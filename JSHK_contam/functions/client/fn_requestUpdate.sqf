/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_requestUpdate.sqf
Parameters: string
Return: none

*///////////////////////////////////////////////
params ["_owner",["_var","",[""]],["_send",true,[false]]];
private ["_clientVal"];
if (isDedicated) exitWith {};

_clientVal = missionNamespace getVariable [_var,nil];
if (isNil "_clientVal") then {["Client value of " + _var + " is nil."] call JSHK_contam_fnc_logMessage;};
JSHK_contamSERVER_updateRequest = [_owner,_var,_clientVal,_send];
publicVariableServer "JSHK_contamSERVER_updateRequest";
JSHK_contamSERVER_updateRequest = nil;
[("Attempt to update client variable, " +_var + format [", owner %1.",_owner])] call JSHK_contam_fnc_logMessage;