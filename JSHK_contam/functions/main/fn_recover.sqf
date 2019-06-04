/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_recover.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit"];
private ["_damage","_initialH"];

if (JSHK_contam_ACE_enabled || !alive _unit) exitWith {};
if (isPlayer _unit && !JSHK_contam_autoRecovery) exitWith {};
if (!isPlayer _unit && !JSHK_contam_aiAutoRecovery) exitWith {};

private _damage = damage _unit;
private _initialH = (_unit getVariable "JSHK_contam_initialDamage");

while {alive _unit && !(_unit getVariable ["JSHK_contam_damageHandle",false]) && (_damage > _initialH)} do
{
	_unit setDamage ((damage _unit)-0.05);
	_damage = damage _unit;
	sleep 1;
};
if (_damage < _initialH) then
{
	_unit setDamage _initialH;
	[format ["fn_recover: Damage was less than initial saved damage, setting damage to intial saved value of: %1",_initialH]] call JSHK_contam_fnc_logMessage;
};