/*/////////////////////////////////////////////////
Author: J.Shock
			   
File: fn_addEnviroEffects.sqf
Parameters: number, number
Return: number of effects added
*///////////////////////////////////////////////
#include "\JSHK_contam\functions\enviro\macros.hpp"
params [["_type",-1,[0]],["_in",1,[0]]];

if (_type == -1) exitWith {};
private _step = [_in] call JSHK_contam_fnc_getStep;

private _effects = [];
private _commitTime = 2;
switch (_type) do 
{
	case 0: //standard
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectAdjust [JSHK_CONTAM_E_CHROM_1_F,_step] call JSHK_contam_fnc_applyStep;
		_dyna = ppEffectCreate ["DynamicBlur",500];
		_dyna ppEffectAdjust [JSHK_CONTAM_E_BLUR_1_F,_step] call JSHK_contam_fnc_applyStep;
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectAdjust [JSHK_CONTAM_E_GRAIN_F,_step] call JSHK_contam_fnc_applyStep;
		_effects = [[_chrom,"chr1"],[_dyna,"blur1"],[_film,"film"]];
	};
	case 1: //distorted
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectAdjust [JSHK_CONTAM_E_CHROM_2_F,_step] call JSHK_contam_fnc_applyStep;
		_dyna = ppEffectCreate ["DynamicBlur",500];
		_dyna ppEffectAdjust [JSHK_CONTAM_E_BLUR_2_F,_step] call JSHK_contam_fnc_applyStep;
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectAdjust [JSHK_CONTAM_E_GRAIN_F,_step] call JSHK_contam_fnc_applyStep;
		_effects = [[_chrom,"chr2"],[_dyna,"blur2"],[_film,"film"]];
	};
	case 2: //haze
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectAdjust [JSHK_CONTAM_E_CHROM_3_F,_step] call JSHK_contam_fnc_applyStep;
		_wet = ppEffectCreate ["WetDistortion",300];
		_wet ppEffectAdjust [JSHK_CONTAM_E_WET_1_F,_step] call JSHK_contam_fnc_applyStep;
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectAdjust [JSHK_CONTAM_E_GRAIN_F,_step] call JSHK_contam_fnc_applyStep;
		_commitTime = 0;
		_effects = [[_chrom,"chr3"],[_wet,"wet1"],[_film,"film"]];
	};
	case 3: //haze 2
	{
		_wet = ppEffectCreate ["WetDistortion",300];
		_wet ppEffectAdjust [JSHK_CONTAM_E_WET_2_F,_step] call JSHK_contam_fnc_applyStep;
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectAdjust [JSHK_CONTAM_E_GRAIN_F,_step] call JSHK_contam_fnc_applyStep;
		_commitTime = 0;
		_effects = [[_wet,"wet2"],[_film,"film"]];
	};
	default {};
};

private _color = [JSHK_contam_colorFilterType,_step] call JSHK_contam_fnc_addColorFilter;
_effects pushBack _color;

_effects ppEffectEnable true;
_effects ppEffectCommit _commitTime;
private _c = _effects call JSHK_contam_fnc_addActiveEnviroEffects;

_c;







/*//////////////////////////////////////////////
params [["_num",-1,[0]]];
switch (_num) do 
{
	case 0:
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectEnable true;
		_chrom ppEffectAdjust [-0.02,0,true];
		_dyna = ppEffectCreate ["DynamicBlur",500];
		_dyna ppEffectEnable true;
		_dyna ppEffectAdjust [0.03];
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectEnable true;
		_film ppEffectAdjust [0.12,1.52,3.54,2,2,true];
		_color = ppEffectCreate ["colorCorrections",800];
		_color ppEffectAdjust [ .4, 1, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.4],[0.83, 0.56, 0.29, 0.0]];
		_color ppEffectEnable true;
		[_chrom,_dyna,_film,_color] ppEffectCommit 2;
		
		[_chrom,_dyna,_film,_color] call JSHK_contam_fnc_addActiveEnviroEffects;
	};
	case 1:
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectEnable true;
		_chrom ppEffectAdjust [-1,-1,true];
		_dyna = ppEffectCreate ["DynamicBlur",500];
		_dyna ppEffectEnable true;
		_dyna ppEffectAdjust [0.41];
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectEnable true;
		_film ppEffectAdjust [1,4.5,4.08,2,2,true];
		_color = ppEffectCreate ["colorCorrections",800];
		_color ppEffectAdjust [ .4, 1, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.4],[0.83, 0.56, 0.29, 0.0]];
		_color ppEffectEnable true;
		[_chrom,_dyna,_film,_color] ppEffectCommit 2;
		
		[_chrom,_dyna,_film,_color] call JSHK_contam_fnc_addActiveEnviroEffects;
	};
	case 2:
	{
		_chrom = ppEffectCreate ["ChromAberration",200];
		_chrom ppEffectEnable true;
		_chrom ppEffectAdjust [0,-0.01,true];
		_wet = ppEffectCreate ["WetDistortion",300];
		_wet ppEffectEnable true;
		_wet ppEffectAdjust [-1.29,0.02,0.02,5,0.98,5,-2.48,-0.08,-0.08,0.02,-0.16,-0.15,0.04,0.2,0.2];
		_film = ppEffectCreate ["FilmGrain",2000];
		_film ppEffectEnable true;
		_film ppEffectAdjust [1,2.47,1.58,2,2,true];
		[_chrom,_wet,_film] ppEffectCommit 0;
		
		[_chrom,_wet,_film] call JSHK_contam_fnc_addActiveEnviroEffects;
	};
	default {};
};




///////////////////////////////////////////////////*/

