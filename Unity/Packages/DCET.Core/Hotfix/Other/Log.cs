﻿using System;

namespace DCET
{
	public static class Log
	{
#if SERVER
		private static readonly ILog globalLog = new NLogAdapter();
#endif

		public static void Warning(string msg)
		{
#if !SERVER
			DCETRuntime.Log.Warning(msg);
#else
			globalLog.Warning(msg);
#endif
		}

		public static void Info(string msg)
		{
#if !SERVER
			DCETRuntime.Log.Info(msg);
#else
			globalLog.Info(msg);
#endif
		}

		public static void Error(Exception e)
		{
#if !SERVER
			DCETRuntime.Log.Error(e.ToStr());			
#else
			globalLog.Error(e.ToStr());
#endif
		}

		public static void Error(string msg)
		{
#if !SERVER
			DCETRuntime.Log.Error(msg);
#else
			globalLog.Error(msg);
#endif
		}

		public static void Debug(string msg)
		{
#if !SERVER
			DCETRuntime.Log.Debug(msg);			
#else
			globalLog.Debug(msg);
#endif
		}

		public static void Msg(object msg)
		{
			Debug(StringHelper.MessageToStr(msg));
		}
	}
}