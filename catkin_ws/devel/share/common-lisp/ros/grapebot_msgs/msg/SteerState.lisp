; Auto-generated. Do not edit!


(cl:in-package grapebot_msgs-msg)


;//! \htmlinclude SteerState.msg.html

(cl:defclass <SteerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (CurrentSteerAngle
    :reader CurrentSteerAngle
    :initarg :CurrentSteerAngle
    :type cl:float
    :initform 0.0)
   (CurrentSensorRead
    :reader CurrentSensorRead
    :initarg :CurrentSensorRead
    :type cl:float
    :initform 0.0))
)

(cl:defclass SteerState (<SteerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SteerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SteerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grapebot_msgs-msg:<SteerState> is deprecated: use grapebot_msgs-msg:SteerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:header-val is deprecated.  Use grapebot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'CurrentSteerAngle-val :lambda-list '(m))
(cl:defmethod CurrentSteerAngle-val ((m <SteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:CurrentSteerAngle-val is deprecated.  Use grapebot_msgs-msg:CurrentSteerAngle instead.")
  (CurrentSteerAngle m))

(cl:ensure-generic-function 'CurrentSensorRead-val :lambda-list '(m))
(cl:defmethod CurrentSensorRead-val ((m <SteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:CurrentSensorRead-val is deprecated.  Use grapebot_msgs-msg:CurrentSensorRead instead.")
  (CurrentSensorRead m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SteerState>) ostream)
  "Serializes a message object of type '<SteerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CurrentSteerAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CurrentSensorRead))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SteerState>) istream)
  "Deserializes a message object of type '<SteerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CurrentSteerAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CurrentSensorRead) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SteerState>)))
  "Returns string type for a message object of type '<SteerState>"
  "grapebot_msgs/SteerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SteerState)))
  "Returns string type for a message object of type 'SteerState"
  "grapebot_msgs/SteerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SteerState>)))
  "Returns md5sum for a message object of type '<SteerState>"
  "95d8e1b9d99823009e315b31307e1b15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SteerState)))
  "Returns md5sum for a message object of type 'SteerState"
  "95d8e1b9d99823009e315b31307e1b15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SteerState>)))
  "Returns full string definition for message of type '<SteerState>"
  (cl:format cl:nil "Header header~%~%float32 CurrentSteerAngle~%float32 CurrentSensorRead~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SteerState)))
  "Returns full string definition for message of type 'SteerState"
  (cl:format cl:nil "Header header~%~%float32 CurrentSteerAngle~%float32 CurrentSensorRead~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SteerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SteerState>))
  "Converts a ROS message object to a list"
  (cl:list 'SteerState
    (cl:cons ':header (header msg))
    (cl:cons ':CurrentSteerAngle (CurrentSteerAngle msg))
    (cl:cons ':CurrentSensorRead (CurrentSensorRead msg))
))
