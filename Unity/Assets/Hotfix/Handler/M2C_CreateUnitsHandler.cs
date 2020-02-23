﻿using System.Threading.Tasks;
using Vector3 = UnityEngine.Vector3;

namespace DCET
{
	[MessageHandler]
	public class M2C_CreateUnitsHandler : AMHandler<M2C_CreateUnits>
	{
		protected override async Task Run(Session session, M2C_CreateUnits message)
		{	
			UnitComponent unitComponent = Game.Scene.GetComponent<UnitComponent>();
			
			foreach (UnitInfo unitInfo in message.Units)
			{
				if (unitComponent.Get(unitInfo.UnitId) != null)
				{
					continue;
				}
				Unit unit = UnitFactory.Create(Game.Scene, unitInfo.UnitId);
				unit.Position = new Vector3(unitInfo.X, unitInfo.Y, unitInfo.Z);
			}

			await Task.CompletedTask;
		}
	}
}
