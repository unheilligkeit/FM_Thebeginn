params ["_pos1","_pos2","_pos3","_pos4","_pos5","_pos6"];

_color = [1,1,1];


while {true} do {


	_light1 = "#lightpoint" createVehicle getPos _pos1;
	_light1 setLightBrightness 5;
	_light1 setLightColor _color;
	_light1 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light1;


	_light2 = "#lightpoint" createVehicle getPos _pos2;
	_light2 setLightBrightness 5;
	_light2 setLightColor _color;
	_light2 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light2;


	_light3 = "#lightpoint" createVehicle getPos _pos3;
	_light3 setLightBrightness 5;
	_light3 setLightColor _color;
	_light3 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light3;


	_light4 = "#lightpoint" createVehicle getPos _pos4;
	_light4 setLightBrightness 5;
	_light4 setLightColor _color;
	_light4 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light4;

	_light5 = "#lightpoint" createVehicle getPos _pos5;
	_light5 setLightBrightness 5;
	_light5 setLightColor _color;
	_light5 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light5;

	_light6 = "#lightpoint" createVehicle getPos _pos6;
	_light6 setLightBrightness 5;
	_light6 setLightColor _color;
	_light6 setLightAmbient _color;
	sleep 1;
	deleteVehicle _light6;

	sleep random [60,90,120];
};
