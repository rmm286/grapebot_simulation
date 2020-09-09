import rospy
class Robot(object):
  """docstring for RobotControlState"""
  def __init__(self):
    
    # import the dimension of robot here
    self.wheel_radius = rospy.get_param('wheel_radius', 0.19) #m 
    self.robot_length = rospy.get_param('robot_length', 1.2446) #m 
    self.track_width = rospy.get_param('track_width', 1.0239) #m 
    # software stop flag
    self.stop = False
    
    # commands (set point)
    ## for robot
    ## mode 0: linear velociy + angular velociy
    ## mode 1: linear velociy + steer angle
    self.control_mode = 1 
    self.linear_velocity_command = 0.0
    self.angular_velocity_command = 0.0
    self.steer_angle_command = 0.0
    ## ackerman to motors from steer angle  
    self.wheelVelocitiesCommand = {}
    self.wheelVelocitiesCommand['left'] = 0.0
    self.wheelVelocitiesCommand['right'] = 0.0
    self.wheelVelocitiesCommand['front'] = 0.0

    # robot states (response)
    self.linear_velocity = 0.0 
    self.angular_velocity = 0.0 
    self.steer_angle = 0.0
    self.wheelVelocities = {}
    self.wheelVelocities['left'] = 0.0
    self.wheelVelocities['right'] = 0.0
    self.wheelVelocities['front'] = 0.0