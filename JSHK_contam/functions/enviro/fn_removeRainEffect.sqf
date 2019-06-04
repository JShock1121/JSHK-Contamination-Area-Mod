/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_removeRainEffect.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params ["_unit"];
private _arr = _unit getVariable ["JSHK_contam_rainPP",[]];
if (_arr isEqualTo []) exitWith {};
{
	_x ppEffectEnable false;
	_x ppEffectCommit 2;
	sleep 2;
	ppEffectDestroy _x;
} forEach _arr;
_unit setVariable ["JSHK_contam_rainPP",[]];