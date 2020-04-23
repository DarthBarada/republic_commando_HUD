class CfgFunctions
	{
		class republic_commando_system
			{
				class system
					{
						class IFF_system // Система свой-чужой для Republic Commando
							{
								file = "rc_hud\functions\fnc_IFF_system.sqf";
							};
						class system_init
							{
								file = "rc_hud\functions\fnc_system_init.sqf";
								preInit = 1;
							};
					};
			};
	};	