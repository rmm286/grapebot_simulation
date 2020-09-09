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

class OdomCustom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.theta = null;
      this.vx = null;
      this.vy = null;
      this.angularVelocity = null;
      this.linearVelocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
      if (initObj.hasOwnProperty('vx')) {
        this.vx = initObj.vx
      }
      else {
        this.vx = 0.0;
      }
      if (initObj.hasOwnProperty('vy')) {
        this.vy = initObj.vy
      }
      else {
        this.vy = 0.0;
      }
      if (initObj.hasOwnProperty('angularVelocity')) {
        this.angularVelocity = initObj.angularVelocity
      }
      else {
        this.angularVelocity = 0.0;
      }
      if (initObj.hasOwnProperty('linearVelocity')) {
        this.linearVelocity = initObj.linearVelocity
      }
      else {
        this.linearVelocity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OdomCustom
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float64(obj.theta, buffer, bufferOffset);
    // Serialize message field [vx]
    bufferOffset = _serializer.float64(obj.vx, buffer, bufferOffset);
    // Serialize message field [vy]
    bufferOffset = _serializer.float64(obj.vy, buffer, bufferOffset);
    // Serialize message field [angularVelocity]
    bufferOffset = _serializer.float64(obj.angularVelocity, buffer, bufferOffset);
    // Serialize message field [linearVelocity]
    bufferOffset = _serializer.float64(obj.linearVelocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OdomCustom
    let len;
    let data = new OdomCustom(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vx]
    data.vx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vy]
    data.vy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angularVelocity]
    data.angularVelocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [linearVelocity]
    data.linearVelocity = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/OdomCustom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb1d581231acbe75fed151be720c6675';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    float64 x
    float64 y
    float64 theta
    float64 vx
    float64 vy
    float64 angularVelocity
    float64 linearVelocity
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
    const resolved = new OdomCustom(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    if (msg.vx !== undefined) {
      resolved.vx = msg.vx;
    }
    else {
      resolved.vx = 0.0
    }

    if (msg.vy !== undefined) {
      resolved.vy = msg.vy;
    }
    else {
      resolved.vy = 0.0
    }

    if (msg.angularVelocity !== undefined) {
      resolved.angularVelocity = msg.angularVelocity;
    }
    else {
      resolved.angularVelocity = 0.0
    }

    if (msg.linearVelocity !== undefined) {
      resolved.linearVelocity = msg.linearVelocity;
    }
    else {
      resolved.linearVelocity = 0.0
    }

    return resolved;
    }
};

module.exports = OdomCustom;
