/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_assessModules.sqf
Parameters: module class, variable to check
Return: bool

*///////////////////////////////////////////////
params [["_classes",[],[[]]],["_var","",[""]]];
if (!isServer) exitWith {};
private _return = true;
private _modules = [];
if (_classes isEqualTo []) exitWith {_return;};

private _liveModules = entities [["Logic"],[],false,false];
_modules = _liveModules select {side _x == sideLogic && (_classes find (typeOf _x) > -1)};

private _modCount = count _modules;
if (_modCount < 1) exitWith { _return = false; };
_return = count (_modules select {!isNil {_x getVariable [_var,nil]}}) == _modCount;

_return;
