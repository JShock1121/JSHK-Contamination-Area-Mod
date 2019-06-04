/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_settingsValues.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if !(isServer) exitWith {};


private _enabledDamage = _logic getVariable ["JSHK_contamModuleVar_aiEnableDamage",false];
missionNamespace setVariable ["JSHK_contam_aiDamageEnabled",_enabledDamage];
private _autoRecover = _logic getVariable ["JSHK_contamModuleVar_aiAutoRecovery",false];
missionNamespace setVariable ["JSHK_contam_aiAutoRecovery",_autoRecover];

private _spawnedAI = _logic getVariable ["JSHK_contamModuleVar_addSpawnedAI",false];
missionNamespace setVariable ["JSHK_contam_addSpawnedAI",_spawnedAI];

private _classes = [(_logic getVariable ["JSHK_contamModuleVar_aiExclusionClasses",""])] call JSHK_contam_fnc_strToArray;
private _classArr = [];
{
	if (isClass (configFile >> "CfgVehicles" >> _x)) then
	{
		_classArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleAISettings: Unit classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _classes;
missionNamespace setVariable ["JSHK_contam_excludedAIClasses",_classArr];

private _factions = [(_logic getVariable ["JSHK_contamModuleVar_aiExclusionFactions",""])] call JSHK_contam_fnc_strToArray;
private _factionArr = [];
{
	if (isClass (configFile >> "CfgFactionClasses" >> _x)) then
	{
		_factionArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleAISettings: Faction classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _factions;
missionNamespace setVariable ["JSHK_contam_excludedAIFactions",_factionArr];

/*private _sideChosen = _logic getVariable ["JSHK_contamModuleVar_aiExclusionSides",0];
private _sideArr = switch (_sideChosen) do
{
	case 0: { _sideArr = []; };
	case 1: { _sideArr = [west]; };
	case 2: { _sideArr = [east]; };
	case 3: { _sideArr = [resistance]; };
	case 4: { _sideArr = [civilian]; };
	case 5: { _sideArr = [west,east]; };
	case 6: { _sideArr = [west,resistance]; };
	case 7: { _sideArr = [west,civilian]; };
	case 8: { _sideArr = [east,resistance]; };
	case 9: { _sideArr = [east,civilian]; };
	case 10: { _sideArr = [resistance,civilian]; };
	case 11: { _sideArr = [west,east,resistance,civilian]; };
	default { _sideArr = []; };
};
missionNamespace setVariable ["JSHK_contam_excludedAISides",_sideArr];*/

_logic setVariable ["JSHK_contamModule_initCompleted",true];