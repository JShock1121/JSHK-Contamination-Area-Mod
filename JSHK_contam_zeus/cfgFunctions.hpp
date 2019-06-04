class JSHK_contam_addon
{
	tag = "JSHK_contam";
	class Contamination_zeus
	{
		file = "\JSHK_contam_zeus\functions";
		class zeusInit { postInit = 1; };
		
		class isZeus {};
		
		class zeusAddArea {};
		class zeusRemoveArea {};
		class zeusEditArea {};
		
		class zeusAddSafeArea {};
		class zeusRemoveSafeArea {};
		class zeusEditSafeArea {};
		
		class zeusGodMode {};
		class godModeEnabled {};
		
		class zeusSafeVehicle {};
		
		class zeusAddGear {};
	};
};