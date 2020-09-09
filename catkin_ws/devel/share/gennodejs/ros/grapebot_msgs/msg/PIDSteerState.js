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

class PIDSteerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.p_error = null;
      this.i_error = null;
      this.d_error = null;
      this.control_response = null;
      this.set_point = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('p_error')) {
        this.p_error = initObj.p_error
      }
      else {
        this.p_error = 0.0;
      }
      if (initObj.hasOwnProperty('i_error')) {
        this.i_error = initObj.i_error
      }
      else {
        this.i_error = 0.0;
      }
      if (initObj.hasOwnProperty('d_error')) {
        this.d_error = initObj.d_error
      }
      else {
        this.d_error = 0.0;
      }
      if (initObj.hasOwnProperty('control_response')) {
        this.control_response = initObj.control_response
      }
      else {
        this.control_response = 0.0;
      }
      if (initObj.hasOwnProperty('set_point')) {
        this.set_point = initObj.set_point
      }
      else {
        this.set_point = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PIDSteerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [p_error]
    bufferOffset = _serializer.float64(obj.p_error, buffer, bufferOffset);
    // Serialize message field [i_error]
    bufferOffset = _serializer.float64(obj.i_error, buffer, bufferOffset);
    // Serialize message field [d_error]
    bufferOffset = _serializer.float64(obj.d_error, buffer, bufferOffset);
    // Serialize message field [control_response]
    bufferOffset = _serializer.float64(obj.control_response, buffer, bufferOffset);
    // Serialize message field [set_point]
    bufferOffset = _serializer.float64(obj.set_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PIDSteerState
    let len;
    let data = new PIDSteerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [p_error]
    data.p_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [i_error]
    data.i_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d_error]
    data.d_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [control_response]
    data.control_response = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [set_point]
    data.set_point = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/PIDSteerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6d443c27b96bf6a06d83f395d0cd761';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PIDSteerState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.p_error !== undefined) {
      resolved.p_error = msg.p_error;
    }
    else {
      resolved.p_error = 0.0
    }

    if (msg.i_error !== undefined) {
      resolved.i_error = msg.i_error;
    }
    else {
      resolved.i_error = 0.0
    }

    if (msg.d_error !== undefined) {
      resolved.d_error = msg.d_error;
    }
    else {
      resolved.d_error = 0.0
    }

    if (msg.control_response !== undefined) {
      resolved.control_response = msg.control_response;
    }
    else {
      resolved.control_response = 0.0
    }

    if (msg.set_point !== undefined) {
      resolved.set_point = msg.set_point;
    }
    else {
      resolved.set_point = 0.0
    }

    return resolved;
    }
};

module.exports = PIDSteerState;
