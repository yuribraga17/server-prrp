/**********************************************************************************************************************************
 *                                                                                                                                *
 *                                                            ATM Core                                                            *
 *                                                                                                                                *
 * Copyright © 2017 Abyss Morgan. All rights reserved.                                                                            *
 *                                                                                                                                *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/SAM                                                         *
 * Publication: None                                                                                                              *
 * Website: http://8.ct8.pl                                                                                                       *
 *                                                                                                                                *
 * Plugins: None                                                                                                                  *
 * Modules: None                                                                                                                  *
 *                                                                                                                                *
 * File Version: 1.4.2                                                                                                            *
 * SA:MP Version: 0.3.7 (REQUIRE)                                                                                                 *
 *                                                                                                                                *
 * Functions:                                                                                                                     *
 * SecToTimeDay(second);      //Use: %d:%02d:%02d:%02d                                                                            *
 * MSToTimeDay(millisecond);  //Use: %d:%02d:%02d:%02d                                                                            *
 * SecToTime(second);         //Use: %02d:%02d:%02d                                                                               *
 * MSToTime(millisecond);     //Use: %02d:%02d:%02d                                                                               *
 * SecToTimeMini(second);     //Use: %02d:%02d                                                                                    *
 * MSToTimeMini(millisecond); //Use: %02d:%02d                                                                                    *
 * randomex(min,max);                                                                                                             *
 * KEY_PRESSED(key);                                                                                                              *
 * KEY_RELEASED(key);                                                                                                             *
 * KEY_HOLDING(key);                                                                                                              *
 * CreateExplosionForRangePoint(Float:x,Float:y,Float:z,worldid,interiorid,type,Float:radius,Float:expradius);                    *
 * GetSAMIncludeVersion(value,name[],maxdest = sizeof(name));                                                                     *
 * DisableADMLogging(bool:disable);                                                                                               *
 * SetPlayerWorldBoundsEx(playerid,Float:minx,Float:miny,Float:maxx,Float:maxy);                                                  *
 * GetPlayerNick(playerid);                                                                                                       *
 * GetPlayerID(name[]);                                                                                                           *
 *                                                                                                                                *
 **********************************************************************************************************************************/

/*
//Check Version ATM.inc
#if !defined _ATM_Core
	#error [ADM] You need ATM.inc v1.4.2
#elseif !defined ATM_Version
	#error [ADM] Update you ATM.inc to v1.4.2
#elseif (ATM_Version < 10402)
	#error [ADM] Update you ATM.inc to v1.4.2
#endif
*/

#if defined _ATM_Core
	#endinput
#endif
#define _ATM_Core

#if (!defined GetPlayerPoolSize || !defined GetSVarInt)
	#error [ADM] This include requires SA:MP version 0.3.7 (github.com/AbyssMorgan/SA-MP/blob/master/samp/include)
#endif

#define ATM_Version											(10402) //a.b.c 10000*a+100*b+c

#if !defined isnull
	#define isnull(%1) 										((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#if !defined function && !defined DISABLE_ATM_FUNCTION
	#define function%0(%1)									forward %0(%1); public %0(%1)
#endif

#if !defined exec && !defined DISABLE_ATM_EXEC
	#define exec%0(%1)%2(%3)								forward %0(%1); public %0(%1){ return %2(%3); }
	#define PubFunction:{%0,%1}								exec %0 %1
#endif

#if !defined DISABLE_ATM_PUB_VAR
	#define ServerPubVar:{%1,%2}							forward v_%1(); public v_%1(){ return (%2); }
	#define GetServerPubVar(%1)								CallRemoteFunction("v_"#%1"","")
	#define PlayerPubVar:{%1,%2}							forward v_%1(playerid); public v_%1(playerid){ return (%2); }
	#define GetPlayerPubVar(%0,%1)							CallRemoteFunction("v_"#%1"","d",%0)
#endif

#if !defined randomex
	#define randomex(%0,%1) 								(random((%1)-(%0)+1)+(%0))
#endif

#if !defined SecToTimeDay
	//%d:%02d:%02d:%02d
	#define SecToTimeDay(%0)								((%0) / 86400),(((%0) % 86400) / 3600),((((%0) % 86400) % 3600) / 60),((((%0) % 86400) % 3600) % 60)
	#define MSToTimeDay(%0)									SecToTimeDay((%0)/1000)
	//%02d:%02d:%02d
	#define SecToTime(%0)									((%0) / 3600),(((%0) % 3600) / 60),(((%0) % 3600) % 60)
	#define MSToTime(%0)									SecToTime((%0)/1000)
	//%02d:%02d
	#define SecToTimeMini(%0)								((%0) / 60),((%0) % 60)
	#define MSToTimeMini(%0)								SecToTimeMini((%0)/1000)
#endif

//value bigger than possible
#if !defined VBTP
	#define VBTP 											(0x7FFFFFFF)
#endif

#if !defined FLOAT_NAN
	#define FLOAT_NAN 										(Float:0xFFFFFFFF)
#endif

#define SD_TINY												(5.0)
#define SD_VERYLOW											(20.0)
#define SD_LOW												(200.0)
#define SD_MEDIUM											(500.0)
#define SD_HIGH												(800.0)
#define SD_VERYHIGH											(999.0)

#define ALL_PLAYERS											(-1)
#define ALL_VW												(-1)
#define ALL_INT												(-1)
#define ATM_INT												(1)
#define ATM_VW												(1)
#define REAL_INT											(0)
#define REAL_VW												(0)

#if !defined KEY_PRESSED
	#define KEY_PRESSED(%0) 								(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#endif

#if !defined KEY_RELEASED
	#define KEY_RELEASED(%0)								(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#endif

#if !defined KEY_HOLDING
	#define KEY_HOLDING(%0) 								((newkeys & (%0)) == (%0))
#endif

enum e_Vectors {
	Float:X, Float:Y, Float:Z, Float:A
}

enum e_float {
	Float:X, Float:Y, Float:Z,
	Float:rX, Float:rY, Float:rZ,
	
	Float:tX, Float:tY, Float:tZ,
	
	VW, INT, Float:SPEED
}

enum e_long_float {
	Float:X, Float:Y, Float:Z,
	Float:rX, Float:rY, Float:rZ,
	
	Float:tX, Float:tY, Float:tZ,
	Float:trX, Float:trY, Float:trZ,
	
	Float:VecX, Float:VecY, Float:VecZ,
	
	VW, INT, Float:SPEED
}

stock CreateExplosionForRangePoint(Float:x,Float:y,Float:z,worldid,interiorid,type,Float:radius,Float:expradius){
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++){
		if(IsPlayerConnected(i)){
			new F4[e_float];
			if(IsPlayerInAnyVehicle(i)){
				GetVehiclePos(GetPlayerVehicleID(i),F4[X],F4[Y],F4[Z]);
			} else {
				GetPlayerPos(i,F4[X],F4[Y],F4[Z]);
			}
			new Float:distance = VectorSize(F4[X]-x,F4[Y]-y,F4[Z]-z);
			if((GetPlayerInterior(i) == interiorid || interiorid == -1) && (GetPlayerVirtualWorld(i) == worldid || worldid == -1) && (distance <= radius)){
				CreateExplosionForPlayer(i,x,y,z,type,expradius);
			}
		}
	}
	return 1;
}

stock GetSAMIncludeVersion(value,name[],maxdest = sizeof(name)){
	format(name,maxdest,"%d.%d.%d",(value / 10000),((value % 10000) / 100),((value % 10000) % 100));
}

stock DisableADMLogging(bool:disable){
	if(disable){
		SetSVarInt("ADM:Logging:Disable",1);
	} else {
		SetSVarInt("ADM:Logging:Disable",0);
	}
}

stock SetPlayerWorldBoundsEx(playerid,Float:minx,Float:miny,Float:maxx,Float:maxy){
	new Float:Tminx,Float:Tminy,Float:Tmaxx,Float:Tmaxy;
	if(minx < maxx){
		Tminx = minx, Tmaxx = maxx;
	} else {
		Tminx = maxx, Tmaxx = minx;
	}
	if(miny < maxy){
		Tminy = miny, Tmaxy = maxy;
	} else {
		Tminy = maxy, Tmaxy = miny;
	}
	SetPlayerWorldBounds(playerid,Tminx,Tminy,Tmaxx,Tmaxy);
}

stock GetPlayerNick(playerid){
	new pnick[MAX_PLAYER_NAME];
	GetPlayerName(playerid,pnick,sizeof(pnick));
	return pnick;
}

stock GetPlayerID(name[]){
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++){
		if(IsPlayerConnected(i)){
			if(!strcmp(name,GetPlayerNick(i),false)) return i;
		}
	}
	return INVALID_PLAYER_ID;
}

//EOF