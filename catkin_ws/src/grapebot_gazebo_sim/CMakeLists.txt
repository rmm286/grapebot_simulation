cmake_minimum_required(VERSION 2.8.3)

project(grapebot_gazebo_sim)

find_package(catkin REQUIRED)

find_package(catkin REQUIRED COMPONENTS
	grapebot_msgs
	roscpp
  	rospy
  	std_msgs)

foreach(dir config meshes urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)
