/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_ppAbber.sqf
Parameters: type of effect, priority of effect, unit using effect
Return: none

*///////////////////////////////////////////////
params ["_name","_priority","_unit"];
private ["_handle"];
while {_handle = ppEffectCreate [_name, _priority]; _handle < 0} do 
{ 
	_priority = _priority + 1; 
}; 
_handle ppEffectEnable true; 
_handle ppEffectAdjust [-0.21,-0.06,true]; 
_handle ppEffectCommit 2;
_unit setVariable ["JSHK_contam_abberPP_enabled",true];
[_handle,_name,_unit] call JSHK_contam_fnc_setActivePP;