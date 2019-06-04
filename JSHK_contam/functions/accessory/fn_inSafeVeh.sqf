/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_inSafeVeh.sqf
Parameters: unit
Return: bool

*///////////////////////////////////////////////
params ["_unit"];
private _vehUnit = vehicle _unit;
private _vehVar = vehicleVarName _vehUnit;
if (_vehUnit == _unit) exitWith {false};

count ([(typeOf _vehUnit),_vehUnit,_vehVar] select {[_x] call JSHK_contam_fnc_safeVehicleExists}) > 0;