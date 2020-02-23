-- Generated by CSharp.lua Compiler
local System = System
local DCET = DCET
local DCETRuntime = DCET.Runtime
local UnityEngine = UnityEngine
System.namespace("DCET", function (namespace)
  namespace.class("ConfigHelper", function (namespace)
    local GetText, ToObject
    GetText = function (key)
      local default, extern = System.try(function ()
        local config = System.cast(UnityEngine.GameObject, DCET.Game.getScene():GetComponent(DCET.ResourcesComponent):GetAsset("config.unity3d", "Config"))
        return true, DCETRuntime.GameObjectHelper.GetTextAsset(config, key):gettext()
      end, function (default)
        local e = default
        System.throw(System.Exception("load config file fail, key: " .. key, e))
      end)
      if default then
        return extern
      end
    end
    ToObject = function (str, T)
      return DCET.JsonHelper.FromJson(str, T)
    end
    return {
      GetText = GetText,
      ToObject = ToObject
    }
  end)
end)
