/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_rainLoop.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};
if (!hasInterface) exitWith {};
if !(_unit isKindOf "Man") exitWith {};
if !(JSHK_contam_rainEffectEnabled) exitWith {};
while {alive _unit} do
{
	private _isRaining = [0.4] call JSHK_contam_fnc_isRaining;
	private _hasMask = [_unit] call JSHK_contam_fnc_isWearingMask;
	private _effectApplied = [_unit] call JSHK_contam_fnc_rainEffectApplied;
	private _under = [_unit] call JSHK_contam_fnc_underCover;
	
	if (_isRaining && _hasMask && !_under) then
	{
		if (!_effectApplied) then
		{
			[_unit] call JSHK_contam_fnc_addRainEffect;
		};
	} else
	{
		if (_effectApplied) then
		{
			[_unit] call JSHK_contam_fnc_removeRainEffect;
		};
	};
	sleep 1;
};