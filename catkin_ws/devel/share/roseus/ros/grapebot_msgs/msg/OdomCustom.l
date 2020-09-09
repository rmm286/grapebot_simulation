;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::OdomCustom)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'OdomCustom (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::ODOMCUSTOM")
  (make-package "GRAPEBOT_MSGS::ODOMCUSTOM"))

(in-package "ROS")
;;//! \htmlinclude OdomCustom.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::OdomCustom
  :super ros::object
  :slots (_header _x _y _theta _vx _vy _angularVelocity _linearVelocity ))

(defmethod grapebot_msgs::OdomCustom
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:angularVelocity __angularVelocity) 0.0)
    ((:linearVelocity __linearVelocity) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _angularVelocity (float __angularVelocity))
   (setq _linearVelocity (float __linearVelocity))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:angularVelocity
   (&optional __angularVelocity)
   (if __angularVelocity (setq _angularVelocity __angularVelocity)) _angularVelocity)
  (:linearVelocity
   (&optional __linearVelocity)
   (if __linearVelocity (setq _linearVelocity __linearVelocity)) _linearVelocity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _angularVelocity
    8
    ;; float64 _linearVelocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angularVelocity
       (sys::poke _angularVelocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linearVelocity
       (sys::poke _linearVelocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angularVelocity
     (setq _angularVelocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linearVelocity
     (setq _linearVelocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get grapebot_msgs::OdomCustom :md5sum-) "cb1d581231acbe75fed151be720c6675")
(setf (get grapebot_msgs::OdomCustom :datatype-) "grapebot_msgs/OdomCustom")
(setf (get grapebot_msgs::OdomCustom :definition-)
      "Header header

float64 x
float64 y
float64 theta
float64 vx
float64 vy
float64 angularVelocity
float64 linearVelocity
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



(provide :grapebot_msgs/OdomCustom "cb1d581231acbe75fed151be720c6675")


