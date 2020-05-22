/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusInit.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////

private _hasAch = isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles");
private _hasZen = isClass (configFile >> "CfgPatches" >> "zen_custom_modules");
if !(_hasAch || _hasZen) exitWith
{
	private _msg = "******CBA and/or Achilles or Zeus Enhanced not detected and are required to use JSHK CAM Zeus Extension!!!";
	[_msg,true] call JSHK_contam_fnc_logMessage;
};

JSHK_contam_zeus_mod_fn = _hasZen;

if (!hasInterface) exitWith {};

private _wait = [player] spawn
{
	params ["_unit"];
	private _timeout = 0;
	waitUntil 
	{
		if (_timeout >= 10) exitWith 
		{
			["fn_zeusInit: Timed out!!!",true] call JSHK_contam_fnc_logMessage;
			true;
		};
		sleep 1;
		_timeout = _timeout + 1;
		if (count allCurators == 0 || {!isNull (getAssignedCuratorLogic _unit)}) exitWith {true};
		false;
	};
	/*waitUntil 
	{
		if (_timeout >= 10) exitWith 
		{
			["fn_zeusInit: Timed out!!!",true] call JSHK_contam_fnc_logMessage;
			true;
		};
		sleep 1;
		_timeout = _timeout + 1;
		count (allCurators select {isNull (getAssignedCuratorUnit _x)}) > 0;
	};*/
	
	private _moduleList = 
	[
		//["",{}]
		["Add Area",{_this call JSHK_contam_fnc_zeusAddArea}],
		["Add Safe Area",{_this call JSHK_contam_fnc_zeusAddSafeArea}],
		["Remove Area",{_this call JSHK_contam_fnc_zeusRemoveArea}],
		["Remove Safe Area",{_this call JSHK_contam_fnc_zeusRemoveSafeArea}],
		["Toggle Safe Vehicle",{_this call JSHK_contam_fnc_zeusSafeVehicle}],
		["Toggle Invulnerability",{_this call JSHK_contam_fnc_zeusGodMode}]
		
		//["Add Gear",{_this call JSHK_contam_fnc_zeusAddGear}] 
		
	];

	if !(JSHK_contam_zeus_mod_fn) then 
	{
		{
			[
				"JSHK Contam Zeus Modules", 
				(_x select 0), 
				(_x select 1)
			] call Ares_fnc_RegisterCustomModule;
		} forEach _moduleList;
	} else {
		{
			private _reg = 
			[
				"JSHK Contam Zeus Modules", 
				(_x select 0), 
				(_x select 1),
				"\JSHK_contam\data\icon_ca.paa"
			] call zen_custom_modules_fnc_register;
			[format["Zeus Enh Module: %1 registered -- %2",_x select 0,_reg]] call JSHK_contam_fnc_logMessage;
		} forEach _moduleList;
	};

	if ([player] call JSHK_contam_fnc_isZeus) then
	{
		
			(getAssignedCuratorLogic player) addEventHandler
			[
				"CuratorObjectEdited",
				{
					params ["_curator","_obj"];
					if (typeOf _obj isEqualTo "JSHK_contam_dummyObject") then
					{
						private _pos = getPos _obj;
						private _paramArr = [_obj,[["origin",_pos]]];
						private _isContam = [_obj] call JSHK_contam_fnc_areaExists;
						if (_isContam) then
						{
							_paramArr call JSHK_contam_fnc_updateAreaInfo;
						} else
						{
							if ([_obj] call JSHK_contam_fnc_safeAreaExists) then
							{
								_paramArr call JSHK_contam_fnc_updateSafeAreaInfo;
							};
						};				
					};
				}
			];
		
			/*(getAssignedCuratorLogic player) addEventHandler
			[
				"CuratorObjectDoubleClicked",
				{
					params ["_curator","_obj"];
					if (typeOf _obj isEqualTo "JSHK_contam_dummyObject") then
					{
						private _isContam = [_obj] call JSHK_contam_fnc_areaExists;
						if (_isContam) then
						{
							[_obj] call JSHK_contam_fnc_zeusEditArea;
						} else
						{
							if ([_obj] call JSHK_contam_fnc_safeAreaExists) then
							{
								[_obj] call JSHK_contam_fnc_zeusEditSafeArea;
							};
						};
					};
				}
			];*/
	};
};
//waitUntil {scriptDone _wait};
[format ["fn_zeusInit: Zeus initialization complete. Achilles Detected: %1 -- Zeus Enhanced Detected: %2",_hasAch,_hasZen],true] call JSHK_contam_fnc_logMessage;

