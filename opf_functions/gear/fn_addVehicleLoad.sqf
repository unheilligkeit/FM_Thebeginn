﻿/*
ADV_fnc_addVehicleLoad by Belbo:

Adds vehicle loadouts to preplaced vehicles in ADV_MissionTemplate.
*/

if (!isServer) exitWith {};

{
	switch (true) do {
		case (str _x in ADV_opf_veh_transport): {
			[_x,false,true,4] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_logistic_fuel+ADV_opf_veh_logistic_ammo): {
			[_x,false,false,4] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_logistic_repair): {
			[_x,false,false,4,true] call ADV_opf_fnc_vehicleLoad;
		};		
		case (str _x in ADV_opf_veh_logistic_medic): {
			[_x,true,false,4] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_air && !(str _x in ADV_opf_veh_airLogistic)): {
			[_x,false,false,0] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_airLogistic): {
			[_x,true,false,0] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_car): {
			[_x,false,true,2] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_heavys): {
			[_x,false,true,2] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_tanks+ADV_opf_veh_artys): {
			[_x,false,true,2] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_ATVs+ADV_opf_veh_UAVs+ADV_opf_veh_UGVs): {
			[_x,false,false,0] call ADV_opf_fnc_vehicleLoad;
		};
		case (str _x in ADV_opf_veh_UGVs_repair): {
			[_x,false,false,0,true] call ADV_opf_fnc_vehicleLoad;
		};
	};
} forEach _this;

if (true) exitWith {};