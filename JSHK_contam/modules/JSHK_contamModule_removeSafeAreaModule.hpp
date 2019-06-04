class JSHK_contamModule_removeSafeModule: Module_F
{
	scope = 2;
	displayName = "Remove Safe Area";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleRemoveSafeAreas";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 1;
	isDisposable = 0;
	is3DEN = 0;
	
	//curatorInfoType = "RscDisplayAttributecontamAreaModule";
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_safeAreaNames
		{
			displayName = "Name(s) of Area(s)";
			description = "Enter the names of the safe areas to be deleted, no quotes and no spaces in the names, seperated by commas";
			typeName = "STRING";
			defaultValue = "";
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Remove Safe Areas Module";
		sync[] = {"EmptyDetector"};
		
		class EmptyDetector
		{
			position = 1;
			direction = 0;
			optional = 1;
			duplicate = 1;
			synced[] = {"EmptyDetector"};
		};
	};
};