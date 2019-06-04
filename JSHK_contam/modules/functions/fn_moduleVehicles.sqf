/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleVehicles.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];

private _tempArr = [(_logic getVariable ["JSHK_contamModuleVar_vehicles",""])] call JSHK_contam_fnc_strToArray;
[format ["fn_moduleVehicles: _tempArr value pre-synced objects: %1",_tempArr]] call JSHK_contam_fnc_logMessage;
{
	if !(_x isKindOf "Man") then
	{
		_tempArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleSettingsValues: Player or units cannot be added as safe vehicles: %1",typeOf _x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _units;
[format ["fn_moduleVehicles: _tempArr value post-synced objects: %1",_tempArr]] call JSHK_contam_fnc_logMessage;
private _vehArr = [];
{
	if (typeName _x == "OBJECT") then 
	{
		if (!isNull _x) then
		{
			_vehArr pushBackUnique _x;
			["fn_moduleVehicles: Vehicle by object added to safe vehicle pool"] call JSHK_contam_fnc_logMessage;
		};
	} else
	{
		if (typeName _x == "STRING") then
		{
			if (isClass (configfile >> "CfgVehicles" >> _x)) then
			{
				_vehArr pushBackUnique _x;
				["fn_moduleVehicles: Vehicle class added to safe vehicle pool"] call JSHK_contam_fnc_logMessage;
			} else
			{
				private _vehObj = missionNamespace getVariable [_x,objNull];
				if (!isNull _vehObj) then
				{
					_vehArr pushBackUnique _x;
					["fn_moduleVehicles: Vehicle by variable name added to safe vehicle pool"] call JSHK_contam_fnc_logMessage;
				} else
				{
					[format ["fn_moduleVehicles: Vehicle classname or object provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
				};
			};
		};
	};
} forEach _tempArr;
[format ["fn_moduleVehicles: Final value of _vehArr - %1",_vehArr]] call JSHK_contam_fnc_logMessage;
missionNamespace setVariable ["JSHK_contam_safeVehicles",_vehArr];

_logic setVariable ["JSHK_contamModule_initCompleted",true];