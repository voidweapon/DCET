-- Generated by CSharp.lua Compiler
local System = System
System.namespace("DCET", function (namespace)
  -- 不需要返回消息
  namespace.interface("IActorMessage", function ()
    return {
      base = function (out)
        return {
          out.DCET.IMessage
        }
      end
    }
  end)

  namespace.interface("IActorRequest", function ()
    return {
      base = function (out)
        return {
          out.DCET.IActorMessage,
          out.DCET.IRequest
        }
      end
    }
  end)

  namespace.interface("IActorResponse", function ()
    return {
      base = function (out)
        return {
          out.DCET.IResponse
        }
      end
    }
  end)
end)
