cmake_minimum_required(VERSION 2.8.3)
project(grapebot_msgs)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED
  COMPONENTS
    rospy
    message_generation
    std_msgs
    geometry_msgs
    sensor_msgs
    nav_msgs
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  ControlCommand.msg
  ControlState.msg
  PIDSteerState.msg
  SteerState.msg
  OdomCustom.msg
)

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
  geometry_msgs
  sensor_msgs
  nav_msgs
)
###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES frailbot_msgs
  CATKIN_DEPENDS
    message_runtime
    std_msgs
    geometry_msgs
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)