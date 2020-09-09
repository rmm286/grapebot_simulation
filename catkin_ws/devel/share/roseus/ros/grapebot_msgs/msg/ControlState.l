;; Auto-generated. Do not edit!


(when (boundp 'grapebot_msgs::ControlState)
  (if (not (find-package "GRAPEBOT_MSGS"))
    (make-package "GRAPEBOT_MSGS"))
  (shadow 'ControlState (find-package "GRAPEBOT_MSGS")))
(unless (find-package "GRAPEBOT_MSGS::CONTROLSTATE")
  (make-package "GRAPEBOT_MSGS::CONTROLSTATE"))

(in-package "ROS")
;;//! \htmlinclude ControlState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grapebot_msgs::ControlState
  :super ros::object
  :slots (_header _SteerAngleCommand _SteerAngleResponse _linearVelocityCommand _leftWheelVelocityCommand _rightWheelVelocityCommand _frontWheelVelocityCommand _linearVelocityResponse _leftWheelVelocityResponse _rightWheelVelocityResponse _frontWheelVelocityResponse ))

(defmethod grapebot_msgs::ControlState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:SteerAngleCommand __SteerAngleCommand) 0.0)
    ((:SteerAngleResponse __SteerAngleResponse) 0.0)
    ((:linearVelocityCommand __linearVelocityCommand) 0.0)
    ((:leftWheelVelocityCommand __leftWheelVelocityCommand) 0.0)
    ((:rightWheelVelocityCommand __rightWheelVelocityCommand) 0.0)
    ((:frontWheelVelocityCommand __frontWheelVelocityCommand) 0.0)
    ((:linearVelocityResponse __linearVelocityResponse) 0.0)
    ((:leftWheelVelocityResponse __leftWheelVelocityResponse) 0.0)
    ((:rightWheelVelocityResponse __rightWheelVelocityResponse) 0.0)
    ((:frontWheelVelocityResponse __frontWheelVelocityResponse) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _SteerAngleCommand (float __SteerAngleCommand))
   (setq _SteerAngleResponse (float __SteerAngleResponse))
   (setq _linearVelocityCommand (float __linearVelocityCommand))
   (setq _leftWheelVelocityCommand (float __leftWheelVelocityCommand))
   (setq _rightWheelVelocityCommand (float __rightWheelVelocityCommand))
   (setq _frontWheelVelocityCommand (float __frontWheelVelocityCommand))
   (setq _linearVelocityResponse (float __linearVelocityResponse))
   (setq _leftWheelVelocityResponse (float __leftWheelVelocityResponse))
   (setq _rightWheelVelocityResponse (float __rightWheelVelocityResponse))
   (setq _frontWheelVelocityResponse (float __frontWheelVelocityResponse))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:SteerAngleCommand
   (&optional __SteerAngleCommand)
   (if __SteerAngleCommand (setq _SteerAngleCommand __SteerAngleCommand)) _SteerAngleCommand)
  (:SteerAngleResponse
   (&optional __SteerAngleResponse)
   (if __SteerAngleResponse (setq _SteerAngleResponse __SteerAngleResponse)) _SteerAngleResponse)
  (:linearVelocityCommand
   (&optional __linearVelocityCommand)
   (if __linearVelocityCommand (setq _linearVelocityCommand __linearVelocityCommand)) _linearVelocityCommand)
  (:leftWheelVelocityCommand
   (&optional __leftWheelVelocityCommand)
   (if __leftWheelVelocityCommand (setq _leftWheelVelocityCommand __leftWheelVelocityCommand)) _leftWheelVelocityCommand)
  (:rightWheelVelocityCommand
   (&optional __rightWheelVelocityCommand)
   (if __rightWheelVelocityCommand (setq _rightWheelVelocityCommand __rightWheelVelocityCommand)) _rightWheelVelocityCommand)
  (:frontWheelVelocityCommand
   (&optional __frontWheelVelocityCommand)
   (if __frontWheelVelocityCommand (setq _frontWheelVelocityCommand __frontWheelVelocityCommand)) _frontWheelVelocityCommand)
  (:linearVelocityResponse
   (&optional __linearVelocityResponse)
   (if __linearVelocityResponse (setq _linearVelocityResponse __linearVelocityResponse)) _linearVelocityResponse)
  (:leftWheelVelocityResponse
   (&optional __leftWheelVelocityResponse)
   (if __leftWheelVelocityResponse (setq _leftWheelVelocityResponse __leftWheelVelocityResponse)) _leftWheelVelocityResponse)
  (:rightWheelVelocityResponse
   (&optional __rightWheelVelocityResponse)
   (if __rightWheelVelocityResponse (setq _rightWheelVelocityResponse __rightWheelVelocityResponse)) _rightWheelVelocityResponse)
  (:frontWheelVelocityResponse
   (&optional __frontWheelVelocityResponse)
   (if __frontWheelVelocityResponse (setq _frontWheelVelocityResponse __frontWheelVelocityResponse)) _frontWheelVelocityResponse)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _SteerAngleCommand
    4
    ;; float32 _SteerAngleResponse
    4
    ;; float32 _linearVelocityCommand
    4
    ;; float32 _leftWheelVelocityCommand
    4
    ;; float32 _rightWheelVelocityCommand
    4
    ;; float32 _frontWheelVelocityCommand
    4
    ;; float32 _linearVelocityResponse
    4
    ;; float32 _leftWheelVelocityResponse
    4
    ;; float32 _rightWheelVelocityResponse
    4
    ;; float32 _frontWheelVelocityResponse
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _SteerAngleCommand
       (sys::poke _SteerAngleCommand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _SteerAngleResponse
       (sys::poke _SteerAngleResponse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearVelocityCommand
       (sys::poke _linearVelocityCommand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _leftWheelVelocityCommand
       (sys::poke _leftWheelVelocityCommand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rightWheelVelocityCommand
       (sys::poke _rightWheelVelocityCommand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _frontWheelVelocityCommand
       (sys::poke _frontWheelVelocityCommand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearVelocityResponse
       (sys::poke _linearVelocityResponse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _leftWheelVelocityResponse
       (sys::poke _leftWheelVelocityResponse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rightWheelVelocityResponse
       (sys::poke _rightWheelVelocityResponse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _frontWheelVelocityResponse
       (sys::poke _frontWheelVelocityResponse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _SteerAngleCommand
     (setq _SteerAngleCommand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _SteerAngleResponse
     (setq _SteerAngleResponse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearVelocityCommand
     (setq _linearVelocityCommand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _leftWheelVelocityCommand
     (setq _leftWheelVelocityCommand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rightWheelVelocityCommand
     (setq _rightWheelVelocityCommand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _frontWheelVelocityCommand
     (setq _frontWheelVelocityCommand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearVelocityResponse
     (setq _linearVelocityResponse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _leftWheelVelocityResponse
     (setq _leftWheelVelocityResponse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rightWheelVelocityResponse
     (setq _rightWheelVelocityResponse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _frontWheelVelocityResponse
     (setq _frontWheelVelocityResponse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get grapebot_msgs::ControlState :md5sum-) "349f39f889b30f99304b05f07b1445d7")
(setf (get grapebot_msgs::ControlState :datatype-) "grapebot_msgs/ControlState")
(setf (get grapebot_msgs::ControlState :definition-)
      "Header header

float32 SteerAngleCommand
float32 SteerAngleResponse

float32 linearVelocityCommand
float32 leftWheelVelocityCommand
float32 rightWheelVelocityCommand
float32 frontWheelVelocityCommand
float32 linearVelocityResponse
float32 leftWheelVelocityResponse
float32 rightWheelVelocityResponse
float32 frontWheelVelocityResponse
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



(provide :grapebot_msgs/ControlState "349f39f889b30f99304b05f07b1445d7")


