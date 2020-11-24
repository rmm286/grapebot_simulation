# Grapebot Simulation: A Physics Simulator for an Agricultural Vehicle

* Author: Rayne Milner
* Maintainer: Rayne Milner
* Contact: rmmilner@ucdavis.edu
* Org: Univeristy of California at Davis

## Overview

***

The Grapebot simulator is a ROS based tool that uses [Gazebo][1] to model the physics of an agricultural vehicle. This simulator is designed to interface with robotic systems exactly like a physical robot and provide tools for faster development and validation of these systems.

## Dependencies

***

* ROS Kinetic: <http://wiki.ros.org/kinetic/Installation/Ubuntu>

    * ROS Kinetic is only supported on a few Ubuntu distributions and architectures, check the ROS installation page for details.

## Installation

***

Note: Working on developing a single file download.

ROS is built in a catkin workspace. Read more about catkin [here](http://wiki.ros.org/action/fullsearch/catkin/conceptual_overview?action=fullsearch&context=180&value=linkto%3A%22catkin%2Fconceptual_overview%22).

To build, navigate to the catkin workspace, remove any build files and run catkin_make.

 `cd catkin_ws;`
 `rm -rd build;`
 `catkin_make;`

You may need to rebuild the world plugin package, built with cmake and make.

At this point, you may encounter issues with dependencies so you can install these with your package manager, with [rosdep](http://wiki.ros.org/ROS/Tutorials/rosdep), or with APT like this.

`sudo apt-get install ros-kinetic-<dependency>;`

Run catkin_make until successful.

## Usage

***

All primary functionalities are initialized with one roslaunch command: `roslaunch grapebot_sim_launch start_grapebot.launch;`. This command will open gazebo, spawn the grapebot, start the controllers as well as publish all output topics. In order to move the grapeobt, the user must publish messages to the ControlCommand topic, either through the command line, or with another node.

Additional launch commands initialize data visualization, run a simple control command publisher, or start Rviz visualization. See Launch Commands subsection.

The Rosnodes in this package produce data streams in the form of [Rostopics][2]. The relevant topics are described in the Topics subsection.

### Launch Commands

Start gazebo, spawn grapebot and controllers in the custom map world:

* `roslaunch grapebot_sim_launch start_grapebot_in_map.launch`

Start gazebo, spawn grapebot and controllers in the empty world:

* `roslaunch grapebot_sim_launch start_grapebot_in_empty_world.launch`

Issue simple control commands:

* `rosrun grapebot_sim_launch SimpleCommandPublisher.py`

Visualize using Rviz:

* `roslaunch grapebot_sim_launch display.launch`

Data Visualization Node:

* `roslaunch grapebot_sim_launch start_data_analysis.launch`

## Topics

***

### Input Topics

These topics are taken as inputs to the nodes in the simulation. Topics can be sent on the command line with a call like `rostopic pub <topic-name> <topic-type> [data...]`. See [rostopics wiki page][2] for more information.

### ControlCommand

`"/grapebot/ControlCommand"`

Data on this topic is received by control node and translated into low level control commands for the wheels and turning axis. The control command topic has the following structure:

```
Header header
float32 linearVelocity
float32 angularVelocity
float32 steeringAngle
int16 controlMode
bool robotStop
```

Commands can be given in two high level modes: ControlMode 0 and 1. In mode 0, the message should contain linear velocity and angular velocity components, but not steering angle. In mode 1, the message should contain linear velocity and steering angle components, not angular velocity.

### Output Topics

These topics are published as outputs from the nodes in the simulation. Topics can be read on the command line with a call like `rostopic echo <topic-name>`. See [rostopics wiki page][2] for more information.

### Odometry

`"/odom"`

This topic provides the current odometry of the COM of the robot in the world frame. This message is calculated from the wheel velocities and the steering angle as read by gazebo joint state topic. Is a standard [nav_message](http://docs.ros.org/melodic/api/nav_msgs/html/msg/Odometry.html).

### ControlState

`"/grapebot/ControlState"`

This topic relays the current state of the Control Structure of the robot. Primarily used for debug. It has the following structure:

```
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
```

### JointState

`"/grapebot/JointState"`

The joint states topic is a data stream which publishes the position, velocity and effort for every controlled joint in the robot description as calculated by gazebos physics engines. Note that the joint state reflects real dynamics and will not be exactly equal to the commanded velocity/position for that joint. Revolute joints give angles as radians.

Details on this topic can be found in the [sensor messages documentation for Joint States][4].

Below is the name of each controlled joint.

* back_left_wheel_joint
* back_right_wheel_joint
* front_wheel_axis_joint
* front_wheel_joint

### ModelState

`"/gazebo/model_states"`

Gazebo publishes the state of each object in the simulation in the form of Pose and Twist messages. Details on this message can be found in the [sensor messages documentation for Model States][5]. This message can be used as a ground truth for the simulation.

### Internal Topics

There are a few topics that are used internally to communicate between nodes. These messages may be read or published for debugging purposes or to extend functionality.

### Controller Commands

* `"/grapebot/back_left_wheel_joint_velocity_controller/command"`

* `"/grapebot/back_right_wheel_joint_velocity_controller/command"`

* `"/grapebot/front_wheel_axis_joint_position_controller/command"`

* `"/grapebot/front_wheel_joint_velocity_controller/command"`

There is one message generated for each controller. In this simulation there are three velocity controllers to set the velocity of each wheel, as well as one position controller to set the position of the steering axis. Details about ROS control can be found in the [ROS control documentation][3] and in the package descriptions section.

## Package Descriptions

***

### Grapebot Gazebo Sim

Contains robot description for simulation in gazebo

1. Robot Description (URDF)

    * Robot description developed through sw2urdf plugin: <http://wiki.ros.org/sw_urdf_exporter>

    * Mesh files from solidworks

2. Controller configuration

PID gains set to arbitrary values

* Front wheel velocity controller
* Back right wheel velocity controller
* Back left wheel velocity controller
* Front steering position controller

### Simulation Control

1. Robot

    * Stores geometric description of robot
    * Stores control commands, control state

2. Robot Odom

    Provides functionality to compute odometry of robot.

    * Reads model state from gazebo, initialize starting position
    * Reads joint states (wheel velocity and steering position) from gazebo
    * Publishes odometry

3. Simulation Control

    Main file for package. Read high level control commands and compute desired wheel velocity

    * Publishes joint state commands
    * Reads control command
    * Publishes control state topic for debug

### Grapebot Data Analysis

Record data and provide visualization through pandas and matplotlib.

* Reads true state from gazebo
* Reads Odometry topic
* Saves data streams to csv
* Provides visualization of odometry and true state, saved to cwd as PNG images
* Provides visualization of linear velocity response, saved to cwd as PNG images.

## External Links

***

* <http://gazebosim.org/tutorials?tut=guided_b1&cat=>
* <http://wiki.ros.org/rostopic>
* <https://wiki.ros.org/ros_control>
* <http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html>
* <http://docs.ros.org/kinetic/api/gazebo_msgs/html/msg/ModelState.html>
* <http://wiki.ros.org/sw_urdf_exporter>
* <http://wiki.ros.org/action/fullsearch/catkin/conceptual_overview?action=fullsearch&context=180&value=linkto%3A%22catkin%2Fconceptual_overview%22>

## License

***

MIT License

Copyright (c) [2020] [Rayne Michael Milner]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[1]: http://gazebosim.org/tutorials?tut=guided_b1&cat=
[2]: http://wiki.ros.org/rostopic
[3]: https://wiki.ros.org/ros_control
[4]: http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html
[5]: http://docs.ros.org/kinetic/api/gazebo_msgs/html/msg/ModelState.html
