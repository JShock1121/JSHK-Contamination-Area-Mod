/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_underCover.sqf
Parameters: unit, int (height above)
Return: bool unit has something overhead

*///////////////////////////////////////////////
params [["_unit",objNull,[objNull]],["_threshold",30,[0]]];
if (isNull _unit) exitWith {};
private _under = lineIntersectsSurfaces 
[
	getPosWorld _unit, 
	getPosWorld _unit vectorAdd [0, 0, _threshold], 
	_unit, 
	objNull, 
	true, 
	1, 
	"GEOM", 
	"NONE"
];
count _under > 0;