/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_unitInit.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]],["_addPVEH",false,[false]]];
private _return = true;
if (isNull _unit) exitWith
{
	["fn_unitInit: Unit provided does not exist.",true] call JSHK_contam_fnc_logMessage;
	!_return;
};

_unit setVariable ["JSHK_contam_damageHandle",false];

private _type = typeOf _unit;
private _fac = faction _unit;

if (isPlayer _unit) then
{
	private _condOne =  _type in JSHK_contam_excludedUnitClasses;
	private _condTwo =  _fac in JSHK_contam_excludedUnitFactions;
	
	if (_addPVEH) then { [] call JSHK_contam_fnc_addPVEH; };
	[_unit] spawn JSHK_contam_fnc_detectorSoundLoop;
	[_unit] spawn JSHK_contam_fnc_maskOnLoop;
	if !(_condOne || _condTwo) then
	{
		[_unit] spawn JSHK_contam_fnc_damageCondLoop;
	} else
	{
		[
			format 
			[
				"fn_unitInit: Unit provided has a classname or faction that is excluded from damage initialization - Classname: %1 -- Faction: %2",
				_type,
				_fac
			],
			false
		] call JSHK_contam_fnc_logMessage;
	};
	//[_unit] spawn JSHK_contam_fnc_rainLoop;
	[_unit] spawn JSHK_contam_fnc_detectorKeyHandle;
	[_unit] spawn JSHK_contam_fnc_addOnEachFrame;
} else
{
	private _condOne =  _type in JSHK_contam_excludedAIClasses;
	private _condTwo =  _fac in JSHK_contam_excludedAIFactions;
	if !(_condOne || _condTwo) then
	{
		[_unit] spawn JSHK_contam_fnc_damageCondLoop;
	} else
	{
		[
			format 
			[
				"fn_unitInit: AI unit provided has a classname or faction that is excluded from initialization - Classname: %1 -- Faction: %2",
				_type,
				_fac
			],
			false
		] call JSHK_contam_fnc_logMessage;
	};
};
_return;