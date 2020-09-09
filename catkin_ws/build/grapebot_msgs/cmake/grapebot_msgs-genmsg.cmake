# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "grapebot_msgs: 5 messages, 0 services")

set(MSG_I_FLAGS "-Igrapebot_msgs:/home/pc/temp/catkin_ws/src/grapebot_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(grapebot_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_custom_target(_grapebot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grapebot_msgs" "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_custom_target(_grapebot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grapebot_msgs" "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_custom_target(_grapebot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grapebot_msgs" "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_custom_target(_grapebot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grapebot_msgs" "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_custom_target(_grapebot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grapebot_msgs" "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_cpp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_cpp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_cpp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_cpp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(grapebot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(grapebot_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(grapebot_msgs_generate_messages grapebot_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_cpp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_cpp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_cpp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_cpp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_cpp _grapebot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grapebot_msgs_gencpp)
add_dependencies(grapebot_msgs_gencpp grapebot_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grapebot_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_eus(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_eus(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_eus(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_eus(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(grapebot_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(grapebot_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(grapebot_msgs_generate_messages grapebot_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_eus _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_eus _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_eus _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_eus _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_eus _grapebot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grapebot_msgs_geneus)
add_dependencies(grapebot_msgs_geneus grapebot_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grapebot_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_lisp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_lisp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_lisp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_lisp(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(grapebot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(grapebot_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(grapebot_msgs_generate_messages grapebot_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_lisp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_lisp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_lisp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_lisp _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_lisp _grapebot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grapebot_msgs_genlisp)
add_dependencies(grapebot_msgs_genlisp grapebot_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grapebot_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_nodejs(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_nodejs(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_nodejs(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_nodejs(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(grapebot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(grapebot_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(grapebot_msgs_generate_messages grapebot_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_nodejs _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_nodejs _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_nodejs _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_nodejs _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_nodejs _grapebot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grapebot_msgs_gennodejs)
add_dependencies(grapebot_msgs_gennodejs grapebot_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grapebot_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_py(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_py(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_py(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
)
_generate_msg_py(grapebot_msgs
  "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(grapebot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(grapebot_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(grapebot_msgs_generate_messages grapebot_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlCommand.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_py _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/PIDSteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_py _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/SteerState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_py _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/OdomCustom.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_py _grapebot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pc/temp/catkin_ws/src/grapebot_msgs/msg/ControlState.msg" NAME_WE)
add_dependencies(grapebot_msgs_generate_messages_py _grapebot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grapebot_msgs_genpy)
add_dependencies(grapebot_msgs_genpy grapebot_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grapebot_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grapebot_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(grapebot_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(grapebot_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(grapebot_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(grapebot_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grapebot_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(grapebot_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(grapebot_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(grapebot_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(grapebot_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grapebot_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(grapebot_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(grapebot_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(grapebot_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(grapebot_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grapebot_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(grapebot_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(grapebot_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(grapebot_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(grapebot_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grapebot_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(grapebot_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(grapebot_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(grapebot_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(grapebot_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
