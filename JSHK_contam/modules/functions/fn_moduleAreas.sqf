/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addContamArea.sqf
Parameters: logic, list of units, boolean
Return: none

*///////////////////////////////////////////////
params ["_logic","_units","_activated"];
if (_activated && isServer) then
{
	_radius = _logic getVariable ["JSHK_contamModuleVar_radius",100];
	_hotRadius = _logic getVariable ["JSHK_contamModuleVar_hotRadius",50];
	_objRadius = _logic getVariable ["JSHK_contamModuleVar_objRadius",5];
	_timeToDeath = _logic getVariable ["JSHK_contamModuleVar_timeToDeath",100];
	_entireMap = _logic getVariable ["JSHK_contamModuleVar_entireMap",false];
	_showMarker = _logic getVariable ["JSHK_contamModuleVar_showMarker",true];
	_alphaMarker = _logic getVariable ["JSHK_contamModuleVar_alphaMarker",1];
	_usePos = _logic getVariable ["JSHK_contamModuleVar_useModulePos",false];
	_onDestroy = _logic getVariable ["JSHK_contamModuleVar_deleteAreaOnObjDestroy",true];
	_moppLevel = _logic getVariable ["JSHK_contamModuleVar_MOPPlevel",1];
	_name = _logic getVariable ["JSHK_contamModuleVar_name",""];
	
	if !(_showMarker) then
	{
		_alphaMarker = 0;
	};

	if (_entireMap) then
	{
		[getPos _logic,[worldSize,worldSize,0],_timeToDeath,_alphaMarker,[false,objNull,false],_moppLevel,_name] call JSHK_contam_fnc_addArea;
	} else
	{
		if (_usePos) then
		{
			[getPos _logic,[_radius,_hotRadius,_objRadius],_timeToDeath,_alphaMarker,[false,objNull,_onDestroy],_moppLevel,_name] call JSHK_contam_fnc_addArea;
		};
		if (count _units > 0) then
		{
			{
				[getPos _x,[_radius,_hotRadius,_objRadius],_timeToDeath,_alphaMarker,[true,_x,_onDestroy],_moppLevel,_name] call JSHK_contam_fnc_addArea;
			} forEach _units;
		};
	};
	_logic setVariable ["JSHK_contamModule_initCompleted",true];
};