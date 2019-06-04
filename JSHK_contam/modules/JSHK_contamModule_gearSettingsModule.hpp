class JSHK_contamModule_gearSettingsModule: Module_F
{
	scope = 2;
	displayName = "Gear Settings Module";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleGearValues";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_uniforms
		{
			displayName = "Types of Uniforms";
			description = "Classnames of uniforms (seperate by commas with no quotations)";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_vests
		{
			displayName = "Types of Vests";
			description = "Classnames of vests (seperate by commas with no quotations)";
			typeName = "STRING";
			defaultValue = "";
		};
		class JSHK_contamModuleVar_includeJSHKGear
		{
			displayName = "Include JSHK Gear";
			description = "Include the gear contained within the JSHK Contamination Gear addon (not including the masks)";
			typeName = "BOOL";
			defaultValue = false;
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Gear Settings Module";
		sync[] = {};
	};
};