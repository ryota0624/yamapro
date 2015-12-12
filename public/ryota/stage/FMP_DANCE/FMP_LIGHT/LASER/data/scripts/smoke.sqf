

private ["_obj", "_pos", "_time"];

//_obj = vehicle player;
_obj = _this select 0;
_pos = position _obj;
_time = _this select 1;
	
/**
	_wave = "#particlesource" createVehicleLocal getpos _obj;

	_wave setParticleRandom [0.3, [1, 1, 0], [0.5, 0.5, 0], 0, 0.3, [0, 0, 0, 0], 0, 0];
	_wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0], "", "Billboard", 1, 1.6, "destructionEffect1",
			[0, 0, 0], 0, 10, 7.9, 0.075, [3,8],
			[[0.7,0.8,1,0.6],[0.85,0.9,1,0.0]], [1000], 1, 0, "", "", _pos];
	_wave setparticlecircle [2,[0,16,0]];
	_wave setDropInterval 0.0015;

	_splash = "#particlesource" createVehicleLocal getpos _obj;

	_splash setParticleRandom [2, [2, 2, 0], [2, 2, 7], 0, 0.5, [0, 0, 0, 0], 0, 0];
	_splash setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 13, 6, 0], "", "Billboard", 1, 4, "destructionEffect1",
			[0, 0, 0], 0, 30, 7.9, 0.075, [8,15],
			[[0.7,0.7,0.7,1],[1,1,1,0]], [1000], 1, 0, "", "", _pos];
	_splash setparticlecircle [2,[0,3,15]];
	_splash setDropInterval 0.002;

	sleep 0.2;
	//deletevehicle _wave;deletevehicle _splash;
*/



_ps1 = "#particlesource" createVehicleLocal getpos _obj;
_ps1 setparticlecircle [2,[3,3,1]];
//_ps1 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps1 setParticleRandom [2, [2, 2, 0], [2, 2, 7], 0, 0.5, [0, 0, 0, 0], 0, 0];
//_ps1 setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
_ps1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
                        "",
                        "billboard",
                         1,
                         8,
                         [0, 0, 0],
                         [0, 0, 1],
                         0,
                         70,
                         7.9,
                         0.5,
                         [4, 12, 20],
                         [[1.0, 0.8, 0.6, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]],
                         [0.125],
                         1,
                         0,
                         "",
                         "",
                         _pos];
_ps1 setDropInterval 0.001;

sleep 60.7;
deletevehicle _ps1;
/*

_ps1 = "#particlesource" createVehicleLocal getpos _obj;
_ps1 setParticleCircle [0, [0, 0, 0]];
//_ps1 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps1 setParticleRandom [2, [2, 2, 0], [2, 2, 7], 0, 0.5, [0, 0, 0, 0], 0, 0];
//_ps1 setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
_ps1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], 
                        "",
                        "billboard",
                         1,
                         8,
                         [0, 0, 0],
                         [0, 0, 2.5],
                         0,
                         70,
                         7.9,
                         0.5,
                         [4, 12, 20],
                         [[0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]],
                         [0.125],
                         1,
                         0,
                         "",
                         "",
                         _pos];
_ps1 setDropInterval 0.04;
*/
