;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::PIDSteerState)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'PIDSteerState (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::PIDSTEERSTATE")
  (make-package "GRAPEBOT_MSGS::PIDSTEERSTATE"))

(in-package "ROS")
;;//! \htmlinclude PIDSteerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::PIDSteerState
  :super ros::object
  :slots (_header _p_error _i_error _d_error _control_response _set_point ))

(defmethod grapebot_msgs::PIDSteerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:p_error __p_error) 0.0)
    ((:i_error __i_error) 0.0)
    ((:d_error __d_error) 0.0)
    ((:control_response __control_response) 0.0)
    ((:set_point __set_point) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _p_error (float __p_error))
   (setq _i_error (float __i_error))
   (setq _d_error (float __d_error))
   (setq _control_response (float __control_response))
   (setq _set_point (float __set_point))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:p_error
   (&optional __p_error)
   (if __p_error (setq _p_error __p_error)) _p_error)
  (:i_error
   (&optional __i_error)
   (if __i_error (setq _i_error __i_error)) _i_error)
  (:d_error
   (&optional __d_error)
   (if __d_error (setq _d_error __d_error)) _d_error)
  (:control_response
   (&optional __control_response)
   (if __control_response (setq _control_response __control_response)) _control_response)
  (:set_point
   (&optional __set_point)
   (if __set_point (setq _set_point __set_point)) _set_point)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _p_error
    8
    ;; float64 _i_error
    8
    ;; float64 _d_error
    8
    ;; float64 _control_response
    8
    ;; float64 _set_point
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _p_error
       (sys::poke _p_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_error
       (sys::poke _i_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d_error
       (sys::poke _d_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _control_response
       (sys::poke _control_response (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _set_point
       (sys::poke _set_point (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _p_error
     (setq _p_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_error
     (setq _i_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d_error
     (setq _d_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _control_response
     (setq _control_response (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _set_point
     (setq _set_point (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get grapebot_msgs::PIDSteerState :md5sum-) "e6d443c27b96bf6a06d83f395d0cd761")
(setf (get grapebot_msgs::PIDSteerState :datatype-) "grapebot_msgs/PIDSteerState")
(setf (get grapebot_msgs::PIDSteerState :definition-)
      "Header header
float64 p_error
float64 i_error
float64 d_error
float64 control_response
float64 set_point
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



(provide :grapebot_msgs/PIDSteerState "e6d443c27b96bf6a06d83f395d0cd761")


