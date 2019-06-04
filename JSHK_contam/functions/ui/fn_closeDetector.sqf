/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_closeDetector.sqf
Parameters: none
Return: none

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\ui\macros.hpp"
JSHK_CONTAM_DETECTOR_DISPLAY displayRemoveEventHandler ["KeyDown",(player getVariable "JSHK_contam_detectDisplay_kDEH")];
JSHK_CONTAM_DETECTOR_DISPLAY closeDisplay 1;