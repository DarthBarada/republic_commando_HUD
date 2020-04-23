/*
	Author: Darth Barda
	Function: RC_system_fnc_IFF_system
	Version: 0.0
	Date: 23/04/2020
	
	Description:
	RC IFF system.

	Parameters:
	none

	Returns:
	nothing
*/

waitUntil { !isNull findDisplay 46 };

_nameString="";
//_x_pos_HUD = safeZoneX + 0.05;
//_y_pos_HUD = 0.6;
_x_pos_HUD = 0.675;
_y_pos_HUD = 0.8; 

while{(list_of_HUDs find (goggles player)) != -1} do
	{
		_target = cursorObject; // When someone just stay, game think that it's a object but not a target.

		if ((_target isKindOf "Man") && (player == vehicle player)) then
			{			
				if(((player distance _target) < system_distance) && (alive _target)) then
					{
						_weaponsplayer = weapons _target;
						_weaponsplayername = "";
						_name = name _target;
						_distance_to_target = round(player distance _target);
						_displayname =  getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");

						// nameString = "<t size='0.5' shadow='2' color='#7FFF00'>" + format['%1 %2',_target getVariable ['unitname', name _target]] + "</t>"; // delete
						/**
						*	If target have a gun, then choose this one and search it's display name, else target is unarmed.
						**/
						if (currentWeapon _target != "") then
							{
								_weaponsplayer =  _weaponsplayer select 0;
								_weaponsplayername = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "displayname");
							}
						else
							{
								_weaponsplayername = "Unarmed";
							};
						
						_rank = [_target,"displayNameShort"] call BIS_fnc_rankParams;

						// PRINT THE RANK/NAME/WEAPON ONSCREEN
						if (side _target == playerSide) then
							{
								_nameString = format ["<t size='0.5' align='left' shadow='2' color='#7FFF00'>%3. </t><t size='0.5' align='left' shadow='2' color='#7FFF00'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#7FFF00'>%2</t><br/><t size='0.5' align='left' shadow='2' color='#7FFF00'>Дистанция: %4</t><br/>",_displayname, _weaponsplayername,_rank,_distance_to_target];
							}
						else
							{
								_nameString = format ["<t size='0.5' align='left' shadow='2' color='#FF0000'>%3. </t><t size='0.5' align='left' shadow='2' color='#FF0000'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#FF0000'>%2</t><br/><t size='0.5' align='left' shadow='2' color='#FF0000'>Дистанция: %4</t><br/>",_displayname, _weaponsplayername,_rank,_distance_to_target];
							};
						[_nameString,_x_pos_HUD,_y_pos_HUD,system_refresh,0,0,3] spawn bis_fnc_dynamicText;
					};				
			};

			// VEHICLE DISPLAY TARGETS
	
		if ((_target isKindOf "Car" || _target isKindOf "Motorcycle" ||  _target isKindOf "boat" || _target isKindOf "air" || _target isKindOf "Tank") && (player == vehicle player)) then
			{
				if(((player distance _target) < system_distance) && (alive _target))then
					{
						_side = side group _target;
						_displayname = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
						_health = round(abs(damage _target - 1.0)*100);
						_distance_to_target = round(player distance _target);
						
						switch(_side) do
							{
								case east:{_nameString = format ["<t size='0.5' align='left' shadow='2' color='#FF0000'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#FF0000'>Дистанция: %2</t><br/><t size='0.5' align='left' shadow='2' color='#FF0000'>Состояние: %3</t><br/>",_displayname,_distance_to_target, _health]};
								case west:{_nameString = format ["<t size='0.5' align='left' shadow='2' color='#7FFF00'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#7FFF00'>Дистанция: %2</t><br/><t size='0.5' align='left' shadow='2' color='#7FFF00'>Состояние: %3</t><br/>",_displayname,_distance_to_target, _health]};
								case civilian:{_nameString = format ["<t size='0.5' align='left' shadow='2' color='#7F00FF'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#7F00FF'>Дистанция: %2</t><br/><t size='0.5' align='left' shadow='2' color='#7F00FF'>Состояние: %3</t><br/>",_displayname,_distance_to_target, _health]};
								default{_nameString = format ["<t size='0.5' align='left' shadow='2' color='#FFFFFF'>%1</t><br/><t size='0.5' align='left' shadow='2' color='#FFFFFF'>Дистанция: %2</t><br/><t size='0.5' align='left' shadow='2' color='#FFFFFF'>Состояние: %3</t><br/>",_displayname,_distance_to_target, _health]};
							};
						[_nameString,_x_pos_HUD,_y_pos_HUD,system_refresh,0,0,3] spawn bis_fnc_dynamicText;						
					};
			};

		sleep system_refresh;
	};