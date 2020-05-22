/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusRemoveSafeArea.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_obj",objNull,[objNull]]];

if (!hasInterface || !([player] call JSHK_contam_fnc_isZeus)) exitWith {};

private _onConfirm =
{
	params ["_dialogResult","_in"];
	_dialogResult params ["_name"];
	
	if (_name == "") exitWith {};
	
	private _area = [_name] call JSHK_contam_fnc_findSafeArea;
	if (isNull _area) exitWith {};

	[_area] call JSHK_contam_fnc_removeSafeArea;
};

private _areaNames = [];
if (count JSHK_contam_safeAreas > 0) then
{
	_areaNames = JSHK_contam_safeAreas apply {[_x,"name"] call JSHK_contam_fnc_getSafeAreaInfo};
} else
{
	_areaNames pushBack "";
};

if (_areaNames isEqualTo []) exitWith {};

[
	"Remove Safe Area", 
	[
		["COMBO","Safe Areas",[_areaNames,_areaNames,0]]
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;