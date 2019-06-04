/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addSafeVehicle.sqf
Parameters: veh or str
Return: none

*///////////////////////////////////////////////
params 
[
	["_veh",objNull,[objNull,""]],
	["_execAll",false,[false]]
];
if ([_veh] call JSHK_contam_fnc_safeVehicleExists) exitWith {};
if !(isServer) exitWith 
{
	private _sendParams = [_veh,true];
	["JSHK_contam_fnc_addSafeVehicle",_sendParams] call JSHK_contam_fnc_requestExec;
};

JSHK_contam_safeVehicles pushBackUnique _veh;

if (_execAll || JSHK_contam_serverInitComplete) then
{
	["JSHK_contam_safeVehicles"] call JSHK_contam_fnc_updateAllClients;
	[format ["fn_addSafeVehicle: Attempt to add safe vehicle outside module init on all clients- Vehicle: %1",_veh],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
};
[format ["fn_addSafeVehicle - Attempt to add safe vehicle to pool: %1",_veh],false] call JSHK_contam_fnc_logMessage;