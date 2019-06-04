/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusRemoveSafeArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};
private _areaNames = [];
if (count JSHK_contam_safeAreas > 0) then
{
	_areaNames = JSHK_contam_safeAreas apply {[_x,"name"] call JSHK_contam_fnc_getSafeAreaInfo};
} else
{
	_areaNames pushBack "";
};

private _dialogResult =
[
	"Remove Safe Area",
	[
		["Choose Area", _areaNames,0,true]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};
if (_areaNames isEqualTo []) exitWith {};
_dialogResult params ["_nameIndex"];
[_areaNames select _nameIndex] call JSHK_contam_fnc_removeSafeArea;