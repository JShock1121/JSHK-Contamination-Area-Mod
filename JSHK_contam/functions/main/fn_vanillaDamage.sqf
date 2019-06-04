/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_vanillaDamage.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit","_timeToDeath"];

private _initialDamage = damage _unit;
private _rate = (1/_timeToDeath);
private _quarterDamage = -1;
private _halfDamage = -1;
private _threeQuarterDamage = -1;
if (_initialDamage == 0) then 
{
	_quarterDamage = 0.25;
	_halfDamage = 0.5;
	_threeQuarterDamage = 0.75;
} else
{
	_quarterDamage = _initialDamage + (_initialDamage*0.25);
	_halfDamage = _initialDamage + (_initialDamage*0.5);
	_threeQuarterDamage = _initialDamage + (_initialDamage*0.75);
};
if ({_x < 0} count [_quarterDamage,_halfDamage,_threeQuarterDamage] > 0) then
{
	["fn_vanillaDamage: Calculation of damage level error.",true] call JSHK_contam_fnc_logMessage;
};

_unit setVariable ["JSHK_contam_initialDamage",_initialDamage];

private _coughCond = false;
private _coughHandle = scriptNull;

//temp sound til blur////////////////////////////
{
	[_unit,_x] say3D ["WoundedGuyA_03",10,1];
} count (allPlayers select {_x distance2D _unit < 15});
////////////////////////////////////////////////

while {alive _unit && (_unit getVariable ["JSHK_contam_damageHandle",false])} do
{
	private _dam = damage _unit;
	if (isNull _coughHandle || scriptDone _coughHandle) then
	{
		_coughCond = true;
	} else { _coughCond = false; };
	
	switch (true) do
	{
		case (_dam <= _quarterDamage):
		{
			//if !(_unit getVariable ["JSHK_contam_blurPP_enabled",false]) then
			//{
				//[_unit,"BLUR"] call JSHK_contam_fnc_startPP;
			//};
			
			//temp have cough here until PP fixed
			if _coughCond then
			{
				_coughHandle = [_unit,"JSHK_contam_addon_cough1"] spawn JSHK_contam_fnc_playCough;
			};
		};
		case (_dam > _quarterDamage && _dam <= _halfDamage):
		{
			//if !(_unit getVariable ["JSHK_contam_abberPP_enabled",false]) then
			//{
				//[_unit,"ABBERATION"] call JSHK_contam_fnc_startPP;
				[_unit] spawn JSHK_contam_fnc_lucidAnim;
				if _coughCond then
				{
					_coughHandle = [_unit,"JSHK_contam_addon_cough1"] spawn JSHK_contam_fnc_playCough;
				};
			//};
		};
		case (_dam > _halfDamage && _dam <= _threeQuarterDamage):
		{
			//if !(_unit getVariable ["JSHK_contam_wetPP_enabled",false]) then
			//{
			//	[_unit,"WET"] call JSHK_contam_fnc_startPP;
				[_unit] spawn JSHK_contam_fnc_lucidAnim;
				if _coughCond then
				{
					_coughHandle = [_unit,"JSHK_contam_addon_cough2"] spawn JSHK_contam_fnc_playCough;
				};
				if (!isForcedWalk _unit) then {	_unit forceWalk true; };
			//};	
		};
		default {};
	};
	if (_dam == 0) then
	{
		private _newDam = _rate;
		_unit setDamage _newDam;
	} else 
	{
		private _newDam = (_dam + _rate);
		_unit setDamage _newDam;
	};
	sleep 1;
};

if (!isNull _coughHandle) then
{
	if (!scriptDone _coughHandle) then { terminate _coughHandle; };
};

//[_unit] spawn JSHK_contam_fnc_stopPP;

[_unit] spawn JSHK_contam_fnc_recover;

_unit forceWalk false;