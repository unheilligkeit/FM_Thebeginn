﻿/*
cratefiller script by Belbo
put this into init-line of the crate that's supposed to contain the items specified below:
nul = [this] call ADV_fnc_target;
*/

if (!isServer) exitWith {};
private ["_target"];
{
	_target = _x;
	//makes the crates indestructible:
	_target allowDamage false;
	
	//weapons & ammo
	switch (true) do {
		case (ADV_par_indWeap == 2): {
			//SeL RHS
			//weapons
			_target addWeaponCargoGlobal ["rhs_weap_M136",5];
			_target addWeaponCargoGlobal ["rhs_weap_M136_hedp",5];
			_target addWeaponCargoGlobal ["rhs_weap_M136_hp",5];
			_target addWeaponCargoGlobal ["rhs_weap_fgm148",2];
			//ammo
			_target addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",4];
			if !(isClass(configFile >> "CfgPatches" >> "ace_disposable")) then {  _target addMagazineCargoGlobal ["rhs_m136_mag",3];
				_target addMagazineCargoGlobal ["rhs_m136_hedp_mag",3];
				_target addMagazineCargoGlobal ["rhs_m136_hp_mag",3]; 
			};
			_target addMagazineCargoGlobal ["30rnd_556x45_STANAG",40];
			_target addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",40];
			_target addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",20];
			_target addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010",10];
			_target addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",20];
			_target addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",20];
			if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
				_target addMagazineCargoGlobal ["RH_12Rnd_45cal_usp",20];
				_target addMagazineCargoGlobal ["RH_15Rnd_45cal_fnp",5];
			} else {
				_target addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",20];
			};
			if (isClass(configFile >> "CfgPatches" >> "hlcweapons_mp5")) then { _target addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5",10]; };
			//items
			_target addItemCargoGlobal ["rhsusf_acc_harris_bipod",3];
			if (ADV_par_optics == 1) then {
				_target addItemCargoGlobal ["rhsusf_acc_compm4",5];
				_target addItemCargoGlobal ["rhsusf_acc_eotech_552",5];
				_target addItemCargoGlobal ["rhsusf_acc_ACOG",5];
				_target addItemCargoGlobal ["rhsusf_acc_ACOG_pip",5];
				_target addItemCargoGlobal ["rhsusf_acc_LEUPOLDMK4",1];
			};
		};
		case (ADV_par_indWeap == 3): {
			//HLC
			if (isClass(configFile >> "CfgPatches" >> "rhsusf_main")) then {
				//weapons
				_target addWeaponCargoGlobal ["rhs_weap_M136",5];
				_target addWeaponCargoGlobal ["rhs_weap_M136_hedp",5];
				_target addWeaponCargoGlobal ["rhs_weap_M136_hp",5];
				_target addWeaponCargoGlobal ["rhs_weap_fgm148",2];
				//ammo
				_target addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",4];
				if !(isClass(configFile >> "CfgPatches" >> "ace_disposable")) then {  _target addMagazineCargoGlobal ["rhs_m136_mag",3];
					_target addMagazineCargoGlobal ["rhs_m136_hedp_mag",3];
					_target addMagazineCargoGlobal ["rhs_m136_hp_mag",3]; 
				};
			} else {
				//weapons
				_target addWeaponCargoGlobal ["launch_NLAW_F",5];
				_target addWeaponCargoGlobal ["launch_I_Titan_F",5];
				_target addWeaponCargoGlobal ["launch_I_Titan_short_F",5];
				if !(isClass(configFile >> "CfgPatches" >> "ace_disposable")) then { _target addMagazineCargoGlobal ["NLAW_F",5]; };
				_target addMagazineCargoGlobal ["Titan_AA",5];
				_target addMagazineCargoGlobal ["Titan_AT",5];
				_target addMagazineCargoGlobal ["Titan_AP",5];
			};
			_target addMagazineCargoGlobal ["hlc_20rnd_762x51_b_G3",40];
			_target addMagazineCargoGlobal ["hlc_20rnd_762x51_T_G3",20];
			_target addMagazineCargoGlobal ["hlc_20Rnd_762x51_B_fal",40];
			_target addMagazineCargoGlobal ["hlc_20Rnd_762x51_T_fal",20];
			_target addMagazineCargoGlobal ["hlc_100Rnd_762x51_M_M60E4",20];
			_target addMagazineCargoGlobal ["hlc_50rnd_762x51_M_FAL",20];
			_target addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5",20];
		};
		default {
			//weapons
			_target addWeaponCargoGlobal ["launch_NLAW_F",5];
			_target addWeaponCargoGlobal ["launch_I_Titan_F",5];
			_target addWeaponCargoGlobal ["launch_I_Titan_short_F",5];
			//ammo
			if ( ADV_par_indWeap == 1 ) then {
				_target addMagazineCargoGlobal ["30rnd_556x45_STANAG",40];
				_target addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow",20];
				_target addMagazineCargoGlobal ["9Rnd_45ACP_Mag",10];
			} else {
				_target addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",40];
				_target addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer",40];
				_target addMagazineCargoGlobal ["11Rnd_45ACP_Mag",10];
			};
			_target addMagazineCargoGlobal ["20Rnd_762x51_Mag",40];
			_target addMagazineCargoGlobal ["150Rnd_762x54_Box",10];
			_target addMagazineCargoGlobal ["150Rnd_762x54_Box_Tracer",10];
			_target addMagazineCargoGlobal ["130Rnd_338_Mag",10];
			_target addMagazineCargoGlobal ["200Rnd_65x39_cased_Box",20];
			_target addMagazineCargoGlobal ["7Rnd_408_Mag",10];
			if !(isClass(configFile >> "CfgPatches" >> "ace_disposable")) then { _target addMagazineCargoGlobal ["NLAW_F",5]; };
			_target addMagazineCargoGlobal ["Titan_AA",5];
			_target addMagazineCargoGlobal ["Titan_AT",5];
			_target addMagazineCargoGlobal ["Titan_AP",5];
			//items
			_target addItemCargoGlobal ["bipod_01_F_blk",3];
			if (ADV_par_optics == 1) then {
				_target addItemCargoGlobal ["optic_MRD",5];
				_target addItemCargoGlobal ["optic_Aco_grn",5];
				_target addItemCargoGlobal ["optic_Holosight",5];
				_target addItemCargoGlobal ["optic_HAMR",3];
			};
		};
	};
	_target addMagazineCargoGlobal ["DemoCharge_Remote_Mag",5];
	_target addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",2];
	_target addMagazineCargoGlobal ["ATMine_Range_Mag",5];
	_target addMagazineCargoGlobal ["APERSTripMine_Wire_Mag",5];
	_target addMagazineCargoGlobal ["APERSMine_Range_Mag",5];
	//_target addItemCargoGlobal ["optic_LRPS",2];
		
	//grenades
	switch (ADV_par_indWeap) do {
		case 2: {
			_target addMagazineCargoGlobal ["rhs_mag_m67",20];
			_target addMagazineCargoGlobal ["rhs_mag_an_m8hc",20];
			_target addMagazineCargoGlobal ["rhs_mag_m18_green",20];
			_target addMagazineCargoGlobal ["rhs_mag_m18_red",20];
			_target addMagazineCargoGlobal ["rhs_mag_m18_purple",20];
			_target addMagazineCargoGlobal ["rhs_mag_m18_yellow",20];
		};
		default {
			_target addMagazineCargoGlobal ["HandGrenade",20];
			_target addMagazineCargoGlobal ["SmokeShell",20];
			_target addMagazineCargoGlobal ["SmokeShellGreen",20];
			_target addMagazineCargoGlobal ["SmokeShellRed",20];
			_target addMagazineCargoGlobal ["SmokeShellBlue",20];
			_target addMagazineCargoGlobal ["SmokeShellYellow",20];
		};
	};
	if !(isClass (configFile >> "CfgPatches" >> "ACE_attach")) then {
		_target addMagazineCargoGlobal ["I_IR_Grenade",10];
	};
	_target addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",40];
	_target addMagazineCargoGlobal ["UGL_FlareYellow_F",20];
	_target addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",20];
	_target addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",20];
	_target addMagazineCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",20];
	
	//uniform items
	switch (ADV_par_indUni) do {
		//BWmod Tropen
		case 1: {
			_target addItemCargoGlobal ["H_HelmetIA",5];		
			_target addBackpackCargoGlobal ["B_AssaultPack_rgr",3];		
		};
		default {
			_target addItemCargoGlobal ["H_HelmetSpecB",5];
			_target addBackpackCargoGlobal ["B_AssaultPack_rgr",3];
		};
	};

	//radios
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio") && (ADV_par_Radios == 1 || ADV_par_Radios == 3)) then {
		_target addBackpackCargoGlobal ["tf_anprc155_coyote",2];
	};
	if (ADV_par_Radios == 1 || ADV_par_Radios == 3) then {
		_target addItemCargoGlobal ["ItemRadio",4];
	};

	//ACE items (if ACE is running on the server) - (integers)
	if (isClass (configFile >> "CfgPatches" >> "ACE_common")) then {
		_ACE_EarPlugs = 1;

		_ACE_atropine = 30;
		_ACE_adenosine = 30;
		_ACE_fieldDressing = 50;
		_ACE_elasticBandage = 50;
		_ACE_quikclot = 50;
		_ACE_bloodIV = 10;
		_ACE_bloodIV_500 = 10;
		_ACE_bloodIV_250 = 20;
		_ACE_bodyBag = 10;
		_ACE_epinephrine = 30;
		_ACE_morphine = 30;
		_ACE_packingBandage = 50;
		_ACE_personalAidKit = 20;
		_ACE_plasmaIV = 10;
		_ACE_plasmaIV_500 = 10;
		_ACE_plasmaIV_250 = 20;
		_ACE_salineIV = 10;
		_ACE_salineIV_500 = 20;
		_ACE_salineIV_250 = 20;
		_ACE_surgicalKit = 10;
		_ACE_tourniquet = 20;

		_ACE_SpareBarrel = 5;
		_ACE_tacticalLadder = 3;
		_ACE_UAVBattery = 5;
		_ACE_wirecutter = 5;
		_ACE_sandbag = 30;
		_ACE_Clacker = 0;
		_ACE_M26_Clacker = 0;
		_ACE_DeadManSwitch = 0;
		_ACE_DefusalKit = 0;
		_ACE_Cellphone = 0;
		_ACE_MapTools = 0;
		_ACE_CableTie = 20;
		_ACE_NonSteerableParachute = 0;
		_ACE_EntrenchingTool = 5;
		
		_ACE_sprayPaintBlack = 5;
		_ACE_sprayPaintBlue = 5;
		_ACE_sprayPaintGreen = 5;
		_ACE_sprayPaintRed = 5;

		_ACE_key_west = 0;
		_ACE_key_east = 0;
		_ACE_key_indp = 0;
		_ACE_key_civ = 0;
		_ACE_key_master = 0;
		_ACE_key_lockpick = 0;
		_ACE_kestrel = 0;
		_ACE_ATragMX = 0;
		_ACE_rangecard = 4;
		_ACE_altimeter = 0;
		_ACE_microDAGR = 0;
		_ACE_DAGR = 0;
		_ACE_RangeTable_82mm = 5;
		_ACE_rangefinder = 0;
		_ACE_NonSteerableParachute = 0;
		_ACE_IR_Strobe = 10;
		_ACE_M84 = 0;
		_ACE_HandFlare_Green = 10;
		_ACE_HandFlare_Red = 10;
		_ACE_HandFlare_White = 10;
		_ACE_HandFlare_Yellow = 10;
		[_target] call ADV_fnc_addACEItems;
	};
	if !(isClass (configFile >> "CfgPatches" >> "ACE_medical")) then {
	_target addItemCargoGlobal ["FirstAidKit",20];
	_target addItemCargoGlobal ["MediKit",5];	
	};
	switch ( ADV_par_Tablets ) do {
		case 1: {
			if (isClass (configFile >> "CfgPatches" >> "cTab")) then {
				_target addItemCargoGlobal ["ItemAndroid",5];
				_target addItemCargoGlobal ["ItemcTab",5];
				_target addItemCargoGlobal ["ItemMicroDAGR",5];
				_target addItemCargoGlobal ["ItemcTabHCam",5];
			};
		};
		case 2: {
			if (isClass(configFile >> "CfgPatches" >> "ACE_DAGR")) then {
				_target addItemCargoGlobal ["ACE_DAGR",5];
			};
			if (isClass(configFile >> "CfgPatches" >> "ACE_microdagr")) then {
				_target addItemCargoGlobal ["ACE_microDAGR",5];
			};
		};
		case 99: {
			_target addItemCargoGlobal ["ItemGPS",5];
		};
	};
	
	//other stuff
	_target addItemCargoGlobal ["Toolkit",5];
	_target addItemCargoGlobal ["acc_flashlight",5];
	
} forEach _this;

if (true) exitWith {true;};