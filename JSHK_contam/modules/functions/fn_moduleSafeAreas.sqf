/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_moduleSafeAreas.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (_activated && isServer) then
{
	_radius = _logic getVariable ["JSHK_contamModuleVar_radius",100];
	_showMarker = _logic getVariable ["JSHK_contamModuleVar_showMarker",true];
	_alphaMarker = _logic getVariable ["JSHK_contamModuleVar_alphaMarker",1];
	_usePos = _logic getVariable ["JSHK_contamModuleVar_useModulePos",false];
	_name = _logic getVariable ["JSHK_contamModuleVar_name",""];
	
	if (_radius < 0) then { _radius = 0; };
	
	if !(_showMarker) then
	{
		_alphaMarker = 0;
	};
	if (_usePos) then
	{
		[getPos _logic,_radius,_alphaMarker,_name] call JSHK_contam_fnc_addSafeArea;
	};
	if (count _units > 0) then
	{
		{
			[getPos _x,_radius,_alphaMarker,_name] call JSHK_contam_fnc_addSafeArea;
		} forEach _units;
	};
	_logic setVariable ["JSHK_contamModule_initCompleted",true];
};