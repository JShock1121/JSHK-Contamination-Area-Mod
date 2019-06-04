class JSHK_contamModule_aiSettingsModule: Module_F
{
	scope = 2;
	displayName = "AI Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleAISettings";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_aiEnableDamage
		{
			displayName = "Damage";
			description = "Enable damage of the AI without a gear (auto detection for ACE)";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_aiAutoRecovery
		{
			displayName = "Auto Recovery";
			description = "After taking damage from area, enable recovery from that damage for AI (VANILLA ONLY)";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_addSpawnedAI
		{
			displayName = "Add Spawned AI";
			description = "Add AI automatically when spawned by Zeus or other outside script";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_aiExclusionClasses
		{
			displayName = "Excluded Classnames";
			description = "Classnames of units (seperate by commas with no quotations) that aren't affected by areas";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_aiExclusionFactions
		{
			displayName = "Excluded Factions";
			description = "Faction classnames of units (seperate by commas with no quotations) that aren't affected by areas";
			typeName = "STRING";
			defaultValue = "";
		};
		/*class JSHK_contamModuleVar_aiExclusionSides
		{
			displayName = "Excluded Sides";
			description = "Sides of AI units excluded";
			typeName = "NUMBER";
			class values
			{
				class none {name = "None"; value = 0; default = 0;};
				class one {name = "BLUFOR"; value = 1; default = 0;};
				class two {name = "OPFOR"; value = 2; default = 0;};
				class three {name = "INDEP"; value = 3; default = 0;};
				class four {name = "CIV"; value = 4; default = 0;};
				class five {name = "BLUFOR & OPFOR"; value = 5; default = 0;};
				class six {name = "BLUFOR & INDEP"; value = 6; default = 0;};
				class seven {name = "BLUFOR & CIV"; value = 7; default = 0;};
				class eight {name = "OPFOR & INDEP"; value = 8; default = 0;};
				class nine {name = "OPFOR & CIV"; value = 9; default = 0;};
				class ten {name = "INDEP & CIV"; value = 10; default = 0;};
				class eleven {name = "ALL"; value = 11; default = 0;};
			};
		};*/
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination AI Settings Module";
		sync[] = {};
	};
};