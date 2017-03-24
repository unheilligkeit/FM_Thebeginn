[] spawn {
    while {true} do {
        waitUntil {sleep 1; flo_var_sound == 1};
        while {flo_var_sound == 1} do {
            [{sound say3D "club"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
            sleep 236;
            [{sound say3D "club2"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
            sleep 130;

        };
    };
};