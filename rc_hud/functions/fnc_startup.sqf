/*
	Author: Darth Barda
	Function: RC_system_fnc_system_startup
	Version: 0.0
	Date: 23/04/2020
	
	Description:
	Initializes the RC system.

	Parameters:
	none

	Returns:
	nothing
*/
private ["list_of_HUDs","_refresh","_distance"];
waitUntil {!isNull (findDisplay 46)};

//setup some default values
list_of_HUDs = ["RC_HUD_blue","RC_HUD_green","RC_HUD_orange","RC_HUD_red","RC_HUD_skyblue","RC_HUD_yellow"];
_refresh = 0.5;
_distance = 1000;