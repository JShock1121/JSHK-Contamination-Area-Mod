/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_aceDamage.sqf
Parameters: unit
Return: none

*///////////////////////////////////////////////
params ["_unit","_timeToDeath"];

private _initialTime = time;
private _quaterTime = _timeToDeath * 0.25;
private _halfTime = _timeToDeath * 0.5;
private _threeQuarterTime = _timeToDeath * 0.75;

private _coughCond = false;
private _coughHandle = scriptNull;

//temp sound til blur////////////////////////////
{
	[_unit,_x] say3D ["WoundedGuyA_03",10,1];
} count (allPlayers select {_x distance2D _unit < 15});
////////////////////////////////////////////////


while {alive _unit && (_unit getVariable ["JSHK_contam_damageHandle",false])} do
{
	private _timeDiff = time - _initialtime;
	
	if (isNull _coughHandle || scriptDone _coughHandle) then
	{
		_coughCond = true;
	} else { _coughCond = false; };
	
	switch (true) do
	{
		case (_timeDiff <= _quaterTime):
		{
			//if !(_unit getVariable ["JSHK_contam_blurPP_enabled",false]) then
			//{
			//	[_unit,"BLUR"] call JSHK_contam_fnc_startPP;
			//};
			
			//temp have cough here until PP fixed
			if _coughCond then
			{
				_coughHandle = [_unit,"JSHK_contam_addon_cough1"] spawn JSHK_contam_fnc_playCough;
			};
		};
		case (_timeDiff <= _halfTime):
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
		case (_timeDiff <= _threeQuarterTime):
		{
			//if !(_unit getVariable ["JSHK_contam_wetPP_enabled",false]) then
			//{
				//[_unit,"WET"] call JSHK_contam_fnc_startPP;
				[_unit] spawn JSHK_contam_fnc_lucidAnim;
				if _coughCond then
				{
					_coughHandle = [_unit,"JSHK_contam_addon_cough2"] spawn JSHK_contam_fnc_playCough;
				};
				if (!isForcedWalk _unit) then {	_unit forceWalk true; };
			//};	
		};
		case (_timeDiff >= _timeToDeath):
		{
			[_unit] call ace_medical_fnc_setCardiacArrest;
		};
		default {};
	};
	sleep 1;
};

if (!isNull _coughHandle) then
{
	if (!scriptDone _coughHandle) then { terminate _coughHandle; };
};

//[_unit] spawn JSHK_contam_fnc_stopPP;


_unit forceWalk false;