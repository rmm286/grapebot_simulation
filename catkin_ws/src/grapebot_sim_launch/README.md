# Explanation of launch files

## Main Launch Files

### start_grapebot_in_map.launch

Spawn the grapebot with controllers in the custom plugin world in gazebo. This launch file calls two other launch files in this package: `spawn_grapebot_with_controller_in_map.launch` and `grapebot_control.launch`.

### start_grapebot_in_empty_world.launch

Spawn the grapebot with controller in an empty world. This launch file calls two other launch files in this package: `spawn_grapebot_with_controller_in_empty_world.launch` and `grapebot_control.launch`

### spawn_grapebot_with_controller_in_empty_world.launch

Launch empty world and spawns grapebot. Calls another file `spawn_urdf.launch`. Called by `start_grapebot_in_empty_world.launch`.

### spawn_grapebot_with_controller_in_map.launch

Launch custom world and spawns grapebot. Calls another file `spawn_urdf.launch`. Called by `start_grapebot_in_map.launch`.

### spawn_urdf.launch

Spawn any generic urdf using a python script. Has arguments to modify the location where the robot is spawned. Called by `spawn_grapebot_with_controller_in_map.launch` and `spawn_grapebot_with_controller_in_empty_world.launch`.

## Additional Launch Files

### display.launch

Spawn the grapebot and open RVIZ visualizer.

### gazebo.launch

Spawn the grapebot in an empty gazebo world without controllers.

### grapebot_control.launch

Spawn the controllers for the grapebot.

### map_world.launch

Open the custom plugin world in gazebo.
