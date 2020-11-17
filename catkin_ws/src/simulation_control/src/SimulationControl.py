#!/usr/bin/env python
import time
import math
from math import pi, sin, cos, acos, atan2

import rospy
from std_msgs.msg import Float64
from sensor_msgs.msg import JointState

from grapebot_msgs.msg import ControlCommand, ControlState
from RobotOdomClass import RobotOdom


class SimulationControlObject(object):


    """
    Topics To Write on:
    type: std_msgs/Float64
    /grapebot/back_left_wheel_joint_velocity_controller/command
    /grapebot/back_right_wheel_joint_velocity_controller/command
    /grapebot/front_wheel_axis_joint_position_controller/command
    /grapebot/front_wheel_joint_velocity_controller/command
    /grapebot/ControlState
    /odom/

    Topics To Read:
    /grapebot/ControlCommand
    /grapebot/JointState
    """

    def __init__(self):
        
        rospy.init_node('simulation_control_node')
        rospy.loginfo('Grapebot JointMover Initialising...')
        self._drive_mode = rospy.get_param('number_of_drives', 3)
        print('drive_mode:', self._drive_mode)
        
        control_state_topic = '/grapebot/ControlState'
        control_command_topic_name = '/grapebot/ControlCommand'

        self.robot_odom = RobotOdom() # initialize the robot control and odometry state structure

        self.pub_back_left_joint_velocity = rospy.Publisher('/grapebot/back_left_wheel_joint_velocity_controller/command',
                                                            Float64,queue_size=1)
        self.pub_back_right_joint_velocity = rospy.Publisher('/grapebot/back_right_wheel_joint_velocity_controller/command',
                                                            Float64,queue_size=1)
        self.pub_front_axis_joint_position = rospy.Publisher('/grapebot/front_wheel_axis_joint_position_controller/command',
                                                            Float64,queue_size=1)
        self.pub_front_wheel_joint_velocity = rospy.Publisher('/grapebot/front_wheel_joint_velocity_controller/command',
                                                            Float64,queue_size=1)
        self.control_debug_pub = rospy.Publisher(control_state_topic,
                                                            ControlState, queue_size=1)                                                   
 
        rospy.Subscriber(control_command_topic_name, ControlCommand, self.grapebot_control_cmd_callback)

        self._motor_control_rate = rospy.get_param('motor_control_rate', 10)
        self._motor_drive_ROSrate = rospy.Rate(self._motor_control_rate)
        self._control_cmd_ROSrate = rospy.Rate(10) #recieve control commands at rate of 10hz
        self._control_state_ROSrate = rospy.Rate(10)

    def grapebot_drive(self):

        """
        Calls the functions to actuate grapebot joints
        """
        front = self.robot_odom.wheelVelocitiesCommand['front']/self.robot_odom.wheel_radius
        left = self.robot_odom.wheelVelocitiesCommand['left']/self.robot_odom.wheel_radius
        right = self.robot_odom.wheelVelocitiesCommand['right']/self.robot_odom.wheel_radius
        steer_angle = self.robot_odom.steer_angle_command  

        if self._drive_mode == 3:
            self.drive_grapebot_all_wheels(back_left=left, back_right=right,front=front, front_axis=steer_angle)
        elif self._drive_mode == 2:
            self.drive_grapebot_back_wheels(back_left=left, back_right=right, front_axis=steer_angle)
        elif self._drive_mode ==1:
            self.drive_grapebot_front_wheel(front=front, front_axis=steer_angle)
        else: 
            print('Error: Invalid Drive Mode.')

        self._motor_drive_ROSrate.sleep()   

    def grapebot_control_cmd_callback(self,msg):

        """
        recieves high level control commands and calls method to calculate wheel velocity commands

        :param msg:
        grapebot_msgs/ControlCommand
        Header header
        float32 linearVelocity
        float32 angularVelocity
        float32 steeringAngle
        int16 controlMode
        bool robotStop
        """
        if msg.robotStop:
            self.robot_odom.control_mode = msg.control_mode
            self.robot_odom.linear_velocity = 0.0
            self.robot_odom.angular_velocity = 0.0
            self.robot_odom.steer_angle_command = 0.0
            self.robot_odom.stop = msg.robotStop

        elif msg.controlMode == 0:
            self.robot_odom.control_mode = 0
            self.robot_odom.linear_velocity_command = msg.linearVelocity
            self.robot_odom.angular_velocity_command = msg.angularVelocity
            self.robot_odom.steer_angle_command = atan2((msg.linearVelocity*self.robot_odom.robot_length),msg.angularVelocity)
            self.robot_odom.stop = msg.robotStop
            self.update_motor_set_velocities()

        else:
            self.robot_odom.control_mode = 1
            self.robot_odom.linear_velocity_command = msg.linearVelocity
            self.robot_odom.steer_angle_command = msg.steeringAngle
            self.robot_odom.stop = msg.robotStop
            self.update_motor_set_velocities()     

        self._control_cmd_ROSrate.sleep()

    def update_motor_set_velocities(self):

        """
        calculates wheel velocity commands from sensed steer_angle and speed command
        """

        steer_angle_radians = self.robot_odom.steer_angle*math.pi/180.0
        rotation_curvature = math.tan(steer_angle_radians)/self.robot_odom.robot_length
        angular_velocity = self.robot_odom.linear_velocity_command*(rotation_curvature)
        
        mid_wheel_velocity = self.robot_odom.linear_velocity_command
        rear_diff_omeg = angular_velocity*self.robot_odom.track_width/2.0
        
        right_wheel_velocity =  mid_wheel_velocity + rear_diff_omeg
        left_wheel_velocity = mid_wheel_velocity - rear_diff_omeg

        front_wheel_velocity = mid_wheel_velocity/math.cos(steer_angle_radians)

        self.robot_odom.wheelVelocitiesCommand['front'] = front_wheel_velocity
        self.robot_odom.wheelVelocitiesCommand['left'] = left_wheel_velocity
        self.robot_odom.wheelVelocitiesCommand['right'] = right_wheel_velocity

    def drive_grapebot_back_wheels(self, back_left, back_right, front_axis):

        """
        Publishes control commands to back wheels and turning axis

        :param value:
        back_left: back left wheel velocity [Float64, m/s] 
        back_right: back right wheel velocity [Float64, m/s]
        front_axis: front turning angle [Float64, rad] 
        """

        vel_back_left = Float64()
        vel_back_left.data = back_left
        vel_back_right = Float64()
        vel_back_right.data = back_right
        angle_front_axis = Float64()
        angle_front_axis.data = front_axis

        self.pub_back_left_joint_velocity.publish(vel_back_left)
        self.pub_back_right_joint_velocity.publish(vel_back_right)
        self.pub_front_axis_joint_position.publish(angle_front_axis)

    def drive_grapebot_front_wheel(self, front, front_axis):

        """
        Publishes control commands to front wheel and turning axis

        :param value:
        front: front wheel velocity [Float64, m/s]
        front_axis: front turning angle [Float64, rad] 
        """
        vel_front = Float64()
        vel_front.data = front
        angle_front_axis = Float64()
        angle_front_axis.data = front_axis

        self.pub_front_axis_joint_position.publish(angle_front_axis)
        self.pub_front_wheel_joint_velocity.publish(vel_front)

    def drive_grapebot_all_wheels(self, back_left, back_right, front, front_axis):

        """
        Publishes control commands to al wheels and turning axis

        :param value:
        back_left: back left wheel velocity [Float64, m/s] 
        back_right: back right wheel velocity [Float64, m/s]
        front: front wheel velocity [Float64, m/s]
        front_axis: front turning angle [Float64, rad] 
        """        
        vel_back_left = Float64()
        vel_back_right = Float64()
        vel_front = Float64()
        angle_front_axis = Float64()

        vel_back_left.data = back_left
        vel_back_right.data = back_right
        vel_front.data = front
        angle_front_axis.data = front_axis

        self.pub_back_left_joint_velocity.publish(vel_back_left)
        self.pub_back_right_joint_velocity.publish(vel_back_right)
        self.pub_front_axis_joint_position.publish(angle_front_axis)
        self.pub_front_wheel_joint_velocity.publish(vel_front)

    def control_state_publish(self):

        """
        publishes control state for debugging

        :param msg:
        grapebot_msgs/ControlState
        Header header
        float32 SteerAngleCommand
        float32 SteerAngleResponse
        float32 linearVelocityCommand
        float32 leftWheelVelocityCommand
        float32 rightWheelVelocityCommand
        float32 frontWheelVelocityCommand
        float32 linearVelocityResponse
        float32 leftWheelVelocityResponse
        float32 rightWheelVelocityResponse
        float32 frontWheelVelocityResponse
        """
        state = ControlState()
        
        now = rospy.get_rostime()
        state.header.stamp.secs = now.secs
        state.header.stamp.nsecs = now.nsecs
        
        state.SteerAngleCommand = self.robot_odom.steer_angle_command
        state.SteerAngleResponse = self.robot_odom.steer_angle 

        state.linearVelocityCommand = self.robot_odom.linear_velocity_command
        state.frontWheelVelocityCommand = self.robot_odom.wheelVelocitiesCommand['front']
        state.leftWheelVelocityCommand = self.robot_odom.wheelVelocitiesCommand['left']
        state.rightWheelVelocityCommand = self.robot_odom.wheelVelocitiesCommand['right']
        
        state.linearVelocityResponse = self.robot_odom.linear_velocity
        state.frontWheelVelocityResponse = self.robot_odom.wheelVelocities['front']
        state.leftWheelVelocityResponse = self.robot_odom.wheelVelocities['left']
        state.rightWheelVelocityResponse = self.robot_odom.wheelVelocities['right']
        
        self.control_debug_pub.publish(state)

        self._control_state_ROSrate.sleep()

if __name__ == '__main__':
  
    simulation_control = SimulationControlObject()
  
    while not rospy.is_shutdown() and not simulation_control.robot_odom.stop:
        
        simulation_control.grapebot_drive()
        simulation_control.robot_odom.odom_publish()
        simulation_control.robot_odom.broadcast_grapebot_tf()
        simulation_control.robot_odom.pose_front_gps_publish()
        simulation_control.robot_odom.pose_rear_gps_publish()
        simulation_control.control_state_publish() 