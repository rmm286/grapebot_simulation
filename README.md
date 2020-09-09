# Grapebot Simulation

* Author: Rayne Milner
* Maintainer: Rayne Milner rmmilner@ucdavis.edu
* Org: UC Davis

## Description

Source code for grapebot gazebo simulator

## Dependencies list

* ROS: <http://wiki.ros.org/kinetic/Installation/Ubuntu>

## Launch Commands

1. Start gazebo, spawn grapebot and controllers

    * roslaunch grapebot_gazebo_sim start_grapebot.launch

2. Issue simple control commands

    * rosrun grapebot_gazebo_sim SimpleCommandPublisher.py
