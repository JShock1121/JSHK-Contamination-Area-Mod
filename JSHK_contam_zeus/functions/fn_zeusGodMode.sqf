/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusGodMode.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos", [0,0,0], [[]]], ["_unit", objNull, [objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

if (isMultiplayer) then
{
	["JSHK_contam_serverFnc_enableGodMode",[player,_unit]] call JSHK_contam_fnc_requestExec;
		
	if !([_unit] call JSHK_contam_fnc_godModeEnabled) then
	{
		[format ["%1 is now invulnerable",name _unit]] call ares_fnc_showZeusMessage;
	} else
	{
		[format ["%1 is now vulnerable",name _unit]] call ares_fnc_showZeusMessage;
	};
} else
{
	if !([player] call JSHK_contam_fnc_godModeEnabled) then
	{
		JSHK_contam_godModeUnits pushBackUnique player;
		[format ["%1 is now invulnerable",name player]] call ares_fnc_showZeusMessage;
	} else
	{
		JSHK_contam_godModeUnits = [];
		[format ["%1 is now vulnerable",name player]] call ares_fnc_showZeusMessage;
	};

};