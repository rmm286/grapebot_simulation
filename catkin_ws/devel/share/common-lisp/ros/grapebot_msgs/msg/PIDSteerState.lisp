; Auto-generated. Do not edit!


(cl:in-package grapebot_msgs-msg)


;//! \htmlinclude PIDSteerState.msg.html

(cl:defclass <PIDSteerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (p_error
    :reader p_error
    :initarg :p_error
    :type cl:float
    :initform 0.0)
   (i_error
    :reader i_error
    :initarg :i_error
    :type cl:float
    :initform 0.0)
   (d_error
    :reader d_error
    :initarg :d_error
    :type cl:float
    :initform 0.0)
   (control_response
    :reader control_response
    :initarg :control_response
    :type cl:float
    :initform 0.0)
   (set_point
    :reader set_point
    :initarg :set_point
    :type cl:float
    :initform 0.0))
)

(cl:defclass PIDSteerState (<PIDSteerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PIDSteerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PIDSteerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grapebot_msgs-msg:<PIDSteerState> is deprecated: use grapebot_msgs-msg:PIDSteerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:header-val is deprecated.  Use grapebot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'p_error-val :lambda-list '(m))
(cl:defmethod p_error-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:p_error-val is deprecated.  Use grapebot_msgs-msg:p_error instead.")
  (p_error m))

(cl:ensure-generic-function 'i_error-val :lambda-list '(m))
(cl:defmethod i_error-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:i_error-val is deprecated.  Use grapebot_msgs-msg:i_error instead.")
  (i_error m))

(cl:ensure-generic-function 'd_error-val :lambda-list '(m))
(cl:defmethod d_error-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:d_error-val is deprecated.  Use grapebot_msgs-msg:d_error instead.")
  (d_error m))

(cl:ensure-generic-function 'control_response-val :lambda-list '(m))
(cl:defmethod control_response-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:control_response-val is deprecated.  Use grapebot_msgs-msg:control_response instead.")
  (control_response m))

(cl:ensure-generic-function 'set_point-val :lambda-list '(m))
(cl:defmethod set_point-val ((m <PIDSteerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grapebot_msgs-msg:set_point-val is deprecated.  Use grapebot_msgs-msg:set_point instead.")
  (set_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PIDSteerState>) ostream)
  "Serializes a message object of type '<PIDSteerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'p_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'd_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'control_response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'set_point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PIDSteerState>) istream)
  "Deserializes a message object of type '<PIDSteerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'control_response) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_point) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PIDSteerState>)))
  "Returns string type for a message object of type '<PIDSteerState>"
  "grapebot_msgs/PIDSteerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PIDSteerState)))
  "Returns string type for a message object of type 'PIDSteerState"
  "grapebot_msgs/PIDSteerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PIDSteerState>)))
  "Returns md5sum for a message object of type '<PIDSteerState>"
  "e6d443c27b96bf6a06d83f395d0cd761")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PIDSteerState)))
  "Returns md5sum for a message object of type 'PIDSteerState"
  "e6d443c27b96bf6a06d83f395d0cd761")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PIDSteerState>)))
  "Returns full string definition for message of type '<PIDSteerState>"
  (cl:format cl:nil "Header header~%float64 p_error~%float64 i_error~%float64 d_error~%float64 control_response~%float64 set_point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PIDSteerState)))
  "Returns full string definition for message of type 'PIDSteerState"
  (cl:format cl:nil "Header header~%float64 p_error~%float64 i_error~%float64 d_error~%float64 control_response~%float64 set_point~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PIDSteerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PIDSteerState>))
  "Converts a ROS message object to a list"
  (cl:list 'PIDSteerState
    (cl:cons ':header (header msg))
    (cl:cons ':p_error (p_error msg))
    (cl:cons ':i_error (i_error msg))
    (cl:cons ':d_error (d_error msg))
    (cl:cons ':control_response (control_response msg))
    (cl:cons ':set_point (set_point msg))
))
