; Auto-generated. Do not edit!


(cl:in-package grapebot_msgs-msg)


;//! \htmlinclude ControlCommand.msg.html

(cl:defclass <ControlCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (linearVelocity
    :reader linearVelocity
    :initarg :linearVelocity
    :type cl:float
    :initform 0.0)
   (angularVelocity
    :reader angularVelocity
    :initarg :angularVelocity
    :type cl:float
    :initform 0.0)
   (steeringAngle
    :reader steeringAngle
    :initarg :steeringAngle
    :type cl:float
    :initform 0.0)
   (controlMode
    :reader controlMode
    :initarg :controlMode
    :type cl:fixnum
    :initform 0)
   (robotStop
    :reader robotStop
    :initarg :robotStop
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ControlCommand (<ControlCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grapebot_msgs-msg:<ControlCommand> is deprecated: use grapebot_msgs-msg:ControlCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:header-val is deprecated.  Use grapebot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'linearVelocity-val :lambda-list '(m))
(cl:defmethod linearVelocity-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:linearVelocity-val is deprecated.  Use grapebot_msgs-msg:linearVelocity instead.")
  (linearVelocity m))

(cl:ensure-generic-function 'angularVelocity-val :lambda-list '(m))
(cl:defmethod angularVelocity-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:angularVelocity-val is deprecated.  Use grapebot_msgs-msg:angularVelocity instead.")
  (angularVelocity m))

(cl:ensure-generic-function 'steeringAngle-val :lambda-list '(m))
(cl:defmethod steeringAngle-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:steeringAngle-val is deprecated.  Use grapebot_msgs-msg:steeringAngle instead.")
  (steeringAngle m))

(cl:ensure-generic-function 'controlMode-val :lambda-list '(m))
(cl:defmethod controlMode-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:controlMode-val is deprecated.  Use grapebot_msgs-msg:controlMode instead.")
  (controlMode m))

(cl:ensure-generic-function 'robotStop-val :lambda-list '(m))
(cl:defmethod robotStop-val ((m <ControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:robotStop-val is deprecated.  Use grapebot_msgs-msg:robotStop instead.")
  (robotStop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlCommand>) ostream)
  "Serializes a message object of type '<ControlCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearVelocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angularVelocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steeringAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'controlMode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'robotStop) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlCommand>) istream)
  "Deserializes a message object of type '<ControlCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearVelocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angularVelocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steeringAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'controlMode) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'robotStop) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlCommand>)))
  "Returns string type for a message object of type '<ControlCommand>"
  "grapebot_msgs/ControlCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlCommand)))
  "Returns string type for a message object of type 'ControlCommand"
  "grapebot_msgs/ControlCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlCommand>)))
  "Returns md5sum for a message object of type '<ControlCommand>"
  "d93c5b5e27556bc38e51f13b2d85f1fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlCommand)))
  "Returns md5sum for a message object of type 'ControlCommand"
  "d93c5b5e27556bc38e51f13b2d85f1fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlCommand>)))
  "Returns full string definition for message of type '<ControlCommand>"
  (cl:format cl:nil "Header header~%float32 linearVelocity~%float32 angularVelocity~%float32 steeringAngle~%int16 controlMode~%bool robotStop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlCommand)))
  "Returns full string definition for message of type 'ControlCommand"
  (cl:format cl:nil "Header header~%float32 linearVelocity~%float32 angularVelocity~%float32 steeringAngle~%int16 controlMode~%bool robotStop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlCommand
    (cl:cons ':header (header msg))
    (cl:cons ':linearVelocity (linearVelocity msg))
    (cl:cons ':angularVelocity (angularVelocity msg))
    (cl:cons ':steeringAngle (steeringAngle msg))
    (cl:cons ':controlMode (controlMode msg))
    (cl:cons ':robotStop (robotStop msg))
))
