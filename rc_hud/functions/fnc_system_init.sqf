/*
	Author: Darth Brada
	Function: RC_system_fnc_system_init
	Version: 0.0
	Date: 23/04/2020
	
	Description:
	No params, Simple preinit function to initialize feature.

	Parameters:
	none

	Returns:
	nothing
*/

RC_IsHost = false;
RC_IsDedicated = false;
RC_DediRunning = false;
RC_IsClient = false;

if (isDedicated) then {RC_IsDedicated = true;RC_DediRunning = true;};
if (!isDedicated && hasInterface && isServer) then {RC_IsHost = true;};
if (!isDedicated && hasInterface && !isServer) then {RC_IsClient = true;};

list_of_HUDs = ["RC_HUD_blue","RC_HUD_green","RC_HUD_orange","RC_HUD_red","RC_HUD_skyblue","RC_HUD_yellow"];
system_refresh = 0.5;
system_distance = 1000;

publicVariable "list_of_HUDs";
publicVariable "system_refresh";
publicVariable "system_distance";