#!/usr/bin/env python
import rospy
import math
import numpy as np
import tf
import tf2_ros
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
import geometry_msgs.msg
#import transformation_py.transformation as transformation

class FieldMapPublisher(object):
    def __init__(self):
        rospy.init_node('field_map')
        # rospy.sleep(0.5)  # Wait for a while for init to complete before printing
        rospy.loginfo(rospy.get_name() + " start")
        self.rate = rospy.Rate(1.) # 10hz

        # get static map information
        self.map_file = rospy.get_param('map_file', default= '/home/pc/grapebot_simulation/catkin_ws/src/map_initializer/RMI-Harry-E-Jacob-UTM-Extend.txt')
        self.map_dict = eval(open('/home/pc/grapebot_simulation/catkin_ws/src/map_initializer/RMI-Harry-E-Jacob-UTM-Extend.txt', 'r').read())
        #TODO: fix map file
        self.map_heading = self.map_dict['heading']
        self.map_origin = np.asarray(self.map_dict['origin'])
        self.map_rows = np.asarray(self.map_dict['rows'])
        #print("map_file: ", self.map_file)
        print("map_heading: ", self.map_heading)
        print("map_origin: ", self.map_origin)
        print("map_rows: ", self.map_rows.shape)

        self.odom_T_gps =  np.asarray(self.map_dict['odom_T_gps'])
        self.tf_listener = tf.TransformListener()

        self.publish_ned_to_field_static_tf()
        self.map_rows_local = self.transform_map_points_to_local_frame()

        self.field_row_lines = Marker() # line list

        self.add_field_ros_feature()

        # # create vertices for points and lines
        self.rviz_plot()
        self.map_publisher = rospy.Publisher("/field_map", Marker, queue_size=10)

    def publish_ned_to_field_static_tf(self):
        translation = self.odom_T_gps[:, 3]
        static_transformStamped = geometry_msgs.msg.TransformStamped()
        static_transformStamped.header.stamp = rospy.Time.now()
        static_transformStamped.header.frame_id = "baseline_ned"
        static_transformStamped.child_frame_id = "odom"
        static_transformStamped.transform.translation.x = translation[0]
        static_transformStamped.transform.translation.y = translation[1]
        static_transformStamped.transform.translation.z = translation[2]
        quat = tf.transformations.quaternion_from_matrix(self.odom_T_gps)
        static_transformStamped.transform.rotation.x = quat[0]
        static_transformStamped.transform.rotation.y = quat[1]
        static_transformStamped.transform.rotation.z = quat[2]
        static_transformStamped.transform.rotation.w = quat[3]
        broadcaster = tf2_ros.StaticTransformBroadcaster()
        broadcaster.sendTransform(static_transformStamped)


    def transform_map_points_to_local_frame(self):
        map_rows_transfered = self.map_rows.copy()[:, :, :2]
        map_rows_transfered = map_rows_transfered.reshape([-1, 2])
        map_rows_transfered_T = np.concatenate([map_rows_transfered, np.ones([len(map_rows_transfered), 2])], axis=1).T
        map_rows_transfered_T = self.odom_T_gps.dot(map_rows_transfered_T)
        map_rows_transfered = map_rows_transfered_T.T
        map_rows_transfered = map_rows_transfered[:, :2]
        map_rows_transfered = map_rows_transfered.reshape([-1, 2, 2])
        return map_rows_transfered


    def add_field_ros_feature(self):
        self.field_row_lines.header.frame_id = "/odom"
        self.field_row_lines.ns = "field_beds"
        self.field_row_lines.type = Marker.LINE_LIST
        self.field_row_lines.action = Marker.ADD
        self.field_row_lines.pose.orientation.w = 1.0
        self.field_row_lines.scale.x = 0.2

        self.field_row_lines.color.r = 1.0
        self.field_row_lines.color.a = 1.0

    def rviz_plot(self):
        # draw plant bed points and beds
        for row in self.map_rows_local:
            p = Point()
            p.x = row[0, 0]
            p.y = row[0, 1]
            p.z = 0.0
            self.field_row_lines.points.append(p)
            p2 = Point()
            p2.x = row[1, 0]
            p2.y = row[1, 1]
            p2.z = 0.0
            self.field_row_lines.points.append(p2)

    def map_pub(self):
        while not rospy.is_shutdown():
            self.map_publisher.publish(self.field_row_lines)
            self.rate.sleep()

if __name__ == '__main__':
    field_map_publisher = FieldMapPublisher()
    try:
        field_map_publisher.map_pub()
    except rospy.ROSInterruptException:
        pass
