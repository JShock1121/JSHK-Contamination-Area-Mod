/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_settingsValues.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (isDedicated) exitWith {};

private _uni = [(_logic getVariable ["JSHK_contamModuleVar_uniforms",""])] call JSHK_contam_fnc_strToArray;
private _uniArr = [];
{
	if (isClass (configFile >> "CfgWeapons" >> _x)) then
	{
		_uniArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleGearValues: Uniform classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _uni;

private _vests = [(_logic getVariable ["JSHK_contamModuleVar_vests",""])] call JSHK_contam_fnc_strToArray;
private _vestArr = [];
{
	if (isClass (configFile >> "CfgWeapons" >> _x)) then
	{
		_vestArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleGearValues: Vest classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _vests;

if (_logic getVariable ["JSHK_contamModuleVar_includeJSHKGear",false]) then
{
	if (isClass(configFile >> "CfgPatches" >> "JSHK_contam_gear_suits")) then
	{ 
		private _jshkUniArr = getArray(configFile >> "CfgPatches" >> "JSHK_contam_gear_suits" >> "weapons");
		{	
			if (isClass (configFile >> "CfgWeapons" >> _x)) then
			{
				_uniArr pushBackUnique _x;
			} else
			{
				[format ["fn_moduleGearValues: Uniform classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
			};
		} forEach _jshkUniArr;
	} else { ["fn_moduleGearValues: JSHK Contamination Gear suits pbo not loaded, unable to include in gear array",true] call JSHK_contam_fnc_logMessage};
};

missionNamespace setVariable ["JSHK_contam_uniforms",_uniArr];
missionNamespace setVariable ["JSHK_contam_vests",_vestArr];

_logic setVariable ["JSHK_contamModule_initCompleted",true];