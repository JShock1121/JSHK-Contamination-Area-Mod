class JSHK_contamModule_debugModule: Module_F
{
	scope = 2;
	displayName = "Debug Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleDebug";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_enableDebug
		{
			displayName = "Enable Debug";
			description = "Enable to send messages to the rpt regarding addon status";
			typeName = "BOOL";
			defaultValue = false;
		};
		class JSHK_contamModuleVar_logNetwork
		{
			displayName = "Log Network Var Updates";
			description = "Enable to send messages to the rpt regarding variable status when updated across the server";
			typeName = "BOOL";
			defaultValue = false;
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Debug Module";
		sync[] = {};
	};
};