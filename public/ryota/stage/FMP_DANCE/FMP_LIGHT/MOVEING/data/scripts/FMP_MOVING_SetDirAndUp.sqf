private ["_device", "_dir", "_up"];

_device = _this select 0;
_dir = _this select 1;
_up = _this select 2;

_device animate ["LightTurret", rad _dir];
_device animate ["LightGun", rad _up];

