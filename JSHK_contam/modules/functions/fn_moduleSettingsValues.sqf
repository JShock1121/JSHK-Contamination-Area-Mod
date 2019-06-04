/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleSettingsValues.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (isDedicated) exitWith {};

private _enabledDamage = _logic getVariable ["JSHK_contamModuleVar_enableDamage",true];
missionNamespace setVariable ["JSHK_contam_enableDamage",_enabledDamage];
private _autoRecover = _logic getVariable ["JSHK_contamModuleVar_autoRecovery",false];
missionNamespace setVariable ["JSHK_contam_autoRecovery",_autoRecover];

private _classes = [(_logic getVariable ["JSHK_contamModuleVar_exclusionClasses",""])] call JSHK_contam_fnc_strToArray;
private _classArr = [];
{
	if (isClass (configFile >> "CfgVehicles" >> _x)) then
	{
		_classArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleSettingsValues: Unit classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _classes;
missionNamespace setVariable ["JSHK_contam_excludedUnitClasses",_classArr];

private _factions = [(_logic getVariable ["JSHK_contamModuleVar_exclusionFactions",""])] call JSHK_contam_fnc_strToArray;
private _factionArr = [];
{
	if (isClass (configFile >> "CfgFactionClasses" >> _x)) then
	{
		_factionArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleSettingsValues: Faction classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _factions;
missionNamespace setVariable ["JSHK_contam_excludedUnitFactions",_factionArr];

private _enabledCough = _logic getVariable ["JSHK_contamModuleVar_enableCoughSound",true];
missionNamespace setVariable ["JSHK_contam_enableCough",_enabledCough];

_logic setVariable ["JSHK_contamModule_initCompleted",true];