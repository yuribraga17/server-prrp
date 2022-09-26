// Vehicle Library - Transmission and Speed Detection
// (C) Copyright 2010, Luka P. 

#if defined _VEH_LIB_INCLUDED_ALREADY
	#endinput
#endif
#define _VEH_LIB_INCLUDED_ALREADY

#pragma library VEH_LIB

#include "a_samp.inc"

// Definitions
#if (!defined USE_MPH && !defined USE_KMPH) || (defined USE_MPH && defined USE_KMPH)
	#define USE_KMPH
#endif

#define VEH_STATE_DRIVING_FORWARD       (01)
#define VEH_STATE_NOT_DRIVING           (00)
#define VEH_STATE_DRIVING_BACKWARDS     (-1)

// Enumerator
enum E_VEHICLE_INFO{E_VEHICLE_TRACKING, E_VEHICLE_BACKWARDS, E_VEHICLE_SPEED, E_VEHICLE_TRANS};

new VehicleInfo[MAX_VEHICLES][E_VEHICLE_INFO];
forward UpdateVehicle(vehicleid);

// 	Callbacks offered by this library:
//
	forward OnVehicleTransmissionChange(vehicleid, newtrans, oldtrans);
	forward OnVehicleSpeedChange(vehicleid, newspeed, oldspeed);
//
//  [!] OnVehicleSpeedChange gets called many times in a second, you can simply compare it to native SA-MP OnPlayerUpdate callback
//  [!] You should use it sparely, for most cases when there is a need to get vehicle speed, you can use ReturnVehicleSpeed function


// 	First function has been done by Joker (you can find it on SA-MP forum, but in more read-able way), and the second one I did. Sorry for 1 line functions, but I like that, and obviously you don't have to change anything here, but if you want, you can contact me to get more read-able version, or even indent it yourself :)
#pragma tabsize 0
stock IsVehicleDrivingBackwards(vehicleid){new Float:Float[3];if(GetVehicleVelocity(vehicleid, Float[1], Float[2], Float[0])){GetVehicleZAngle(vehicleid, Float[0]);if(Float[0] < 90){if(Float[1] > 0 && Float[2] < 0) return true;}else if(Float[0] < 180){if(Float[1] > 0 && Float[2] > 0) return true;}else if(Float[0] < 270){if(Float[1] < 0 && Float[2] > 0) return true;}else if(Float[1] < 0 && Float[2] < 0) return true;}return false;}
stock ReturnVehicleSpeed(vehicleid,type=1){new Float:memory[3]={0.00,0.00,0.00 },result_speed=0;GetVehicleVelocity(vehicleid,memory[0],memory[1],memory[2]);switch(type){case 1:{result_speed=floatround(floatround(floatsqroot(((memory[0]*memory[0])+(memory[1]*memory[1]))+(memory[2]*memory[2]))*(136.666667),floatround_round)*(1.609344));}case 2:{result_speed=floatround(floatsqroot(((memory[0]*memory[0])+(memory[1]*memory[1]))+(memory[2]*memory[2]))*(136.666667),floatround_round);}}return result_speed;}

// 	You can use above functions to determinate is vehicle driving backwards (obviously, the function name says all)
// 	and you can use second function to return the vehicle speed, in kilometers or even miles (use type 1 for kmph and type 2 for mph)

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger){if(!ispassenger){VehicleInfo[vehicleid][E_VEHICLE_TRACKING] = 1;SetTimerEx("UpdateVehicle", 10, 0, "i", vehicleid);}if(funcidx("VEH_LIB_OnPlayerEnterVehicle") != -1){return CallLocalFunction("Streamer_OnPlayerEnterVehicle", "iii", playerid, vehicleid, ispassenger);}return 1;}
public OnPlayerExitVehicle(playerid, vehicleid){if(VehicleInfo[vehicleid][E_VEHICLE_TRACKING]) VehicleInfo[vehicleid][E_VEHICLE_TRACKING] = 0;if(funcidx("VEH_LIB_OnPlayerExitVehicle") != -1){return CallLocalFunction("VEH_LIB_OnGameModeInit", "ii", playerid, vehicleid);}return 1;}
#pragma tabsize 4

public UpdateVehicle(vehicleid)
{
	static tmp[2];

	tmp[0] = VehicleInfo[vehicleid][E_VEHICLE_SPEED];
	tmp[1] = VehicleInfo[vehicleid][E_VEHICLE_TRANS];    
	
	#if defined USE_MPH && !defined USE_KMPH
		VehicleInfo[vehicleid][E_VEHICLE_SPEED] = ReturnVehicleSpeed(vehicleid, 2);
	#elseif !defined USE_MPH && defined USE_KMPH
        VehicleInfo[vehicleid][E_VEHICLE_SPEED] = ReturnVehicleSpeed(vehicleid, 1);
	#endif
	
	if(tmp[0] != VehicleInfo[vehicleid][E_VEHICLE_SPEED])
	    CallRemoteFunction("OnVehicleSpeedChange", "iii", vehicleid, VehicleInfo[vehicleid][E_VEHICLE_SPEED], tmp[0]);
	
	if(VehicleInfo[vehicleid][E_VEHICLE_SPEED] != 0)
	{
		if(!IsVehicleDrivingBackwards(vehicleid))
		    VehicleInfo[vehicleid][E_VEHICLE_TRANS] = 1;
		else
		    VehicleInfo[vehicleid][E_VEHICLE_TRANS] = -1;
	}
	else
	    VehicleInfo[vehicleid][E_VEHICLE_TRANS] = 0;
	    
	if(tmp[1] != VehicleInfo[vehicleid][E_VEHICLE_TRANS])
	    CallRemoteFunction("OnVehicleTransmissionChange", "iii", vehicleid, VehicleInfo[vehicleid][E_VEHICLE_TRANS], tmp[1]);
	
	if(VehicleInfo[vehicleid][E_VEHICLE_TRACKING]) SetTimerEx("UpdateVehicle", 10, 0, "i", vehicleid);
	return 1;
}

#if defined _ALS_OnPlayerEnterVehicle
	#undef OnPlayerEnterVehicle
#else
	#define _ALS_OnPlayerEnterVehicle
#endif
#define OnPlayerEnterVehicle VEH_LIB_OnPlayerEnterVehicle
#if defined _ALS_OnPlayerExitVehicle
	#undef OnPlayerExitVehicle
#else
	#define _ALS_OnPlayerExitVehicle
#endif
#define OnPlayerExitVehicle VEH_LIB_OnPlayerExitVehicle

forward VEH_LIB_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
forward VEH_LIB_OnPlayerExitVehicle(playerid, vehicleid);




