//レーザーの色を変えるスクリプト

private ["_device", "_color", "_red", "_blue", "_green", "_alpha"];

_device = _this select 0;
_color = _this select 1;

//hint format["fn_FMP_LASER_Color: start device=%1 color=%2", _device, _color];

_fullcolor = _color ^ 3;

_red = (_fullcolor / 256) / 256;
_blue = (_fullcolor / 256) % 256;
_green = _fullcolor % 256;

_alpha = 0.5;

//hint format["fn_FMP_LASER_Color: _fullcolor=%1 red=%2 blue=%3 green=%4", _fullcolor, (_red/256), (_green/256), (_blue/256)];

call compile format ["_device setObjectTexture [0, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [1, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [2, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [3, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [4, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [5, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [6, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [7, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [8, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];
call compile format ["_device setObjectTexture [9, ""#(argb,8,8,3)color(%1,%2,%3,%4,CA)""];",(_red/256) ,(_green/256) ,(_blue/256), _alpha];

//hint "fn_FMP_LASER_Color end";