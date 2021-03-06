﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class FairyGUI_Utils_ByteBufferWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(FairyGUI.Utils.ByteBuffer), typeof(System.Object));
		L.RegFunction("Skip", Skip);
		L.RegFunction("ReadByte", ReadByte);
		L.RegFunction("ReadBytes", ReadBytes);
		L.RegFunction("ReadBuffer", ReadBuffer);
		L.RegFunction("ReadChar", ReadChar);
		L.RegFunction("ReadBool", ReadBool);
		L.RegFunction("ReadShort", ReadShort);
		L.RegFunction("ReadUshort", ReadUshort);
		L.RegFunction("ReadInt", ReadInt);
		L.RegFunction("ReadUint", ReadUint);
		L.RegFunction("ReadFloat", ReadFloat);
		L.RegFunction("ReadLong", ReadLong);
		L.RegFunction("ReadDouble", ReadDouble);
		L.RegFunction("ReadString", ReadString);
		L.RegFunction("ReadS", ReadS);
		L.RegFunction("WriteS", WriteS);
		L.RegFunction("ReadColor", ReadColor);
		L.RegFunction("Seek", Seek);
		L.RegFunction("New", _CreateFairyGUI_Utils_ByteBuffer);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("littleEndian", get_littleEndian, set_littleEndian);
		L.RegVar("stringTable", get_stringTable, set_stringTable);
		L.RegVar("version", get_version, set_version);
		L.RegVar("position", get_position, set_position);
		L.RegFunction("getposition", get_position);
		L.RegFunction("setposition", set_position);
		L.RegVar("length", get_length, null);
		L.RegFunction("getlength", get_length);
		L.RegVar("bytesAvailable", get_bytesAvailable, null);
		L.RegFunction("getbytesAvailable", get_bytesAvailable);
		L.RegVar("buffer", get_buffer, null);
		L.RegFunction("getbuffer", get_buffer);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateFairyGUI_Utils_ByteBuffer(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				byte[] arg0 = ToLua.CheckByteBuffer(L, 1);
				FairyGUI.Utils.ByteBuffer obj = new FairyGUI.Utils.ByteBuffer(arg0);
				ToLua.PushObject(L, obj);
				return 1;
			}
			else if (count == 2)
			{
				byte[] arg0 = ToLua.CheckByteBuffer(L, 1);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 2);
				FairyGUI.Utils.ByteBuffer obj = new FairyGUI.Utils.ByteBuffer(arg0, arg1);
				ToLua.PushObject(L, obj);
				return 1;
			}
			else if (count == 3)
			{
				byte[] arg0 = ToLua.CheckByteBuffer(L, 1);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 2);
				int arg2 = (int)LuaDLL.luaL_checknumber(L, 3);
				FairyGUI.Utils.ByteBuffer obj = new FairyGUI.Utils.ByteBuffer(arg0, arg1, arg2);
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: FairyGUI.Utils.ByteBuffer.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Skip(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			int o = obj.Skip(arg0);
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadByte(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			byte o = obj.ReadByte();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadBytes(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				byte[] o = obj.ReadBytes(arg0);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 4)
			{
				FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
				byte[] arg0 = ToLua.CheckByteBuffer(L, 2);
				int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
				int arg2 = (int)LuaDLL.luaL_checknumber(L, 4);
				byte[] o = obj.ReadBytes(arg0, arg1, arg2);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: FairyGUI.Utils.ByteBuffer.ReadBytes");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadBuffer(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			FairyGUI.Utils.ByteBuffer o = obj.ReadBuffer();
			ToLua.PushObject(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadChar(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			char o = obj.ReadChar();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadBool(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			bool o = obj.ReadBool();
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadShort(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			short o = obj.ReadShort();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadUshort(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			ushort o = obj.ReadUshort();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadInt(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			int o = obj.ReadInt();
			LuaDLL.lua_pushinteger(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadUint(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			uint o = obj.ReadUint();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadFloat(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			float o = obj.ReadFloat();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadLong(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			long o = obj.ReadLong();
			LuaDLL.tolua_pushint64(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadDouble(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			double o = obj.ReadDouble();
			LuaDLL.lua_pushnumber(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadString(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
				string o = obj.ReadString();
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 2)
			{
				FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
				int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
				string o = obj.ReadString(arg0);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: FairyGUI.Utils.ByteBuffer.ReadString");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadS(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			string o = obj.ReadS();
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int WriteS(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.WriteS(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadColor(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			UnityEngine.Color o = obj.ReadColor();
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Seek(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)ToLua.CheckObject<FairyGUI.Utils.ByteBuffer>(L, 1);
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			int arg1 = (int)LuaDLL.luaL_checknumber(L, 3);
			bool o = obj.Seek(arg0, arg1);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_littleEndian(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			bool ret = obj.littleEndian;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index littleEndian on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_stringTable(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			string[] ret = obj.stringTable;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index stringTable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			int ret = obj.version;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_position(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			int ret = obj.position;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_length(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			int ret = obj.length;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index length on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_bytesAvailable(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			bool ret = obj.bytesAvailable;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index bytesAvailable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_buffer(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			byte[] ret = obj.buffer;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index buffer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_littleEndian(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.littleEndian = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index littleEndian on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_stringTable(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			string[] arg0 = ToLua.CheckStringArray(L, 2);
			obj.stringTable = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index stringTable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_version(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.version = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index version on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_position(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			FairyGUI.Utils.ByteBuffer obj = (FairyGUI.Utils.ByteBuffer)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.position = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index position on a nil value");
		}
	}
}

