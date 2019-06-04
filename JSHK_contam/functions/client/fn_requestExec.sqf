/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_requestExec.sqf
Parameters: fnc as str, params for fnc
Return: none

*///////////////////////////////////////////////
params [["_fnc","",[""]],["_params",[],[[]]]];
if (isDedicated) exitWith {};

JSHK_contamSERVER_executeFncRequest = 
[
	_fnc,
	_params,
	[clientOwner,profileName,getPlayerUID player,[player] call JSHK_contam_fnc_isZeus]
];
publicVariableServer "JSHK_contamSERVER_executeFncRequest";
JSHK_contamSERVER_executeFncRequest = nil;