/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_maskOnLoop.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit"];
if (!hasInterface) exitWith {};
private _time = 5;
while {alive _unit} do
{
	if ([_unit] call JSHK_contam_fnc_isWearingMask) then
	{
		[] spawn JSHK_contam_fnc_maskSound;
	};
	sleep _time;
	if (JSHK_contam_staminaEffectEnabled) then
	{
		_time = 5*([_unit] call JSHK_contam_fnc_getStamina);
	};
};
