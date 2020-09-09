; Auto-generated. Do not edit!


(cl:in-package grapebot_msgs-msg)


;//! \htmlinclude ControlState.msg.html

(cl:defclass <ControlState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (SteerAngleCommand
    :reader SteerAngleCommand
    :initarg :SteerAngleCommand
    :type cl:float
    :initform 0.0)
   (SteerAngleResponse
    :reader SteerAngleResponse
    :initarg :SteerAngleResponse
    :type cl:float
    :initform 0.0)
   (linearVelocityCommand
    :reader linearVelocityCommand
    :initarg :linearVelocityCommand
    :type cl:float
    :initform 0.0)
   (leftWheelVelocityCommand
    :reader leftWheelVelocityCommand
    :initarg :leftWheelVelocityCommand
    :type cl:float
    :initform 0.0)
   (rightWheelVelocityCommand
    :reader rightWheelVelocityCommand
    :initarg :rightWheelVelocityCommand
    :type cl:float
    :initform 0.0)
   (frontWheelVelocityCommand
    :reader frontWheelVelocityCommand
    :initarg :frontWheelVelocityCommand
    :type cl:float
    :initform 0.0)
   (linearVelocityResponse
    :reader linearVelocityResponse
    :initarg :linearVelocityResponse
    :type cl:float
    :initform 0.0)
   (leftWheelVelocityResponse
    :reader leftWheelVelocityResponse
    :initarg :leftWheelVelocityResponse
    :type cl:float
    :initform 0.0)
   (rightWheelVelocityResponse
    :reader rightWheelVelocityResponse
    :initarg :rightWheelVelocityResponse
    :type cl:float
    :initform 0.0)
   (frontWheelVelocityResponse
    :reader frontWheelVelocityResponse
    :initarg :frontWheelVelocityResponse
    :type cl:float
    :initform 0.0))
)

(cl:defclass ControlState (<ControlState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grapebot_msgs-msg:<ControlState> is deprecated: use grapebot_msgs-msg:ControlState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:header-val is deprecated.  Use grapebot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'SteerAngleCommand-val :lambda-list '(m))
(cl:defmethod SteerAngleCommand-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:SteerAngleCommand-val is deprecated.  Use grapebot_msgs-msg:SteerAngleCommand instead.")
  (SteerAngleCommand m))

(cl:ensure-generic-function 'SteerAngleResponse-val :lambda-list '(m))
(cl:defmethod SteerAngleResponse-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:SteerAngleResponse-val is deprecated.  Use grapebot_msgs-msg:SteerAngleResponse instead.")
  (SteerAngleResponse m))

(cl:ensure-generic-function 'linearVelocityCommand-val :lambda-list '(m))
(cl:defmethod linearVelocityCommand-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:linearVelocityCommand-val is deprecated.  Use grapebot_msgs-msg:linearVelocityCommand instead.")
  (linearVelocityCommand m))

(cl:ensure-generic-function 'leftWheelVelocityCommand-val :lambda-list '(m))
(cl:defmethod leftWheelVelocityCommand-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:leftWheelVelocityCommand-val is deprecated.  Use grapebot_msgs-msg:leftWheelVelocityCommand instead.")
  (leftWheelVelocityCommand m))

(cl:ensure-generic-function 'rightWheelVelocityCommand-val :lambda-list '(m))
(cl:defmethod rightWheelVelocityCommand-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:rightWheelVelocityCommand-val is deprecated.  Use grapebot_msgs-msg:rightWheelVelocityCommand instead.")
  (rightWheelVelocityCommand m))

(cl:ensure-generic-function 'frontWheelVelocityCommand-val :lambda-list '(m))
(cl:defmethod frontWheelVelocityCommand-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:frontWheelVelocityCommand-val is deprecated.  Use grapebot_msgs-msg:frontWheelVelocityCommand instead.")
  (frontWheelVelocityCommand m))

(cl:ensure-generic-function 'linearVelocityResponse-val :lambda-list '(m))
(cl:defmethod linearVelocityResponse-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:linearVelocityResponse-val is deprecated.  Use grapebot_msgs-msg:linearVelocityResponse instead.")
  (linearVelocityResponse m))

(cl:ensure-generic-function 'leftWheelVelocityResponse-val :lambda-list '(m))
(cl:defmethod leftWheelVelocityResponse-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:leftWheelVelocityResponse-val is deprecated.  Use grapebot_msgs-msg:leftWheelVelocityResponse instead.")
  (leftWheelVelocityResponse m))

(cl:ensure-generic-function 'rightWheelVelocityResponse-val :lambda-list '(m))
(cl:defmethod rightWheelVelocityResponse-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:rightWheelVelocityResponse-val is deprecated.  Use grapebot_msgs-msg:rightWheelVelocityResponse instead.")
  (rightWheelVelocityResponse m))

(cl:ensure-generic-function 'frontWheelVelocityResponse-val :lambda-list '(m))
(cl:defmethod frontWheelVelocityResponse-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:frontWheelVelocityResponse-val is deprecated.  Use grapebot_msgs-msg:frontWheelVelocityResponse instead.")
  (frontWheelVelocityResponse m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlState>) ostream)
  "Serializes a message object of type '<ControlState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'SteerAngleCommand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'SteerAngleResponse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearVelocityCommand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'leftWheelVelocityCommand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rightWheelVelocityCommand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frontWheelVelocityCommand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearVelocityResponse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'leftWheelVelocityResponse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rightWheelVelocityResponse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frontWheelVelocityResponse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlState>) istream)
  "Deserializes a message object of type '<ControlState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'SteerAngleCommand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'SteerAngleResponse) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearVelocityCommand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'leftWheelVelocityCommand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rightWheelVelocityCommand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frontWheelVelocityCommand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearVelocityResponse) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'leftWheelVelocityResponse) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rightWheelVelocityResponse) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frontWheelVelocityResponse) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlState>)))
  "Returns string type for a message object of type '<ControlState>"
  "grapebot_msgs/ControlState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlState)))
  "Returns string type for a message object of type 'ControlState"
  "grapebot_msgs/ControlState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlState>)))
  "Returns md5sum for a message object of type '<ControlState>"
  "349f39f889b30f99304b05f07b1445d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlState)))
  "Returns md5sum for a message object of type 'ControlState"
  "349f39f889b30f99304b05f07b1445d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlState>)))
  "Returns full string definition for message of type '<ControlState>"
  (cl:format cl:nil "Header header~%~%float32 SteerAngleCommand~%float32 SteerAngleResponse~%~%float32 linearVelocityCommand~%float32 leftWheelVelocityCommand~%float32 rightWheelVelocityCommand~%float32 frontWheelVelocityCommand~%float32 linearVelocityResponse~%float32 leftWheelVelocityResponse~%float32 rightWheelVelocityResponse~%float32 frontWheelVelocityResponse~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlState)))
  "Returns full string definition for message of type 'ControlState"
  (cl:format cl:nil "Header header~%~%float32 SteerAngleCommand~%float32 SteerAngleResponse~%~%float32 linearVelocityCommand~%float32 leftWheelVelocityCommand~%float32 rightWheelVelocityCommand~%float32 frontWheelVelocityCommand~%float32 linearVelocityResponse~%float32 leftWheelVelocityResponse~%float32 rightWheelVelocityResponse~%float32 frontWheelVelocityResponse~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlState>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlState
    (cl:cons ':header (header msg))
    (cl:cons ':SteerAngleCommand (SteerAngleCommand msg))
    (cl:cons ':SteerAngleResponse (SteerAngleResponse msg))
    (cl:cons ':linearVelocityCommand (linearVelocityCommand msg))
    (cl:cons ':leftWheelVelocityCommand (leftWheelVelocityCommand msg))
    (cl:cons ':rightWheelVelocityCommand (rightWheelVelocityCommand msg))
    (cl:cons ':frontWheelVelocityCommand (frontWheelVelocityCommand msg))
    (cl:cons ':linearVelocityResponse (linearVelocityResponse msg))
    (cl:cons ':leftWheelVelocityResponse (leftWheelVelocityResponse msg))
    (cl:cons ':rightWheelVelocityResponse (rightWheelVelocityResponse msg))
    (cl:cons ':frontWheelVelocityResponse (frontWheelVelocityResponse msg))
))
