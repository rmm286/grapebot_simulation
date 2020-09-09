# Grapebot Simulation

* Author: Rayne Milner
* Maintainer: Rayne Milner rmmilner@ucdavis.edu
* Orginization: Uuniveristy of California at Davis

## Description

Source code for grapebot gazebo simulator.

## Dependencies list

* ROS: <http://wiki.ros.org/kinetic/Installation/Ubuntu>

## Launch Commands

1. Start gazebo, spawn grapebot and controllers

    * roslaunch grapebot_sim_launch start_grapebot.launch

2. Issue simple control commands

    * rosrun grapebot_gazebo_sim SimpleCommandPublisher.py

## Package Description

### Grapebot Gazebo Sim

Robot description for simulation in gazebo

1. Robot Description

    * Robot description developed through sw2urdf plugin <http://wiki.ros.org/sw_urdf_exporter>

    * Mesh files from solidworks

2. Controller configuration

PID gains set to arbitrary values

* Front wheel velocity controller
* Back right wheel velocity controller
* Back left wheel velocity controller
* Front steering position controller

### Simulation Control

1. Robot

    * Store geometric description of robot
    * Store control commands, control state

2. Robot Odom

    Provides functionality to compute odometry of robot.

    * Read model state from gazebo, initialize starting position
    * Read joint states (wheel velocity and steering position) from gazebo
    * Publish odometry

3. Simulation Control

    Main file for package. Read high level control commands and compute desired wheel velocity

    * Publish joint state commands
    * Read control command
    * Publish control state topic for debug

### Grapebot Data Analysis

Record data and provide visualization through pandas and matplotlib.

* Read true state from gazebo
* Read Odometry topic
* Save data streams to csv
* Provide visualization of odometry and true state, saved to cwd as PNG images
* Provide visualization of linear velocity response, saved to cwd as PNG images.
