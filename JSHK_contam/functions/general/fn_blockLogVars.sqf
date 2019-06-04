params [["_in","",[""]],["_vars",[],[[]]]];
if (count _vars < 1) exitWith {};

{
	private _varVal = missionNamespace getVariable [_x,nil];
	if (!isNil "_varVal") then
	{
		private _str = format [_in,_x,_varVal];
		[_str] call JSHK_contam_fnc_logMessage;
	};
} forEach _vars;