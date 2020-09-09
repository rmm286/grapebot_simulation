cmake_minimum_required(VERSION 2.8.3)

project(grapebot_data_analysis)

find_package(catkin REQUIRED)

catkin_package(
 CATKIN_DEPENDS 
  grapebot_msgs
)

find_package(catkin REQUIRED COMPONENTS
	grapebot_msgs
	roscpp
  	rospy
  	std_msgs)

foreach(dir config launch meshes urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)