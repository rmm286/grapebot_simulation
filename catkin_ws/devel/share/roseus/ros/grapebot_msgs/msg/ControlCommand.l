;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::ControlCommand)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'ControlCommand (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::CONTROLCOMMAND")
  (make-package "GRAPEBOT_MSGS::CONTROLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ControlCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::ControlCommand
  :super ros::object
  :slots (_header _linearVelocity _angularVelocity _steeringAngle _controlMode _robotStop ))

(defmethod grapebot_msgs::ControlCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:linearVelocity __linearVelocity) 0.0)
    ((:angularVelocity __angularVelocity) 0.0)
    ((:steeringAngle __steeringAngle) 0.0)
    ((:controlMode __controlMode) 0)
    ((:robotStop __robotStop) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _linearVelocity (float __linearVelocity))
   (setq _angularVelocity (float __angularVelocity))
   (setq _steeringAngle (float __steeringAngle))
   (setq _controlMode (round __controlMode))
   (setq _robotStop __robotStop)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:linearVelocity
   (&optional __linearVelocity)
   (if __linearVelocity (setq _linearVelocity __linearVelocity)) _linearVelocity)
  (:angularVelocity
   (&optional __angularVelocity)
   (if __angularVelocity (setq _angularVelocity __angularVelocity)) _angularVelocity)
  (:steeringAngle
   (&optional __steeringAngle)
   (if __steeringAngle (setq _steeringAngle __steeringAngle)) _steeringAngle)
  (:controlMode
   (&optional __controlMode)
   (if __controlMode (setq _controlMode __controlMode)) _controlMode)
  (:robotStop
   (&optional __robotStop)
   (if __robotStop (setq _robotStop __robotStop)) _robotStop)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _linearVelocity
    4
    ;; float32 _angularVelocity
    4
    ;; float32 _steeringAngle
    4
    ;; int16 _controlMode
    2
    ;; bool _robotStop
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _linearVelocity
       (sys::poke _linearVelocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angularVelocity
       (sys::poke _angularVelocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steeringAngle
       (sys::poke _steeringAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _controlMode
       (write-word _controlMode s)
     ;; bool _robotStop
       (if _robotStop (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _linearVelocity
     (setq _linearVelocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angularVelocity
     (setq _angularVelocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steeringAngle
     (setq _steeringAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _controlMode
     (setq _controlMode (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _robotStop
     (setq _robotStop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get grapebot_msgs::ControlCommand :md5sum-) "d93c5b5e27556bc38e51f13b2d85f1fa")
(setf (get grapebot_msgs::ControlCommand :datatype-) "grapebot_msgs/ControlCommand")
(setf (get grapebot_msgs::ControlCommand :definition-)
      "Header header
float32 linearVelocity
float32 angularVelocity
float32 steeringAngle
int16 controlMode
bool robotStop
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



(provide :grapebot_msgs/ControlCommand "d93c5b5e27556bc38e51f13b2d85f1fa")


