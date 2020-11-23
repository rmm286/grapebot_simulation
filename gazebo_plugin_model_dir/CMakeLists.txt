cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

find_package(gazebo REQUIRED)

set(JSON_BuildTests OFF CACHE INTERNAL "")
add_subdirectory(${nlohmann_json_source} ${CMAKE_CURRENT_BINARY_DIR}/../json)

include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
list(APPEND CMAKE_CXX_FLAGS "${GAZEBO_CXX_FLAGS}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GAZEBO_CXX_FLAGS}")

add_library(factory SHARED factory.cc)
target_link_libraries(factory
  ${GAZEBO_LIBRARIES}
)

target_link_libraries(factory nlohmann_json::nlohmann_json)