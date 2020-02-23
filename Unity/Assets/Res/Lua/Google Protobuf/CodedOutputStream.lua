-- Generated by CSharp.lua Compiler
--#region Copyright notice and license
-- Protocol Buffers - Google's data interchange format
-- Copyright 2008 Google Inc.  All rights reserved.
-- https://developers.google.com/protocol-buffers/
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:
--
--     * Redistributions of source code must retain the above copyright
-- notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above
-- copyright notice, this list of conditions and the following disclaimer
-- in the documentation and/or other materials provided with the
-- distribution.
--     * Neither the name of Google Inc. nor the names of its
-- contributors may be used to endorse or promote products derived from
-- this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-- OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-- LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-- DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-- THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--#endregion
local System = System
local SystemIO = System.IO
local SystemText = System.Text
local ArrayByte = System.Array(System.Byte)
local GoogleProtobuf
System.import(function (out)
  GoogleProtobuf = Google.Protobuf
end)
System.namespace("Google.Protobuf", function (namespace)
  -- <summary>
  -- Encodes and writes protocol message fields.
  -- </summary>
  -- <para>
  -- This class is generally used by generated code to write appropriate
  -- primitives to the stream. It effectively encapsulates the lowest
  -- levels of protocol buffer format. Unlike some other implementations,
  -- this does not include combined "write tag and value" methods. Generated
  -- code knows the exact byte representations of the tags they're going to write,
  -- so there's no need to re-encode them each time. Manually-written code calling
  -- this class should just call one of the <c>WriteTag</c> overloads before each value.
  -- </para>
  -- <para>
  -- Repeated fields and map fields are not handled by this class; use <c>RepeatedField&lt;T&gt;</c>
  -- and <c>MapField&lt;TKey, TValue&gt;</c> to serialize such fields.
  -- </para>
  -- </remarks>
  namespace.class("CodedOutputStream", function (namespace)
    local ComputeDoubleSize, ComputeFloatSize, ComputeUInt64Size, ComputeInt64Size, ComputeInt32Size, ComputeFixed64Size, ComputeFixed32Size, ComputeBoolSize, 
    ComputeStringSize, ComputeGroupSize, ComputeMessageSize, ComputeBytesSize, ComputeUInt32Size, ComputeEnumSize, ComputeSFixed32Size, ComputeSFixed64Size, 
    ComputeSInt32Size, ComputeSInt64Size, ComputeLengthSize, ComputeRawVarint32Size, ComputeRawVarint64Size, ComputeTagSize, Utf8Encoding, DefaultBufferSize, 
    Reset, getPosition, WriteDouble, WriteFloat, WriteUInt64, WriteInt64, WriteInt32, WriteFixed64, 
    WriteFixed32, WriteBool, WriteString, WriteMessage, WriteBytes, WriteUInt32, WriteEnum, WriteSFixed32, 
    WriteSFixed64, WriteSInt32, WriteSInt64, WriteLength, WriteTag, WriteTag1, WriteRawTag, WriteRawTag1, 
    WriteRawTag2, WriteRawTag3, WriteRawTag4, WriteRawVarint32, WriteRawVarint64, WriteRawLittleEndian32, WriteRawLittleEndian64, WriteRawByte, 
    WriteRawByte1, WriteRawBytes, WriteRawBytes1, EncodeZigZag32, EncodeZigZag64, RefreshBuffer, Dispose, Flush, 
    CheckNoSpaceLeft, getSpaceLeft, class, static, __ctor1__, __ctor2__, __ctor3__, __ctor4__, 
    __ctor5__, __ctor6__, __ctor7__
    -- <summary>
    -- Indicates that a CodedOutputStream wrapping a flat byte array
    -- ran out of space.
    -- </summary>
    namespace.class("OutOfSpaceException", function (namespace)
      local __ctor__
      __ctor__ = function (this)
        System.base(this).__ctor__(this, "CodedOutputStream was writing to a flat byte array and ran out of space.")
      end
      return {
        base = function (out, this)
          local base = System.IO.IOException
          this.__tostring = base.__tostring
          return {
            base
          }
        end,
        __ctor__ = __ctor__
      }
    end)
    static = function (this)
      Utf8Encoding = SystemText.Encoding.getUTF8()
      this.Utf8Encoding = Utf8Encoding
    end
    -- <summary>
    -- Creates a new CodedOutputStream that writes directly to the given
    -- byte array. If more bytes are written than fit in the array,
    -- OutOfSpaceException will be thrown.
    -- </summary>
    __ctor1__ = function (this, flatArray)
      __ctor2__(this, flatArray, 0, #flatArray)
    end
    -- <summary>
    -- Creates a new CodedOutputStream that writes directly to the given
    -- byte array slice. If more bytes are written than fit in the array,
    -- OutOfSpaceException will be thrown.
    -- </summary>
    __ctor2__ = function (this, buffer, offset, length)
      this.output = nil
      this.buffer = buffer
      this.position = offset
      this.limit = offset + length
      this.leaveOpen = true
      -- Simple way of avoiding trying to dispose of a null reference
    end
    __ctor3__ = function (this, output, buffer, leaveOpen)
      this.output = GoogleProtobuf.ProtoPreconditions.CheckNotNull(output, "output", SystemIO.Stream)
      this.buffer = buffer
      this.position = 0
      this.limit = #buffer
      this.leaveOpen = leaveOpen
    end
    -- <summary>
    -- Creates a new <see cref="CodedOutputStream" /> which write to the given stream, and disposes of that
    -- stream when the returned <c>CodedOutputStream</c> is disposed.
    -- </summary>
    __ctor4__ = function (this, output)
      __ctor7__(this, output, DefaultBufferSize, false)
    end
    -- <summary>
    -- Creates a new CodedOutputStream which write to the given stream and uses
    -- the specified buffer size.
    -- </summary>
    -- <param name="bufferSize">The size of buffer to use internally.</param>
    __ctor5__ = function (this, output, bufferSize)
      __ctor3__(this, output, ArrayByte:new(bufferSize), false)
    end
    -- <summary>
    -- Creates a new CodedOutputStream which write to the given stream.
    -- </summary>
    -- <param name="leaveOpen">If <c>true</c>, <paramref name="output"/> is left open when the returned <c>CodedOutputStream</c> is disposed;
    -- if <c>false</c>, the provided stream is disposed as well.</param>
    __ctor6__ = function (this, output, leaveOpen)
      __ctor7__(this, output, DefaultBufferSize, leaveOpen)
    end
    -- <summary>
    -- Creates a new CodedOutputStream which write to the given stream and uses
    -- the specified buffer size.
    -- </summary>
    -- <param name="bufferSize">The size of buffer to use internally.</param>
    -- <param name="leaveOpen">If <c>true</c>, <paramref name="output"/> is left open when the returned <c>CodedOutputStream</c> is disposed;
    -- if <c>false</c>, the provided stream is disposed as well.</param>
    __ctor7__ = function (this, output, bufferSize, leaveOpen)
      __ctor3__(this, output, ArrayByte:new(bufferSize), leaveOpen)
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- double field, including the tag.
    -- </summary>
    ComputeDoubleSize = function (value)
      return 8 --[[CodedOutputStream.LittleEndian64Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- float field, including the tag.
    -- </summary>
    ComputeFloatSize = function (value)
      return 4 --[[CodedOutputStream.LittleEndian32Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- uint64 field, including the tag.
    -- </summary>
    ComputeUInt64Size = function (value)
      return ComputeRawVarint64Size(value)
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- int64 field, including the tag.
    -- </summary>
    ComputeInt64Size = function (value)
      return ComputeRawVarint64Size(System.toUInt64(value))
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- int32 field, including the tag.
    -- </summary>
    ComputeInt32Size = function (value)
      if value >= 0 then
        return ComputeRawVarint32Size(System.toUInt32(value))
      else
        -- Must sign-extend.
        return 10
      end
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- fixed64 field, including the tag.
    -- </summary>
    ComputeFixed64Size = function (value)
      return 8 --[[CodedOutputStream.LittleEndian64Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- fixed32 field, including the tag.
    -- </summary>
    ComputeFixed32Size = function (value)
      return 4 --[[CodedOutputStream.LittleEndian32Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- bool field, including the tag.
    -- </summary>
    ComputeBoolSize = function (value)
      return 1
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- string field, including the tag.
    -- </summary>
    ComputeStringSize = function (value)
      local byteArraySize = Utf8Encoding:GetByteCount(value)
      return ComputeLengthSize(byteArraySize) + byteArraySize
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- group field, including the tag.
    -- </summary>
    ComputeGroupSize = function (value)
      return value:CalculateSize()
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- embedded message field, including the tag.
    -- </summary>
    ComputeMessageSize = function (value)
      local size = value:CalculateSize()
      return ComputeLengthSize(size) + size
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- bytes field, including the tag.
    -- </summary>
    ComputeBytesSize = function (value)
      return ComputeLengthSize(value:getLength()) + value:getLength()
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- uint32 field, including the tag.
    -- </summary>
    ComputeUInt32Size = function (value)
      return ComputeRawVarint32Size(value)
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a
    -- enum field, including the tag. The caller is responsible for
    -- converting the enum value to its numeric value.
    -- </summary>
    ComputeEnumSize = function (value)
      -- Currently just a pass-through, but it's nice to separate it logically.
      return ComputeInt32Size(value)
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- sfixed32 field, including the tag.
    -- </summary>
    ComputeSFixed32Size = function (value)
      return 4 --[[CodedOutputStream.LittleEndian32Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- sfixed64 field, including the tag.
    -- </summary>
    ComputeSFixed64Size = function (value)
      return 8 --[[CodedOutputStream.LittleEndian64Size]]
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- sint32 field, including the tag.
    -- </summary>
    ComputeSInt32Size = function (value)
      return ComputeRawVarint32Size(EncodeZigZag32(value))
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode an
    -- sint64 field, including the tag.
    -- </summary>
    ComputeSInt64Size = function (value)
      return ComputeRawVarint64Size(EncodeZigZag64(value))
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a length,
    -- as written by <see cref="WriteLength"/>.
    -- </summary>
    ComputeLengthSize = function (length)
      return ComputeRawVarint32Size(System.toUInt32(length))
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a varint.
    -- </summary>
    ComputeRawVarint32Size = function (value)
      if (System.band(value, (4294967168 --[[0xffffffff << 7]]))) == 0 then
        return 1
      end
      if (System.band(value, (4294950912 --[[0xffffffff << 14]]))) == 0 then
        return 2
      end
      if (System.band(value, (4292870144 --[[0xffffffff << 21]]))) == 0 then
        return 3
      end
      if (System.band(value, (4026531840 --[[0xffffffff << 28]]))) == 0 then
        return 4
      end
      return 5
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a varint.
    -- </summary>
    ComputeRawVarint64Size = function (value)
      if (System.band(value, (18446744073709551488 --[[0xffffffffffffffffL << 7]]))) == 0 then
        return 1
      end
      if (System.band(value, (18446744073709535232 --[[0xffffffffffffffffL << 14]]))) == 0 then
        return 2
      end
      if (System.band(value, (18446744073707454464 --[[0xffffffffffffffffL << 21]]))) == 0 then
        return 3
      end
      if (System.band(value, (18446744073441116160 --[[0xffffffffffffffffL << 28]]))) == 0 then
        return 4
      end
      if (System.band(value, (18446744039349813248 --[[0xffffffffffffffffL << 35]]))) == 0 then
        return 5
      end
      if (System.band(value, (18446739675663040512 --[[0xffffffffffffffffL << 42]]))) == 0 then
        return 6
      end
      if (System.band(value, (18446181123756130304 --[[0xffffffffffffffffL << 49]]))) == 0 then
        return 7
      end
      if (System.band(value, (18374686479671623680 --[[0xffffffffffffffffL << 56]]))) == 0 then
        return 8
      end
      if (System.band(value, (9223372036854775808 --[[0xffffffffffffffffL << 63]]))) == 0 then
        return 9
      end
      return 10
    end
    -- <summary>
    -- Computes the number of bytes that would be needed to encode a tag.
    -- </summary>
    ComputeTagSize = function (fieldNumber)
      return ComputeRawVarint32Size(GoogleProtobuf.WireFormat.MakeTag(fieldNumber, 0))
    end
    DefaultBufferSize = 4096
    Reset = function (this, buf, offset, length)
      this.output = nil
      this.buffer = buf
      this.position = offset
      this.limit = offset + length
      this.leaveOpen = true
      -- Simple way of avoiding trying to dispose of a null reference
    end
    getPosition = function (this)
      if this.output ~= nil then
        return this.output:getPosition() + this.position
      end
      return this.position
    end
    -- <summary>
    -- Writes a double field value, without a tag, to the stream.
    -- </summary>
    WriteDouble = function (this, value)
      WriteRawLittleEndian64(this, System.toUInt64(System.BitConverter.DoubleToInt64Bits(value)))
    end
    -- <summary>
    -- Writes a float field value, without a tag, to the stream.
    -- </summary>
    WriteFloat = function (this, value)
      local rawBytes = System.BitConverter.GetBytesFromFloat(value)
      if not System.BitConverter.IsLittleEndian then
        GoogleProtobuf.ByteArray.Reverse(rawBytes)
      end

      if this.limit - this.position >= 4 then
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, rawBytes:get(0))
        local extern = this.position
        this.position = extern + 1
        this.buffer:set(extern, rawBytes:get(1))
        local ref = this.position
        this.position = ref + 1
        this.buffer:set(ref, rawBytes:get(2))
        local out = this.position
        this.position = out + 1
        this.buffer:set(out, rawBytes:get(3))
      else
        WriteRawBytes1(this, rawBytes, 0, 4)
      end
    end
    -- <summary>
    -- Writes a uint64 field value, without a tag, to the stream.
    -- </summary>
    WriteUInt64 = function (this, value)
      WriteRawVarint64(this, value)
    end
    -- <summary>
    -- Writes an int64 field value, without a tag, to the stream.
    -- </summary>
    WriteInt64 = function (this, value)
      WriteRawVarint64(this, System.toUInt64(value))
    end
    -- <summary>
    -- Writes an int32 field value, without a tag, to the stream.
    -- </summary>
    WriteInt32 = function (this, value)
      if value >= 0 then
        WriteRawVarint32(this, System.toUInt32(value))
      else
        -- Must sign-extend.
        WriteRawVarint64(this, value)
      end
    end
    -- <summary>
    -- Writes a fixed64 field value, without a tag, to the stream.
    -- </summary>
    WriteFixed64 = function (this, value)
      WriteRawLittleEndian64(this, value)
    end
    -- <summary>
    -- Writes a fixed32 field value, without a tag, to the stream.
    -- </summary>
    WriteFixed32 = function (this, value)
      WriteRawLittleEndian32(this, value)
    end
    -- <summary>
    -- Writes a bool field value, without a tag, to the stream.
    -- </summary>
    WriteBool = function (this, value)
      WriteRawByte(this, value and 1 --[[(byte) 1]] or 0 --[[(byte) 0]])
    end
    -- <summary>
    -- Writes a string field value, without a tag, to the stream.
    -- The data is length-prefixed.
    -- </summary>
    WriteString = function (this, value)
      -- Optimise the case where we have enough space to write
      -- the string directly to the buffer, which should be common.
      local length = Utf8Encoding:GetByteCount(value)
      WriteLength(this, length)
      if this.limit - this.position >= length then
        if length == #value then
          for i = 0, length - 1 do
            this.buffer:set(this.position + i, System.toByte(value:get(i)))
          end
        else
          Utf8Encoding:GetBytes(value, 0, #value, this.buffer, this.position)
        end
        this.position = this.position + length
      else
        local bytes = Utf8Encoding:GetBytes(value)
        WriteRawBytes(this, bytes)
      end
    end
    -- <summary>
    -- Writes a message, without a tag, to the stream.
    -- The data is length-prefixed.
    -- </summary>
    WriteMessage = function (this, value)
      WriteLength(this, value:CalculateSize())
      value:WriteTo(this)
    end
    -- <summary>
    -- Write a byte string, without a tag, to the stream.
    -- The data is length-prefixed.
    -- </summary>
    WriteBytes = function (this, value)
      WriteLength(this, value:getLength())
      value:WriteRawBytesTo(this)
    end
    -- <summary>
    -- Writes a uint32 value, without a tag, to the stream.
    -- </summary>
    WriteUInt32 = function (this, value)
      WriteRawVarint32(this, value)
    end
    -- <summary>
    -- Writes an enum value, without a tag, to the stream.
    -- </summary>
    WriteEnum = function (this, value)
      WriteInt32(this, value)
    end
    -- <summary>
    -- Writes an sfixed32 value, without a tag, to the stream.
    -- </summary>
    WriteSFixed32 = function (this, value)
      WriteRawLittleEndian32(this, System.toUInt32(value))
    end
    -- <summary>
    -- Writes an sfixed64 value, without a tag, to the stream.
    -- </summary>
    WriteSFixed64 = function (this, value)
      WriteRawLittleEndian64(this, System.toUInt64(value))
    end
    -- <summary>
    -- Writes an sint32 value, without a tag, to the stream.
    -- </summary>
    WriteSInt32 = function (this, value)
      WriteRawVarint32(this, EncodeZigZag32(value))
    end
    -- <summary>
    -- Writes an sint64 value, without a tag, to the stream.
    -- </summary>
    WriteSInt64 = function (this, value)
      WriteRawVarint64(this, EncodeZigZag64(value))
    end
    -- <summary>
    -- Writes a length (in bytes) for length-delimited data.
    -- </summary>
    -- This method simply writes a rawint, but exists for clarity in calling code.
    -- </remarks>
    -- <param name="length">Length value, in bytes.</param>
    WriteLength = function (this, length)
      WriteRawVarint32(this, System.toUInt32(length))
    end
    -- <summary>
    -- Encodes and writes a tag.
    -- </summary>
    -- <param name="type">The wire format type of the tag to write</param>
    WriteTag = function (this, fieldNumber, type)
      WriteRawVarint32(this, GoogleProtobuf.WireFormat.MakeTag(fieldNumber, type))
    end
    -- <summary>
    -- Writes an already-encoded tag.
    -- </summary>
    WriteTag1 = function (this, tag)
      WriteRawVarint32(this, tag)
    end
    -- <summary>
    -- Writes the given single-byte tag directly to the stream.
    -- </summary>
    WriteRawTag = function (this, b1)
      WriteRawByte(this, b1)
    end
    -- <summary>
    -- Writes the given two-byte tag directly to the stream.
    -- </summary>
    -- <param name="b2">The second byte of the encoded tag</param>
    WriteRawTag1 = function (this, b1, b2)
      WriteRawByte(this, b1)
      WriteRawByte(this, b2)
    end
    -- <summary>
    -- Writes the given three-byte tag directly to the stream.
    -- </summary>
    -- <param name="b2">The second byte of the encoded tag</param>
    -- <param name="b3">The third byte of the encoded tag</param>
    WriteRawTag2 = function (this, b1, b2, b3)
      WriteRawByte(this, b1)
      WriteRawByte(this, b2)
      WriteRawByte(this, b3)
    end
    -- <summary>
    -- Writes the given four-byte tag directly to the stream.
    -- </summary>
    -- <param name="b2">The second byte of the encoded tag</param>
    -- <param name="b3">The third byte of the encoded tag</param>
    -- <param name="b4">The fourth byte of the encoded tag</param>
    WriteRawTag3 = function (this, b1, b2, b3, b4)
      WriteRawByte(this, b1)
      WriteRawByte(this, b2)
      WriteRawByte(this, b3)
      WriteRawByte(this, b4)
    end
    -- <summary>
    -- Writes the given five-byte tag directly to the stream.
    -- </summary>
    -- <param name="b2">The second byte of the encoded tag</param>
    -- <param name="b3">The third byte of the encoded tag</param>
    -- <param name="b4">The fourth byte of the encoded tag</param>
    -- <param name="b5">The fifth byte of the encoded tag</param>
    WriteRawTag4 = function (this, b1, b2, b3, b4, b5)
      WriteRawByte(this, b1)
      WriteRawByte(this, b2)
      WriteRawByte(this, b3)
      WriteRawByte(this, b4)
      WriteRawByte(this, b5)
    end
    -- <summary>
    -- Writes a 32 bit value as a varint. The fast route is taken when
    -- there's enough buffer space left to whizz through without checking
    -- for each byte; otherwise, we resort to calling WriteRawByte each time.
    -- </summary>
    WriteRawVarint32 = function (this, value)
      -- Optimize for the common case of a single byte value
      if value < 128 and this.position < this.limit then
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, System.toByte(value))
        return
      end

      while value > 127 and this.position < this.limit do
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, System.toByte(System.bor((System.band(value, 0x7F)), 0x80)))
        value = System.sr(value, 7)
      end
      while value > 127 do
        WriteRawByte(this, System.toByte(System.bor((System.band(value, 0x7F)), 0x80)))
        value = System.sr(value, 7)
      end
      if this.position < this.limit then
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, System.toByte(value))
      else
        WriteRawByte(this, System.toByte(value))
      end
    end
    WriteRawVarint64 = function (this, value)
      while value > 127 and this.position < this.limit do
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, System.toByte(System.bor((System.band(value, 0x7F)), 0x80)))
        value = System.sr(value, 7)
      end
      while value > 127 do
        WriteRawByte(this, System.toByte(System.bor((System.band(value, 0x7F)), 0x80)))
        value = System.sr(value, 7)
      end
      if this.position < this.limit then
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, System.toByte(value))
      else
        WriteRawByte(this, System.toByte(value))
      end
    end
    WriteRawLittleEndian32 = function (this, value)
      if this.position + 4 > this.limit then
        WriteRawByte(this, System.toByte(value))
        WriteRawByte(this, System.toByte(System.sr(value, 8)))
        WriteRawByte(this, System.toByte(System.sr(value, 16)))
        WriteRawByte(this, System.toByte(System.sr(value, 24)))
      else
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, (System.toByte(value)))
        local extern = this.position
        this.position = extern + 1
        this.buffer:set(extern, (System.toByte(System.sr(value, 8))))
        local ref = this.position
        this.position = ref + 1
        this.buffer:set(ref, (System.toByte(System.sr(value, 16))))
        local out = this.position
        this.position = out + 1
        this.buffer:set(out, (System.toByte(System.sr(value, 24))))
      end
    end
    WriteRawLittleEndian64 = function (this, value)
      if this.position + 8 > this.limit then
        WriteRawByte(this, System.toByte(value))
        WriteRawByte(this, System.toByte(System.sr(value, 8)))
        WriteRawByte(this, System.toByte(System.sr(value, 16)))
        WriteRawByte(this, System.toByte(System.sr(value, 24)))
        WriteRawByte(this, System.toByte(System.sr(value, 32)))
        WriteRawByte(this, System.toByte(System.sr(value, 40)))
        WriteRawByte(this, System.toByte(System.sr(value, 48)))
        WriteRawByte(this, System.toByte(System.sr(value, 56)))
      else
        local default = this.position
        this.position = default + 1
        this.buffer:set(default, (System.toByte(value)))
        local extern = this.position
        this.position = extern + 1
        this.buffer:set(extern, (System.toByte(System.sr(value, 8))))
        local ref = this.position
        this.position = ref + 1
        this.buffer:set(ref, (System.toByte(System.sr(value, 16))))
        local out = this.position
        this.position = out + 1
        this.buffer:set(out, (System.toByte(System.sr(value, 24))))
        local try = this.position
        this.position = try + 1
        this.buffer:set(try, (System.toByte(System.sr(value, 32))))
        local case = this.position
        this.position = case + 1
        this.buffer:set(case, (System.toByte(System.sr(value, 40))))
        local void = this.position
        this.position = void + 1
        this.buffer:set(void, (System.toByte(System.sr(value, 48))))
        local byte = this.position
        this.position = byte + 1
        this.buffer:set(byte, (System.toByte(System.sr(value, 56))))
      end
    end
    WriteRawByte = function (this, value)
      if this.position == this.limit then
        RefreshBuffer(this)
      end

      local default = this.position
      this.position = default + 1
      this.buffer:set(default, value)
    end
    WriteRawByte1 = function (this, value)
      WriteRawByte(this, System.toByte(value))
    end
    -- <summary>
    -- Writes out an array of bytes.
    -- </summary>
    WriteRawBytes = function (this, value)
      WriteRawBytes1(this, value, 0, #value)
    end
    -- <summary>
    -- Writes out part of an array of bytes.
    -- </summary>
    WriteRawBytes1 = function (this, value, offset, length)
      if this.limit - this.position >= length then
        GoogleProtobuf.ByteArray.Copy(value, offset, this.buffer, this.position, length)
        -- We have room in the current buffer.
        this.position = this.position + length
      else
        -- Write extends past current buffer.  Fill the rest of this buffer and
        -- flush.
        local bytesWritten = this.limit - this.position
        GoogleProtobuf.ByteArray.Copy(value, offset, this.buffer, this.position, bytesWritten)
        offset = offset + bytesWritten
        length = length - bytesWritten
        this.position = this.limit
        RefreshBuffer(this)

        -- Now deal with the rest.
        -- Since we have an output stream, this is our buffer
        -- and buffer offset == 0
        if length <= this.limit then
          -- Fits in new buffer.
          GoogleProtobuf.ByteArray.Copy(value, offset, this.buffer, 0, length)
          this.position = length
        else
          -- Write is very big.  Let's do it all at once.
          this.output:Write(value, offset, length)
        end
      end
    end
    -- <summary>
    -- Encode a 32-bit value with ZigZag encoding.
    -- </summary>
    -- ZigZag encodes signed integers into values that can be efficiently
    -- encoded with varint.  (Otherwise, negative values must be
    -- sign-extended to 64 bits to be varint encoded, thus always taking
    -- 10 bytes on the wire.)
    -- </remarks>
    EncodeZigZag32 = function (n)
      -- Note:  the right-shift must be arithmetic
      return System.toUInt32(System.xor((System.sl(n, 1)), (System.sr(n, 31))))
    end
    -- <summary>
    -- Encode a 64-bit value with ZigZag encoding.
    -- </summary>
    -- ZigZag encodes signed integers into values that can be efficiently
    -- encoded with varint.  (Otherwise, negative values must be
    -- sign-extended to 64 bits to be varint encoded, thus always taking
    -- 10 bytes on the wire.)
    -- </remarks>
    EncodeZigZag64 = function (n)
      return System.toUInt64(System.xor((System.sl(n, 1)), (System.sr(n, 63))))
    end
    RefreshBuffer = function (this)
      if this.output == nil then
        -- We're writing to a single buffer.
        System.throw(class.OutOfSpaceException())
      end

      -- Since we have an output stream, this is our buffer
      -- and buffer offset == 0
      this.output:Write(this.buffer, 0, this.position)
      this.position = 0
    end
    -- <summary>
    -- Flushes any buffered data and optionally closes the underlying stream, if any.
    -- </summary>
    -- <para>
    -- By default, any underlying stream is closed by this method. To configure this behaviour,
    -- use a constructor overload with a <c>leaveOpen</c> parameter. If this instance does not
    -- have an underlying stream, this method does nothing.
    -- </para>
    -- <para>
    -- For the sake of efficiency, calling this method does not prevent future write calls - but
    -- if a later write ends up writing to a stream which has been disposed, that is likely to
    -- fail. It is recommend that you not call any other methods after this.
    -- </para>
    -- </remarks>
    Dispose = function (this)
      Flush(this)
      if not this.leaveOpen then
        this.output:Dispose()
      end
    end
    -- <summary>
    -- Flushes any buffered data to the underlying stream (if there is one).
    -- </summary>
    Flush = function (this)
      if this.output ~= nil then
        RefreshBuffer(this)
      end
    end
    -- <summary>
    -- Verifies that SpaceLeft returns zero. It's common to create a byte array
    -- that is exactly big enough to hold a message, then write to it with
    -- a CodedOutputStream. Calling CheckNoSpaceLeft after writing verifies that
    -- the message was actually as big as expected, which can help bugs.
    -- </summary>
    CheckNoSpaceLeft = function (this)
      if getSpaceLeft(this) ~= 0 then
        System.throw(System.InvalidOperationException("Did not write as much data as expected."))
      end
    end
    getSpaceLeft = function (this)
      if this.output == nil then
        return this.limit - this.position
      else
        System.throw(System.InvalidOperationException("SpaceLeft can only be called on CodedOutputStreams that are writing to a flat array." --[["SpaceLeft can only be called on CodedOutputStreams that are " +
                        "writing to a flat array."]]))
      end
    end
    class = {
      base = function (out)
        return {
          System.IDisposable
        }
      end,
      ComputeDoubleSize = ComputeDoubleSize,
      ComputeFloatSize = ComputeFloatSize,
      ComputeUInt64Size = ComputeUInt64Size,
      ComputeInt64Size = ComputeInt64Size,
      ComputeInt32Size = ComputeInt32Size,
      ComputeFixed64Size = ComputeFixed64Size,
      ComputeFixed32Size = ComputeFixed32Size,
      ComputeBoolSize = ComputeBoolSize,
      ComputeStringSize = ComputeStringSize,
      ComputeGroupSize = ComputeGroupSize,
      ComputeMessageSize = ComputeMessageSize,
      ComputeBytesSize = ComputeBytesSize,
      ComputeUInt32Size = ComputeUInt32Size,
      ComputeEnumSize = ComputeEnumSize,
      ComputeSFixed32Size = ComputeSFixed32Size,
      ComputeSFixed64Size = ComputeSFixed64Size,
      ComputeSInt32Size = ComputeSInt32Size,
      ComputeSInt64Size = ComputeSInt64Size,
      ComputeLengthSize = ComputeLengthSize,
      ComputeRawVarint32Size = ComputeRawVarint32Size,
      ComputeRawVarint64Size = ComputeRawVarint64Size,
      ComputeTagSize = ComputeTagSize,
      DefaultBufferSize = DefaultBufferSize,
      leaveOpen = false,
      limit = 0,
      position = 0,
      Reset = Reset,
      getPosition = getPosition,
      WriteDouble = WriteDouble,
      WriteFloat = WriteFloat,
      WriteUInt64 = WriteUInt64,
      WriteInt64 = WriteInt64,
      WriteInt32 = WriteInt32,
      WriteFixed64 = WriteFixed64,
      WriteFixed32 = WriteFixed32,
      WriteBool = WriteBool,
      WriteString = WriteString,
      WriteMessage = WriteMessage,
      WriteBytes = WriteBytes,
      WriteUInt32 = WriteUInt32,
      WriteEnum = WriteEnum,
      WriteSFixed32 = WriteSFixed32,
      WriteSFixed64 = WriteSFixed64,
      WriteSInt32 = WriteSInt32,
      WriteSInt64 = WriteSInt64,
      WriteLength = WriteLength,
      WriteTag = WriteTag,
      WriteTag1 = WriteTag1,
      WriteRawTag = WriteRawTag,
      WriteRawTag1 = WriteRawTag1,
      WriteRawTag2 = WriteRawTag2,
      WriteRawTag3 = WriteRawTag3,
      WriteRawTag4 = WriteRawTag4,
      WriteRawVarint32 = WriteRawVarint32,
      WriteRawVarint64 = WriteRawVarint64,
      WriteRawLittleEndian32 = WriteRawLittleEndian32,
      WriteRawLittleEndian64 = WriteRawLittleEndian64,
      WriteRawByte = WriteRawByte,
      WriteRawByte1 = WriteRawByte1,
      WriteRawBytes = WriteRawBytes,
      WriteRawBytes1 = WriteRawBytes1,
      EncodeZigZag32 = EncodeZigZag32,
      EncodeZigZag64 = EncodeZigZag64,
      Dispose = Dispose,
      Flush = Flush,
      CheckNoSpaceLeft = CheckNoSpaceLeft,
      getSpaceLeft = getSpaceLeft,
      static = static,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__,
        __ctor5__,
        __ctor6__,
        __ctor7__
      }
    }
    return class
  end)
end)
