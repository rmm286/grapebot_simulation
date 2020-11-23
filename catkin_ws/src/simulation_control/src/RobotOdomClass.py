#!/usr/bin/env python
import time
import math
from math import pi, sin, cos, acos, atan2, tan
import numpy as np
import tf

import rospy
from std_msgs.msg import Float64
from gazebo_msgs.msg import ModelStates
from nav_msgs.msg import Odometry
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Twist, Quaternion, Vector3, Point, Pose

from Robot import Robot
from grapebot_msgs.msg import OdomCustom


class RobotOdom(Robot):


    """
    Topics To Write on:
    /odom_custom
    /odom

    Topics To Read:
    /gazebo/model_states
    """

    def __init__(self):

        super(RobotOdom, self).__init__() # init parent class, Robot
        
        model_states_topic_name = '/gazebo/model_states'
        odom_custom_topic_name = '/odom_custom'
        odom_topic_name = '/odom'
        pose_front_gps_topic_name = '/pose_front_gps'
        pose_rear_gps_topic_name = '/pose_rear_gps'
        joint_states_topic_name = '/grapebot/joint_states'

        self.pub_odom_custom = rospy.Publisher(odom_custom_topic_name, OdomCustom, queue_size=10)
        self.pub_odom = rospy.Publisher(odom_topic_name, Odometry, queue_size=10)
        self.pub_odom_front_imu = rospy.Publisher(pose_front_gps_topic_name, Odometry, queue_size= 10)   
        self.pub_odom_rear_imu = rospy.Publisher(pose_rear_gps_topic_name, Odometry, queue_size= 10)
        self.br = tf.TransformBroadcaster()
        self.front_imu_tf_listener = tf.TransformListener()
        self.rear_imu_tf_listener = tf.TransformListener()                                                                                           

        grapebot_model_state_data = None
        while grapebot_model_state_data is None:
            try:
                grapebot_model_state_data = rospy.wait_for_message(model_states_topic_name, ModelStates, timeout=5)
            except:
                rospy.logwarn('Time out ' + str(model_states_topic_name))
                break
        grapebot_joints_data = None
        while grapebot_joints_data is None:
            try:
                grapebot_joints_data = rospy.wait_for_message(joint_states_topic_name, JointState, timeout=5)
            except:
                rospy.logwarn('Time out ' + str(joint_states_topic_name))
                break  

        self._grapebot_joint_position_dict = dict(zip(grapebot_joints_data.name, grapebot_joints_data.position))
        self._grapebot_joint_velocity_dict = dict(zip(grapebot_joints_data.name, grapebot_joints_data.velocity))
        self._grapebot_model_pose_dict = dict(zip(grapebot_model_state_data.name, grapebot_model_state_data.pose))
        self._grapebot_model_twist_dict = dict(zip(grapebot_model_state_data.name, grapebot_model_state_data.twist))

        position = self._grapebot_model_pose_dict['grapebot'].position
        orientation = self._grapebot_model_pose_dict['grapebot'].orientation
        twist = self._grapebot_model_twist_dict['grapebot']

        #Init inital odometry of grapebot from gazebo model states topic
        self._odom = {'x': position.x,
                            'y': position.y,
                            'z': position.z,
                            'theta':tf.transformations.euler_from_quaternion([
                                                                orientation.x,
                                                                orientation.y,
                                                                orientation.z,
                                                                orientation.w ]),
                            'quat': 0,
                            'vx': twist.linear.x,
                            'vy': twist.linear.y,
                            'linear_velocity': 0,
                            'angular_velocity': twist.angular.z}

        self._odom['theta'] = self.convert_angle_to_unitary(self._odom['theta'][2])
        self._odom['quat'] = tf.transformations.quaternion_from_euler(0.0, 0.0, self._odom['theta'])
        self._odom['linear_velocity'] = math.sqrt(self._odom['vx']**2 + self._odom['vy']**2)

        self._true_state = self._odom

        self._timestamp = rospy.get_rostime()
        rospy.Subscriber(joint_states_topic_name, JointState, self.grapebot_joints_callback)
        rospy.Subscriber(model_states_topic_name, ModelStates, self.grapebot_model_state_callback)

        self._odom_pub_ROSrate = rospy.Rate(40)
        self._odom_custom_pub_ROSrate = rospy.Rate(40)
        self._odom_gps_pub_ROSrate = rospy.Rate(40) 

    def set_odom(self, update_state_dict):

        keys = ['x', 'y', 'z', 'theta', 'quat']

        for key in keys:
            if key in update_state_dict:
                self._odom[key] = update_state_dict[key]

        if (('theta' in update_state_dict) and not('quat' in update_state_dict)):
            self._odom['quat'] = tf.transformations.quaternion_from_euler(0.0, 0.0, self._odom['theta'])
        elif (('quat' in update_state_dict) and not('theta' in update_state_dict)):
            self._odom['theta'] = tf.transformations.euler_from_quaternion(*self._odom['quat'])

    def grapebot_joints_callback(self, msg):

        """
        recieves joint posiiton and velocities and updates odometry

        :param msg:
        sensor_msgs/JointState
        std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
        string[] name
        float64[] position
        float64[] velocity
        float64[] effort
        """
        #print('joints callback')
        self._grapebot_joint_position_dict = dict(zip(msg.name, msg.position))
        self._grapebot_joint_velocity_dict = dict(zip(msg.name, msg.velocity))

        self.wheelVelocities['left'] = self._grapebot_joint_velocity_dict.get('back_left_wheel_joint')*self.wheel_radius
        self.wheelVelocities['right'] = self._grapebot_joint_velocity_dict.get('back_right_wheel_joint')*self.wheel_radius
        self.wheelVelocities['front'] = self._grapebot_joint_velocity_dict.get('front_wheel_joint')*self.wheel_radius
        self.steer_angle = self._grapebot_joint_position_dict.get('front_wheel_axis_joint') # this is in radians        
    
        last_time = self._timestamp
        self._timestamp = rospy.get_rostime()
        delta_t = self._timestamp.to_sec() - last_time.to_sec()
        
        self.update_odom(delta_t)
    
    def grapebot_model_state_callback(self, msg):

        """
        recieves model states and updates transform tree. 

        :param msg:
        sensor_msgs/JointState
        std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
        string[] name
        float64[] position
        float64[] velocity
        float64[] effort
        """
        #print('joints callback')

        self._grapebot_model_pose_dict = dict(zip(msg.name, msg.pose))

        position = self._grapebot_model_pose_dict['grapebot'].position
        orientation = self._grapebot_model_pose_dict['grapebot'].orientation

        theta = tf.transformations.euler_from_quaternion([orientation.x,
                                                                orientation.y,
                                                                orientation.z,
                                                                orientation.w ])
        theta = self.convert_angle_to_unitary(theta[2])

        self._true_state = {'x': position.x,
                            'y': position.y,
                            'z': position.z,
                            'theta': theta}

    def update_odom(self,delta_t):

        """
        updates the current pose of robot based on sensed wheel velocity and steering angle.

        Note: Due to initial designation in URDF file, y is the coordinate that points toward the front of the vehicle in body fixed coordinates.

        :param delta_t: timestep, seconds
        """

        self._odom['linear_velocity'] = self.wheelVelocities['front']*cos(self.steer_angle)
        self._odom['angular_velocity'] = self._odom['linear_velocity']*tan(self.steer_angle)/self.robot_length        
                
        self._odom['theta'] = self.convert_angle_to_unitary(self._odom['theta'] + delta_t*(self._odom['angular_velocity']))

        self._odom['vx'] = self._odom['linear_velocity'] * -sin(self._odom['theta'])
        self._odom['vy'] = self._odom['linear_velocity'] * cos(self._odom['theta'])

        self._odom['x'] += delta_t*(self._odom['vx'])
        self._odom['y'] += delta_t*(self._odom['vy'])

        self._odom['quat'] = tf.transformations.quaternion_from_euler(0.0, 0.0, self._odom['theta'])

    def convert_angle_to_unitary(self, angle):

        """
        Removes complete revolutions from angle and converts to positive equivalent if the angle is negative

        :param angle: Has to be in radians
        :return clean_angle: commputed angle in radians 
        """
        # Convert to angle between [0,360)
        complete_rev = 2 * pi
        mod_angle = int(angle / complete_rev)
        clean_angle = angle - mod_angle * complete_rev
        # Convert Negative angles to their corresponding positive values
        if clean_angle < 0:
            clean_angle += 2 * pi

        return clean_angle

    def broadcast_grapebot_tf(self): #this broadcasts TF between world and robot from true pose
               
        self.br.sendTransform((self._true_state['x'], self._true_state['y'], self._true_state['z']),
                     tf.transformations.quaternion_from_euler(0, 0, self._true_state['theta']),
                     rospy.get_rostime(),
                     'grapebot/base_link',
                     'world')
        self._odom_pub_ROSrate.sleep()

    def odom_publish(self):

        """
        publishes robot odometry to odom topic

        :param msg:
        Header header
        uint32 seq
        time stamp
        string frame_id
        string child_frame_id
        geometry_msgs/PoseWithCovariance pose
        geometry_msgs/Pose pose
        geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
        geometry_msgs/Quaternion orientation
            float64 x
            float64 y
            float64 z
            float64 w
        float64[36] covariance
        geometry_msgs/TwistWithCovariance twist
        geometry_msgs/Twist twist
        geometry_msgs/Vector3 linear
            float64 x
            float64 y
            float64 z
        geometry_msgs/Vector3 angular
            float64 x
            float64 y
            float64 z
        """

        odom = Odometry()
        now = rospy.get_rostime()
        odom.header.stamp = now
        odom.child_frame_id = 'base_footprint'
        odom.header.frame_id = 'odom'

        odom.pose.pose = Pose(Point(self._odom['x'], self._odom['y'], self._odom['z']), Quaternion(*(self._odom['quat'])))
        odom.twist.twist = Twist(Vector3(self._odom['vx'], self._odom['vy'], 0), Vector3(0.0, 0.0, self._odom['angular_velocity']))

        self.pub_odom.publish(odom)

        self._odom_pub_ROSrate.sleep()

    def odom_custom_publish(self):

        """
        This method is used to publish odometry data in a more human readable format with a data structure that is more meaningful for the specific robot. This method is used for debugging and is not currently in use. 
        
        publishes custom odometry stream to /odom_custom

        Header header
        
        float64 x
        float64 y
        float64 theta
        float64 vx
        float64 vy
        float64 angularVelocity
        float64 linearVelocity 
        """
        
        odom_msg = OdomCustom()

        now = rospy.get_rostime()
        odom_msg.header.stamp.secs = now.secs
        odom_msg.header.stamp.nsecs = now.nsecs

        odom_msg.x = self._odom['x']
        odom_msg.y = self._odom['y']
        odom_msg.theta = self._odom['theta']
        odom_msg.angularVelocity = self._odom['angular_velocity']
        odom_msg.linearVelocity = self._odom['linear_velocity']
        odom_msg.vx = self._odom['vx']
        odom_msg.vy = self._odom['vy']

        self.pub_odom_custom.publish(odom_msg)       

        self._odom_custom_pub_ROSrate.sleep()

    def pose_front_gps_publish(self):

        """
        publishes front gps odometry

        :param msg:
        Header header
        uint32 seq
        time stamp
        string frame_id
        string child_frame_id
        geometry_msgs/PoseWithCovariance pose
        geometry_msgs/Pose pose
        geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
        """

        now = rospy.get_rostime()        
        (front_imu_translation,front_imu_rotation) = self.front_imu_tf_listener.lookupTransform('/world', '/front_imu', now)

        odom = Odometry()
        
        odom.header.stamp = now
        odom.child_frame_id = 'front_imu'
        odom.header.frame_id = 'world'

        odom.pose.pose = Pose(Point(front_imu_translation[0], front_imu_translation[1], front_imu_translation[2]), Quaternion(*front_imu_rotation) )

        self.pub_odom_front_imu.publish(odom)

        self._odom_gps_pub_ROSrate.sleep()
    
    def pose_rear_gps_publish(self):

        """
        publishes rear imu odometry

        :param msg:
        Header header
        uint32 seq
        time stamp
        string frame_id
        string child_frame_id
        geometry_msgs/PoseWithCovariance pose
        geometry_msgs/Pose pose
        geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
        """

        now = rospy.get_rostime()        
        (rear_imu_translation,rear_imu_rotation) = self.rear_imu_tf_listener.lookupTransform('/world', '/rear_imu', now)

        odom = Odometry()
        
        odom.header.stamp = now
        odom.child_frame_id = 'rear_imu'
        odom.header.frame_id = 'world'

        odom.pose.pose = Pose(Point(rear_imu_translation[0], rear_imu_translation[1], rear_imu_translation[2]), Quaternion(*rear_imu_rotation) )

        self.pub_odom_rear_imu.publish(odom)

        self._odom_gps_pub_ROSrate.sleep()