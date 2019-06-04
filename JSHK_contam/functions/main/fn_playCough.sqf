/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_playCough.sqf
Parameters: unit,  classname of sound
Return: none

*///////////////////////////////////////////////
params ["_unit","_class"];

if !(JSHK_contam_enableCough) exitWith {};

private _timeout = -1;
if (isNil {_unit getVariable ["JSHK_contam_coughTimeout",nil]}) then
{
	_unit setVariable ["JSHK_contam_coughTimeout",(round(random(7)+3))];
};
_timeout = (_unit getVariable "JSHK_contam_coughTimeout");
sleep _timeout;
{
	[_unit,_x] say3D [_class,10,1];
} count (allPlayers select {_x distance2D _unit < 15});
_unit setVariable ["JSHK_contam_coughTimeout",nil];