/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_safeVehicleExists.sqf
Parameters: veh or string
Return: bool

*///////////////////////////////////////////////
params [["_veh",objNull,[objNull,""]]];
if (count JSHK_contam_safeVehicles < 1) exitWith {false;};

private _typeInput = typeName _veh;
private _vehUnit = objNull;
private _vehVar = "";
private _vehType = "";
private _check = [];

if (_typeInput == "OBJECT") then
{	
	_vehUnit = _veh;
	if (isNull _veh || _veh isKindOf "Man") exitWith {};
	_vehVar = vehicleVarName _veh;
	_vehType = typeOf _veh;
	_check = [_vehUnit,_vehVar,_vehType];;
} else
{
	if (_typeInput == "STRING") then
	{
		if (_veh isEqualTo "") exitWith {};
		_check = [_veh];
	};
};
count (_check select {_x in JSHK_contam_safeVehicles}) > 0;