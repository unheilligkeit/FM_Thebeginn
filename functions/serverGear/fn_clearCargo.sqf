﻿/*
remove vehicle cargo globally
[item_1,item_2] call ADV_fnc_clearCargo;
*/
if (count _this == 0) exitWith {};
//removes all content from the target:
{
	clearWeaponCargoGlobal _x;clearMagazineCargoGlobal _x;clearBackpackCargoGlobal _x;clearItemCargoGlobal _x;
} forEach _this;

if (true) exitWith {true;};