class JSHK_contamModule_detectorModule: Module_F
{
	scope = 2;
	displayName = "Detector Settings";
	category = "JSHK_contamModule_cat";
	icon = "\JSHK_contam\data\icon_ca.paa";
	
	function = "JSHK_contamModule_fnc_moduleDetector";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	
	//curatorInfoType = "RscDisplayAttributecontamAreaModule";
	
	class Arguments: ArgumentsBaseUnits
	{
		class JSHK_contamModuleVar_requireDetector
		{
			displayName = "Require Detector";
			description = "Require detector to hear contaminated area warning sounds";
			typeName = "BOOL";
			defaultValue = true;
		};
		class JSHK_contamModuleVar_detectorArrowEnabled
		{
			displayName = "Direction Indicator";
			description = "Enable the use of the directional indicator on the detector interface";
			typeName = "BOOL";
			defaultValue = true;
		};
	};
	
	class ModuleDescription: ModuleDescription
	{
		description = "JSHK Contamination Detector Module";
		sync[] = {};
	};
};