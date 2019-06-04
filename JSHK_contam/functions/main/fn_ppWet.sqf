/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_ppWet.sqf
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
_handle ppEffectAdjust [-4,-0.4,0,1,1,1,1,0.09,0.01,0.05,0.01,0.1,0.1,0.2,0.2]; 
_handle ppEffectCommit 5;
_unit setVariable ["JSHK_contam_wetPP_enabled",true];
[_handle,_name,_unit] call JSHK_contam_fnc_setActivePP;