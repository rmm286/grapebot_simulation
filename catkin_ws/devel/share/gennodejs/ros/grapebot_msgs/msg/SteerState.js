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

class SteerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.CurrentSteerAngle = null;
      this.CurrentSensorRead = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('CurrentSteerAngle')) {
        this.CurrentSteerAngle = initObj.CurrentSteerAngle
      }
      else {
        this.CurrentSteerAngle = 0.0;
      }
      if (initObj.hasOwnProperty('CurrentSensorRead')) {
        this.CurrentSensorRead = initObj.CurrentSensorRead
      }
      else {
        this.CurrentSensorRead = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SteerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [CurrentSteerAngle]
    bufferOffset = _serializer.float32(obj.CurrentSteerAngle, buffer, bufferOffset);
    // Serialize message field [CurrentSensorRead]
    bufferOffset = _serializer.float32(obj.CurrentSensorRead, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SteerState
    let len;
    let data = new SteerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [CurrentSteerAngle]
    data.CurrentSteerAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CurrentSensorRead]
    data.CurrentSensorRead = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grapebot_msgs/SteerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95d8e1b9d99823009e315b31307e1b15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    float32 CurrentSteerAngle
    float32 CurrentSensorRead
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
    const resolved = new SteerState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.CurrentSteerAngle !== undefined) {
      resolved.CurrentSteerAngle = msg.CurrentSteerAngle;
    }
    else {
      resolved.CurrentSteerAngle = 0.0
    }

    if (msg.CurrentSensorRead !== undefined) {
      resolved.CurrentSensorRead = msg.CurrentSensorRead;
    }
    else {
      resolved.CurrentSensorRead = 0.0
    }

    return resolved;
    }
};

module.exports = SteerState;
