private ["_laser", "_time", "_counttime"];

_laser = _this select 0;
_time = _this select 1;

_counttime = 0;

while {_time > _counttime} do 
{

	sleep 2.5;

	_laser animate ["ani_role_laser1", 0];
	_laser animate ["ani_role_laser2", 0];
	_laser animate ["ani_role_laser3", 0];
	_laser animate ["ani_role_laser4", 0];
	_laser animate ["ani_role_laser5", 0];
	_laser animate ["ani_role_laser6", 0];
	_laser animate ["ani_role_laser7", 0];
	_laser animate ["ani_role_laser8", 0];
	_laser animate ["ani_role_laser9", 0];
	_laser animate ["ani_role_laser10", 0];

	sleep 2.5;

	_laser animate ["ani_role_laser1", 1];
	_laser animate ["ani_role_laser2", 1];
	_laser animate ["ani_role_laser3", 1];
	_laser animate ["ani_role_laser4", 1];
	_laser animate ["ani_role_laser5", 1];
	_laser animate ["ani_role_laser6", 1];
	_laser animate ["ani_role_laser7", 1];
	_laser animate ["ani_role_laser8", 1];
	_laser animate ["ani_role_laser9", 1];
	_laser animate ["ani_role_laser10", 1];

	_counttime = _counttime + 1;
};

hint "end";

exit;

