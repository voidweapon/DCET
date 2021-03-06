-- Generated by CSharp.lua Compiler
local System = System
System.namespace("DCET", function (namespace)

  namespace.class("Packet", function (namespace)
    return {}
  end)

  namespace.class("PacketParser", function (namespace)
    local Parse, GetPacket, __ctor__
    __ctor__ = function (this, packetSizeLength, buffer, memoryStream)
      this.packetSizeLength = packetSizeLength
      this.buffer = buffer
      this.memoryStream = memoryStream
    end
    Parse = function (this)
      if this.isOK then
        return true
      end

      local finish = false
      while not finish do
        repeat
          local default = this.state
          if default == 0 --[[ParserState.PacketSize]] then
            if this.buffer:getLength() < this.packetSizeLength then
              finish = true
            else
              this.buffer:Read(this.memoryStream:GetBuffer(), 0, this.packetSizeLength)

              repeat
                local extern = this.packetSizeLength
                if extern == 4 --[[Packet.PacketSizeLength4]] then
                  this.packetSize = System.BitConverter.ToInt32(this.memoryStream:GetBuffer(), 0)
                  if this.packetSize > 1048560 --[[ushort.MaxValue * 16]] or this.packetSize < 2 --[[Packet.MinPacketSize]] then
                    System.throw(System.Exception("recv packet size error, 可能是外网探测端口: " .. this.packetSize))
                  end
                  break
                elseif extern == 2 --[[Packet.PacketSizeLength2]] then
                  this.packetSize = System.BitConverter.ToUInt16(this.memoryStream:GetBuffer(), 0)
                  if this.packetSize > 65535 --[[UInt16.MaxValue]] or this.packetSize < 2 --[[Packet.MinPacketSize]] then
                    System.throw(System.Exception("recv packet size error:, 可能是外网探测端口: " .. this.packetSize))
                  end
                  break
                else
                  System.throw(System.Exception("packet size byte count must be 2 or 4!"))
                end
              until 1
              this.state = 1 --[[ParserState.PacketBody]]
            end
            break
          elseif default == 1 --[[ParserState.PacketBody]] then
            if this.buffer:getLength() < this.packetSize then
              finish = true
            else
              this.memoryStream:Seek(0, 0 --[[SeekOrigin.Begin]])
              this.memoryStream:SetLength(this.packetSize)
              local bytes = this.memoryStream:GetBuffer()
              this.buffer:Read(bytes, 0, this.packetSize)
              this.isOK = true
              this.state = 0 --[[ParserState.PacketSize]]
              finish = true
            end
            break
          end
        until 1
      end
      return this.isOK
    end
    GetPacket = function (this)
      this.isOK = false
      return this.memoryStream
    end
    return {
      packetSize = 0,
      state = 0,
      isOK = false,
      packetSizeLength = 0,
      Parse = Parse,
      GetPacket = GetPacket,
      __ctor__ = __ctor__
    }
  end)
end)
