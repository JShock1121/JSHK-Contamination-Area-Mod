/*/////////////////////////////////////////////////
Current Modification Author: J.Shock
			   
File: fn_applyStep.sqf
Parameters: array, number
Return: Array

*///////////////////////////////////////////////
params [["_in",[],[[]]],["_v",0,[0]],["_b",false,[false]]];

private _newArr = _in apply 
{
	_a = _x;
	switch (typeName _a) do
	{
		case "ARRAY": {[_a,_v] call JSHK_contam_fnc_applyStep;};
		case "SCALAR": 
		{
			private _n =  _a*_v;
			if (_a < 0 && _v == 0) then
			{
				0;
			} else { _n; };
		};
		case "BOOL": 
		{
			if (_v == 0 && _b) then 
			{ !_a; } else
			{
				_a;
			};
		};
		default {};
	};
};
_newArr;