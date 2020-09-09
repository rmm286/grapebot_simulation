;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::SteerState)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'SteerState (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::STEERSTATE")
  (make-package "GRAPEBOT_MSGS::STEERSTATE"))

(in-package "ROS")
;;//! \htmlinclude SteerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::SteerState
  :super ros::object
  :slots (_header _CurrentSteerAngle _CurrentSensorRead ))

(defmethod grapebot_msgs::SteerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:CurrentSteerAngle __CurrentSteerAngle) 0.0)
    ((:CurrentSensorRead __CurrentSensorRead) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _CurrentSteerAngle (float __CurrentSteerAngle))
   (setq _CurrentSensorRead (float __CurrentSensorRead))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:CurrentSteerAngle
   (&optional __CurrentSteerAngle)
   (if __CurrentSteerAngle (setq _CurrentSteerAngle __CurrentSteerAngle)) _CurrentSteerAngle)
  (:CurrentSensorRead
   (&optional __CurrentSensorRead)
   (if __CurrentSensorRead (setq _CurrentSensorRead __CurrentSensorRead)) _CurrentSensorRead)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _CurrentSteerAngle
    4
    ;; float32 _CurrentSensorRead
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _CurrentSteerAngle
       (sys::poke _CurrentSteerAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CurrentSensorRead
       (sys::poke _CurrentSensorRead (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _CurrentSteerAngle
     (setq _CurrentSteerAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CurrentSensorRead
     (setq _CurrentSensorRead (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get grapebot_msgs::SteerState :md5sum-) "95d8e1b9d99823009e315b31307e1b15")
(setf (get grapebot_msgs::SteerState :datatype-) "grapebot_msgs/SteerState")
(setf (get grapebot_msgs::SteerState :definition-)
      "Header header

float32 CurrentSteerAngle
float32 CurrentSensorRead
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :grapebot_msgs/SteerState "95d8e1b9d99823009e315b31307e1b15")


