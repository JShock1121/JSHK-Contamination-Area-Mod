/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_getStamina.sqf
Parameters: unit
Return: stamina level

*///////////////////////////////////////////////
params ["_unit"];
if (!hasInterface) exitWith {};
private _return = 1;
if (isStaminaEnabled _unit) then 
{
	private _fatigue = getFatigue _unit;
	if (_fatigue > 0.70) then { _fatigue = 0.70};
	private _val = 1 - _fatigue;
	if (_val == 0) then { _val = 0.30; };
	_return = _val;
};
_return;