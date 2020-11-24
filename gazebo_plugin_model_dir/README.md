# Custom World Plugin

## Overview

This package is used to build a custom world in gazebo. It is built from the bascis of the [Gazebo World Plugin Tutorial](http://gazebosim.org/tutorials?cat=install&tut=plugins_world&ver=7%20-%208). The custom world is built from a JSON file.

## Dependencies

- Gazebo 7: avaible with ROS Kinetic Full installation.
- [nlohmann_json](https://github.com/nlohmann/json): This library is embedded in the project, no additional files required.

## Installation

Built using cmake.

## Usage

To change the behvior of the world plugin the user can modify the factory.cc file. The most important paramters are

- map_file_name: determines which json file is used to build the custom world.
- model_name: determines which model is used to build the rows.
- row_size: determines how many rows are built in the custom world.

The map_fil JSON contains information about how to build the world. Origin and odom_T_gps are two fields that determine how any given coordinate is transformed from the UTM frame to the local frame. The Rows field contains many pairs of coordinates. These coordinates define the endpoints of rows and are the basis for the custom world.
