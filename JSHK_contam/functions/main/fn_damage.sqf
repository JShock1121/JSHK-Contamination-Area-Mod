/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_damage.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit","_time"];
if (_time < 0) then
{
	["fn_damage: Time to death came in as an unknown value!",true] call JSHK_contam_fnc_logMessage; 
};
if (isPlayer _unit && !JSHK_contam_enableDamage) exitWith {};
if (!isPlayer _unit && !JSHK_contam_aiDamageEnabled) exitWith {};
if ([_unit] call JSHK_contam_fnc_godModeEnabled) exitWith {};

if (_time <= 0) then { _time = 1; };

private _handle = scriptNull;
if (JSHK_contam_ACE_enabled) then
{
	_handle = [_unit,_time] spawn JSHK_contam_fnc_aceDamage;
}
else
{
	_handle = [_unit,_time] spawn JSHK_contam_fnc_vanillaDamage;
};
[format ["fn_damage: Time to death passed as: %1",_time]] call JSHK_contam_fnc_logMessage;
[format ["fn_damage: Damage handle id isNull: %1",isNull _handle]] call JSHK_contam_fnc_logMessage;
_handle;