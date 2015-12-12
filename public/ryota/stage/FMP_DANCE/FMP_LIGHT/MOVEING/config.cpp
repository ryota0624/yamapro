#include "basicDefines.hpp"

class CfgPatches {
	class FMP_LIGHT {
		units[] = {"FMP_MOVING_Light"};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
	};
};


class cfgWeapons
{
	class Default;
	class PistolCore;
	class RifleCore;
	class MGunCore;
	class LauncherCore;
	class GrenadeCore;
	class CannonCore;
	class MGun: MGunCore {};

	// searchlights BEGIN
	class SEARCHLIGHT: MGun
	{
		scope = protected;
		displayName = $STR_DN_SEARCHLIGHT;
	};
};

class CfgVehicles
{
	/*extern*/ class Land;
	class LandVehicle: Land {
		/*extern*/ class NewTurret;
	}
	class StaticWeapon : LandVehicle {};
	class FMP_Light : StaticWeapon{};
	class FMP_MOVING_Light: FMP_Light
	{
		vehicleClass = "FMP_LIGHT";
		
		DisplayName="Moving Light White";
  		scope = public;
		side = 1;
		crew = "USMC_Soldier_Light";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light.p3d";
		picture="\FMP_DANCE\FMP_LIGHT\MOVEING\fmp_moving_picture.paa";
		icon="\FMP_DANCE\FMP_LIGHT\MOVEING\fmp_moving_icon.paa";
		mapSize = 0.5;
		nameSound="light";
		typicalCargo[]={USMC_Soldier_Light};
		//displayName=$STR_DN_SEARCHLIGHT;
		gunnerHasFlares = true;

		//cobraLight = "testlight\cobraSvetlo.p3d";
		/**
		class Turrets
		{
			class MainTurret : NewTurret
			{
			  weapons[]={SEARCHLIGHT};
				minElev=-10;
				minTurn=-180; maxTurn=+180; initTurn=0;
				gunnerAction = "searchlight_Gunner";
			};
		};
		*/
		class AnimationSources {

			class light_src {
				source = "user";
				animPeriod = 0.4;
				initPhase = 0;
			};
		};//End AnimationSources
		
		
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 1.0, 1.0, 1.0};
				ambient[] = {0.3, 0.3, 0.3, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
		//class Library {libTextDesc = $STR_LIB_SEARCHLIGHT;};
	};

	class FMP_MOVING_Light_Red: FMP_MOVING_Light
	{
		DisplayName="Moving Light Red";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Red.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 0, 0, 1.0};
				ambient[] = {0.3, 0, 0, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Green: FMP_MOVING_Light
	{
		DisplayName="Moving Light Green";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Green.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {0, 1.0, 0, 1.0};
				ambient[] = {0, 0.3, 0, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Blue: FMP_MOVING_Light
	{
		DisplayName="Moving Light Blue";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Blue.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {0, 0, 1.0, 1.0};
				ambient[] = {0, 0, 0.3, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Purple: FMP_MOVING_Light
	{
		DisplayName="Moving Light Purple";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Purple.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 0, 1.0, 1.0};
				ambient[] = {0.3, 0, 0.3, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Aqua: FMP_MOVING_Light
	{
		DisplayName="Moving Light Aqua";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Aqua.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {0, 1.0, 1.0, 1.0};
				ambient[] = {0, 0.3, 0.3, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Yellow: FMP_MOVING_Light
	{
		DisplayName="Moving Light Yellow";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Yellow.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 1.0, 0, 1.0};
				ambient[] = {0.3, 0.3, 0, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Lamp: FMP_MOVING_Light
	{
		DisplayName="Moving Light Lamp";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Lamp.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 1.0, 0, 1.0};
				ambient[] = {0.1, 0.1, 0.1, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};
	
	class FMP_MOVING_Light_Pink: FMP_MOVING_Light
	{
		DisplayName="Moving Light Pink";
		model="\FMP_DANCE\FMP_LIGHT\MOVEING\FMP_MOVING_Light_Pink.p3d";
	  	class Reflectors
		{
			class main_reflector
			{
				color[] = {1.0, 1.0, 0, 1.0};
				ambient[] = {1.0, 0.5, 0.75, 1.0};
				position = "light";
				direction = "lightEnd";
				hitpoint = "light";
				selection = "light";
				sourceSize = 0.1;
				size = 0.1;
				brightness = 1.0;
			};
		};
	};

	
};//End CfgVehcile