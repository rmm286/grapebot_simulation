# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from grapebot_msgs/ControlState.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class ControlState(genpy.Message):
  _md5sum = "349f39f889b30f99304b05f07b1445d7"
  _type = "grapebot_msgs/ControlState"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header

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
"""
  __slots__ = ['header','SteerAngleCommand','SteerAngleResponse','linearVelocityCommand','leftWheelVelocityCommand','rightWheelVelocityCommand','frontWheelVelocityCommand','linearVelocityResponse','leftWheelVelocityResponse','rightWheelVelocityResponse','frontWheelVelocityResponse']
  _slot_types = ['std_msgs/Header','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,SteerAngleCommand,SteerAngleResponse,linearVelocityCommand,leftWheelVelocityCommand,rightWheelVelocityCommand,frontWheelVelocityCommand,linearVelocityResponse,leftWheelVelocityResponse,rightWheelVelocityResponse,frontWheelVelocityResponse

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ControlState, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.SteerAngleCommand is None:
        self.SteerAngleCommand = 0.
      if self.SteerAngleResponse is None:
        self.SteerAngleResponse = 0.
      if self.linearVelocityCommand is None:
        self.linearVelocityCommand = 0.
      if self.leftWheelVelocityCommand is None:
        self.leftWheelVelocityCommand = 0.
      if self.rightWheelVelocityCommand is None:
        self.rightWheelVelocityCommand = 0.
      if self.frontWheelVelocityCommand is None:
        self.frontWheelVelocityCommand = 0.
      if self.linearVelocityResponse is None:
        self.linearVelocityResponse = 0.
      if self.leftWheelVelocityResponse is None:
        self.leftWheelVelocityResponse = 0.
      if self.rightWheelVelocityResponse is None:
        self.rightWheelVelocityResponse = 0.
      if self.frontWheelVelocityResponse is None:
        self.frontWheelVelocityResponse = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.SteerAngleCommand = 0.
      self.SteerAngleResponse = 0.
      self.linearVelocityCommand = 0.
      self.leftWheelVelocityCommand = 0.
      self.rightWheelVelocityCommand = 0.
      self.frontWheelVelocityCommand = 0.
      self.linearVelocityResponse = 0.
      self.leftWheelVelocityResponse = 0.
      self.rightWheelVelocityResponse = 0.
      self.frontWheelVelocityResponse = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_10f().pack(_x.SteerAngleCommand, _x.SteerAngleResponse, _x.linearVelocityCommand, _x.leftWheelVelocityCommand, _x.rightWheelVelocityCommand, _x.frontWheelVelocityCommand, _x.linearVelocityResponse, _x.leftWheelVelocityResponse, _x.rightWheelVelocityResponse, _x.frontWheelVelocityResponse))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 40
      (_x.SteerAngleCommand, _x.SteerAngleResponse, _x.linearVelocityCommand, _x.leftWheelVelocityCommand, _x.rightWheelVelocityCommand, _x.frontWheelVelocityCommand, _x.linearVelocityResponse, _x.leftWheelVelocityResponse, _x.rightWheelVelocityResponse, _x.frontWheelVelocityResponse,) = _get_struct_10f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_10f().pack(_x.SteerAngleCommand, _x.SteerAngleResponse, _x.linearVelocityCommand, _x.leftWheelVelocityCommand, _x.rightWheelVelocityCommand, _x.frontWheelVelocityCommand, _x.linearVelocityResponse, _x.leftWheelVelocityResponse, _x.rightWheelVelocityResponse, _x.frontWheelVelocityResponse))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 40
      (_x.SteerAngleCommand, _x.SteerAngleResponse, _x.linearVelocityCommand, _x.leftWheelVelocityCommand, _x.rightWheelVelocityCommand, _x.frontWheelVelocityCommand, _x.linearVelocityResponse, _x.leftWheelVelocityResponse, _x.rightWheelVelocityResponse, _x.frontWheelVelocityResponse,) = _get_struct_10f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_10f = None
def _get_struct_10f():
    global _struct_10f
    if _struct_10f is None:
        _struct_10f = struct.Struct("<10f")
    return _struct_10f