﻿/*
cratefiller script by Belbo
put this into init-line of the crate that's supposed to contain the items specified below:
nul = [[this],true,true] call ADV_fnc_resupplyCrate;
*/

if (!isServer) exitWith {};
private ["_target"];
{
	_target = _x;
	//makes the crates indestructible:
	_target allowDamage false;

	//grenades
	switch (ADV_par_indWeap) do {
		case 2: {
			_target addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
		};
		default {
			_target addMagazineCargoGlobal ["SmokeShell",2];
		};
	};

	if ( ADV_par_NVGs == 2 && !(isClass (configFile >> "CfgPatches" >> "ACE_attach")) ) then {
		_target addMagazineCargoGlobal ["I_IR_Grenade",4];
	};
	_target addItemCargoGlobal ["ToolKit",2];
	
	if ( ADV_par_radios > 0 && isClass (configFile >> "CfgPatches" >> "task_force_radio") ) then {
		_target addItemCargoGlobal [TF_defaultGuerPersonalRadio,1];
	};
	
	if ( ADV_par_Tablets == 1 && isClass (configFile >> "CfgPatches" >> "cTab") ) then {
		_target addItemCargoGlobal ["ItemAndroid",1];
	};
	
	if ( ADV_par_NVGs == 2 ) then {
		if ( isClass (configFile >> "CfgPatches" >> "ACE_nightvision") ) then {
			_target addItemCargoGlobal ["ACE_NVG_Wide",2];
		} else {
			_target addItemCargoGlobal ["NVGoggles_OPFOR",2];
		};
	};

	_ACE_fieldDressing = 0;
	_ACE_packingBandage = 0;
	_ACE_elasticBandage = 0;
	_ACE_quikclot = 0;
	_ACE_atropine = 0;
	_ACE_epinephrine = 0;
	_ACE_morphine = 0;
	_ACE_tourniquet = 0;
	_ACE_bloodIV = 0;
	_ACE_bloodIV_500 = 0;
	_ACE_bloodIV_250 = 0;
	_ACE_plasmaIV = 0;
	_ACE_plasmaIV_500 = 0;
	_ACE_plasmaIV_250 = 0;
	_ACE_salineIV = 0;
	_ACE_salineIV_500 = 0;
	_ACE_salineIV_250 = 0;
	_ACE_personalAidKit = 0;
	_ACE_surgicalKit = 0;
	_ACE_bodyBag = 5;
	
	_FAKs = 2;
	_mediKit = 0;
	
	if !(isClass (configFile >> "CfgPatches" >> "ACE_Medical")) then {
		_target addItemCargoGlobal ["FirstAidKit",_FAKs];
		_target addItemCargoGlobal ["MediKit",_mediKit];	
	};
	//medical stuff
	if (isClass (configFile >> "CfgPatches" >> "ACE_common")) then {
		_ACE_EarPlugs = 5;

		_ACE_SpareBarrel = 0;
		_ACE_tacticalLadder = 2;
		_ACE_UAVBattery = 2;
		_ACE_wirecutter = 1;
		_ACE_sandbag = 30;
		_ACE_Clacker = 0;
		_ACE_M26_Clacker = 0;
		_ACE_DeadManSwitch = 0;
		_ACE_DefusalKit = 1;
		_ACE_Cellphone = 0;
		_ACE_MapTools = 4;
		_ACE_CableTie = 10;
		_ACE_NonSteerableParachute = 0;
		_ACE_EntrenchingTool = 1;

		_ACE_key_west = 1;
		_ACE_key_east = 0;
		_ACE_key_indp = 0;
		_ACE_key_civ = 0;
		_ACE_key_master = 0;
		_ACE_key_lockpick = 0;
		_ACE_kestrel = 0;
		_ACE_ATragMX = 0;
		_ACE_rangecard = 1;
		_ACE_altimeter = 0;
		_ACE_microDAGR = 0;
		_ACE_DAGR = 0;
		_ACE_RangeTable_82mm = 1;
		_ACE_rangefinder = 0;
		_ACE_NonSteerableParachute = 0;
		_ACE_IR_Strobe = 4;
		_ACE_M84 = 0;
		_ACE_HandFlare_Green = 0;
		_ACE_HandFlare_Red = 8;
		_ACE_HandFlare_White = 0;
		_ACE_HandFlare_Yellow = 0;
		[_target] call ADV_fnc_addACEItems;
	};
} forEach _this;

if (true) exitWith {true;};