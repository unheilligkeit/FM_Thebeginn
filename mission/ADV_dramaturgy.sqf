﻿if (!isServer && hasInterface) exitWith {};

if !(isServer || hasInterface) then {ADV_HCpresent = 1;};
if (isServer) then {ADV_HCpresent = 0;};
publicVariable "ADV_HCpresent";

if (isNil "ADV_taskVar") then { ADV_taskVar = 0; };
if (isNil "ADV_spawnVar") then { ADV_spawnVar = 0; };

//upsmon arrays for editor placed units (for HC-compatibility)
/*
[] spawn {
	_upsmonCalls = [
		//[opf_group_1,"area","CARELESS","LIMITED"]
	];
	if (count _upsmonCalls != 0) then {
		{_x execVM "scripts\upsmon.sqf"} forEach _upsmonCalls;
	};
};
*/
ADV_civ_unitArray = ["RDS_Priest","RDS_Priest","RDS_Civilian_Random","RDS_Civilian_Random"];

//scripts for first mission part
[l1] remoteExec ["disco",0,true];
[l2] remoteExec ["disco",0,true];
[l3] remoteExec ["disco",0,true];
[l4] remoteExec ["disco",0,true];
[l5] remoteExec ["disco",0,true];
[l6] remoteExec ["disco",0,true];
[l7] remoteExec ["disco",0,true];


[k1,k2,k3,k4,k5,k6] remoteExec ["strobo",0,true];

waitUntil {sleep 1; ADV_taskVar == 1};

_i = 0;
while {_i < 2} do
{
	[ADV_civ_unitArray,east,1,["LIMITED","CARELESS","STAG COLUMN","NOFOLLOW"],[sp1,sp2,sp3,sp4,sp5,sp6,sp7,sp8,sp9],"area1"] call ADV_fnc_spawnPatrol;
	sleep 5;
	_i = _i+1;
};

waitUntil {sleep 1; ADV_taskVar == 2};

	["task_1", "succeeded"] remoteExec ["FHQ_TT_setTaskState",2];
	sleep 20;
	["End2",true,8] remoteExec ["BIS_fnc_endMission",0];

//scripts for following mission parts
ADV_handle_dramaturgy_1 = [] spawn {

};

//mission end:
ADV_handle_dramaturgy_end = [] spawn {
	waitUntil {sleep 1; ADV_taskVar == 99};
	["task_1", "succeeded"] remoteExec ["FHQ_TT_setTaskState",2];
	sleep 20;
	["End2",true,8] remoteExec ["BIS_fnc_endMission",0];
};

/*
//possible spawn calls:
[["O_Soldier_TL_F","O_Soldier_GL_F","O_Soldier_F","O_soldier_AR_F","O_medic_F"],east,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
//or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1,spawnLogic_2],"area_1"] call ADV_fnc_spawnPatrol;
or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,[spawnLogic_1],attackLogic_1] call ADV_fnc_spawnAttack;
//for calling custom loadouts on last group spawned (just add one spawnLogic/Marker):
_grp = [["B_Sniper_F","B_Spotter_F"],west,200,["LIMITED","STAG COLUMN","NOFOLLOW"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
[(units _grp) select 0] call ADV_fnc_sniper;
[(units _grp) select 1] call ADV_fnc_spotter;
//for adding new tasks, create a new case in ADV_tasks.sqf, a new task within this case and call like this:
[2] remoteExec ["ADV_fnc_tasks",2];
*/

if (true) exitWith {};