﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class PF_ThreadCountWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(PF.ThreadCount));
		L.RegConstant("AutomaticLowLoad", PF.ThreadCount.AutomaticLowLoad);
		L.RegConstant("AutomaticHighLoad", PF.ThreadCount.AutomaticHighLoad);
		L.RegConstant("None", PF.ThreadCount.None);
		L.RegConstant("One", PF.ThreadCount.One);
		L.RegConstant("Two", PF.ThreadCount.Two);
		L.RegConstant("Three", PF.ThreadCount.Three);
		L.RegConstant("Four", PF.ThreadCount.Four);
		L.RegConstant("Five", PF.ThreadCount.Five);
		L.RegConstant("Six", PF.ThreadCount.Six);
		L.RegConstant("Seven", PF.ThreadCount.Seven);
		L.RegConstant("Eight", PF.ThreadCount.Eight);
		L.EndEnum();
		TypeTraits<PF.ThreadCount>.Check = CheckType;
		StackTraits<PF.ThreadCount>.Push = Push;
	}

	static void Push(IntPtr L, PF.ThreadCount arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(PF.ThreadCount), L, pos);
	}
}

