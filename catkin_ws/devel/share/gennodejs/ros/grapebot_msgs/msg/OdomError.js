// Auto-generated. Do not edit!

// (in-package grapebot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class OdomError {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.xError = null;
      this.yError = null;
      this.thetaError = null;
      this.vxError = null;
      this.vyError = null;
      this.angularVelocityError = null;
      this.linearVelocityError = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('xError')) {
        this.xError = initObj.xError
      }
      else {
        this.xError = 0.0;
      }
      if (initObj.hasOwnProperty('yError')) {
        this.yError = initObj.yError
      }
      else {
        this.yError = 0.0;
      }
      if (initObj.hasOwnProperty('thetaError')) {
        this.thetaError = initObj.thetaError
      }
      else {
        this.thetaError = 0.0;
      }
      if (initObj.hasOwnProperty('vxError')) {
        this.vxError = initObj.vxError
      }
      else {
        this.vxError = 0.0;
      }
      if (initObj.hasOwnProperty('vyError')) {
        this.vyError = initObj.vyError
      }
      else {
        this.vyError = 0.0;
      }
      if (initObj.hasOwnProperty('angularVelocityError')) {
        this.angularVelocityError = initObj.angularVelocityError
      }
      else {
        this.angularVelocityError = 0.0;
      }
      if (initObj.hasOwnProperty('linearVelocityError')) {
        this.linearVelocityError = initObj.linearVelocityError
      }
      else {
        this.linearVelocityError = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OdomError
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [xError]
    bufferOffset = _serializer.float64(obj.xError, buffer, bufferOffset);
    // Serialize message field [yError]
    bufferOffset = _serializer.float64(obj.yError, buffer, bufferOffset);
    // Serialize message field [thetaError]
    bufferOffset = _serializer.float64(obj.thetaError, buffer, bufferOffset);
    // Serialize message field [vxError]
    bufferOffset = _serializer.float64(obj.vxError, buffer, bufferOffset);
    // Serialize message field [vyError]
    bufferOffset = _serializer.float64(obj.vyError, buffer, bufferOffset);
    // Serialize message field [angularVelocityError]
    bufferOffset = _serializer.float64(obj.angularVelocityError, buffer, bufferOffset);
    // Serialize message field [linearVelocityError]
    bufferOffset = _serializer.float64(obj.linearVelocityError, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OdomError
    let len;
    let data = new OdomError(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [xError]
    data.xError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yError]
    data.yError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [thetaError]
    data.thetaError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vxError]
    data.vxError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vyError]
    data.vyError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angularVelocityError]
    data.angularVelocityError = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [linearVelocityError]
    data.linearVelocityError = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/OdomError';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7f07c711d610abd5fe2a2b6e0224c4ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OdomError(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.xError !== undefined) {
      resolved.xError = msg.xError;
    }
    else {
      resolved.xError = 0.0
    }

    if (msg.yError !== undefined) {
      resolved.yError = msg.yError;
    }
    else {
      resolved.yError = 0.0
    }

    if (msg.thetaError !== undefined) {
      resolved.thetaError = msg.thetaError;
    }
    else {
      resolved.thetaError = 0.0
    }

    if (msg.vxError !== undefined) {
      resolved.vxError = msg.vxError;
    }
    else {
      resolved.vxError = 0.0
    }

    if (msg.vyError !== undefined) {
      resolved.vyError = msg.vyError;
    }
    else {
      resolved.vyError = 0.0
    }

    if (msg.angularVelocityError !== undefined) {
      resolved.angularVelocityError = msg.angularVelocityError;
    }
    else {
      resolved.angularVelocityError = 0.0
    }

    if (msg.linearVelocityError !== undefined) {
      resolved.linearVelocityError = msg.linearVelocityError;
    }
    else {
      resolved.linearVelocityError = 0.0
    }

    return resolved;
    }
};

module.exports = OdomError;
