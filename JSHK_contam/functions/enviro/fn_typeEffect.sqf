/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_stepEffect.sqf
Parameters: string
Return: Array

*///////////////////////////////////////////////
#include "\JSHK_contam\functions\enviro\macros.hpp"

params [["_in","",[""]]];
if (_in == "") exitWith {[];};

private _out = switch (toLower _in) do
{
	case "chr1": {JSHK_CONTAM_E_CHROM_1_F};
	case "chr2": {JSHK_CONTAM_E_CHROM_2_F};
	case "chr3": {JSHK_CONTAM_E_CHROM_3_F};
	
	case "blur1": {JSHK_CONTAM_E_BLUR_1_F};
	case "blur2": {JSHK_CONTAM_E_BLUR_2_F};
	
	case "film": {JSHK_CONTAM_E_GRAIN_F};
	
	case "wet1": {JSHK_CONTAM_E_WET_1_F};
	case "wet2": {JSHK_CONTAM_E_WET_2_F};
	
	case "brown": {JSHK_CONTAM_C_FILM_F};
	case "red": {JSHK_CONTAM_C_RED_F};
	case "yellow": {JSHK_CONTAM_C_MUS_F};
	case "blue": {JSHK_CONTAM_C_CHLOR_F};
	
	default {};
};

_out;