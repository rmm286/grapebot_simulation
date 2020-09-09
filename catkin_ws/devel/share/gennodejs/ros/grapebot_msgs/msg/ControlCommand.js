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

class ControlCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.linearVelocity = null;
      this.angularVelocity = null;
      this.steeringAngle = null;
      this.controlMode = null;
      this.robotStop = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('linearVelocity')) {
        this.linearVelocity = initObj.linearVelocity
      }
      else {
        this.linearVelocity = 0.0;
      }
      if (initObj.hasOwnProperty('angularVelocity')) {
        this.angularVelocity = initObj.angularVelocity
      }
      else {
        this.angularVelocity = 0.0;
      }
      if (initObj.hasOwnProperty('steeringAngle')) {
        this.steeringAngle = initObj.steeringAngle
      }
      else {
        this.steeringAngle = 0.0;
      }
      if (initObj.hasOwnProperty('controlMode')) {
        this.controlMode = initObj.controlMode
      }
      else {
        this.controlMode = 0;
      }
      if (initObj.hasOwnProperty('robotStop')) {
        this.robotStop = initObj.robotStop
      }
      else {
        this.robotStop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlCommand
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [linearVelocity]
    bufferOffset = _serializer.float32(obj.linearVelocity, buffer, bufferOffset);
    // Serialize message field [angularVelocity]
    bufferOffset = _serializer.float32(obj.angularVelocity, buffer, bufferOffset);
    // Serialize message field [steeringAngle]
    bufferOffset = _serializer.float32(obj.steeringAngle, buffer, bufferOffset);
    // Serialize message field [controlMode]
    bufferOffset = _serializer.int16(obj.controlMode, buffer, bufferOffset);
    // Serialize message field [robotStop]
    bufferOffset = _serializer.bool(obj.robotStop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlCommand
    let len;
    let data = new ControlCommand(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [linearVelocity]
    data.linearVelocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angularVelocity]
    data.angularVelocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steeringAngle]
    data.steeringAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [controlMode]
    data.controlMode = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [robotStop]
    data.robotStop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/ControlCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd93c5b5e27556bc38e51f13b2d85f1fa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlCommand(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.linearVelocity !== undefined) {
      resolved.linearVelocity = msg.linearVelocity;
    }
    else {
      resolved.linearVelocity = 0.0
    }

    if (msg.angularVelocity !== undefined) {
      resolved.angularVelocity = msg.angularVelocity;
    }
    else {
      resolved.angularVelocity = 0.0
    }

    if (msg.steeringAngle !== undefined) {
      resolved.steeringAngle = msg.steeringAngle;
    }
    else {
      resolved.steeringAngle = 0.0
    }

    if (msg.controlMode !== undefined) {
      resolved.controlMode = msg.controlMode;
    }
    else {
      resolved.controlMode = 0
    }

    if (msg.robotStop !== undefined) {
      resolved.robotStop = msg.robotStop;
    }
    else {
      resolved.robotStop = false
    }

    return resolved;
    }
};

module.exports = ControlCommand;
