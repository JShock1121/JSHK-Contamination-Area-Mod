class Logic;
class Module_F: Logic
{
	class ArgumentsBaseUnits
	{
		class Units;
	};
	class ModuleDescription
	{
		class EmptyDetector;
	};
};
#include "\JSHK_contam\modules\JSHK_contamModule_areaModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_removeAreaModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_safeAreaModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_removeSafeAreaModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_playerSettingsModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_gearSettingsModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_enviroModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_debugModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_detectorModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_maskModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_vehicleModule.hpp"
#include "\JSHK_contam\modules\JSHK_contamModule_aiSettingsModule.hpp"

//#include "\JSHK_contam\modules\zeus\JSHK_contamModule_ZEUS_moduleBase.hpp"
//#include "\JSHK_contam\modules\zeus\JSHK_contamModule_ZEUS_areaModule.hpp"
//#include "\JSHK_contam\modules\zeus\JSHK_contamModule_ZEUS_safeAreaModule.hpp"
//#include "\JSHK_contam\modules\zeus\JSHK_contamModule_ZEUS_removeAreaModule.hpp"
//#include "\JSHK_contam\modules\zeus\JSHK_contamModule_ZEUS_removeSafeAreaModule.hpp"

#include "\JSHK_contam\dummy\dummyObject.hpp"

class Item_Base_F;
class Item_JSHK_contam_detector: Item_Base_F
{
	scope = 2;
	scopeCurator = 2;
	displayName = "Contamination Zone Detector";
	author = "J. Shock";
	vehicleClass = "Items";
	class TransportItems
	{
		class JSHK_contam_detector
		{
			name = "JSHK_contam_detector";
			count = 1;
		};
	};
};

//#include "\JSHK_contam\airTank\backpacks.hpp"
//#include "\JSHK_contam\airTank\vehicles.hpp"
//#include "\JSHK_contam\airTank\refill_station.hpp"
/* //backpacks
define TANK_CONST 0.28 //class E cylinder
define TANK_LPM 15
define TANK_PRES(TIME) ((TIME*TANK_LPM)/TANK_CONST)
define TANK_TIME(PSI) ((TANK_CONST*PSI)/TANK_LPM)
	class *A3 Air Tank Backpack Class 1*
	{
		JSHK_contam_airTankCap = 3000; //in psi
		//JSHK_contam_airTankUseRate = 15; //liters/min
		//JSHK_contam_timeToEmpty = TANK_TIME(3000); //in min
	};
	class *A3 Air Tank Backpack Class 2*
	{
		JSHK_contam_airTankCap = 3000; //in psi
		//JSHK_contam_airTankUseRate = 15; //liters/min
		//JSHK_contam_timeToEmpty = 45; //in min
	};
	///////////////////
	class JSHK_contam_airTank1_standard: *A3 Air Tank Backpack Class 1* {};
	class JSHK_contam_airTank1_low: *A3 Air Tank Backpack Class 1*
	{
		JSHK_contam_airTankCap = 2500; //in psi
		//JSHK_contam_timeToEmpty = 30; //in min
	};
	class JSHK_contam_airTank1_high: *A3 Air Tank Backpack Class 1*
	{
		JSHK_contam_airTankCap = 3500; //in psi
		//JSHK_contam_timeToEmpty = 60; //in min
	};
	////////////////////
	class JSHK_contam_airTank2_standard: *A3 Air Tank Backpack Class 2*	{};
	class JSHK_contam_airTank2_low: *A3 Air Tank Backpack Class 2*
	{
		JSHK_contam_airTankCap = 2500; //in psi
		//JSHK_contam_timeToEmpty = 30; //in min
	};
	class JSHK_contam_airTank2_high: *A3 Air Tank Backpack Class 2*
	{
		JSHK_contam_airTankCap = 3500; //in psi
		//JSHK_contam_timeToEmpty = 60; //in min
	};
*/