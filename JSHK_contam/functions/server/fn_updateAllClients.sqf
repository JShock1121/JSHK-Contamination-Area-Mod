/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_updateAllClients.sqf
Parameters: variable to be updated
Return: none

*///////////////////////////////////////////////
params [["_var","",[""]]];
if !(isServer) exitWith {};
private _c = 
{
	/*_owner = owner _x;
	if (_owner == 0) then 
	{
		["fn_updateAllClients: Attempt to update client with owner returning zero.",JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		false;
	};
	[_owner,_var,[]] call JSHK_contam_fnc_updateClient;*/
	true;
} count allPlayers;
private _varVal = missionNamespace getVariable [_var,nil];
missionNamespace setVariable [_var,_varVal,true];
[format ["fn_updateAllClients: Attempt to update all client values from server, %1, %2 clients updated.",_var,_c],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;