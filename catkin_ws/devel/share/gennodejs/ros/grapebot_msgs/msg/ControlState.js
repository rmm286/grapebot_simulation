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

class ControlState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.SteerAngleCommand = null;
      this.SteerAngleResponse = null;
      this.linearVelocityCommand = null;
      this.leftWheelVelocityCommand = null;
      this.rightWheelVelocityCommand = null;
      this.frontWheelVelocityCommand = null;
      this.linearVelocityResponse = null;
      this.leftWheelVelocityResponse = null;
      this.rightWheelVelocityResponse = null;
      this.frontWheelVelocityResponse = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('SteerAngleCommand')) {
        this.SteerAngleCommand = initObj.SteerAngleCommand
      }
      else {
        this.SteerAngleCommand = 0.0;
      }
      if (initObj.hasOwnProperty('SteerAngleResponse')) {
        this.SteerAngleResponse = initObj.SteerAngleResponse
      }
      else {
        this.SteerAngleResponse = 0.0;
      }
      if (initObj.hasOwnProperty('linearVelocityCommand')) {
        this.linearVelocityCommand = initObj.linearVelocityCommand
      }
      else {
        this.linearVelocityCommand = 0.0;
      }
      if (initObj.hasOwnProperty('leftWheelVelocityCommand')) {
        this.leftWheelVelocityCommand = initObj.leftWheelVelocityCommand
      }
      else {
        this.leftWheelVelocityCommand = 0.0;
      }
      if (initObj.hasOwnProperty('rightWheelVelocityCommand')) {
        this.rightWheelVelocityCommand = initObj.rightWheelVelocityCommand
      }
      else {
        this.rightWheelVelocityCommand = 0.0;
      }
      if (initObj.hasOwnProperty('frontWheelVelocityCommand')) {
        this.frontWheelVelocityCommand = initObj.frontWheelVelocityCommand
      }
      else {
        this.frontWheelVelocityCommand = 0.0;
      }
      if (initObj.hasOwnProperty('linearVelocityResponse')) {
        this.linearVelocityResponse = initObj.linearVelocityResponse
      }
      else {
        this.linearVelocityResponse = 0.0;
      }
      if (initObj.hasOwnProperty('leftWheelVelocityResponse')) {
        this.leftWheelVelocityResponse = initObj.leftWheelVelocityResponse
      }
      else {
        this.leftWheelVelocityResponse = 0.0;
      }
      if (initObj.hasOwnProperty('rightWheelVelocityResponse')) {
        this.rightWheelVelocityResponse = initObj.rightWheelVelocityResponse
      }
      else {
        this.rightWheelVelocityResponse = 0.0;
      }
      if (initObj.hasOwnProperty('frontWheelVelocityResponse')) {
        this.frontWheelVelocityResponse = initObj.frontWheelVelocityResponse
      }
      else {
        this.frontWheelVelocityResponse = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [SteerAngleCommand]
    bufferOffset = _serializer.float32(obj.SteerAngleCommand, buffer, bufferOffset);
    // Serialize message field [SteerAngleResponse]
    bufferOffset = _serializer.float32(obj.SteerAngleResponse, buffer, bufferOffset);
    // Serialize message field [linearVelocityCommand]
    bufferOffset = _serializer.float32(obj.linearVelocityCommand, buffer, bufferOffset);
    // Serialize message field [leftWheelVelocityCommand]
    bufferOffset = _serializer.float32(obj.leftWheelVelocityCommand, buffer, bufferOffset);
    // Serialize message field [rightWheelVelocityCommand]
    bufferOffset = _serializer.float32(obj.rightWheelVelocityCommand, buffer, bufferOffset);
    // Serialize message field [frontWheelVelocityCommand]
    bufferOffset = _serializer.float32(obj.frontWheelVelocityCommand, buffer, bufferOffset);
    // Serialize message field [linearVelocityResponse]
    bufferOffset = _serializer.float32(obj.linearVelocityResponse, buffer, bufferOffset);
    // Serialize message field [leftWheelVelocityResponse]
    bufferOffset = _serializer.float32(obj.leftWheelVelocityResponse, buffer, bufferOffset);
    // Serialize message field [rightWheelVelocityResponse]
    bufferOffset = _serializer.float32(obj.rightWheelVelocityResponse, buffer, bufferOffset);
    // Serialize message field [frontWheelVelocityResponse]
    bufferOffset = _serializer.float32(obj.frontWheelVelocityResponse, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlState
    let len;
    let data = new ControlState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [SteerAngleCommand]
    data.SteerAngleCommand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [SteerAngleResponse]
    data.SteerAngleResponse = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [linearVelocityCommand]
    data.linearVelocityCommand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [leftWheelVelocityCommand]
    data.leftWheelVelocityCommand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rightWheelVelocityCommand]
    data.rightWheelVelocityCommand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [frontWheelVelocityCommand]
    data.frontWheelVelocityCommand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [linearVelocityResponse]
    data.linearVelocityResponse = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [leftWheelVelocityResponse]
    data.leftWheelVelocityResponse = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rightWheelVelocityResponse]
    data.rightWheelVelocityResponse = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [frontWheelVelocityResponse]
    data.frontWheelVelocityResponse = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/ControlState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '349f39f889b30f99304b05f07b1445d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.SteerAngleCommand !== undefined) {
      resolved.SteerAngleCommand = msg.SteerAngleCommand;
    }
    else {
      resolved.SteerAngleCommand = 0.0
    }

    if (msg.SteerAngleResponse !== undefined) {
      resolved.SteerAngleResponse = msg.SteerAngleResponse;
    }
    else {
      resolved.SteerAngleResponse = 0.0
    }

    if (msg.linearVelocityCommand !== undefined) {
      resolved.linearVelocityCommand = msg.linearVelocityCommand;
    }
    else {
      resolved.linearVelocityCommand = 0.0
    }

    if (msg.leftWheelVelocityCommand !== undefined) {
      resolved.leftWheelVelocityCommand = msg.leftWheelVelocityCommand;
    }
    else {
      resolved.leftWheelVelocityCommand = 0.0
    }

    if (msg.rightWheelVelocityCommand !== undefined) {
      resolved.rightWheelVelocityCommand = msg.rightWheelVelocityCommand;
    }
    else {
      resolved.rightWheelVelocityCommand = 0.0
    }

    if (msg.frontWheelVelocityCommand !== undefined) {
      resolved.frontWheelVelocityCommand = msg.frontWheelVelocityCommand;
    }
    else {
      resolved.frontWheelVelocityCommand = 0.0
    }

    if (msg.linearVelocityResponse !== undefined) {
      resolved.linearVelocityResponse = msg.linearVelocityResponse;
    }
    else {
      resolved.linearVelocityResponse = 0.0
    }

    if (msg.leftWheelVelocityResponse !== undefined) {
      resolved.leftWheelVelocityResponse = msg.leftWheelVelocityResponse;
    }
    else {
      resolved.leftWheelVelocityResponse = 0.0
    }

    if (msg.rightWheelVelocityResponse !== undefined) {
      resolved.rightWheelVelocityResponse = msg.rightWheelVelocityResponse;
    }
    else {
      resolved.rightWheelVelocityResponse = 0.0
    }

    if (msg.frontWheelVelocityResponse !== undefined) {
      resolved.frontWheelVelocityResponse = msg.frontWheelVelocityResponse;
    }
    else {
      resolved.frontWheelVelocityResponse = 0.0
    }

    return resolved;
    }
};

module.exports = ControlState;
