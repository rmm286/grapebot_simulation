#!/usr/bin/env python
import rospy
from grapebot_msgs.msg import ControlCommand
# Simple publisher for testing
def talker(mode):
    pub = rospy.Publisher('/grapebot/ControlCommand',ControlCommand, queue_size=10)
    rospy.init_node('ControlCommandTalker', anonymous=True)
    rate = rospy.Rate(10)  

    command = ControlCommand()
    controlMode = mode
    command.controlMode = controlMode

    now = rospy.get_rostime()
    command.header.stamp.secs = now.secs
    command.header.stamp.nsecs = now.nsecs

    #timestr = 'start %s' % rospy.get_time()
    #rospy.loginfo(timestr)
    
    raw_steering_angle = 0.0
    raw_linear_velocity = 8.5

#    if ((now.secs) < 5) or ((now.secs) > 10):
#        raw_steering_angle = 0.0
#        raw_linear_velocity = 0.0
#    else:
#        raw_steering_angle = 0.0
#        raw_linear_velocity = 1.0         

    command.linearVelocity = raw_linear_velocity
    command.steeringAngle = raw_steering_angle
    command.robotStop = False
    pub.publish(command)
    rate.sleep()

if __name__ == '__main__':

    while not rospy.is_shutdown():
        talker(1)