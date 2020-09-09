#!/usr/bin/env python
import time
import math
from math import pi, sin, cos, acos, atan2, tan
import tf
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import os

import rospy
from std_msgs.msg import Float64
from gazebo_msgs.msg import ModelStates
from grapebot_msgs.msg import ControlCommand
from nav_msgs.msg import Odometry
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Twist, Quaternion, Vector3, Point, Pose

from grapebot_msgs.msg import OdomCustom


class DataAnalysis(object):


    def __init__(self):
        """ Docstring """
        rospy.init_node('data_analysis_node')
        model_states_topic_name = '/gazebo/model_states'
        #odom_topic_name = '/odom'
        odom_custom_topic_name = '/odom_custom'
        control_command_topic_name = '/grapebot/ControlCommand'

        #self.pub_odom_error = rospy.Publisher('/odom_error', OdomCustom, queue_size=10)
        #self.pub_odom_true = rospy.Publisher('/odom_true', OdomCustom, queue_size=10)

        odom_column_names = ['x', 'y', 'vx', 'vy', 'linear_velocity', 'angular_velocity', 'theta',  'quat', 'time']
        model_state_column_names = ['x', 'y', 'vx', 'vy', 'linear_velocity', 'angular_velocity', 'theta', 'quat', 'time']
        cmd_column_names = ['linear', 'angular', 'mode', 'time']

        self._model_states_df = pd.DataFrame(columns = model_state_column_names)
        #odom_df = pd.DataFrame(columns = odom_column_names)
        self._odom_custom_df = pd.DataFrame(columns = odom_column_names)
        self._cmd_df = pd.DataFrame(columns = cmd_column_names)

        grapebot_model_state_data = None
        while grapebot_model_state_data is None:
            try:
                grapebot_model_state_data = rospy.wait_for_message(model_states_topic_name, ModelStates, timeout=5)
            except:
                rospy.logwarn('Time out ' + str(model_states_topic_name))
                break

        self._grapebot_model_pose_dict = dict(zip(grapebot_model_state_data.name, grapebot_model_state_data.pose))
        self._grapebot_model_twist_dict = dict(zip(grapebot_model_state_data.name, grapebot_model_state_data.twist))

        rospy.Subscriber(model_states_topic_name, ModelStates, self.gazebo_model_states_callback)
        #rospy.Subscriber(odom_topic_name, Odometry, self.odom_callback)
        rospy.Subscriber(odom_custom_topic_name, OdomCustom, self.odom_custom_callback)
        rospy.Subscriber(control_command_topic_name, ControlCommand, self.control_command_callback)


    def gazebo_model_states_callback(self,msg):

        """
        reads model states from gazebo and updates true pose

        :param msg:
        string[] name                 # model names
        geometry_msgs/Pose[] pose     # desired pose in world frame
        geometry_msgs/Twist[] twist   # desired twist in world frame
        """

        self._initialized = True
        #print("model states")

        self._grapebot_model_pose_dict = dict(zip(msg.name, msg.pose))
        self._grapebot_model_twist_dict = dict(zip(msg.name, msg.twist))

        position = self._grapebot_model_pose_dict['grapebot'].position
        orientation = self._grapebot_model_pose_dict['grapebot'].orientation
        twist = self._grapebot_model_twist_dict['grapebot']
        now = rospy.get_rostime()
        secs = now.secs
        nsecs = now.nsecs

        x = position.x
        y = position.y
        theta = tf.transformations.euler_from_quaternion([orientation.x,orientation.y,orientation.z,orientation.w])[2]
        quat = tf.transformations.quaternion_from_euler(0, 0, theta)
        vx = twist.linear.x
        vy = twist.linear.y
        angular_velocity = twist.angular.z
        linear_velocity = math.sqrt(vx**2 + vy**2)
        time = (secs) + (nsecs)*(10**(-9))

        self._model_states_df = self._model_states_df.append({
            'x':x,
            'y':y,
            'theta':theta,
            'quat':quat,
            'vx':vx,
            'vy':vy,
            'angular_velocity':angular_velocity,
            'linear_velocity':linear_velocity,
            'time':time},
        ignore_index=True
        )
        

    def odom_custom_callback(self,msg):

        """
        reads custom odometry from simulation control node

        :param msg:
        Header header

        float64 x
        float64 y
        float64 theta
        float64 vx
        float64 vy
        float64 angularVelocity
        float64 linearVelocity
        """

        now = rospy.get_rostime()
        secs = now.secs
        nsecs = now.nsecs

        x = msg.x
        y = msg.y
        theta = msg.theta
        quat = tf.transformations.quaternion_from_euler(0, 0, theta)
        vx = msg.vx
        vy = msg.vy
        angular_velocity = msg.angularVelocity
        linear_velocity = msg.linearVelocity
        time = (secs) + (nsecs)*(10**(-9)) #TODO: figure out time difference from header

        self._odom_custom_df = self._odom_custom_df.append({
            'x':x,
            'y':y,
            'theta':theta,
            'quat':quat,
            'vx':vx,
            'vy':vy,
            'angular_velocity':angular_velocity,
            'linear_velocity':linear_velocity,
            'time':time},
        ignore_index=True
        )


    def control_command_callback(self,msg):

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
        linear = msg.linearVelocity
        now = rospy.get_rostime()
        secs = now.secs
        nsecs = now.nsecs        
        time = (secs) + (nsecs)*(10**(-9))

        if msg.controlMode == 0:
            angular = msg.angular_velocity
            mode = 0

        if msg.controlMode == 1:
            angular = msg.steeringAngle
            mode = 1

        #TODO: time 

        self._cmd_df = self._cmd_df.append(
            {'linear':linear,
             'angular':angular,
             'time': time,
             'mode':mode},
        ignore_index=True
        )
    
    def odom_error_publish(self):

        """
        publishes odometry error stream to /odom_error

        Header header
        
        float64 x
        float64 y
        float64 theta
        float64 vx
        float64 vy
        float64 angularVelocity
        float64 linearVelocity 
        """

        odom_error_msg = OdomCustom()

        now = rospy.get_rostime()
        odom_error_msg.header.stamp.secs = now.secs
        odom_error_msg.header.stamp.nsecs = now.nsecs

        odom_error_msg.x = self._model_states_df['x'][-1] - odom_custom_df['x'][-1]
        odom_error_msg.y = self._model_states_df['y'][-1] - odom_custom_df['y'][-1]
        odom_error_msg.theta = self._model_states_df['theta'][-1] - odom_custom_df['theta'][-1]
        odom_error_msg.angularVelocity = self._model_states_df['angular_velocity'][-1] - odom_custom_df['angular_velocity'][-1]
        odom_error_msg.linearVelocity = self._model_states_df['linear_velocity'][-1] - odom_custom_df['linear_velocity'][-1]
        odom_error_msg.vx = self._model_states_df['vx'][-1] - odom_custom_df['vx'][-1]
        odom_error_msg.vy = self._model_states_df['vy'][-1] - odom_custom_df['vy'][-1]

        self.pub_odom_error.publish(odom_error_msg)

    def odom_true_publish(self):

        """
        publishes odometry_true stream to /odom_custom

        Header header
        
        float64 x
        float64 y
        float64 theta
        float64 vx
        float64 vy
        float64 angularVelocity
        float64 linearVelocity 
        """

        odom_true_msg = OdomCustom()

        now = rospy.get_rostime()
        odom_true_msg.header.stamp.secs = now.secs
        odom_true_msg.header.stamp.nsecs = now.nsecs

        odom_true_msg.x = self._model_states_df['x'][-1]
        odom_true_msg.y = self._model_states_df['y'][-1]
        odom_true_msg.theta = self._model_states_df['theta'][-1]
        odom_true_msg.angularVelocity = self._model_states_df['angular_velocity'][-1]
        odom_true_msg.linearVelocity = self._model_states_df['linear_velocity'][-1]
        odom_true_msg.vx = self._model_states_df['vx'][-1]
        odom_true_msg.vy = self._model_states_df['vy'][-1]

        self.pub_odom_true.publish(odom_true_msg)

    def myhook(self):
        """CB to be performed on shutdown""" 

        data_analysis._odom_custom_df.to_csv('odom_custom.csv')
        data_analysis._model_states_df.to_csv('model_states.csv')
        data_analysis._cmd_df.to_csv('cmd.csv')

        fig_0 = plt.figure(0)
        ax = plt.gca()

        data_analysis._odom_custom_df.plot(kind = 'scatter', x = 'time', y = 'linear_velocity', marker = '.', ax = ax)
        data_analysis._cmd_df.plot(kind = 'scatter', x = 'time', y = 'linear', marker = '.', ax = ax, color = 'red')
        plt.ylabel('Command/Response (m/s)')
        plt.xlabel('time (s)')
        plt.title('Linear Velocity Command and Response')
        plt.legend(['Response', 'Command'])
        
        plt.savefig('plot_0.png')
        

        fig_1 = plt.figure(1)
        ax1 = plt.gca()
        data_analysis._odom_custom_df.plot(kind='scatter',x='x',y='y',ax=ax1, marker = '.')
        data_analysis._model_states_df.plot(kind='scatter',x='x',y='y', color='red', ax=ax1, marker = '.')
        plt.ylabel('y (m)')
        plt.xlabel('x (m)')
        plt.title('Odometry vs True position')
        plt.legend(('Odom', 'True'))
        plt.savefig('plot_1.png')
       


        #plt.annotate('Time: ' + str(true_df['time'][len(true_df)-1]) + 's', xy=(true_df['x_true'][len(true_df)-1], true_df['y_true'][len(true_df)-1]), xytext=(true_df['x_true'][len(true_df)-1]+1, true_df['y_true'][len(true_df)-1]),
                #arrowprops=dict(facecolor='black', shrink=0.1),
                #)


if __name__ == '__main__':

    data_analysis = DataAnalysis()
    
    while not rospy.is_shutdown():
        pass 
        #if hasattr(data_analysis,'_initialized'):
            #data_analysis.odom_error_publish()
            #data_analysis.odom_true_publish()
    
    rospy.on_shutdown(data_analysis.myhook)
