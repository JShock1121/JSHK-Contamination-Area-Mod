/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_updateClient.sqf
Parameters: owner of client, variable to be updated, client's var value
Return: none

*///////////////////////////////////////////////
params ["_owner",["_var","",[""]],"_clientVal"];
private ["_serverVal","_same"];
if !(isServer) exitWith {};
_serverVal = missionNamespace getVariable [_var,nil];

if (isNil "_serverVal") then 
{
	["fn_updateClient: Server value of " + _var + " is nil.",true] call JSHK_contam_fnc_logMessage;
} else
{
	["fn_updateClient: Server value of " + _var + format [" is %1.",_serverVal],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
};

_same = [_serverVal,_clientVal] call JSHK_contam_fnc_compare;
if !(_same) then
{
	_owner publicVariableClient _var;
	[format ["fn_updateClient: Attempt to update variable, %2, client from server: owner %1, original client value recieved: %3, server value: %4",_owner,_var,str(_clientVal),str(_serverVal)],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
};