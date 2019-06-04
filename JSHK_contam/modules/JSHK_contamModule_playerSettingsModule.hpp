class JSHK_contamModule_playerSettingsModule: Module_F
{
	scope = 2;
	displayName = "Player Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleSettingsValues";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_enableDamage
		{
			displayName = "Damage";
			description = "Enable damage of the player without a mask (auto detection for ACE)";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_autoRecovery
		{
			displayName = "Auto Recovery";
			description = "After taking damage from area, enable recovery from that damage (VANILLA ONLY)";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_exclusionClasses
		{
			displayName = "Excluded Classnames";
			description = "Classnames of units (seperate by commas with no quotations) that aren't affected by areas";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_exclusionFactions
		{
			displayName = "Excluded Factions";
			description = "Faction classnames of units (seperate by commas with no quotations) that aren't affected by areas";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_enableCoughSound
		{
			displayName = "Cough";
			description = "Enable coughing when player is affected within an area";
			typeName = "BOOL";
			defaultValue = true;
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Global Settings Module";
		sync[] = {};
	};
};