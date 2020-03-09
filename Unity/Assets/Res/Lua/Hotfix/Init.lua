-- Generated by CSharp.lua Compiler
local System = System
local BehaviorDesignerRuntime = BehaviorDesigner.Runtime
local DCET = DCET
local DCETRuntime = DCETRuntime
local UnityEngine = UnityEngine
local DCET
System.import(function (out)
  DCET = out.DCET
end)
System.namespace("DCET", function (namespace)
  namespace.class("Init", function (namespace)
    local Start, TestBehaviorTree, Update, LateUpdate, OnApplicationQuit
    Start = function ()
      System.async(function (async)
        System.try(function ()
          DCET.TypeHelper.Init()
          DCET.Game.getEventSystem():Init()

          -- 注册热更层回调
          DCETRuntime.GameLoop.onUpdate = DCETRuntime.GameLoop.onUpdate + Update
          DCETRuntime.GameLoop.onLateUpdate = DCETRuntime.GameLoop.onLateUpdate + LateUpdate
          DCETRuntime.GameLoop.onApplicationQuit = DCETRuntime.GameLoop.onApplicationQuit + OnApplicationQuit

          DCET.Game.Scene = DCET.EntityFactory.CreateScene1(30, "Client", nil, 0)
          DCET.Game.Scene:AddComponent(DCET.NetOuterComponent)
          DCET.Game.Scene:AddComponent(DCET.OpcodeTypeComponent)
          DCET.Game.Scene:AddComponent(DCET.MessageDispatcherComponent)
          DCET.Game.Scene:AddComponent(DCET.SessionComponent)
          DCET.Game.Scene:AddComponent(DCET.PlayerComponent)
          DCET.Game.Scene:AddComponent(DCET.UnitComponent)

          -- 加载热更配置
          DCET.Game.Scene:AddComponent(DCET.ResourcesComponent):LoadBundle("config.unity3d")
          DCET.Game.Scene:AddComponent(DCET.ConfigComponent)
          DCET.Game.Scene:GetComponent(DCET.ResourcesComponent):UnloadBundle("config.unity3d")

          DCET.Game.Scene:AddComponent(DCET.FUIPackageComponent)
          DCET.Game.Scene:AddComponent(DCET.FUIComponent)
          async:await(DCET.Game.Scene:AddComponent(DCET.FUIInitComponent):Init())
          DCET.Game.getEventSystem():Run("InitSceneStart" --[[EventIdType.InitSceneStart]])

          -- 演示行为树用法
          --TestBehaviorTree();
        end, function (default)
          local e = default
          DCET.Log.Error(e)
        end)
      end, true)
    end
    -- <summary>
    -- 演示行为树用法，使用时可以删除
    -- </summary>
    TestBehaviorTree = function ()
      -- 全局共享变量用法
      DCET.Game.Scene:AddComponent(DCET.BehaviorTreeVariableComponent):SetVariable("全局变量", 1, System.Int32)

      local runtimeBehaivorTree = UnityEngine.Object.Instantiate(System.as(DCETRuntime.ResourcesHelper.Load("Cube"), UnityEngine.GameObject)):GetComponent(BehaviorDesignerRuntime.BehaviorTree)

      if UnityEngine.op_Implicit(runtimeBehaivorTree) then
        --建议在资源预加载时进行初始化，以免游戏对局中反序列化GC卡顿
        DCET.BehaviorTreeHelper.Init(runtimeBehaivorTree:getgameObject());

        --动态加载外部行为树用法
        --UnityEngine.Object externalBehavior = 加载("外部行为树资源");
        --BehaviorTreeHelper.Init(externalBehavior);
        --runtimeBehaivorTree.Ensure<BehaviorTreeController>().SetExternalBehavior(externalBehavior);

        (System.as(DCETRuntime.GameObjectHelper.Ensure(runtimeBehaivorTree:getgameObject(), System.typeof(BehaviorDesignerRuntime.BehaviorTreeController)), BehaviorDesignerRuntime.BehaviorTreeController)):Init()
      end

      local behaviorTree = DCET.BehaviorTreeFactory.Create4(DCET.Game.Scene, runtimeBehaivorTree)

      -- 新增行为树共享变量用法
      local p1 = behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):GetVariable("变量1", System.Int32)

      DCET.Log.Info("行为树变量：" .. System.toString(p1))

      behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):SetVariable("变量1", 2, System.Int32)

      p1 = behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):GetVariable("变量1", System.Int32)

      DCET.Log.Info("行为树变量：" .. System.toString(p1))

      behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):SetVariable("变量2", "", System.String)
      behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):SetVariable("变量3", behaviorTree, DCET.BehaviorTree)
      behaviorTree:GetComponent(DCET.BehaviorTreeVariableComponent):SetVariable("变量4", runtimeBehaivorTree, BehaviorDesignerRuntime.BehaviorTree)
    end
    Update = function ()
      DCET.Game.getEventSystem():Update()
    end
    LateUpdate = function ()
      DCET.Game.getEventSystem():LateUpdate()
    end
    OnApplicationQuit = function ()
      DCET.Game.Close()
    end
    return {
      Start = Start,
      Update = Update,
      LateUpdate = LateUpdate,
      OnApplicationQuit = OnApplicationQuit
    }
  end)
end)