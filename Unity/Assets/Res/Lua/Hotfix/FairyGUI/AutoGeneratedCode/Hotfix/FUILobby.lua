-- Generated by CSharp.lua Compiler
local System = System
local DCET = DCET
local FairyGUI = FairyGUI
local DCET
System.import(function (out)
  DCET = out.DCET
end)
System.namespace("DCET", function (namespace)
  namespace.class("FUILobbyAwakeSystem", function (namespace)
    local Awake
    Awake = function (this, self, go)
      self:Awake(go)
    end
    return {
      base = function (out)
        return {
          out.DCET.AwakeSystem_2(out.DCET.FUILobby, out.FairyGUI.GObject)
        }
      end,
      Awake = Awake,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.DCET.ObjectSystemAttribute() }
        }
      end
    }
  end)

  namespace.class("FUILobby", function (namespace)
    local CreateGObject, CreateGObjectAsync, CreateInstance, CreateInstanceAsync, Create, GetFormPool, Awake, Dispose, 
    class
    CreateGObject = function ()
      return FairyGUI.UIPackage.CreateObject("Hotfix" --[[FUILobby.UIPackageName]], "Lobby" --[[FUILobby.UIResName]])
    end
    CreateGObjectAsync = function (result)
      FairyGUI.UIPackage.CreateObjectAsync("Hotfix" --[[FUILobby.UIPackageName]], "Lobby" --[[FUILobby.UIResName]], result)
    end
    CreateInstance = function (domain)
      return DCET.EntityFactory.Create2(domain, CreateGObject(), class, FairyGUI.GObject)
    end
    CreateInstanceAsync = function (domain)
      local tcs = System.TaskCompletionSource()

      CreateGObjectAsync(function (go)
        tcs:SetResult(DCET.EntityFactory.Create2(domain, go, class, FairyGUI.GObject))
      end)

      return tcs:getTask()
    end
    Create = function (domain, go)
      return DCET.EntityFactory.Create2(domain, go, class, FairyGUI.GObject)
    end
    -- <summary>
    -- 通过此方法获取的FUI，在Dispose时不会释放GObject，需要自行管理（一般在配合FGUI的Pool机制时使用）。
    -- </summary>
    GetFormPool = function (domain, go)
      local fui = DCET.GObjectHelper.Get(go, class)

      if fui == nil then
        fui = Create(domain, go)
      end

      fui.isFromFGUIPool = true

      return fui
    end
    Awake = function (this, go)
      if go == nil then
        return
      end

      this.GObject = go

      if System.String.IsNullOrWhiteSpace(this:getName()) then
        this:setName(this.Id:ToString())
      end

      this.self = System.cast(FairyGUI.GComponent, go)

      DCET.GObjectHelper.Add(this.self, this)

      local com = go:getasCom()

      if com ~= nil then
        this.bg = System.cast(FairyGUI.GImage, com:GetChild("bg"))
        this.enterButton = DCET.FUITitleButton.Create(this.domain, com:GetChild("enterButton"))
      end
    end
    Dispose = function (this)
      if this:getIsDisposed() then
        return
      end

      System.base(this).Dispose(this)

      DCET.GObjectHelper.Remove(this.self)
      this.self = nil
      this.bg = nil
      this.enterButton:Dispose()
      this.enterButton = nil
    end
    class = {
      base = function (out)
        return {
          out.DCET.FUI
        }
      end,
      CreateInstance = CreateInstance,
      CreateInstanceAsync = CreateInstanceAsync,
      Create = Create,
      GetFormPool = GetFormPool,
      Awake = Awake,
      Dispose = Dispose
    }
    return class
  end)
end)
