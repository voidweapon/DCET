-- Generated by CSharp.lua Compiler
local System = System
local SystemIO = System.IO
System.namespace("DCET", function (namespace)
  namespace.class("ProtobufHelper", function (namespace)
    local ToBytes, ToStream, FromBytes, FromBytes1, FromStream, FromStream1, static
    static = function (this)
      protobuf.register_file("Assets/Res/Lua/pbc/AutoGeneratedCode/OuterMessage.pb")
    end
    ToBytes = function (message)
      local bytes = nil
      bytes = encodeProtobuf(message)
      return bytes
    end
    ToStream = function (message, memoryStream)
      local bytes = nil

      bytes = encodeProtobuf(message)

      if bytes ~= nil then
        memoryStream:Write(bytes, 0, #bytes)
      end
    end
    FromBytes = function (type, bytes, index, count)
      local default, extern = System.using(SystemIO.MemoryStream(bytes, index, count), function (s)
        local datas = s:ToArray()

        if bytes ~= nil then
          return decodeProtobuf(datas, type)
        end

        return true, nil
      end)
      if default then
        return extern
      end
    end
    FromBytes1 = function (instance, bytes, index, count)
      if instance ~= nil then
        return FromBytes(instance:GetType(), bytes, index, count)
      end

      return nil
    end
    FromStream = function (type, stream)
      local bytes = stream:ToArray()

      if bytes ~= nil then
        return decodeProtobuf(bytes, type)
      end

      return nil
    end
    FromStream1 = function (message, stream)
      if message ~= nil then
        return FromStream(message:GetType(), stream)
      end

      return nil
    end
    return {
      ToBytes = ToBytes,
      ToStream = ToStream,
      FromBytes = FromBytes,
      FromBytes1 = FromBytes1,
      FromStream = FromStream,
      FromStream1 = FromStream1,
      static = static
    }
  end)
end)
