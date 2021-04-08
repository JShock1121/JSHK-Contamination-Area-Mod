/*/////////////////////////////////////////////////
Author: J.Shock + Crowdedlight
			   
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

private _damage = 0.3; //only doing small damage, default ace settings you can get 10 of these in one go without going down. 
private _damageEnabled = false; //Don't start doing dmg until the first quarter has passed, as we rely on coughing/pain effects here.

private _quarterIncrease = false;
private _halfIncrease = false;
private _threeQuarterIncrease = false;
private _deathEnabled = false;

// time between dmg reoccurence
private _dmgTimer = (_timeToDeath * 0.1) max 3; //10% of timetodeath, with a minimum of 5s between injuries so people have a chance before they get all the dmg
private _lastDmgTime = 0;

//temp sound til blur////////////////////////////
{
	[_unit,_x] say3D ["WoundedGuyA_03",10,1];
} count (allPlayers select {_x distance2D _unit < 15});
////////////////////////////////////////////////


while {alive _unit && (_unit getVariable ["JSHK_contam_damageHandle",false])} do
{
	private _now = time;
	private _timeDiff = _now - _initialtime;
	
	// cough handler
	if (isNull _coughHandle || scriptDone _coughHandle) then
	{
		_coughCond = true;
	} else { _coughCond = false; };

	//ACE unconsious check
	private _unitUnconsious = _unit getVariable ["ace_isUnconscious", false];

	//damage handler, if its time, and unit is not unconsious, do dmg 
	if ((_now - _lastDmgTime) >= _dmgTimer && _damageEnabled && !_unitUnconsious) then
	{
		//apply damage
		[_unit, _damage, "body", "unknown", _unit] call ace_medical_fnc_addDamageToUnit;

		//save time of dmg inflicted
		_lastDmgTime = _now;
	};

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

			//give pain when we are 50% into the quarter period
			if (!_quarterIncrease && _timeDiff >= (_quaterTime*0.5)) then
			{
				_quarterIncrease = true;
				//set pain to 0.5 for severer pain to help signify we are in hot zone
				[_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
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

			//enable damage
			if !_halfIncrease then
			{
				_halfIncrease = true;
				_damageEnabled = true;
				_lastDmgTime = _now;
			};					
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

			//increase damage and damage time, if we haven't
			if !_halfIncrease then
			{
				_halfIncrease = true;
				_damage = 0.5; 
				_dmgTimer = (_timeToDeath * 0.05) max 3;
				_lastDmgTime = _now;
			};					
		};
		case (_timeDiff >= _timeToDeath):
		{	
			//set cardiac arrest and force it until we are out of area and this loop is stopped
			if !_unitUnconsious then 
			{
				//go into cardiac arrest. Can be zeus healed and be revieved by players
				["ace_medical_FatalVitals", _this] call CBA_fnc_localEvent;
			};
		};
		default {};
	};
	sleep 1;
};

if (!isNull _coughHandle) then
{
	if (!scriptDone _coughHandle) then { terminate _coughHandle; };
};

_unit forceWalk false;