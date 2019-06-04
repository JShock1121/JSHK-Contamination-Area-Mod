/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusSafeVehicle.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos", [0,0,0], [[]]], ["_obj", objNull, [objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};
if (isNull _obj) exitWith {};

private _vehObj = objNull;
if (_obj isKindOf "Man") then 
{
	_vehObj = vehicle _obj;
	if !(_obj isEqualTo _vehObj) then 
	{
		_obj = _vehObj;
	} else
	{
		["Object must be a vehicle!"] call Achilles_fnc_showZeusErrorMessage;
	};
};

if ([_obj] call JSHK_contam_fnc_safeVehicleExists) then
{
	[_obj] call JSHK_contam_fnc_removeSafeVehicle;
	[format ["%1 is now unsafe",_obj]] call ares_fnc_showZeusMessage;
} else
{
	[_obj] call JSHK_contam_fnc_addSafeVehicle;
	[format ["%1 is now safe",_obj]] call ares_fnc_showZeusMessage;
};