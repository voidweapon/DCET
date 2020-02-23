-- Generated by CSharp.lua Compiler
local System = System
local BehaviorDesignerRuntime = BehaviorDesigner.Runtime
local DCETRuntime = DCET.Runtime
local UnityEngine = UnityEngine
System.namespace("DCET", function (namespace)
  namespace.class("BehaviorTreeHelper", function (namespace)
    local Init
    Init = function (_object)
      if System.is(_object, UnityEngine.GameObject) then
        local go = System.as(_object, UnityEngine.GameObject)

        if UnityEngine.op_Implicit(go) then
          local bts = go:GetComponentsInChildren(BehaviorDesignerRuntime.BehaviorTree)

          if bts ~= nil then
            for _, bt in System.each(bts) do
              if UnityEngine.op_Implicit(bt) then
                (System.as(DCETRuntime.GameObjectHelper.Ensure(bt:getgameObject(), System.typeof(BehaviorDesignerRuntime.BehaviorTreeController)), BehaviorDesignerRuntime.BehaviorTreeController)):Init()
              end
            end
          end
        end
      elseif System.is(_object, BehaviorDesignerRuntime.ExternalBehavior) then
        local externalBehavior = System.as(_object, BehaviorDesignerRuntime.ExternalBehavior)

        if UnityEngine.op_Implicit(externalBehavior) then
          externalBehavior:Init()
        end
      end
    end
    return {
      Init = Init
    }
  end)
end)
