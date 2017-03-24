/*
ADV_fnc_radioHeadset - by Belbo
*/

if (!hasInterface) exitWith {};

params [
	["_unit", player, [objNull]]
];

adv_var_headsetOn = true;
adv_var_headsetSWVolume = if (call TFAR_fnc_haveSWRadio) then { (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume; } else { 8 };
adv_var_headsetLRVolume = if (call TFAR_fnc_haveLRRadio) then { [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1] call TFAR_fnc_getLrVolume; } else { 8 };

adv_script_fnc_headsetOff = {
	//sw radio
	if (call TFAR_fnc_haveSWRadio) then {
		adv_var_headsetSWVolume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
		[(call TFAR_fnc_ActiveSWRadio), 0] call TFAR_fnc_setSwVolume;
	};
	
	//lr and vehicle radio
	if (call TFAR_fnc_haveLRRadio) then {
		adv_var_headsetLRVolume = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1] call TFAR_fnc_getLrVolume;
		[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrVolume;
		if ( count (player call TFAR_fnc_VehicleLR) > 0 ) then { [(player call TFAR_fnc_VehicleLR) select 0, (player call TFAR_fnc_VehicleLR) select 1, 0] call TFAR_fnc_setLrVolume; };
	};
	
	player setVariable ["tf_unable_to_use_radio", true, true];
	
	systemChat "Headset lowered.";
	adv_var_headsetOn = false;
};

adv_script_fnc_headsetOn = {
	//sw radio
	if (call TFAR_fnc_haveSWRadio) then {
		[(call TFAR_fnc_ActiveSWRadio), adv_var_headsetSWVolume] call TFAR_fnc_setSwVolume;
	};
	
	//lr and vehicle radio
	if (call TFAR_fnc_haveLRRadio) then {
		[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, adv_var_headsetLRVolume] call TFAR_fnc_setLrVolume;
		if ( count (player call TFAR_fnc_VehicleLR) > 0 ) then { [(player call TFAR_fnc_VehicleLR) select 0, (player call TFAR_fnc_VehicleLR) select 1, adv_var_headsetLRVolume] call TFAR_fnc_setLrVolume; };
	};
	
	player setVariable ["tf_unable_to_use_radio", false, true];
	
	systemChat "Headset raised.";
	adv_var_headsetOn = true;
};

if ( isClass(configFile >> "CfgPatches" >> "ace_interact_menu") ) then {

	_lowerHeadset = ["lowerHeadsetSelfAction",("<t color=""#FF0000"">" + ("Lower Headset") + "</t>"),"",{
	
		call adv_script_fnc_headsetOff;
		
	},{ adv_var_headsetOn && (call TFAR_fnc_haveSWRadio || call TFAR_fnc_haveLRRadio) }] call ace_interact_menu_fnc_createAction;
	
	_raiseHeadset = ["raiseHeadsetSelfAction",("<t color=""#00FF00"">" + ("Raise Headset") + "</t>"),"",{

		call adv_script_fnc_headsetOn;
		
	},{ !adv_var_headsetOn && (call TFAR_fnc_haveSWRadio || call TFAR_fnc_haveLRRadio) }] call ace_interact_menu_fnc_createAction;
	
	[_unit , 1, ["ACE_SelfActions"],_lowerHeadset] call ace_interact_menu_fnc_addActionToObject;
	[_unit , 1, ["ACE_SelfActions"],_raiseHeadset] call ace_interact_menu_fnc_addActionToObject;

};

while { true } do {

	adv_handle_headsetActionOff = _unit addAction [("<t color=""#FF0000"">" + ("Lower Headset") + "</t>"), {
	
		call adv_script_fnc_headsetOff;

		},nil,-999,false,true,"","(call TFAR_fnc_haveSWRadio || call TFAR_fnc_haveLRRadio)"
	];
	
	waitUntil { sleep 1; !adv_var_headsetOn };
	_unit removeAction adv_handle_headsetActionOff;
	
	adv_handle_headsetActionOn = _unit addAction [("<t color=""#00FF00"">" + ("Raise Headset") + "</t>"), {

		call adv_script_fnc_headsetOn;
	
		},nil,-999,false,true,"","(call TFAR_fnc_haveSWRadio || call TFAR_fnc_haveLRRadio)"
	];
	
	waitUntil { sleep 1; adv_var_headsetOn};
	_unit removeAction adv_handle_headsetActionOn;
};

if (true) exitWith {};