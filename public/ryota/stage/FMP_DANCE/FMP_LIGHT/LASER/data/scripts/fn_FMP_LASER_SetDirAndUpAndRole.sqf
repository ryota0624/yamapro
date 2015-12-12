private ["_device", "_dir", "_up", "_role"];

//hint "FMP_LASER_SetDirAndUpAndRole Start";

_device = _this select 0;
_dir = _this select 1;
_up = _this select 2;
_role = _this select 3;

_role = rad _role;

if (_up >= 1) then {
	_up = ((_up / 360)/2) + 0.5;
};
if (_up <= -1) then {
	_up = 0.5 - (-_up / 360)/2;
};

if (_dir >= 1) then {
	_dir = ((_dir / 360) /2) + 0.5;
};
if (_dir <= -1) then {
	_dir = 0.5 - (-_dir / 360) / 2;
};


//hint "FMP_LASER_SetDirAndUpAndRole 1";

_device animate ["ani_role_laser1", _role];
_device animate ["ani_role_laser2", _role];
_device animate ["ani_role_laser3", _role];
_device animate ["ani_role_laser4", _role];
_device animate ["ani_role_laser5", _role];
_device animate ["ani_role_laser6", _role];
_device animate ["ani_role_laser7", _role];
_device animate ["ani_role_laser8", _role];
_device animate ["ani_role_laser9", _role];
_device animate ["ani_role_laser10", _role];

_device animate ["ani_pitch_laser1", _up];
_device animate ["ani_pitch_laser2", _up];
_device animate ["ani_pitch_laser3", _up];
_device animate ["ani_pitch_laser4", _up];
_device animate ["ani_pitch_laser5", _up];
_device animate ["ani_pitch_laser6", _up];
_device animate ["ani_pitch_laser7", _up];
_device animate ["ani_pitch_laser8", _up];
_device animate ["ani_pitch_laser9", _up];
_device animate ["ani_pitch_laser10", _up];

_device animate ["ani_yaw_laser1", _dir];
_device animate ["ani_yaw_laser2", _dir];
_device animate ["ani_yaw_laser3", _dir];
_device animate ["ani_yaw_laser4", _dir];
_device animate ["ani_yaw_laser5", _dir];
_device animate ["ani_yaw_laser6", _dir];
_device animate ["ani_yaw_laser7", _dir];
_device animate ["ani_yaw_laser8", _dir];
_device animate ["ani_yaw_laser9", _dir];
_device animate ["ani_yaw_laser10", _dir];


//hint "FMP_LASER_SetDirAndUpAndRole end";