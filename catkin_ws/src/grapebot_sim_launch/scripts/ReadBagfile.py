#!/usr/bin/env python
import rosbag
from geometry_msgs.msg import Point
from grapebot_msgs.msg import OdomError
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
from geometry_msgs.msg import Twist, Quaternion, Vector3, Point, Pose
from gazebo_msgs.msg import ModelStates

# The bag file should be in the same directory as the terminal
bag = rosbag.Bag('odom_and_command_circle.bag')
odom_topic = ['odom_custom']
true_topic = ['odom_true']
cmd_topic = ['grapebot/ControlCommand']
gazebo_topic = ['gazebo/model_states']

odom_column_names = ['x_odom', 'y_odom', 'time']
true_column_names = ['x_true', 'y_true', 'time']
cmd_column_names = ['cmd_linear', 'cmd_ang','time']
gazebo_column_names = ['linear_vel', 'angular_vel', 'time']

odom_df = pd.DataFrame(columns=odom_column_names)
true_df = pd.DataFrame(columns=true_column_names)
cmd_df = pd.DataFrame(columns=cmd_column_names)
gazebo_df = pd.DataFrame(columns = gazebo_column_names)

counter = 0

for topic, msg, t in bag.read_messages(topics=gazebo_topic):

    grapebot_model_twist_dict = dict(zip(msg.name, msg.twist))
    
    vx = grapebot_model_twist_dict['grapebot'].linear.x
    vy = grapebot_model_twist_dict['grapebot'].linear.y

    vel = (vx**2 + vy**2)**(1/2)

    angular_vel = grapebot_model_twist_dict['grapebot'].angular.z

    secs = t.secs
    nsecs = t.nsecs

    while counter < 1:
        secs_start = secs
        nsecs_start = nsecs
        counter = 1

    time = (secs) + (nsecs)*(10**(-9))

    gazebo_df = gazebo_df.append(
        {'linear_vel': vel,
         'angular_vel': angular_vel,
         'time': time},
        ignore_index=True
    )

counter = 0

for topic, msg, t in bag.read_messages(topics=odom_topic):
    x = msg.xError
    y = msg.yError
    secs = msg.header.stamp.secs
    nsecs = msg.header.stamp.nsecs

    while counter < 1:
        secs_start = secs
        nsecs_start = nsecs
        counter = 1

    time = (secs) + (nsecs)*(10**(-9))

    odom_df = odom_df.append(
        {'x_odom': x,
         'y_odom': y,
         'time': time},
        ignore_index=True
    )

counter = 0

for topic, msg, t in bag.read_messages(topics=true_topic):
    x = msg.xError
    y = msg.yError
    secs = msg.header.stamp.secs
    nsecs = msg.header.stamp.nsecs

    while counter < 1:
        secs_start = secs
        nsecs_start = nsecs
        counter = 1

    time = (secs) + (nsecs)*(10**(-9))

    true_df = true_df.append(
        {'x_true': x,
         'y_true': y,
         'time': time},
        ignore_index=True
    )

counter = 0

for topic, msg, t in bag.read_messages(topics=cmd_topic):
    linear = msg.linearVelocity
    angular = msg.steeringAngle
    secs = msg.header.stamp.secs
    nsecs = msg.header.stamp.nsecs
    
    while counter < 1:
        secs_start = secs
        nsecs_start = nsecs
        counter = 1

    time = (secs) + (nsecs)*(10**(-9))

    cmd_df = cmd_df.append(
        {'cmd_linear': linear,
         'cmd_ang': angular,
         'time': time},
        ignore_index=True
    )


odom_df.to_csv('odom.csv')
true_df.to_csv('true.csv')
cmd_df.to_csv('cmd.csv')
gazebo_df.to_csv('gazebo.csv')

ax = plt.gca()

gazebo_df.plot(kind = 'scatter', x = 'time', y = 'linear_vel', marker = '.', ax = ax)
cmd_df.plot(kind = 'scatter', x = 'time', y = 'cmd_linear', marker = '.', ax = ax, color = 'red')
plt.ylabel('Command/Response (m/s)')
plt.xlabel('time (s)')
plt.title('Command and Response')
plt.legend(['Response', 'Command'])

#ax = plt.gca()

#odom_df.plot(kind='scatter',x='x_odom',y='y_odom',ax=ax, marker = '.')
#true_df.plot(kind='scatter',x='x_true',y='y_true', color='red', ax=ax, marker = '.')
#plt.ylabel('y (m)')
#plt.xlabel('x (m)')
#plt.title('Odometry vs True position')

#plt.annotate('Time: ' + str(true_df['time'][len(true_df)-1]) + 's', xy=(true_df['x_true'][len(true_df)-1], true_df['y_true'][len(true_df)-1]), xytext=(true_df['x_true'][len(true_df)-1]+1, true_df['y_true'][len(true_df)-1]),
             #arrowprops=dict(facecolor='black', shrink=0.1),
             #)

#plt.legend(('Odom', 'True'))

plt.show()
