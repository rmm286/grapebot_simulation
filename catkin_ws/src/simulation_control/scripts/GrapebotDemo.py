#!/usr/bin/env python
import time
import rospy
import math
from math import pi, sin, cos, acos
import random
from std_msgs.msg import Float64
from sensor_msgs.msg import JointState
"""
Topics To Write on:
type: std_msgs/Float64
/grapebot/back_left_wheel_joint_velocity_controller/command
/grapebot/back_right_wheel_joint_velocity_controller/command
/grapebot/front_wheel_axis_joint_position_controller/command
/grapebot/front_wheel_joint_velocity_controller/command
"""

class GrapebotJointMover(object):

    def __init__(self):
        self.wheel_radius = 0.19 #m 
        self.robot_length = 1.2446 #m 
        self.track_width = 1.0239 #m 
        rospy.init_node('jointmover_demo', anonymous=True)
        rospy.loginfo("Grapebot JointMover Initialising...")
        self.pub_back_left_joint_velocity = rospy.Publisher('/grapebot/back_left_wheel_joint_velocity_controller/command',
                                                            Float64,
                                                            queue_size=1)
        self.pub_back_right_joint_velocity = rospy.Publisher('/grapebot/back_right_wheel_joint_velocity_controller/command',
                                                            Float64,
                                                            queue_size=1)
        self.pub_front_axis_joint_position = rospy.Publisher('/grapebot/front_wheel_axis_joint_position_controller/command',
                                                           Float64,
                                                           queue_size=1)
        self.pub_front_wheel_joint_velocity = rospy.Publisher('/grapebot/front_wheel_joint_velocity_controller/command',
                                                           Float64,
                                                           queue_size=1)                                                           
        joint_states_topic_name = "/grapebot/joint_states"
        rospy.Subscriber(joint_states_topic_name, JointState, self.grapebot_joints_callback)
        grapebot_joints_data = None
        while grapebot_joints_data is None:
            try:
                grapebot_joints_data = rospy.wait_for_message(joint_states_topic_name, JointState, timeout=5)
            except:
                rospy.logwarn("Time out " + str(joint_states_topic_name))
                pass
        #ignore error here
        self.grapebot_joint_position_dictionary = dict(zip(grapebot_joints_data.name, grapebot_joints_data.position))
        self.grapebot_joint_velocity_dictionary = dict(zip(grapebot_joints_data.name, grapebot_joints_data.velocity))
        

    def drive_grapebot_all_wheels(self, back_left, back_right, front, front_axis):
        vel_back_left = Float64()
        vel_back_left.data = back_left
        vel_back_right = Float64()
        vel_back_right.data = back_right
        vel_front = Float64()
        vel_front.data = front
        angle_front_axis = Float64()
        angle_front_axis.data = front_axis

        self.pub_back_left_joint_velocity.publish(vel_back_left)
        self.pub_back_right_joint_velocity.publish(vel_back_right)
        self.pub_front_axis_joint_position.publish(angle_front_axis)
        self.pub_front_wheel_joint_velocity.publish(vel_front)

    def drive_grapebot_back_right_joint(self, velocity):
        """
        :param velocity:
        :return:
        """
        vel = Float64()
        vel.data = velocity
        self.pub_back_right_joint_velocity.publish(vel)

    def drive_grapebot_back_left_joint(self, velocity):
        """
        :param velocity:
        :return:
        """
        vel = Float64()
        vel.data = velocity
        self.pub_back_left_joint_velocity.publish(vel)

    def drive_grapebot_front_wheel_joint(self, velocity):
        """
        :param velocity:
        :return:
        """
        vel = Float64()
        vel.data = velocity
        self.pub_front_wheel_joint_velocity.publish(vel)

    def move_grapebot_front_axis_joint(self, position):
        """
        limits radians : lower="-0.78" upper="0.78"
        :param position:
        :return:
        """
        angle = Float64()
        angle.data = position
        self.pub_front_axis_joint_position.publish(angle)        

    def grapebot_joints_callback(self, msg):
        """
        sensor_msgs/JointState
        std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
        string[] name
        float64[] position
        float64[] velocity
        float64[] effort

        :param msg:
        :return:
        """
        self.grapebot_joint_position_dictionary = dict(zip(msg.name, msg.position))
        self.grapebot_joint_velocity_dictionary = dict(zip(msg.name, msg.velocity))

    def grapebot_check_joint_position_value(self, joint_name, value, error=0.1):
        """
        Check the joint by name is near the value given
        :param value:
        :return:
        """
        similar = self.grapebot_joint_position_dictionary.get(joint_name) >= (value - error ) and self.grapebot_joint_position_dictionary.get(joint_name) <= (value + error )

        return similar

    def grapebot_check_joint_velocity_value(self, joint_name, value, error=0.1):
        """
        Check the joint by name is near the value given
        :param value:
        :return:
        """

        similar = self.grapebot_joint_velocity_dictionary.get(joint_name) >= (value - error ) and self.grapebot_joint_velocity_dictionary.get(joint_name) <= (value + error )

        return similar        

    def convert_angle_to_unitary(self, angle):
        """
        Removes complete revolutions from angle and converts to positive equivalent
        if the angle is negative
        :param angle: Has to be in radians
        :return:
        """
        # Convert to angle between [0,360)
        complete_rev = 2 * pi
        mod_angle = int(angle / complete_rev)
        clean_angle = angle - mod_angle * complete_rev
        # Convert Negative angles to their corresponding positive values
        if clean_angle < 0:
            clean_angle += 2 * pi

        return clean_angle
        
    def convert_angle_from_unitary(self, angle):
        """
        Convention for quaterion transformation: angles are positive in quadrants one and two and negative in 
        quadrants three and four. The value increases until pi and then becomes negative and decreases until reaching zero
        Removes complete revolutions from angle and converts to this convention
        if the angle is negative
        :param angle: Has to be in radians
        :return:
        """
        # Convert to angle between [0,360)
        complete_rev = 2 * pi
        mod_angle = int(angle/complete_rev)
        clean_angle = angle - mod_angle * complete_rev
        # Convert Negative angles to their corresponding convention values
        if clean_angle > pi:
            clean_angle = -2*pi + clean_angle

        return clean_angle        

    def assertAlmostEqualAngles(self, x, y,):
        c2 = (sin(x) - sin(y)) ** 2 + (cos(x) - cos(y)) ** 2
        angle_diff = acos((2.0 - c2) / 2.0)
        return angle_diff

    def grapebot_check_continuous_joint_value(self, joint_name, value, error=0.1):
        """
        Check the joint by name is near the value given
        We have to convert the joint values removing whole revolutions and converting negative versions
        of the same angle
        :param value:
        :return:
        """
        joint_reading = self.grapebot_joint_position_dictionary.get(joint_name)
        clean_joint_reading = self.convert_angle_to_unitary(angle=joint_reading)
        clean_value = self.convert_angle_to_unitary(angle=value)

        dif_angles = self.assertAlmostEqualAngles(clean_joint_reading, clean_value)
        similar = dif_angles <= error

        return similar


    def grapebot_turn_wheel(self, arg_position, check_rate = 5.0):
        """
        Turn front wheel to given position
        :return:
        """

        rate = rospy.Rate(check_rate)
        similar = False
        while not similar:
            self.move_grapebot_front_axis_joint(position=arg_position)
            similar = self.grapebot_check_continuous_joint_value(joint_name="front_wheel_axis_joint", value=arg_position)

            rate.sleep()

    def grapebot_drive_front(self, arg_velocity, check_rate = 5.0):
        """
        drive front wheel with given velocity
        :return:
        """    
        rate = rospy.Rate(check_rate)
        similar = False
        while not similar:
            self.drive_grapebot_front_wheel_joint(velocity=arg_velocity)
            similar = self.grapebot_check_joint_velocity_value(joint_name = "front_wheel_joint", value=arg_velocity, error=0.01)

            rate.sleep()

    def grapebot_drive_forward(self, arg_velocity, check_rate = 5.0):
        """
        drive all wheels with given velocity
        :return:
        """    
        rate = rospy.Rate(check_rate)
        similar = False
        while not similar:
            self.drive_grapebot_all_wheels(back_left=arg_velocity, back_right=arg_velocity,front=arg_velocity, front_axis=0)
            
            similar_front = self.grapebot_check_joint_velocity_value(joint_name = "front_wheel_joint", value=arg_velocity, error=0.1)
            similar_back_left = self.grapebot_check_joint_velocity_value(joint_name = "back_left_wheel_joint", value=arg_velocity, error=0.1)
            similar_back_right = self.grapebot_check_joint_velocity_value(joint_name = "back_right_wheel_joint", value=arg_velocity, error=0.1)
            similar_front_axis = self.grapebot_check_joint_position_value(joint_name = "front_wheel_axis_joint", value=0, error=0.1)

            similar = (similar_front and similar_front_axis and similar_back_right and similar_back_left)

            rate.sleep()


    def grapebot_stop(self):
        """
        Stop all wheels and set front axis angle to zero
        :return:
        """
        check_rate = 5    
        rate = rospy.Rate(check_rate)
        similar = False
        print("starting stop command")
        while not similar:
            self.drive_grapebot_all_wheels(back_left=0, back_right=0,front=0, front_axis=0)
            
            similar_front = self.grapebot_check_joint_velocity_value(joint_name = "front_wheel_joint", value=0, error=0.1)
            similar_back_left = self.grapebot_check_joint_velocity_value(joint_name = "back_left_wheel_joint", value=0, error=0.1)
            similar_back_right = self.grapebot_check_joint_velocity_value(joint_name = "back_right_wheel_joint", value=0, error=0.1)
            similar_front_axis = self.grapebot_check_joint_position_value(joint_name = "front_wheel_axis_joint", value=0, error=0.1)

            similar = (similar_front and similar_front_axis and similar_back_right and similar_back_left)

            rate.sleep()
        print("finished stop command")


    def grapebot_drive_circle(self, steer_angle, speed):
        """
        move grapebot in circle with given steering angle (radians)
        :return:
        """
        curvature = math.tan(steer_angle)/self.robot_length
        angular_velocity = speed*curvature
        mid_wheel_velocity = speed
        
        rear_diff_omega = angular_velocity*(self.track_width/2.0)
        
        right_wheel_velocity =  mid_wheel_velocity + rear_diff_omega
        left_wheel_velocity = mid_wheel_velocity - rear_diff_omega

        front_wheel_velocity = mid_wheel_velocity/math.cos(steer_angle)

        check_rate = 5    
        rate = rospy.Rate(check_rate)
        similar = False
        while not similar:
            self.drive_grapebot_all_wheels(back_left=left_wheel_velocity, back_right=right_wheel_velocity,front=front_wheel_velocity, front_axis=steer_angle)
            
            similar_front = self.grapebot_check_joint_velocity_value(joint_name = "front_wheel_joint", value=front_wheel_velocity, error=0.05)
            similar_back_left = self.grapebot_check_joint_velocity_value(joint_name = "back_left_wheel_joint", value=left_wheel_velocity, error=0.05)
            similar_back_right = self.grapebot_check_joint_velocity_value(joint_name = "back_right_wheel_joint", value=right_wheel_velocity, error=0.05)
            similar_front_axis = self.grapebot_check_joint_position_value(joint_name = "front_wheel_axis_joint", value=steer_angle, error=0.05)

            similar = (similar_front and similar_front_axis and similar_back_right and similar_back_left)

            rate.sleep()            

if __name__ == "__main__":
    grapebot_jointmover_object = GrapebotJointMover()
    #grapebot_jointmover_object.grapebot_turn_wheel(arg_position = 0.2)
    print("initialized")
 
    grapebot_jointmover_object.grapebot_stop()
    print("stopped")
    time.sleep(5)
    print("begin moving straight")
    grapebot_jointmover_object.grapebot_drive_forward(arg_velocity=3)
    time.sleep(5)
    grapebot_jointmover_object.grapebot_stop()
    print("stopped")
    time.sleep(5)
    grapebot_jointmover_object.grapebot_drive_circle(0.5,5)
    print("begin moving in circle")


