/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_hasAllGear.sqf
Parameters: unit, integer (mopp level)
Return: Boolean

*///////////////////////////////////////////////
params ["_unit","_level"];
if (_level < 0) then 
{ 
	["fn_hasAllGear: MOPP level indicator came in as an unknown value!",true] call JSHK_contam_fnc_logMessage; 
};
private _return = false;
if (_level > 0) then
{
	_return = switch (_level) do
	{
		case 1:
		{
			[_unit] call JSHK_contam_fnc_isWearingMask
		};
		case 2:
		{
			[_unit] call JSHK_contam_fnc_isWearingMask &&
			[_unit] call JSHK_contam_fnc_isWearingUniform
		};
		case 3:
		{
			[_unit] call JSHK_contam_fnc_isWearingMask &&
			[_unit] call JSHK_contam_fnc_isWearingUniform &&
			[_unit] call JSHK_contam_fnc_isWearingBackpack
		};
		case 4:
		{
			[_unit] call JSHK_contam_fnc_isWearingMask &&
			[_unit] call JSHK_contam_fnc_isWearingUniform &&
			[_unit] call JSHK_contam_fnc_isWearingVest &&
			[_unit] call JSHK_contam_fnc_isWearingBackpack
		};
		default { false; };
	};
} else { _return = true; };
_return;