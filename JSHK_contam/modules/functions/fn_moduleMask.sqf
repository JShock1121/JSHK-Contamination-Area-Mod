/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_settingsValues.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];

private _head = [(_logic getVariable ["JSHK_contamModuleVar_headgear",""])] call JSHK_contam_fnc_strToArray;
private _headArr = [];
{
	if (isClass (configFile >> "CfgWeapons" >> _x)) then
	{
		_headArr pushBackUnique _x;
	} else
	{
		[format ["fn_moduleMask: Headgear classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
	};
} forEach _head;
missionNamespace setVariable ["JSHK_contam_headgear",_headArr];

private _masks50 = [(_logic getVariable ["JSHK_contamModuleVar_gasMasks50",""])] call JSHK_contam_fnc_strToArray;
private _masksTwo = [(_logic getVariable ["JSHK_contamModuleVar_gasMasksTwo",""])] call JSHK_contam_fnc_strToArray;
private _masksOpen = [(_logic getVariable ["JSHK_contamModuleVar_gasMasksOpen",""])] call JSHK_contam_fnc_strToArray;
private _allMasks = [];
{
	private _arr = _x;
	{
		if ((isClass (configFile >> "CfgWeapons" >> _x)) || 
				(isClass (configfile >> "CfgGlasses" >> _x))) then
		{
			_allMasks pushBackUnique _x;
		} else
		{
			[format ["fn_moduleMask: Mask classname provided does not exist: %1",_x],true] call JSHK_contam_fnc_logMessage;
		};
	} forEach _arr;
} forEach [_masks50,_masksTwo,_masksOpen];

if (_logic getVariable ["JSHK_contamModuleVar_includeJSHKMask",false]) then
{
	if (isClass(configFile >> "CfgPatches" >> "JSHK_contam_gear_masks")) then
	{
		private _jshkMask50Arr = ("['JSHK_contam_mask_m50',configName _x,false] call BIS_fnc_inString" configClasses (configFile >> "CfgGlasses")) apply {configName _x};
		private _jshkMask04Arr = ("['JSHK_contam_mask_m04',configName _x,false] call BIS_fnc_inString" configClasses (configFile >> "CfgGlasses")) apply {configName _x};
		private _jshkMaskS10Arr = ("['JSHK_contam_mask_s10',configName _x,false] call BIS_fnc_inString" configClasses (configFile >> "CfgGlasses")) apply {configName _x};
		{	
			_masks50 pushBackUnique _x;
			_allMasks pushBackUnique _x;
		} forEach _jshkMask50Arr;
		{
			_masksOpen pushBackUnique _x;
			_allMasks pushBackUnique _x;
		} forEach _jshkMask04Arr;
		{
			_masksTwo pushBackUnique _x;
			_allMasks pushBackUnique _x;
		} forEach _jshkMaskS10Arr;
	} else { ["fn_moduleMask: JSHK Contamination Gear masks pbo not loaded, unable to include in masks array",true] call JSHK_contam_fnc_logMessage};
};

missionNamespace setVariable ["JSHK_contam_gasMasks50",_masks50];
missionNamespace setVariable ["JSHK_contam_gasMasksTwo",_masksTwo];
missionNamespace setVariable ["JSHK_contam_gasMasksOpen",_masksOpen];
missionNamespace setVariable ["JSHK_contam_gasMasks",_allMasks];

JSHK_contam_useMaskSound = _logic getVariable ["JSHK_contamModuleVar_useMaskSound",true];
JSHK_contam_whenOverlay = _logic getVariable ["JSHK_contamModuleVar_useMaskOverlay",1];
JSHK_contam_staminaEffectEnabled = _logic getVariable ["JSHK_contamModuleVar_maskSoundStamina",false];
JSHK_contam_maskTypeOfGear = _logic getVariable ["JSHK_contamModuleVar_typeOfGear",1];

_logic setVariable ["JSHK_contamModule_initCompleted",true];