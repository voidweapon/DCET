-- Generated by CSharp.lua Compiler
local System = System
System.namespace("DCET", function (namespace)
  namespace.class("DBConfig", function (namespace)
    return {
      base = function (out)
        return {
          out.DCET.AConfigComponent
        }
      end,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.MongoDB.Bson.Serialization.Attributes.BsonIgnoreExtraElementsAttribute() }
        }
      end
    }
  end)
end)
