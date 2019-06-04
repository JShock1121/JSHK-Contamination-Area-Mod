/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addPVEH.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
if (!isNil {missionNamespace getVariable ["JSHK_contam_PVEH_present",nil]}) exitWith {};

if !(isServer) then
{
	"JSHK_contam_areas" addPublicVariableEventHandler
	{
		params ["_var","_val"];
		if (isServer) exitWith {["fn_addPVEH: Server exiting JSHK_contam_areas PVEH, client EH only."] call JSHK_contam_fnc_logMessage;};
		private _clientVal = missionNamespace getVariable [_var,nil];
		if (!(_clientVal isEqualTo _val) || isNil "_clientVal") then
		{
			missionNamespace setVariable [_var,_val];
			[("fn_addPVEH: PVEH for JSHK_contam_areas exectuted on CLIENT, " + _var + " sent to client and set as: " +str(_val)),JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		};
	};
	"JSHK_contam_safeAreas" addPublicVariableEventHandler
	{
		params ["_var","_val"];
		if (isServer) exitWith {["fn_addPVEH: Server exiting JSHK_contam_safeAreas PVEH, client EH only."] call JSHK_contam_fnc_logMessage;};
		private _clientVal = missionNamespace getVariable [_var,nil];
		if (!(_clientVal isEqualTo _val) || isNil "_clientVal") then
		{
			missionNamespace setVariable [_var,_val];
			[("fn_addPVEH: PVEH for JSHK_contam_safeAreas exectuted on CLIENT, " + _var + " sent to client and set as: " +str(_val)),JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		};
	};
	"JSHK_contam_godModeUnits" addPublicVariableEventHandler
	{
		params ["_var","_val"];
		if (isServer) exitWith {["fn_addPVEH: Server exiting JSHK_contam_godModeUnits PVEH, client EH only."] call JSHK_contam_fnc_logMessage;};
		private _clientVal = missionNamespace getVariable [_var,nil];
		if (!(_clientVal isEqualTo _val) || isNil "_clientVal") then
		{
			missionNamespace setVariable [_var,_val];
			[("fn_addPVEH: PVEH for JSHK_contam_godModeUnits exectuted on CLIENT, " + _var + " sent to client and set as: " +str(_val)),JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		};
	};
};
if (isServer) then
{
	"JSHK_contamSERVER_updateRequest" addPublicVariableEventHandler
	{
		params ["_var","_val"];
		_val params ["_owner","_rVar","_clientVarVal","_send"];
		if (!isNil _rVar) then
		{
			if (_send) then
			{
				[_owner,_rVar,_clientVarVal] call JSHK_contam_fnc_updateClient;
				[format ["PVEH for JSHK_contamSERVER_updateRequest exectuted, client, %1, updated: %2",_owner,_rVar],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
			} else
			{
				private _serverVal = missionNamespace getVariable [_rVar, nil];
				private _same = [_serverVal,_clientVarVal] call JSHK_contam_fnc_compare;
				if !(_same) then
				{
					[_rVar] call JSHK_contam_fnc_updateAllClients;
					[format ["PVEH for JSHK_contamSERVER_updateRequest exectuted, server updated: %1 from owner %2",_rVar,_owner],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
				};
			};
		} else
		{
			["Requested variable in JSHK_contamSERVER_updateRequest was nil.",JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		};
	};
	"JSHK_contamSERVER_executeFncRequest" addPublicVariableEventHandler
	{
		params [["_var","",[""]],["_in",[],[[]]]];
		_in params [["_fnc","",[""]],["_params",[],[[]]],["_clientInfo",[],[[]],4]];
		_clientInfo params ["_owner","_name","_guid","_isZeus"];
		private _approvedFncs =
		[
			"JSHK_contam_fnc_addArea",
			"JSHK_contam_fnc_addSafeArea",
			"JSHK_contam_fnc_addSafeVehicle",
			"JSHK_contam_fnc_removeArea",
			"JSHK_contam_fnc_removeSafeArea",
			"JSHK_contam_fnc_removeSafeVehicle",
			"JSHK_contam_fnc_updateAreaInfo",
			"JSHK_contam_fnc_updateSafeAreaInfo"
		];
		[format["fn_addPVEH: Requested function to exec: %1",_fnc],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		if (_fnc in _approvedFncs) then
		{
			_params call (missionNamespace getVariable format["%1",_fnc]);
			[format ["fn_addPVEH: Client, %1, name: %2, guid: %3, used function: % -- Zeus status: %5",_owner,_name,_guid,_fnc,_isZeus],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
		} else
		{
			if (_fnc == "JSHK_contam_serverFnc_enableGodMode") then
			{
				[format ["fn_addPVEH: Client, %1, name: %2, guid: %3, requested use of GOD MODE function: % -- Zeus status: %5",_owner,_name,_guid,_fnc,_isZeus],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
				private _godMode = 
				{
					params [["_caller",objNull,[objNull]],["_unit", objNull, [objNull]]];
					if (isNull _caller || !(_isZeus)) exitWith {};
					if (isNull _unit || !(_unit isKindOf "Man")) exitWith {};
					if !(_unit in JSHK_contam_godModeUnits) then
					{
						JSHK_contam_godModeUnits pushBackUnique _unit;
					} else
					{
						JSHK_contam_godModeUnits deleteAt (JSHK_contam_godModeUnits find _unit);
					};
					["JSHK_contam_godModeUnits"] call JSHK_contam_fnc_updateAllClients;
				};
				_params call _godMode;
				[format ["fn_addPVEH: Client, %1, name: %2, guid: %3, used GOD MODE function: % -- Zeus status: %5",_owner,_name,_guid,_fnc,_isZeus],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
			} else
			{
				[format ["fn_addPVEH: Client, %1, name: %2, guid: %3, request to use UNAUTHORIZED or undefined function: ~%4~ -- Zeus status: %5",_owner,_name,_guid,_fnc,_isZeus],JSHK_contam_DEBUG_net] call JSHK_contam_fnc_logMessage;
			};
		};
	};
};
missionNamespace setVariable ["JSHK_contam_PVEH_present",true];