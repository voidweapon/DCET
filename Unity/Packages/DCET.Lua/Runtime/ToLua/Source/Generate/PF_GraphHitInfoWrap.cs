﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class PF_GraphHitInfoWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(PF.GraphHitInfo), null);
		L.RegFunction("New", _CreatePF_GraphHitInfo);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("origin", get_origin, set_origin);
		L.RegVar("point", get_point, set_point);
		L.RegVar("node", get_node, set_node);
		L.RegVar("tangentOrigin", get_tangentOrigin, set_tangentOrigin);
		L.RegVar("tangent", get_tangent, set_tangent);
		L.RegVar("distance", get_distance, null);
		L.RegFunction("getdistance", get_distance);
		L.RegFunction("default", __default__);
		L.RegFunction("__clone__", __clone__);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatePF_GraphHitInfo(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 1);
				PF.GraphHitInfo obj = new PF.GraphHitInfo(arg0);
				ToLua.PushValue(L, obj);
				return 1;
			}
			else if (count == 0)
			{
				PF.GraphHitInfo obj = new PF.GraphHitInfo();
				ToLua.PushValue(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: PF.GraphHitInfo.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_origin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 ret = obj.origin;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index origin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_point(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 ret = obj.point;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index point on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_node(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			PF.GraphNode ret = obj.node;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index node on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_tangentOrigin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 ret = obj.tangentOrigin;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tangentOrigin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_tangent(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 ret = obj.tangent;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tangent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_distance(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			float ret = obj.distance;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index distance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_origin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.origin = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index origin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_point(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.point = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index point on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_node(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			PF.GraphNode arg0 = (PF.GraphNode)ToLua.CheckObject<PF.GraphNode>(L, 2);
			obj.node = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index node on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_tangentOrigin(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.tangentOrigin = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tangentOrigin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_tangent(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			PF.GraphHitInfo obj = (PF.GraphHitInfo)o;
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 2);
			obj.tangent = arg0;
			ToLua.SetBack(L, 1, obj);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index tangent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __default__(IntPtr L)
	{
		try
		{
			var o = new PF.GraphHitInfo();
			ToLua.PushValue(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int __clone__(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			var obj = (PF.GraphHitInfo)ToLua.CheckObject(L, 1, typeof(PF.GraphHitInfo));
			var o = obj;
			ToLua.PushValue(L, o);
			ToLua.SetBack(L, 1, obj);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
