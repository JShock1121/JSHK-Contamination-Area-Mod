/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_zeusInit.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////

if !(isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles") && 
		isClass (configFile >> "CfgPatches" >> "cba_main")) exitWith
{
	private _msg = "******CBA and/or Achilles not detected and are required to use JSHK CAM Zeus Extension!!!";
	//systemChat _msg;
	[_msg,true] call JSHK_contam_fnc_logMessage;
};
	//can ach and cba be client (aka zeus) side only or server required?

//check that all main modules are loaded and/or all associated variables present?

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
		if (!isNull (getAssignedCuratorLogic _unit)) exitWith {true;};
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

	{
		[
			"JSHK Contam Zeus Modules", 
			(_x select 0), 
			(_x select 1)
		] call Ares_fnc_RegisterCustomModule;
	} forEach _moduleList;

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
["fn_zeusInit: Zeus initialization complete.",true] call JSHK_contam_fnc_logMessage;

