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
        odom_front_imu_topic_name = '/odom_front_imu'
        odom_rear_imu_topic_name = '/odom_rear_imu'
        joint_states_topic_name = '/grapebot/joint_states'

        self.pub_odom_custom = rospy.Publisher(odom_custom_topic_name, OdomCustom, queue_size=10)
        self.pub_odom = rospy.Publisher(odom_topic_name, Odometry, queue_size=10)
        self.pub_odom_front_imu = rospy.Publisher(odom_front_imu_topic_name, Odometry, queue_size= 10)   
        self.pub_odom_rear_imu = rospy.Publisher(odom_rear_imu_topic_name, Odometry, queue_size= 10)                                                                                           

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
        self._state = {'x': position.x,
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

        self._state['theta'] = self.convert_angle_to_unitary(self.convert_quat_angle_to_unitary(self._state['theta'][2]) + pi/2) # we have to phase shift to match traditional convention
        self._state['quat'] = tf.transformations.quaternion_from_euler(0.0, 0.0, self._state['theta'])
        self._state['linear_velocity'] = math.sqrt(self._state['vx']**2 + self._state['vy']**2)

        self._timestamp = rospy.get_rostime()
        rospy.Subscriber(joint_states_topic_name, JointState, self.grapebot_joints_callback)


        self._odom_pub_ROSrate = rospy.Rate(40)
        self._odom_custom_pub_ROSrate = rospy.Rate(40)
        self._odom_gps_pub_ROSrate = rospy.Rate(40) 

        # --------------- TODO: to move this into a new class for TF listening and broadcasting 
        self.br = tf.TransformBroadcaster()

        self.front_imu_tf_listener = tf.TransformListener()
        self.rear_imu_tf_listener = tf.TransformListener()

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

    def update_odom(self,delta_t):

        """
        updates the current pose of robot based on sensed wheel velocity and steering angle.

        Note on Gazebo and typical Yaw conventions: Gazebo chooses to define theta (the yaw angle) as the angle originating at the y-axis
        moving CCW toward the negative x direction. We instead choose to report this angle conventionally as originating at x-axis and moving
        CCW toward y-axis.

        :param delta_t: timestep, seconds
        """

        self._state['linear_velocity'] = self.wheelVelocities['front']*cos(self.steer_angle)
        self._state['angular_velocity'] = self._state['linear_velocity']*tan(self.steer_angle)/self.robot_length        
        
        #TODO: use different wheels with different drive modes to mitigate error from slipping
        
        self._state['theta'] = self.convert_angle_to_unitary(self._state['theta'] + delta_t*(self._state['angular_velocity']))

        self._state['vx'] = self._state['linear_velocity'] * cos(self._state['theta'])
        self._state['vy'] = self._state['linear_velocity'] * sin(self._state['theta'])

        self._state['x'] += delta_t*(self._state['vx'])
        self._state['y'] += delta_t*(self._state['vy'])


        self._state['quat'] = tf.transformations.quaternion_from_euler(0.0, 0.0, self._state['theta'])

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

    def convert_quat_angle_to_unitary(self, angle):

        """
        TODO: fix coordinate system to allign with typical convention

        :param angle: Has to be in radians
        :return angle: clean angle in radians
        """
        if angle < 0: 
            angle = 2*pi + angle

        return angle

    def broadcast_odom_tf(self): #this broadcasts TF between world and robot from calculated odometry
        
        self.br.sendTransform((self._state['x'], self._state['y'], 0),
                     tf.transformations.quaternion_from_euler(0, 0, self._state['theta']),
                     rospy.get_rostime(),
                     'grapebot/base_link',
                     'odom')
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

        odom.pose.pose = Pose(Point(self._state['x'], self._state['y'], self._state['z']), Quaternion(*(self._state['quat'])))
        odom.twist.twist = Twist(Vector3(self._state['vx'], self._state['vy'], 0), Vector3(0.0, 0.0, self._state['angular_velocity']))

        self.pub_odom.publish(odom)

        self._odom_pub_ROSrate.sleep()

    def odom_custom_publish(self):

        """
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

        odom_msg.x = self._state['x']
        odom_msg.y = self._state['y']
        odom_msg.theta = self._state['theta']
        odom_msg.angularVelocity = self._state['angular_velocity']
        odom_msg.linearVelocity = self._state['linear_velocity']
        odom_msg.vx = self._state['vx']
        odom_msg.vy = self._state['vy']

        self.pub_odom_custom.publish(odom_msg)       

        self._odom_custom_pub_ROSrate.sleep()

    def odom_front_imu_publish(self):

        """
        publishes front imu odometry

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
        self.front_imu_tf_listener.waitForTransform('/world', '/front_imu', rospy.get_rostime(), rospy.Duration(1.0))
        now = rospy.get_rostime()        
        (front_imu_translation,front_imu_rotation) = self.front_imu_tf_listener.lookupTransform('/world', '/front_imu', now)
        self._front_imu_z = front_imu_translation[2] + self._state['z']
    
        odom = Odometry()
        
        odom.header.stamp = now
        odom.child_frame_id = 'front_imu'
        odom.header.frame_id = 'odom'

        odom.pose.pose = Pose(Point(front_imu_translation[0], front_imu_translation[1], self._front_imu_z), Quaternion(*front_imu_rotation) )

        self.pub_odom_front_imu.publish(odom)

        self._odom_gps_pub_ROSrate.sleep()
    
    def odom_rear_imu_publish(self):

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
        self.rear_imu_tf_listener.waitForTransform('/world', '/rear_imu', rospy.get_rostime(), rospy.Duration(1.0))
        now = rospy.get_rostime()        
        (rear_imu_translation,rear_imu_rotation) = self.rear_imu_tf_listener.lookupTransform('/world', '/rear_imu', now)
        self._rear_imu_z = rear_imu_translation[2] + self._state['z']
    
        odom = Odometry()
        
        odom.header.stamp = now
        odom.child_frame_id = 'rear_imu'
        odom.header.frame_id = 'odom'

        odom.pose.pose = Pose(Point(rear_imu_translation[0], rear_imu_translation[1], self._rear_imu_z), Quaternion(*rear_imu_rotation) )

        self.pub_odom_rear_imu.publish(odom)

        self._odom_gps_pub_ROSrate.sleep()