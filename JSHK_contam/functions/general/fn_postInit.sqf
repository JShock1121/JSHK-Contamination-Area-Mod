/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_postInit.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
_main = [] spawn
{
	[
		"ALL: Postinit value of %1: %2",
		[
			"JSHK_contam_areas",
			"JSHK_contam_safeAreas",
			"JSHK_contam_safeVehicles",
			"JSHK_contam_godModeUnits",
			"JSHK_contam_DEBUG"
		]
	] call JSHK_contam_fnc_blockLogVars;
	
	
	_serverModuleInit = [] spawn
	{
		if (!isServer) exitWith {};
		[
			"SERVER: Postinit value of %1: %2",
			[
				"JSHK_contam_contamIterator",
				"JSHK_contam_safeIterator",
				"JSHK_contam_serverInitComplete",
				"JSHK_contam_addSpawnedAI",
				"JSHK_contam_aiDamageEnabled",
				"JSHK_contam_aiAutoRecovery",
				"JSHK_contam_excludedAIClasses",
				"JSHK_contam_excludedAIFactions",
				"JSHK_contam_godModeUnits"
			]
		] call JSHK_contam_fnc_blockLogVars;
		
		private _timeout = 0;
		private _initComplete = true;
		/*waitUntil 
		{
			if (_timeout >= 30) exitWith
			{
				_initComplete = false;
				["fn_postInit: SERVER module initialization TIMED OUT!!!!",true] call JSHK_contam_fnc_logMessage;
				true;
			};
			private _out =
			[
				[
					"JSHK_contamModule_areaModule",
					"JSHK_contamModule_safeAreaModule",
					"JSHK_contamModule_playerSettingsModule",
					"JSHK_contamModule_gearSettingsModule",
					"JSHK_contamModule_aiSettingsModule",
					"JSHK_contamModule_enviroModule",
					"JSHK_contamModule_debugModule",
					"JSHK_contamModule_detectorModule",
					"JSHK_contamModule_removeAreaModule",
					"JSHK_contamModule_removeSafeAreaModule",
					"JSHK_contamModule_maskModule",
					"JSHK_contamModule_vehicleModule"
				],
				"JSHK_contamModule_initCompleted"
			] call JSHK_contam_fnc_assessModules;
			if (_out) exitWith 
			{
				_initComplete =  true;
				["fn_postInit: SERVER module initialization completed!",true] call JSHK_contam_fnc_logMessage;
				true;
			};
			sleep 1;
			_timeout = _timeout + 1;
			false;
		};*/
		
		[] spawn JSHK_contam_fnc_affectAILoop;
		
		JSHK_contam_serverInitComplete = _initComplete;
	};
	//waitUntil {scriptDone _serverModuleInit;};
	if (isDedicated) exitWith {[] call JSHK_contam_fnc_addPVEH;};
	
	["Server postInit complete"] call JSHK_contam_fnc_logMessage;
	
	if (!hasInterface) exitWith {};
	[
		"CLIENT: Postinit value of %1: %2",
		[
			"JSHK_contam_gasMasks",
			"JSHK_contam_gasMasks50",
			"JSHK_contam_gasMasksTwo",
			"JSHK_contam_gasMasksOpen",
			"JSHK_contam_whenOverlay",
			"JSHK_contam_useMaskSound",
			"JSHK_contam_staminaEffectEnabled",
			"JSHK_contam_rainEffectEnabled",
			"JSHK_contam_uniforms",
			"JSHK_contam_vests",
			"JSHK_contam_headgear",
			"JSHK_contam_enviroEffectsType",
			"JSHK_contam_colorFilterType",
			"JSHK_contam_activeEnviroEffects",
			"JSHK_contam_requireDetector",
			"JSHK_contam_detectorEnabled",
			"JSHK_contam_detectorSoundEnabled",
			"JSHK_contam_detectorArrowEnabled",
			"JSHK_contam_enableDamage",
			"JSHK_contam_autoRecovery",
			"JSHK_contam_enableCough",
			"JSHK_contam_excludedUnitClasses",
			"JSHK_contam_excludedUnitFactions",
			"JSHK_contam_godModeUnits"
		]
	] call JSHK_contam_fnc_blockLogVars;
	
	waitUntil {!isNull player && alive player && !isNull (findDisplay 46)};
	
	[player,true] call JSHK_contam_fnc_unitInit;
	
	if (!isMultiplayer && isNil "JSHK_contam_teamSwitchMEH") then
	{
		private _h = addMissionEventHandler ["TeamSwitch",{[player,false] call JSHK_contam_fnc_unitInit;}];
		missionNamespace setVariable ["JSHK_contam_teamSwitchMEH",_h];
		["Singleplayer detected, enabled teamswitch handling",true] call JSHK_contam_fnc_logMessage;
	} else 
	{
		if (isMultiplayer) then { [player] call JSHK_contam_fnc_onRespawn; };
		["Multiplayer detected, enabled respawn handling",true] call JSHK_contam_fnc_logMessage;
	};
	
	[clientOwner,"JSHK_contam_areas",true] call JSHK_contam_fnc_requestUpdate;
	[clientOwner,"JSHK_contam_safeAreas",true] call JSHK_contam_fnc_requestUpdate;
};
