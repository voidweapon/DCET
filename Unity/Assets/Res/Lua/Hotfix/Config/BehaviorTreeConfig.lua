-- Generated by CSharp.lua Compiler
local System = System
System.namespace("DCET", function (namespace)
  namespace.class("BehaviorTreeConfigCategory", function (namespace)
    return {
      base = function (out)
        return {
          out.DCET.ACategory_1(out.DCET.BehaviorTreeConfig)
        }
      end,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.DCET.ConfigAttribute(-1073741756 --[[(int)(AppType.ClientH |  AppType.ClientM | AppType.Gate | AppType.Map)]]) }
        }
      end
    }
  end)

  namespace.class("BehaviorTreeConfig", function (namespace)
    local getId, setId
    getId, setId = System.property("Id")
    return {
      base = function (out)
        return {
          out.DCET.IConfig
        }
      end,
      Id = 0,
      getId = getId,
      setId = setId
    }
  end)
end)
