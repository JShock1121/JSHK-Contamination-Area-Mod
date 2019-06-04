/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_removeSafeVehicle.sqf
Parameters: veh or str
Return: none

*///////////////////////////////////////////////
params [["_veh",objNull,["",objNull]]];
if !(isServer) exitWith
{
	["JSHK_contam_fnc_removeSafeVehicle",_this] call JSHK_contam_fnc_requestExec;
};

if !([_veh] call JSHK_contam_fnc_safeVehicleExists) exitWith { ["fn_removeSafeVehicle: Object or name provided does not exist.",true] call JSHK_contam_fnc_logMessage; };

private _index = JSHK_contam_safeVehicles find _veh;
if (_index != -1) then
{
	JSHK_contam_safeVehicles deleteAt _index;
};

["JSHK_contam_safeVehicles"] call JSHK_contam_fnc_updateAllClients;