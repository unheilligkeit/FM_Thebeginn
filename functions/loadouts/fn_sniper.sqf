﻿/*
unit loadout script by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set _primaryweaponAmmo to 0 and add those
magazines one for one in _items.
*/

//clothing - (string)
_uniform = switch (true) do {
	//case ((toUpper worldname) in ADV_var_aridMaps): {};
	default {["U_B_GhillieSuit"];};
};
_vest = ["V_PlateCarrier2_rgr","V_PlateCarrier1_rgr"];
_headgear = ["H_Watchcap_khk"];
_backpack = ["B_AssaultPack_blk"];
_insignium = "";
_useProfileGoggles = 1;		//If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "";
_unitTraits = [["medic",true],["engineer",true],["explosiveSpecialist",true],["UAVHacker",true],["camouflageCoef",1.5],["audibleCoef",0.5],["loadCoef",0.9]];

//weapons - primary weapon - (string)
_primaryweapon = "srifle_LRR_F";

//primary weapon items - (array)
_optic = [""];
_attachments = ["optic_LRPS"];
_silencer = "";		//if silencer is added

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_primaryweaponAmmo = [7,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 0;
_40mmSmokeGrenadesWhite = 0;
_40mmSmokeGrenadesYellow = 0;
_40mmSmokeGrenadesOrange = 0;
_40mmSmokeGrenadesRed = 0;
_40mmSmokeGrenadesPurple = 0;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 0;
_40mmFlareWhite = 0;
_40mmFlareYellow = 0;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "hgun_Pistol_heavy_01_F";

//handgun items - (array)
_itemsHandgun = ["optic_MRD","muzzle_snds_acp"];
_handgunSilencer = "";		//if silencer is added

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = [4,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//weapons - launcher - (string)
_launcher = "";

//launcher ammo (if a launcher is given) - (integer) 
_launcherAmmo = [0,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//binocular - (string)
_binocular = "Laserdesignator";

//throwables - (integer)
_grenadeSet = 0;		//contains 2 HE grenades, 1 white and one coloured smoke grenade and 1 red chemlight. Select 0 if you want to define your own grenades.
_grenades = ["HE","HE","WHITE","WHITE","GREEN","RED"];		//depending on the custom loadout the colours may be merged.
_chemlights = ["RED"];
_IRgrenade = 1;

//first aid kits and medi kits- (integer)
_FirstAidKits = 2;
_MediKit = 0;		//if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
_itemsUniform = [];

//items added specifically to vest: - (array)
_itemsVest = [];

//items added specifically to Backpack: - (array)
_itemsBackpack = [];

//linked items (don't put "ItemRadio" in here, as it's set with _equipRadio) - (array)
_itemsLink = [
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap"
];
		
//items added to any container - (array)
_items = ["NVGoggles_OPFOR"];

//MarksmenDLC-objects:
if (304400 in (getDLCs 1) || 332350 in (getDLCs 1)) then {
	_uniform = switch (true) do {
		case ((toUpper worldname) == "ALTIS"): {["U_B_FullGhillie_ard","U_B_FullGhillie_sard"]};
		case ((toUpper worldname) in ADV_var_aridMaps): {["U_B_FullGhillie_ard"]};
		case ((toUpper worldname) in ADV_var_sAridMaps): {["U_B_FullGhillie_sard"]};
		case ((toUpper worldname) in ADV_var_lushMaps): {["U_B_FullGhillie_lsh"]};
		default {["U_B_FullGhillie_lsh","U_B_FullGhillie_sard"]};
	};
};

	//CustomMod items//

//ACRE radios
_ACREradios = ["ACRE_PRC343","ACRE_PRC148"];	//_this select 0=shortrange radio;_this select 1=leader radio;_this select 2=backpackRadio;
//TFAR items
_givePersonalRadio = true;
_giveRiflemanRadio = false;
_tfar_microdagr = 0;		//adds the tfar microdagr to set the channels for a rifleman radio

//ACE items (if ACE is running on the server) - (integers)
_ACE_EarPlugs = 1;

_ace_FAK = 0;		//overwrites the values for bandages, morphine and tourniquet and adds a specified number of bandages and morphine. Defined in fn_aceFAK.sqf
_ACE_fieldDressing = 4;
_ACE_packingBandage = 8;
_ACE_elasticBandage = 8;
_ACE_quikclot = 6;
_ACE_atropine = 0;
_ACE_adenosine = 0;
_ACE_epinephrine = 2;
_ACE_morphine = 2;
_ACE_tourniquet = 2;
_ACE_bloodIV = 0;
_ACE_bloodIV_500 = 0;
_ACE_bloodIV_250 = 0;
_ACE_plasmaIV = 0;
_ACE_plasmaIV_500 = 0;
_ACE_plasmaIV_250 = 0;
_ACE_salineIV = 0;
_ACE_salineIV_500 = 0;
_ACE_salineIV_250 = 0;
_ACE_bodyBag = 0;
_ACE_personalAidKit = 0;
_ACE_surgicalKit = 1;

_ACE_SpareBarrel = 0;
_ACE_EntrenchingTool = 0;
_ACE_UAVBattery = 0;
_ACE_wirecutter = 0;
_ACE_Clacker = 0;
_ACE_M26_Clacker = 0;
_ACE_DeadManSwitch = 0;
_ACE_DefusalKit = 1;
_ACE_Cellphone = 0;
_ACE_MapTools = 1;
_ACE_CableTie = 2;
_ACE_sprayPaintColor = "NONE";

_ACE_key = 3;	//0 = no key, 1 = side dependant key, 2 = master key, 3 = lockpick
_ACE_flashlight = 1;
_ACE_kestrel = 1;
_ACE_altimeter = 0;
_ACE_ATragMX = 0;
_ACE_rangecard = 1;
_ACE_DAGR = 0;
_ACE_microDAGR = 1;
_ACE_RangeTable_82mm = 0;
_ACE_MX2A = 0;
_ACE_HuntIR_monitor = 0;
_ACE_HuntIR = 0;
_ACE_m84 = 0;
_ACE_HandFlare_Green = 0;
_ACE_HandFlare_Red = 0;
_ACE_HandFlare_White = 0;
_ACE_HandFlare_Yellow = 0;

//AGM Variables (if AGM is running) - (bool)
_ACE_isMedic = 1;	//0 = no medic; 1 = medic; 2 = doctor;
_ACE_isEngineer = 1;	//0 = no specialist; 1 = engineer; 2 = repair specialist;
_ACE_isEOD = true;
_ACE_isPilot = false;

//Tablet-Items
_tablet = false;
_androidDevice = true;
_microDAGR = false;
_helmetCam = true;

//scorch inv items
_scorchItems = ["sc_dogtag","sc_mre"];
_scorchItemsRandom = ["sc_cigarettepack","sc_chips","sc_charms","sc_candybar","","",""];

//Addon Content:
switch (ADV_par_customWeap) do {
	case 1: {
		//BWmod
		_primaryweapon = "BWA3_G82_equipped";
		_attachments = ["BWA3_optic_24x72_NSV"];
		_handgun = "BWA3_P8";
		_itemsHandgun = [];
	};
	case 2: {
		//RHS Army
		_primaryWeapon = switch (true) do {
			case ((toUpper worldname) in ADV_var_lushMaps): {"rhs_weap_XM2010_wd";};
			case ((toUpper worldname) in ADV_var_aridMaps): {"rhs_weap_XM2010_d"};
			default {["rhs_weap_XM2010","rhs_weap_XM2010_sa"]};
		};
		_attachments = switch (true) do {
			case ((toUpper worldname) in ADV_var_aridMaps): {["rhsusf_acc_LEUPOLDMK4_2_d"]};
			default {["rhsusf_acc_LEUPOLDMK4_2"]};
		};
		_attachments pushback "rhsusf_acc_harris_bipod";
		_silencer = "rhsusf_acc_M2010S";
		_handgun = "rhsusf_weap_m9";
		_itemsHandgun = [""];
		_handgunSilencer = "";
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = "RH_m9";
			_itemsHandgun = ["RH_x300","RH_m9qd"];
		};
	};
	case 3: {
		//RHS Marines
		_primaryweapon = ["rhs_weap_M107"];
		_attachments = ["rhsusf_acc_premier"];
		_silencer = "";
		_handgun = "rhsusf_weap_m1911a1";
		_itemsHandgun = [""];
		_handgunSilencer = "";
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = "RH_m9";
			_itemsHandgun = ["RH_x300","RH_m9qd"];
		};
	};
	case 4: {
		//RHS SOF
		_primaryweapon = ["rhs_weap_M107"];
		_attachments = ["rhsusf_acc_premier"];
		_silencer = "";
		_handgun = "rhsusf_weap_m9";
		_itemsHandgun = [""];
		_handgunSilencer = "";
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = "RH_m9";
			_itemsHandgun = ["RH_x300","RH_m9qd"];
		};
	};
	case 5: {
		//SELmods CUP Mk16
		_attachments = ["CUP_optic_LeupoldMk4_10x40_LRT_Woodland"];
		if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT","bipod_02_F_blk"]; };
		switch (toUpper (worldname)) do {
			case "TAKISTAN": {_primaryweapon = "CUP_srifle_M24_des"; if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT_tan","bipod_02_F_blk"]; };};
			case "ZARGABAD": {_primaryweapon = "CUP_srifle_M24_des"; if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT_tan","bipod_02_F_blk"]; };};
			default {_primaryweapon = "CUP_srifle_M24_wdl";};
		};
		_handgun="CUP_hgun_Phantom";
		_itemsHandgun=["CUP_acc_CZ_M3X","muzzle_snds_L"];
		_binocular="CUP_SOFLAM";
	};
	case 6: {
		//SELmods CUP M4
		_attachments = ["CUP_optic_LeupoldMk4_10x40_LRT_Woodland"];		
		if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT","bipod_02_F_blk"]; };
		switch (toUpper (worldname)) do {
			case "TAKISTAN": {_primaryweapon = "CUP_srifle_M24_des"; if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT_tan","bipod_02_F_blk"]; };};
			case "ZARGABAD": {_primaryweapon = "CUP_srifle_M24_des"; if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["FHQ_optic_LeupoldERT_tan","bipod_02_F_blk"]; };};
			default {_primaryweapon = "CUP_srifle_M24_wdl";};
		};
		_handgun="CUP_hgun_Phantom";
		_itemsHandgun=["CUP_acc_CZ_M3X","muzzle_snds_L"];
		_binocular="CUP_SOFLAM";
	};
	case 7: {
		//BAF
		_primaryweapon = "CUP_srifle_AS50";
		if (isClass(configFile >> "CfgPatches" >> "iansky_opt")) then { _attachments = ["iansky_nfbeast"]; };
		_silencer = "CUP_muzzle_snds_AWM";		//if silencer is added
		_handgun="CUP_hgun_Phantom";
		_itemsHandgun=["CUP_acc_CZ_M3X","muzzle_snds_L"];
		_handgunSilencer = "";		//if silencer is added
		_binocular="CUP_SOFLAM";
	};
	case 8: {
		//UK3CB
		_primaryweapon = ["UK3CB_BAF_L115A3_Ghillie","UK3CB_BAF_L115A3"];
		_silencer = "UK3CB_BAF_Silencer_L115A3";
		_handgun = "UK3CB_BAF_L131A1";
		_itemsHandgun=["UK3CB_BAF_Flashlight_L131A1","muzzle_snds_L"];
		_binocular = "UK3CB_BAF_Soflam_Laserdesignator";
	};
	case 9: {
		_primaryWeapon = ["hlc_rifle_psg1"];
		_optic = [""];
		_attachments = [""];
		_silencer = "";
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = ["RH_muzi"];
			_itemsHandgun = [""];
			_handgunSilencer = "";
		};
	};
	default {};
};
switch (ADV_par_customUni) do {
	case 1: {
		//BWmod Tropen
		_uniform = ["BWA3_Uniform_Ghillie_idz_Tropen"];
		_vest = ["BWA3_Vest_Marksman_Tropen"];
		_backpack = ["BWA3_PatrolPack_Tropen"];
		_headgear = ["BWA3_Booniehat_Tropen"];
		if ( isClass(configFile >> "CfgPatches" >> "Dsk_lucie_config") ) then { _items = _items-["NVGoggles_OPFOR"]+["dsk_nsv"]; };
	};
	case 2: {
		//BWmod Fleck
		_uniform = ["BWA3_Uniform_Ghillie_idz_Fleck"];
		_vest = ["BWA3_Vest_Marksman_Fleck"];
		_backpack = ["BWA3_PatrolPack_Fleck"];
		_headgear = ["BWA3_Booniehat_Fleck"];
		if ( isClass(configFile >> "CfgPatches" >> "Dsk_lucie_config") ) then { _items = _items-["NVGoggles_OPFOR"]+["dsk_nsv"]; };
	};
	case 3: {
		//TFA Mixed
		_vest = ["TFA_PlateCarrierH_MCam","TFA_PlateCarrierH_Tan","TFA_PlateCarrierH_Grn","TFA_PlateCarrierH_NWU2"];
	};
	case 4: {
		//TFA Woodland
		_vest = ["TFA_PlateCarrierH_fol","TFA_PlateCarrierH_Grn","TFA_PlateCarrierH_Mix"];
	};
	case 5: {
		//TFA Desert
		_vest = ["TFA_PlateCarrierH_NWU2","TFA_PlateCarrierH_MCam","TFA_PlateCarrierH_Tan","TFA_PlateCarrierH_Mix"];
	};
	case 6: {
		//TFA ACU
		_vest = ["TFA_PlateCarrierH_ACU"];
	};
	case 7: {
		//RHS OCP
		_vest = ["rhsusf_iotv_ocp_Squadleader"];
		_backpack = ["rhsusf_falconii"];
		_items = _items-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_14"];
	};
	case 8: {
		//RHS UCP
		_vest = ["rhsusf_iotv_ucp_Squadleader"];
		_backpack = ["rhsusf_falconii"];
		_items = _items-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_14"];
	};
	case 10: {
		//RHS MARPAT Desert
		_vest = ["rhsusf_spc_rifleman"];
		_backpack = ["rhsusf_falconii"];
		_headgear = ["rhs_Booniehat_marpatd"];
		_items = _items-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_15"];
	};	
	case 11: {
		//RHS MARPAT Woodland
		_vest = ["rhsusf_spc_rifleman"];
		_backpack = ["rhsusf_falconii"];
		_headgear = ["rhs_Booniehat_marpatwd"];
		_items = _items-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_15"];
	};
	case 9: {
		//Guerilla
		_headgear = ["H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Cap_headphones","H_MilCap_mcamo","H_MilCap_gry","H_MilCap_blue","H_Cap_tan_specops_US",
			"H_Cap_usblack","H_Cap_oli_hs","H_Cap_blk","H_Booniehat_tan","H_Booniehat_oli","H_Booniehat_khk","H_Watchcap_khk","H_Watchcap_cbr","H_Watchcap_camo"];
		_binocular = "Rangefinder";
	};
	case 12: {
		//UK3CB
		_uniform = ["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM"];
		_vest = ["UK3CB_BAF_V_Osprey_Marksman_A"];
		_headgear = ["UK3CB_BAF_H_Beret_RM_Officer"];
		_backpack = ["UK3CB_BAF_B_Bergen_MTP_JTAC_H_A"];
		_items = _items-["NVGoggles_OPFOR"]+["UK3CB_BAF_HMNVS"];
	};
	case 13: {
		//TRYK SpecOps
		_vest append ["TRYK_V_Sheriff_BA_TBL","TRYK_V_Sheriff_BA_TB3","TRYK_V_tacv1_BK","TRYK_V_tacv10LC_OD","TRYK_V_ArmorVest_Brown2",
			"TRYK_V_ArmorVest_Ranger2","TRYK_V_ArmorVest_rgr","TRYK_V_ArmorVest_khk","TRYK_V_ArmorVest_coyo","TRYK_V_IOTV_BLK"];
		_headgear append ["TRYK_R_CAP_OD_US","TRYK_R_CAP_BLK","H_Cap_headphones","H_Cap_oli_hs","H_Cap_blk","TRYK_ESS_CAP_tan",
			"TRYK_H_PASGT_COYO","TRYK_H_PASGT_OD"];
	};
	case 14: {
		//TRYK Snow
		_uniform = ["TRYK_U_B_PCUHsW6","TRYK_U_B_PCUHsW4","TRYK_U_B_PCUHsW","TRYK_U_B_PCUHsW5"];
		_vest = ["TRYK_V_ArmorVest_Winter"];
		_headgear = ["TRYK_H_woolhat_WH"];
		_backpack = ["TRYK_Winter_pack"];
		_useProfileGoggles = 0;
		_goggles = ["TRYK_kio_balaclava_WH"];
	};
	default {};
};

///// No editing necessary below this line /////

_player = _this select 0;
[_player] call ADV_fnc_gear;
CL_IE_Module_Enabled = true;

true;