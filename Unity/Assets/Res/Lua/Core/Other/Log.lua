-- Generated by CSharp.lua Compiler
local System = System
local DCETRuntime = DCETRuntime
local DCET
System.import(function (out)
  DCET = out.DCET
end)
System.namespace("DCET", function (namespace)
  namespace.class("Log", function (namespace)
    local Warning, Info, Error, Error1, Debug, Msg
    Warning = function (msg)
      DCETRuntime.Log.Warning(msg)
    end
    Info = function (msg)
      DCETRuntime.Log.Info(msg)
    end
    Error = function (e)
      DCETRuntime.Log.Error(DCET.ExceptionHelper.ToStr(e))
    end
    Error1 = function (msg)
      DCETRuntime.Log.Error(msg)
    end
    Debug = function (msg)
      DCETRuntime.Log.Debug(msg)
    end
    Msg = function (msg)
      Debug(DCET.StringHelper.MessageToStr(msg))
    end
    return {
      Warning = Warning,
      Info = Info,
      Error = Error,
      Error1 = Error1,
      Debug = Debug,
      Msg = Msg
    }
  end)
end)