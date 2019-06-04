/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_ppBlur.sqf
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
_handle ppEffectAdjust [1]; 
_handle ppEffectCommit 2;
_unit setVariable ["JSHK_contam_blurPP_enabled",true];
[_handle,_name,_unit] call JSHK_contam_fnc_setActivePP;