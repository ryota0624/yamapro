private ["_device", "_switch"];

_device = _this select 0;
_switch = _this select 1;

//hint "FMP_LASER_Switch start";

if (_switch >= 0.5) then {
	_device animate ["ani_switch_laser1", 0];
	_device animate ["ani_switch_laser2", 0];
	_device animate ["ani_switch_laser3", 0];
	_device animate ["ani_switch_laser4", 0];
	_device animate ["ani_switch_laser5", 0];
	_device animate ["ani_switch_laser6", 0];
	_device animate ["ani_switch_laser7", 0];
	_device animate ["ani_switch_laser8", 0];
	_device animate ["ani_switch_laser9", 0];
	_device animate ["ani_switch_laser10", 0];
} else {
	_device animate ["ani_switch_laser1", 1];
	_device animate ["ani_switch_laser2", 1];
	_device animate ["ani_switch_laser3", 1];
	_device animate ["ani_switch_laser4", 1];
	_device animate ["ani_switch_laser5", 1];
	_device animate ["ani_switch_laser6", 1];
	_device animate ["ani_switch_laser7", 1];
	_device animate ["ani_switch_laser8", 1];
	_device animate ["ani_switch_laser9", 1];
	_device animate ["ani_switch_laser10", 1];
};
