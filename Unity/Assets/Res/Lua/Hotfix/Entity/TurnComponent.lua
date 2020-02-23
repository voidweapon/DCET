-- Generated by CSharp.lua Compiler
local System = System
local DCET = DCET
local UnityEngine = UnityEngine
local DCET
System.import(function (out)
  DCET = out.DCET
end)
System.namespace("DCET", function (namespace)
  namespace.class("TurnComponentUpdateSystem", function (namespace)
    local Update
    Update = function (this, self)
      self:Update()
    end
    return {
      base = function (out)
        return {
          out.DCET.UpdateSystem_1(out.DCET.TurnComponent)
        }
      end,
      Update = Update,
      __metadata__ = function (out)
        return {
          class = { 0x6, out.DCET.ObjectSystemAttribute() }
        }
      end
    }
  end)

  namespace.class("TurnComponent", function (namespace)
    local Update, UpdateTurn, Turn2D, Turn, Turn1, Turn2, TurnImmediately, TurnImmediately1, 
    TurnImmediately2, Dispose, __ctor__
    __ctor__ = function (this)
      this.To = System.default(UnityEngine.Quaternion)
      this.From = System.default(UnityEngine.Quaternion)
      System.base(this).__ctor__(this)
    end
    Update = function (this)
      UpdateTurn(this)
    end
    UpdateTurn = function (this)
      --Log.Debug($"update turn: {this.t} {this.TurnTime}");
      if this.t > this.TurnTime then
        return
      end

      this.t = this.t + UnityEngine.Time.getdeltaTime()

      local v = UnityEngine.Quaternion.Slerp(this.From, this.To, this.t / this.TurnTime)
      this:GetParent(DCET.Unit):setRotation(v:__clone__())
    end
    -- <summary>
    -- 改变Unit的朝向
    -- </summary>
    Turn2D = function (this, dir, turnTime)
      local nexpos = this:GetParent(DCET.Unit).ViewGO:gettransform():getposition() + dir
      Turn(this, nexpos:__clone__(), turnTime)
    end
    -- <summary>
    -- 改变Unit的朝向
    -- </summary>
    Turn = function (this, target, turnTime)
      local quaternion = DCET.PositionHelper.GetVector3ToQuaternion(this:GetParent(DCET.Unit):getPosition(), target)

      this.To = quaternion:__clone__()
      this.From = this:GetParent(DCET.Unit):getRotation()
      this.t = 0
      this.TurnTime = turnTime
    end
    -- <summary>
    -- 改变Unit的朝向
    -- </summary>
    Turn1 = function (this, angle, turnTime)
      local quaternion = DCET.PositionHelper.GetAngleToQuaternion(angle)

      this.To = quaternion:__clone__()
      this.From = this:GetParent(DCET.Unit):getRotation()
      this.t = 0
      this.TurnTime = turnTime
    end
    Turn2 = function (this, quaternion, turnTime)
      this.To = quaternion:__clone__()
      this.From = this:GetParent(DCET.Unit):getRotation()
      this.t = 0
      this.TurnTime = turnTime
    end
    TurnImmediately = function (this, quaternion)
      this:GetParent(DCET.Unit):setRotation(quaternion:__clone__())
    end
    TurnImmediately1 = function (this, target)
      local nowPos = this:GetParent(DCET.Unit):getPosition()
      if nowPos == target then
        return
      end

      local quaternion = DCET.PositionHelper.GetVector3ToQuaternion(this:GetParent(DCET.Unit):getPosition(), target)
      this:GetParent(DCET.Unit):setRotation(quaternion:__clone__())
    end
    TurnImmediately2 = function (this, angle)
      local quaternion = DCET.PositionHelper.GetAngleToQuaternion(angle)
      this:GetParent(DCET.Unit):setRotation(quaternion:__clone__())
    end
    Dispose = function (this)
      if this:getIsDisposed() then
        return
      end
      System.base(this).Dispose(this)
    end
    return {
      base = function (out)
        return {
          out.DCET.Entity
        }
      end,
      t = 3.40282347E+38 --[[Single.MaxValue]],
      TurnTime = 0.1,
      Update = Update,
      Turn2D = Turn2D,
      Turn = Turn,
      Turn1 = Turn1,
      Turn2 = Turn2,
      TurnImmediately = TurnImmediately,
      TurnImmediately1 = TurnImmediately1,
      TurnImmediately2 = TurnImmediately2,
      Dispose = Dispose,
      __ctor__ = __ctor__
    }
  end)
end)
