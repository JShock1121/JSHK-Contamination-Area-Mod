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

// ACE settings, taken from ACE3 - https://github.com/acemod/ACE3/blob/b991fe1343943a869371ef5ba525b6b944b1023d/addons/medical_engine/script_macros_medical.hpp 
//#define PAIN_UNCONSCIOUS EGVAR(medical,const_painUnconscious);
private _damageThreshold = GET_DAMAGE_THRESHOLD(_unit);
private _bodyThreshold = 1.5 * _damageThreshold;
private _quarterDamage = _bodyThreshold * 0.1; //only doing small damage initial
private _halfDamage = _bodyThreshold * 0.5;
private _threeQuarterDamage = _bodyThreshold * 0.75;

// time between dmg reoccurence
private _dmgTimer = 10; //seconds
private _fullDmgTimer = 1; //seconds
private _lastDmgTime = 0;

// always apply dmg when entering a new dmg bracket
private _quarterFirst = true;
private _halfFirst = true;
private _threeQuarterFirst = true;


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
	private _unitConsious = _unit getVariable ["ACE_isUnconscious", false]
	
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

			//if consious and time since last dmg infliced is more than threshold do dmg
			if (_unitConsious && (_now - _lastDmgTime) >= _dmgTimer || _unitConsious && _quarterFirst) then
			{
				// set first to false
				_quarterFirst = false;

				// inflict damage
				[_unit, _quarterDamage, "body", "unknown", _unit] call ace_medical_fnc_addDamageToUnit;

				//save time of dmg inflicted
				_lastDmgTime = now;
			}
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

			//if consious and time since last dmg infliced is more than threshold do dmg
			if (_unitConsious && (_now - _lastDmgTime) >= _dmgTimer || _unitConsious && _halfFirst) then
			{
				// set first to false
				halfFirst = false;

				// inflict damage
				[_unit, _halfDamage, "body", "unknown", _unit] call ace_medical_fnc_addDamageToUnit;

				//save time of dmg inflicted
				_lastDmgTime = now;
			}			
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

			//if consious and time since last dmg infliced is more than threshold do dmg
			if (_unitConsious && (_now - _lastDmgTime) >= _dmgTimer || _unitConsious && _threeQuarterFirst) then
			{
				// set first to false
				_threeQuarterFirst = false;

				// inflict damage
				[_unit, _threeQuarterDamage, "body", "unknown", _unit] call ace_medical_fnc_addDamageToUnit;

				//save time of dmg inflicted
				_lastDmgTime = now;
			}			
		};
		case (_timeDiff >= _timeToDeath):
		{
			//[_unit,true] call ace_medical_status_fnc_setCardiacArrestState;

			// inflict body threshold damage to get unconsious straight away, and to saveguard against odd settings, repeat the dmg every second, until unconcious
			//  This should also trigger unconsious/cardiac arrest state correctly through ACE 
			if (_unitConsious && (_now - _lastDmgTime) >= _fullDmgTimer) then
			{
				// inflict damage
				[_unit, _bodyThreshold, "body", "unknown", _unit] call ace_medical_fnc_addDamageToUnit;

				//save time of dmg inflicted
				_lastDmgTime = now;
			}	

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