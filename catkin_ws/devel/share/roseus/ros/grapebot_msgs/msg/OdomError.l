;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::OdomError)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'OdomError (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::ODOMERROR")
  (make-package "GRAPEBOT_MSGS::ODOMERROR"))

(in-package "ROS")
;;//! \htmlinclude OdomError.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::OdomError
  :super ros::object
  :slots (_header _xError _yError _thetaError _vxError _vyError _angularVelocityError _linearVelocityError ))

(defmethod grapebot_msgs::OdomError
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:xError __xError) 0.0)
    ((:yError __yError) 0.0)
    ((:thetaError __thetaError) 0.0)
    ((:vxError __vxError) 0.0)
    ((:vyError __vyError) 0.0)
    ((:angularVelocityError __angularVelocityError) 0.0)
    ((:linearVelocityError __linearVelocityError) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _xError (float __xError))
   (setq _yError (float __yError))
   (setq _thetaError (float __thetaError))
   (setq _vxError (float __vxError))
   (setq _vyError (float __vyError))
   (setq _angularVelocityError (float __angularVelocityError))
   (setq _linearVelocityError (float __linearVelocityError))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:xError
   (&optional __xError)
   (if __xError (setq _xError __xError)) _xError)
  (:yError
   (&optional __yError)
   (if __yError (setq _yError __yError)) _yError)
  (:thetaError
   (&optional __thetaError)
   (if __thetaError (setq _thetaError __thetaError)) _thetaError)
  (:vxError
   (&optional __vxError)
   (if __vxError (setq _vxError __vxError)) _vxError)
  (:vyError
   (&optional __vyError)
   (if __vyError (setq _vyError __vyError)) _vyError)
  (:angularVelocityError
   (&optional __angularVelocityError)
   (if __angularVelocityError (setq _angularVelocityError __angularVelocityError)) _angularVelocityError)
  (:linearVelocityError
   (&optional __linearVelocityError)
   (if __linearVelocityError (setq _linearVelocityError __linearVelocityError)) _linearVelocityError)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _xError
    8
    ;; float64 _yError
    8
    ;; float64 _thetaError
    8
    ;; float64 _vxError
    8
    ;; float64 _vyError
    8
    ;; float64 _angularVelocityError
    8
    ;; float64 _linearVelocityError
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _xError
       (sys::poke _xError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yError
       (sys::poke _yError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _thetaError
       (sys::poke _thetaError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vxError
       (sys::poke _vxError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vyError
       (sys::poke _vyError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angularVelocityError
       (sys::poke _angularVelocityError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linearVelocityError
       (sys::poke _linearVelocityError (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _xError
     (setq _xError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yError
     (setq _yError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _thetaError
     (setq _thetaError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vxError
     (setq _vxError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vyError
     (setq _vyError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angularVelocityError
     (setq _angularVelocityError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linearVelocityError
     (setq _linearVelocityError (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get grapebot_msgs::OdomError :md5sum-) "7f07c711d610abd5fe2a2b6e0224c4ac")
(setf (get grapebot_msgs::OdomError :datatype-) "grapebot_msgs/OdomError")
(setf (get grapebot_msgs::OdomError :definition-)
      "Header header

float64 xError
float64 yError
float64 thetaError
float64 vxError
float64 vyError
float64 angularVelocityError
float64 linearVelocityError
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



(provide :grapebot_msgs/OdomError "7f07c711d610abd5fe2a2b6e0224c4ac")


