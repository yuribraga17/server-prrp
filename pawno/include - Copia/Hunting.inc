/**********************************************************************************************************************************
 *                                                                                                                                *
 *                                                         Hunting System                                                         *
 *                                                                                                                                *
 * Copyright © 2017 Abyss Morgan. All rights reserved.                                                                            *
 *                                                                                                                                *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/engine                                                      *
 * Publication: http://forum.sa-mp.com/showthread.php?t=639694                                                                    *
 * Website: http://8.ct8.pl                                                                                                       *
 *                                                                                                                                *
 * Plugins: Streamer, ColAndreas                                                                                                  *
 * Modules: 3DTryg                                                                                                                *
 *                                                                                                                                *
 * File Version: 1.2.1                                                                                                            *
 * SA:MP Version: 0.3.7                                                                                                           *
 * Streamer Version: 2.9.1                                                                                                        *
 * ColAndreas Version: 1.4.0                                                                                                      *
 * 3DTryg Version: 4.4.3                                                                                                          *
 *                                                                                                                                *
 * Functions:                                                                                                                     *
 * Hunt_Create(type,Float:x,Float:y,Float:z,Float:health,respawntime,worldid=-1,interiorid=-1,playerid=-1,                    *
 *                 Float:streamdistance=200.0,moving_area = 0);                                                                   *
 * Hunt_Destroy(mobid);                                                                                                       *
 * Hunt_Respawn(mobid);                                                                                                       *
 * Hunt_ForceRespawn(mobid,Float:x,Float:y,Float:z);                                                                          *
 * Hunt_Kill(mobid,playerid=INVALID_PLAYER_ID);                                                                               *
 * Hunt_Stop(mobid,delay=-1);                                                                                                 *
 * Hunt_GoTo(mobid,Float:x,Float:y,bool:disable_moving=false);                                                                *
 * Hunt_GetDrop(mobid);                                                                                                       *
 * Hunt_SetDrop(mobid,drop);                                                                                                  *
 * Hunt_GetPos(mobid,Float:x,Float:y,Float:z);                                                                                *
 * Hunt_SetPos(mobid,Float:x,Float:y,Float:z,bool:disable_moving=false);                                                      *
 * Hunt_GetScaredRange(mobid);                                                                                                *
 * Hunt_SetScaredRange(mobid,Float:range);                                                                                    *
 * Hunt_GetHealth(mobid);                                                                                                     *
 * Hunt_SetHealth(mobid,Float:health);                                                                                        *
 * Hunt_GetSpawnHealth(mobid);                                                                                                *
 * Hunt_SetSpawnHealth(mobid,Float:health);                                                                                   *
 * Hunt_GetRespawnTime(mobid);                                                                                                *
 * Hunt_SetRespawnTime(mobid,respawntime);                                                                                    *
 * Hunt_GetSpawn(mobid,&Float:x,&Float:y,&Float:z);                                                                           *
 * Hunt_SetSpawn(mobid,Float:x,Float:y,Float:z);                                                                              *
 * Hunt_GetInterior(mobid);                                                                                                   *
 * Hunt_SetInterior(mobid,interiorid);                                                                                        *
 * Hunt_GetVirtualWorld(mobid);                                                                                               *
 * Hunt_SetVirtualWorld(mobid,worldid);                                                                                       *
 * Hunt_GetSpeed(mobid);                                                                                                      *
 * Hunt_SetSpeed(mobid,Float:speed);                                                                                          *
 * Hunt_GetPressTime(mobid);                                                                                                  *
 * Hunt_SetPressTime(mobid,miliseconds);                                                                                      *
 * Hunt_GetFacingAngle(mobid);                                                                                                *
 * Hunt_IsPlayerInRange(playerid,mobid,Float:range);                                                                          *
 * Hunt_IsToggledMoving(mobid);                                                                                               *
 * Hunt_ToggleMoving(mobid,toggle);                                                                                           *
 * Hunt_IsValid(mobid);                                                                                                       *
 * Hunt_IsSpawned(mobid);                                                                                                     *
 * Hunt_IsDead(mobid);                                                                                                        *
 * Hunt_IsScared(mobid);                                                                                                      *
 *                                                                                                                                *
 * Extended Functions:                                                                                                            *
 * Hunt_Count();                                                                                                              *
 * Hunt_GetKey();                                                                                                             *
 * Hunt_SetKey(key);                                                                                                          *
 * Hunt_GetFreeID();                                                                                                          *
 * Hunt_GetActiveMob(playerid,mob_state);                                                                                     *
 *                                                                                                                                *
 * Callbacks:                                                                                                                     *
 * OnPlayerTakeHuntDrop(playerid,mobid,drop); //return 0 set drop flag 0                                                          *
 * OnPlayerKillHuntAnimal(playerid,mobid);                                                                                        *
 * OnPlayerApproachingAnimal(playerid,mobid,mob_state);                                                                           *
 * OnAnimalTakeDamage(mobid,playerid,Float:amount,weaponid);                                                                      *
 * OnHuntAnimalRespawn(mobid);                                                                                                    *
 * OnAnimalScareStateChanged(mobid,playerid,isscared);                                                                            *
 * OnPlayerHuntDropStateChange(playerid,mobid,drop_state);                                                                        *
 *                                                                                                                                *
 **********************************************************************************************************************************/
 
#if ((defined Streamer_AppendArrayData) && (defined INVALID_STREAMER_ID) && (!defined STREAMER_TYPE_ACTOR))
	#error [ADM] You need Streamer v2.9.1 (github.com/samp-incognito/samp-streamer-plugin/releases)
#endif

#if !defined COLANDREAS
	#error [ADM] You need ColAndreas v1.4.0 (github.com/Pottus/ColAndreas/releases)
#endif

//Check Version 3DTryg.inc
/*#if !defined _3D_Tryg
	#error [ADM] You need 3DTryg.inc v4.4.3 (github.com/AbyssMorgan/SA-MP/blob/master/include/SAM/3DTryg.inc)
#elseif !defined Tryg3D_Version
	#error [ADM] Update you 3DTryg.inc to v4.4.3 (github.com/AbyssMorgan/SA-MP/blob/master/include/SAM/3DTryg.inc)
#elseif (Tryg3D_Version < 40403)
	#error [ADM] Update you 3DTryg.inc to v4.4.3 (github.com/AbyssMorgan/SA-MP/blob/master/include/SAM/3DTryg.inc)
#endif
*/

#if defined _hunting_system
	#endinput
#endif
#define _hunting_system

#if !defined MAX_HUNTING_ANIMALS
	#define MAX_HUNTING_ANIMALS					(100)
#endif

#if !defined HUNTING_UPDATE_INTERVAL
	#define HUNTING_UPDATE_INTERVAL				(500)
#endif

#define HUNT_EXTRA_ID_OFFSET					(600000)
#define HUNT_EXTRA_ID_OFFSET_B					(HUNT_EXTRA_ID_OFFSET + MAX_HUNTING_ANIMALS)

#define HUNTING_TYPE_COW						(19833)
#define HUNTING_TYPE_DEER						(19315)

#define HUNTING_STATE_DESTROYED					(0)
#define HUNTING_STATE_SPAWNED					(1)
#define HUNTING_STATE_DEAD						(2)

#define HUNTING_DROP_STATE_FINISH				(0)
#define HUNTING_DROP_STATE_START				(1)
#define HUNTING_DROP_STATE_INTERRUPT			(2)

#define INVALID_HUNTING_ID						(0)

#define HUNTING_NO_AUTO_RESPAWN					(-1)

enum Hunt_enum {
	STREAMER_TAG_OBJECT Hunt_objectid,
	STREAMER_TAG_AREA Hunt_drop_area,
	STREAMER_TAG_AREA Hunt_scared_area,
	STREAMER_TAG_AREA Hunt_areaid,
	Hunt_type,
	Float:Hunt_health,
	Float:Hunt_spawn_health,
	Hunt_state,
	Hunt_respawntime,
	Hunt_drop,
	Hunt_respawn_tick,
	Float:Hunt_X,
	Float:Hunt_Y,
	Float:Hunt_Z,
	Float:Hunt_tX,
	Float:Hunt_tY,
	Float:Hunt_rZ,
	Float:Hunt_speed,
	Hunt_moving,
	Hunt_calm,
	Hunt_press_time,
	Hunt_last_scared,
	Hunt_stop_delay
}

new Hunt_Data[MAX_HUNTING_ANIMALS][Hunt_enum],
	Hunt_Upperbound = 0,
	Hunt_Key = KEY_YES,
	Hunt_Timer = -1,
	Hunt_PlayerPress[MAX_PLAYERS];
	
#if defined OnPlayerTakeHuntDrop
	forward OnPlayerTakeHuntDrop(playerid,mobid,drop);
#endif

#if defined OnPlayerKillHuntAnimal
	forward OnPlayerKillHuntAnimal(playerid,mobid);
#endif

#if defined OnPlayerApproachingAnimal
	forward OnPlayerApproachingAnimal(playerid,mobid,mob_state);
#endif

#if defined OnAnimalTakeDamage
	forward OnAnimalTakeDamage(mobid,playerid,Float:amount,weaponid);
#endif

#if defined OnHuntAnimalRespawn
	forward OnHuntAnimalRespawn(mobid);
#endif

#if defined OnAnimalScareStateChanged
	forward OnAnimalScareStateChanged(mobid,playerid,isscared);
#endif

#if defined OnPlayerHuntDropStateChange
	forward OnPlayerHuntDropStateChange(playerid,mobid,drop_state);
#endif

#define Hunt_GetKey()							Hunt_Key
#define Hunt_SetKey(%0)							Hunt_Key = (%0)

#define Hunt_SetDrop(%0,%1)						Hunt_Data[(%0)][Hunt_drop] = (%1)
#define Hunt_GetDrop(%0)						Hunt_Data[(%0)][Hunt_drop]

#define Hunt_ToggleMoving(%0,%1)				Hunt_Data[(%0)][Hunt_moving] = (%1)
#define Hunt_IsToggledMoving(%0)				Hunt_Data[(%0)][Hunt_moving]

#define Hunt_GetPos(%0,%1,%2,%3)				GetDynamicObjectPos(Hunt_Data[(%0)][Hunt_objectid],(%1),(%2),(%3))

#define Hunt_GetHealth(%0)						Hunt_Data[(%0)][Hunt_health]
#define Hunt_SetHealth(%0,%1)					Hunt_Data[(%0)][Hunt_health] = (%1)

#define Hunt_GetSpawnHealth(%0)					Hunt_Data[(%0)][Hunt_spawn_health]
#define Hunt_SetSpawnHealth(%0,%1)				Hunt_Data[(%0)][Hunt_spawn_health] = (%1)

#define Hunt_GetRespawnTime(%0)					Hunt_Data[(%0)][Hunt_respawntime]
#define Hunt_SetRespawnTime(%0,%1)				Hunt_Data[(%0)][Hunt_respawntime] = (%1)

#define Hunt_IsValid(%0)						(Hunt_Data[(%0)][Hunt_state] != HUNTING_STATE_DESTROYED)
#define Hunt_IsSpawned(%0)						(Hunt_Data[(%0)][Hunt_state] == HUNTING_STATE_SPAWNED)
#define Hunt_IsDead(%0)							(Hunt_Data[(%0)][Hunt_state] == HUNTING_STATE_DEAD)

#define Hunt_GetSpeed(%0)						Hunt_Data[(%0)][Hunt_speed]
#define Hunt_SetSpeed(%0,%1)					Hunt_Data[(%0)][Hunt_speed] = (%1)

#define Hunt_GetPressTime(%0)					Hunt_Data[(%0)][Hunt_press_time]
#define Hunt_SetPressTime(%0,%1)				Hunt_Data[(%0)][Hunt_press_time] = (%1)

#define Hunt_IsScared(%0)						(Hunt_Data[(%0)][Hunt_calm] != 0)

stock Hunt_Count(){
	new cnt = 0;
	for(new mobid = 1; mobid <= Hunt_Upperbound; mobid++){
		if(Hunt_IsValid(mobid)) cnt++;
	}
	return cnt;
}

stock Hunt_GetFreeID(){
	for(new mobid = 1; mobid < MAX_HUNTING_ANIMALS; mobid++){
		if(!Hunt_IsValid(mobid)) return mobid;
	}
	return INVALID_HUNTING_ID;
}

stock Hunt_Construct(){
	new Hunt_data_construct[Hunt_enum];
	
	Hunt_data_construct[Hunt_speed] = 0.8;
	Hunt_data_construct[Hunt_last_scared] = INVALID_PLAYER_ID;
	
	return Hunt_data_construct;
}
	
stock Hunt_Stop(mobid,delay=-1){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(delay > 0){
		Hunt_ToggleMoving(mobid,0);
		Hunt_Data[mobid][Hunt_stop_delay] = GetTickCount() + delay;
	} else {
		Hunt_Data[mobid][Hunt_stop_delay] = 0;
		if(delay != -1) Hunt_ToggleMoving(mobid,0);
	}
	StopDynamicObject(Hunt_Data[mobid][Hunt_objectid]);
	return 1;
}

stock Hunt_SetSpawn(mobid,Float:xx,Float:xy,Float:xz){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Hunt_Data[mobid][Hunt_X] = xx;
	Hunt_Data[mobid][Hunt_Y] = xy;
	Hunt_Data[mobid][Hunt_Z] = xz;
	return 1;
}

stock Hunt_GetSpawn(mobid,&Float:xx,&Float:xy,&Float:xz){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	xx = Hunt_Data[mobid][Hunt_X];
	xy = Hunt_Data[mobid][Hunt_Y];
	xz = Hunt_Data[mobid][Hunt_Z];
	return 1;
}

stock Float:Hunt_GetScaredRange(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0.0;
	if(!Hunt_IsValid(mobid)) return 0.0;
	new Float:Hunt_range;
	Streamer_GetFloatData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_scared_area],E_STREAMER_SIZE,Hunt_range);
	return Hunt_range;
}

stock Hunt_SetScaredRange(mobid,Float:range){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Streamer_SetFloatData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_scared_area],E_STREAMER_SIZE,range);
	return 1;
}

stock Hunt_GetInterior(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	return Streamer_GetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_INTERIOR_ID);
}

stock Hunt_SetInterior(mobid,interiorid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Streamer_SetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_INTERIOR_ID,interiorid);
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_drop_area],E_STREAMER_INTERIOR_ID,interiorid);
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_scared_area],E_STREAMER_INTERIOR_ID,interiorid);
	return 1;
}

stock Hunt_GetVirtualWorld(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	return Streamer_GetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_WORLD_ID);
}

stock Hunt_SetVirtualWorld(mobid,worldid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Streamer_SetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_WORLD_ID,worldid);
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_drop_area],E_STREAMER_WORLD_ID,worldid);
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_scared_area],E_STREAMER_WORLD_ID,worldid);
	return 1;
}

stock Hunt_GoTo(mobid,Float:x,Float:y,bool:disable_moving=false){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsSpawned(mobid)) return 0;
	
	new Float:z;
	MapAndreas48FindZ(x,y,z);
	if(IsPointInWater(x,y,z)) return 0;
	if(Hunt_Data[mobid][Hunt_areaid] != STREAMER_TAG_AREA INVALID_STREAMER_ID){
		if(!IsPointInDynamicArea(Hunt_Data[mobid][Hunt_areaid],x,y,z)) return 0;
	}
	
	new F4[Vectors3D], tmp_moving = Hunt_IsToggledMoving(mobid);
	
	Hunt_ToggleMoving(mobid,0);
	Hunt_Stop(mobid);
	Hunt_GetPos(mobid,F4[T3D:X],F4[T3D:Y],F4[T3D:Z]);
	
	Hunt_Data[mobid][Hunt_tX] = x;
	Hunt_Data[mobid][Hunt_tY] = y;
	GetRotationFor2Point2D(F4[T3D:X],F4[T3D:Y],x,y,Hunt_Data[mobid][Hunt_rZ]);
	
	if(!disable_moving){
		Hunt_ToggleMoving(mobid,1);
	} else {
		Hunt_ToggleMoving(mobid,tmp_moving);
	}
	return 1;
}

stock Hunt_SetPos(mobid,Float:x,Float:y,Float:z,bool:disable_moving=false){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsSpawned(mobid)) return 0;
	
	if(IsPointInWater(x,y,z)) return 0;
	if(Hunt_Data[mobid][Hunt_areaid] != STREAMER_TAG_AREA INVALID_STREAMER_ID){
		if(!IsPointInDynamicArea(Hunt_Data[mobid][Hunt_areaid],x,y,z)) return 0;
	}
	
	new tmp_moving = Hunt_IsToggledMoving(mobid);
	
	Hunt_ToggleMoving(mobid,0);
	Hunt_Stop(mobid);
	
	SetDynamicObjectPos(Hunt_Data[mobid][Hunt_objectid],x,y,z);
	
	Hunt_Data[mobid][Hunt_tX] = x;
	Hunt_Data[mobid][Hunt_tY] = y;
	
	if(!disable_moving){
		Hunt_ToggleMoving(mobid,1);
	} else {
		Hunt_ToggleMoving(mobid,tmp_moving);
	}
	return 1;
}

stock Hunt_Create(type,Float:x,Float:y,Float:z,Float:health,respawntime,worldid=-1,interiorid=-1,playerid=-1,Float:streamdistance=200.0){
	new mobid = Hunt_GetFreeID();
	if(mobid == INVALID_HUNTING_ID){
		printf("[ADM] Error: Failed to Hunt_Create limit %d exceeded, add #define MAX_HUNTING_ANIMALS before Hunting.inc",MAX_HUNTING_ANIMALS);
		return mobid;
	}
	
	new moving_area = CreateDynamicRectangle(2085.0176, 52.4910,1945.4626, 142.9483);

	
	if(moving_area != STREAMER_TAG_AREA INVALID_STREAMER_ID){
		if(!IsPointInDynamicArea(moving_area,x,y,z)){
			printf("[ADM] Error: Failed to Hunt_Create(%d,%f,%f,%f,...) position out of moving_area",type,x,y,z);
			return INVALID_HUNTING_ID;
		}
	} 
	if(IsPointInWater(x,y,z) || IsPointInUnderground(x,y,z)){
		printf("[ADM] Error: Failed to Hunt_Create(%d,%f,%f,%f,...) position out of world",type,x,y,z);
		return INVALID_HUNTING_ID;
	}
	
	Hunt_Data[mobid] = Hunt_Construct();
	
	new Float:tmp_float,Float:target_z;
	MovePointCol(x,y,z+1.0,x,y,-100.0,tmp_float,tmp_float,target_z);
	z = target_z;
	switch(type){
		case HUNTING_TYPE_COW: {
			Hunt_Data[mobid][Hunt_objectid] = CreateDynamicObject(type,x,y,z,0.0,0.0,184.0,worldid,interiorid,playerid,streamdistance);
		}
		case HUNTING_TYPE_DEER: {
			z += 0.5;
			Hunt_Data[mobid][Hunt_objectid] = CreateDynamicObject(type,x,y,z,0.0,0.0,90.0,worldid,interiorid,playerid,streamdistance);
		}
	}
	Hunt_Data[mobid][Hunt_drop_area] = CreateDynamicSphere(x,y,z,3.0,worldid,interiorid,playerid);
	Hunt_Data[mobid][Hunt_scared_area] = CreateDynamicSphere(x,y,z,5.0,worldid,interiorid,playerid);
	
	AttachDynamicAreaToObject(Hunt_Data[mobid][Hunt_drop_area],Hunt_Data[mobid][Hunt_objectid]);
	AttachDynamicAreaToObject(Hunt_Data[mobid][Hunt_scared_area],Hunt_Data[mobid][Hunt_objectid]);
	
	Streamer_SetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_EXTRA_ID,(mobid+HUNT_EXTRA_ID_OFFSET));
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_drop_area],E_STREAMER_EXTRA_ID,(mobid+HUNT_EXTRA_ID_OFFSET));
	Streamer_SetIntData(STREAMER_TYPE_AREA,Hunt_Data[mobid][Hunt_scared_area],E_STREAMER_EXTRA_ID,(mobid+HUNT_EXTRA_ID_OFFSET_B));
	
	Hunt_Data[mobid][Hunt_areaid] = moving_area;
	
	Hunt_Data[mobid][Hunt_type] = type;
	Hunt_Data[mobid][Hunt_respawntime] = respawntime;
	Hunt_Data[mobid][Hunt_health] = health;
	Hunt_Data[mobid][Hunt_spawn_health] = health;
	Hunt_Data[mobid][Hunt_drop] = 1;
	Hunt_Data[mobid][Hunt_tX] = x;
	Hunt_Data[mobid][Hunt_tY] = y;
	Hunt_Data[mobid][Hunt_moving] = 1;
	Hunt_Data[mobid][Hunt_speed] = 0.8;
	
	Hunt_SetSpawn(mobid,x,y,z);
	
	if(mobid > Hunt_Upperbound) Hunt_Upperbound = mobid;
	
	Hunt_Data[mobid][Hunt_state] = HUNTING_STATE_SPAWNED;
	
	printf("Bixo Criado");
	
	return mobid;
}

stock Hunt_Destroy(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	
	Hunt_Data[mobid][Hunt_state] = HUNTING_STATE_DESTROYED;
	
	if(IsValidDynamicObject(Hunt_Data[mobid][Hunt_objectid])) DestroyDynamicObject(Hunt_Data[mobid][Hunt_objectid]);
	if(IsValidDynamicArea(Hunt_Data[mobid][Hunt_drop_area])) DestroyDynamicArea(Hunt_Data[mobid][Hunt_drop_area]);
	if(IsValidDynamicArea(Hunt_Data[mobid][Hunt_scared_area])) DestroyDynamicArea(Hunt_Data[mobid][Hunt_scared_area]);
	
	Hunt_Data[mobid] = Hunt_Construct();
	
	if(mobid == Hunt_Upperbound) Hunt_Upperbound--;
	return 1;
}

stock Hunt_Respawn(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Hunt_Data[mobid][Hunt_respawn_tick] = 0;
	
	if(Hunt_IsSpawned(mobid)){
		Hunt_Data[mobid][Hunt_state] = HUNTING_STATE_DEAD;
		Hunt_Stop(mobid);
	}
	
	Hunt_Data[mobid][Hunt_health] = Hunt_Data[mobid][Hunt_spawn_health];
	Hunt_SetDrop(mobid,1);
	
	SetDynamicObjectMaterial(Hunt_Data[mobid][Hunt_objectid],0,0,"","",0);
	SetDynamicObjectMaterial(Hunt_Data[mobid][Hunt_objectid],1,0,"","",0);
	new modelid = Streamer_GetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_MODEL_ID);
	Streamer_SetIntData(STREAMER_TYPE_OBJECT,Hunt_Data[mobid][Hunt_objectid],E_STREAMER_MODEL_ID,modelid);

	new Float:tmp_float,Float:target_z;
	MovePointCol(Hunt_Data[mobid][Hunt_X],Hunt_Data[mobid][Hunt_Y],Hunt_Data[mobid][Hunt_Z]+1.0,Hunt_Data[mobid][Hunt_X],Hunt_Data[mobid][Hunt_Y],-100.0,tmp_float,tmp_float,target_z);
	switch(Hunt_Data[mobid][Hunt_type]){
		case HUNTING_TYPE_DEER:	target_z += 0.5;
	}
	SetDynamicObjectPos(Hunt_Data[mobid][Hunt_objectid],Hunt_Data[mobid][Hunt_X],Hunt_Data[mobid][Hunt_Y],target_z);
	
	Hunt_Data[mobid][Hunt_tX] = Hunt_Data[mobid][Hunt_X];
	Hunt_Data[mobid][Hunt_tY] = Hunt_Data[mobid][Hunt_Y];
	
	switch(Hunt_Data[mobid][Hunt_type]){
		case HUNTING_TYPE_COW: {
			SetDynamicObjectRot(Hunt_Data[mobid][Hunt_objectid],0.0,0.0,184.0);
		}
		case HUNTING_TYPE_DEER: {
			SetDynamicObjectRot(Hunt_Data[mobid][Hunt_objectid],0.0,0.0,90.0);
		}
	}
	
	Hunt_Data[mobid][Hunt_state] = HUNTING_STATE_SPAWNED;
	#if defined OnHuntAnimalRespawn
		OnHuntAnimalRespawn(mobid);
	#endif
	return 1;
}

stock Hunt_IsPlayerInRange(playerid,mobid,Float:range){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	if(!IsPlayerConnected(playerid)) return 0;
	return (GetElementsDistance(playerid,item_player,Hunt_Data[mobid][Hunt_objectid],item_dynamic_object) <= range);
}

stock Float:Hunt_GetFacingAngle(mobid){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	switch(Hunt_Data[mobid][Hunt_type]){
		case HUNTING_TYPE_COW:	return CompRotationFloat(Hunt_Data[mobid][Hunt_rZ]+184.0);
		case HUNTING_TYPE_DEER:	return CompRotationFloat(Hunt_Data[mobid][Hunt_rZ]+90.0);
	}
	return 1;
}

stock Hunt_ForceRespawn(mobid,Float:x,Float:y,Float:z){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsValid(mobid)) return 0;
	Hunt_SetSpawn(mobid,x,y,z);
	return Hunt_Respawn(mobid);
}

stock Hunt_Kill(mobid,playerid=INVALID_PLAYER_ID){
	if(mobid <= 0 || mobid >= MAX_HUNTING_ANIMALS) return 0;
	if(!Hunt_IsSpawned(mobid)) return 0;
	Hunt_Data[mobid][Hunt_state] = HUNTING_STATE_DEAD;
	Hunt_Data[mobid][Hunt_health] = 0.0;
	
	#if defined OnAnimalScareStateChanged
		if(Hunt_IsScared(mobid)){
			OnAnimalScareStateChanged(mobid,Hunt_Data[mobid][Hunt_last_scared],0);
		}
	#endif
	Hunt_Data[mobid][Hunt_calm] = 0;
	Hunt_Data[mobid][Hunt_last_scared] = INVALID_PLAYER_ID;
	
	Hunt_Stop(mobid);
	
	SetDynamicObjectMaterial(Hunt_Data[mobid][Hunt_objectid],0,2806,"CJ_MEATY","CJ_FLESH_1",0);
	SetDynamicObjectMaterial(Hunt_Data[mobid][Hunt_objectid],1,2806,"CJ_MEATY","CJ_FLESH_1",0);
	
	new Float:tmp_float,Float:target_z,Float:x,Float:y,Float:z;
	Hunt_GetPos(mobid,x,y,z);
	Hunt_SetPos(mobid,x,y,z);
	MovePointCol(x,y,z+1.0,x,y,-100.0,tmp_float,tmp_float,target_z);
	
	switch(Hunt_Data[mobid][Hunt_type]){
		case HUNTING_TYPE_COW: {
			MoveDynamicObject(Hunt_Data[mobid][Hunt_objectid],x,y,target_z+0.3,0.5,0.0,90.0);
		}
		case HUNTING_TYPE_DEER: {
			MoveDynamicObject(Hunt_Data[mobid][Hunt_objectid],x,y,target_z+0.1,0.5,270.0);
		}
	}
	
	Hunt_Data[mobid][Hunt_respawn_tick] = GetTickCount() + (1000 * Hunt_Data[mobid][Hunt_respawntime]);
	
	#if defined OnPlayerKillHuntAnimal
		OnPlayerKillHuntAnimal(playerid,mobid);
	#endif
	return 1;
}

stock Hunt_GetActiveMob(playerid,mob_state){
	new max_areas = GetPlayerNumberDynamicAreas(playerid);
	if(max_areas){
		new STREAMER_TAG_AREA player_areas[64], mobid;
		GetPlayerDynamicAreas(playerid,player_areas,max_areas);
		for(new k = 0; k < max_areas; k++){
			mobid = Streamer_GetIntData(STREAMER_TYPE_AREA,player_areas[k],E_STREAMER_EXTRA_ID)-HUNT_EXTRA_ID_OFFSET;
			if(mobid > 0 && mobid < MAX_HUNTING_ANIMALS){
				if(player_areas[k] == Hunt_Data[mobid][Hunt_drop_area]){
					if(mob_state == Hunt_Data[mobid][Hunt_state]){
						return mobid;
					}
				}
			}
			mobid = INVALID_HUNTING_ID;
		}
	}
	return INVALID_HUNTING_ID;
}

stock Hunt_OnUpdate(){
	static	Float:tmp_float,Float:target_z,
			Float:x,Float:y,Float:z,
			Float:tx,Float:ty,
			Float:vx,Float:vy,Float:vz;
	
	for(new mobid = 1; mobid <= Hunt_Upperbound; mobid++){
		switch(Hunt_Data[mobid][Hunt_state]){
			case HUNTING_STATE_SPAWNED: {
				target_z = 0.0;
				Hunt_GetPos(mobid,x,y,z);
				MovePointCol(x,y,z+1.0,x,y,-100.0,tmp_float,tmp_float,target_z);
				if(Hunt_IsToggledMoving(mobid)){
					if(GetDistanceBetweenPoints2D(Hunt_Data[mobid][Hunt_tX],Hunt_Data[mobid][Hunt_tY],x,y) == 0.0){
						for(;;){
							vx = vy = vz = 0.0;
							GetRandomPointInCircle(x,y,25.0,tx,ty);
							MovePointColCutLineEx(x,y,z+1.0,tx,ty,z+1.0,vx,vy,vz,3.0);
							if(GetDistanceBetweenPoints2D(x,y,vx,vy) <= 2.0) continue;
							if(IsPointInWater(vx,vy,vz)) continue;
							if(Hunt_Data[mobid][Hunt_areaid] != STREAMER_TAG_AREA INVALID_STREAMER_ID){
								if(!IsPointInDynamicArea(Hunt_Data[mobid][Hunt_areaid],vx,vy,vz)) continue;
							}
							if(Hunt_Data[mobid][Hunt_last_scared] != INVALID_PLAYER_ID){
								if(IsPlayerInRangeOfPoint(Hunt_Data[mobid][Hunt_last_scared],5.0,vx,vy,vz)) continue;
							}
							Hunt_Data[mobid][Hunt_tX] = vx;
							Hunt_Data[mobid][Hunt_tY] = vy;
							GetRotationFor2Point2D(x,y,vx,vy,Hunt_Data[mobid][Hunt_rZ]);
							break;
						}
					}
				} else {
					if(Hunt_Data[mobid][Hunt_stop_delay] != 0 && GetTickCount() >= Hunt_Data[mobid][Hunt_stop_delay]){
						Hunt_Data[mobid][Hunt_stop_delay] = 0;
						Hunt_ToggleMoving(mobid,1);
					}
				}
				if(GetTickCount() >= Hunt_Data[mobid][Hunt_calm] && Hunt_Data[mobid][Hunt_calm] != 0){
					Hunt_SetSpeed(mobid,0.8);
					#if defined OnAnimalScareStateChanged
						if(Hunt_IsScared(mobid)){
							OnAnimalScareStateChanged(mobid,Hunt_Data[mobid][Hunt_last_scared],0);
						}
					#endif
					Hunt_Data[mobid][Hunt_calm] = 0;
					Hunt_Data[mobid][Hunt_last_scared] = INVALID_PLAYER_ID;
				}
				switch(Hunt_Data[mobid][Hunt_type]){
					case HUNTING_TYPE_COW: {
						SetDynamicObjectPos(Hunt_Data[mobid][Hunt_objectid],x,y,target_z);
						SetDynamicObjectRot(Hunt_Data[mobid][Hunt_objectid],0.0,0.0,CompRotationFloat(Hunt_Data[mobid][Hunt_rZ]+184.0));
						MoveDynamicObject(Hunt_Data[mobid][Hunt_objectid],Hunt_Data[mobid][Hunt_tX],Hunt_Data[mobid][Hunt_tY],target_z,Hunt_GetSpeed(mobid));
					}
					case HUNTING_TYPE_DEER: {
						SetDynamicObjectPos(Hunt_Data[mobid][Hunt_objectid],x,y,target_z+0.5);
						SetDynamicObjectRot(Hunt_Data[mobid][Hunt_objectid],0.0,0.0,CompRotationFloat(Hunt_Data[mobid][Hunt_rZ]+90.0));
						MoveDynamicObject(Hunt_Data[mobid][Hunt_objectid],Hunt_Data[mobid][Hunt_tX],Hunt_Data[mobid][Hunt_tY],target_z+0.5,Hunt_GetSpeed(mobid));
					}
				}
			}
			case HUNTING_STATE_DEAD: {
				if(Hunt_Data[mobid][Hunt_respawntime] != HUNTING_NO_AUTO_RESPAWN){
					if(Hunt_Data[mobid][Hunt_respawn_tick] != 0 && GetTickCount() >= Hunt_Data[mobid][Hunt_respawn_tick]){
						Hunt_Respawn(mobid);
					}
				}
			}
		}
	}
	return 1;
}

new const Float:WeaponHuntingDamage[] = {
	1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,82.5,0.0,1.0,9.9,46.2,0.0,8.25,13.2,46.2,3.3,3.3,4.95,6.6,8.25,
	9.9,9.9,6.6,24.75,41.25,82.5,82.5,1.0,46.2,82.5,0.0,0.33,0.33,0.0,0.0,0.0,0.0,0.0,2.64,9.9,330.0,82.5,1.0,1.0,165.0
};

//Hook: OnPlayerShootDynamicObject
public OnPlayerShootDynamicObject(playerid, weaponid, STREAMER_TAG_OBJECT objectid, Float:x, Float:y, Float:z){
	new mobid = (Streamer_GetIntData(STREAMER_TYPE_OBJECT,objectid,E_STREAMER_EXTRA_ID)-HUNT_EXTRA_ID_OFFSET);
	if(mobid > 0 && mobid < MAX_HUNTING_ANIMALS){
		if(Hunt_Data[mobid][Hunt_objectid] == objectid && Hunt_IsSpawned(mobid)){
			Hunt_SetSpeed(mobid,8.0);
			Hunt_Data[mobid][Hunt_last_scared] = playerid;
			#if defined OnAnimalScareStateChanged
				if(!Hunt_IsScared(mobid)){
					OnAnimalScareStateChanged(mobid,playerid,1);
				}
			#endif
			Hunt_Data[mobid][Hunt_calm] = GetTickCount() + 30000;
			#if defined OnAnimalTakeDamage
				if(OnAnimalTakeDamage(mobid,playerid,WeaponHuntingDamage[weaponid],weaponid)){
					Hunt_Data[mobid][Hunt_health] -= WeaponHuntingDamage[weaponid];
				}
			#else
				Hunt_Data[mobid][Hunt_health] -= WeaponHuntingDamage[weaponid];
			#endif
			if(Hunt_Data[mobid][Hunt_health] <= 0.0){
				Hunt_Kill(mobid,playerid);
			}
		}
	}
	#if defined HUN_OnPlayerShootDynamicObject
		HUN_OnPlayerShootDynamicObject(playerid, weaponid, objectid, x, y, z);
	#endif
	return 1;
}

#if defined _ALS_OnPlayerShootDynamicObject
	#undef OnPlayerShootDynamicObject
#else
	#define _ALS_OnPlayerShootDynamicObject
#endif
#define OnPlayerShootDynamicObject HUN_OnPlayerShootDynamicObject
#if defined HUN_OnPlayerShootDynamicObject
	forward HUN_OnPlayerShootDynamicObject(playerid, weaponid, STREAMER_TAG_OBJECT objectid, Float:x, Float:y, Float:z);
#endif

//Hook: OnPlayerEnterDynamicArea
public OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA areaid){
	new Hunt_extraid = Streamer_GetIntData(STREAMER_TYPE_AREA,areaid,E_STREAMER_EXTRA_ID), mobid;
	
	mobid = (Hunt_extraid - HUNT_EXTRA_ID_OFFSET);
	if(mobid > 0 && mobid < MAX_HUNTING_ANIMALS){
		if(Hunt_Data[mobid][Hunt_drop_area] == areaid){
			#if defined OnPlayerApproachingAnimal
				OnPlayerApproachingAnimal(playerid,mobid,Hunt_Data[mobid][Hunt_state]);
			#endif
		}
	}
	
	mobid = (Hunt_extraid - HUNT_EXTRA_ID_OFFSET_B);
	if(mobid > 0 && mobid < MAX_HUNTING_ANIMALS){
		if(Hunt_Data[mobid][Hunt_scared_area] == areaid){
			if(Hunt_Data[mobid][Hunt_state] == HUNTING_STATE_SPAWNED){
				Hunt_SetSpeed(mobid,8.0);
				Hunt_Data[mobid][Hunt_last_scared] = playerid;
				
				#if defined OnAnimalScareStateChanged
					if(!Hunt_IsScared(mobid)){
						OnAnimalScareStateChanged(mobid,playerid,1);
					}
				#endif
				
				Hunt_Data[mobid][Hunt_calm] = GetTickCount() + 30000;
			}
		}
	}	
	#if defined HUN_OnPlayerEnterDynamicArea
		HUN_OnPlayerEnterDynamicArea(playerid, areaid);
	#endif
	return 1;
}

#if defined _ALS_OnPlayerEnterDynamicArea
	#undef OnPlayerEnterDynamicArea
#else
	#define _ALS_OnPlayerEnterDynamicArea
#endif
#define OnPlayerEnterDynamicArea HUN_OnPlayerEnterDynamicArea
#if defined HUN_OnPlayerEnterDynamicArea
	forward HUN_OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA areaid);
#endif

#define Tryg3D_KeyPressed(%0) 							(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define Tryg3D_KeyReleased(%0)							(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define Tryg3D_KeyHolding(%0) 							((newkeys & (%0)) == (%0))

//Hook: OnPlayerKeyStateChange
public OnPlayerKeyStateChange(playerid,newkeys,oldkeys){
	if(Tryg3D_KeyPressed(Hunt_Key)){
		new mobid = Hunt_GetActiveMob(playerid,HUNTING_STATE_DEAD);
		if(Hunt_GetPressTime(mobid) == 0){
			#if defined OnPlayerTakeHuntDrop
				Hunt_Data[mobid][Hunt_drop] = OnPlayerTakeHuntDrop(playerid,mobid,Hunt_Data[mobid][Hunt_drop]);
			#endif
		} else {
			#if defined OnPlayerHuntDropStateChange
				OnPlayerHuntDropStateChange(playerid,mobid,HUNTING_DROP_STATE_START);
			#endif
			Hunt_PlayerPress[playerid] = GetTickCount() + Hunt_GetPressTime(mobid);
		}
	}
	if(Tryg3D_KeyReleased(Hunt_Key)){
		if(GetTickCount() >= Hunt_PlayerPress[playerid] && Hunt_PlayerPress[playerid] != 0){
			Hunt_PlayerPress[playerid] = 0;
			new mobid = Hunt_GetActiveMob(playerid,HUNTING_STATE_DEAD);
			if(Hunt_GetPressTime(mobid) > 0){
				#if defined OnPlayerHuntDropStateChange
					OnPlayerHuntDropStateChange(playerid,mobid,HUNTING_DROP_STATE_FINISH);
				#endif
				#if defined OnPlayerTakeHuntDrop
					Hunt_Data[mobid][Hunt_drop] = OnPlayerTakeHuntDrop(playerid,mobid,Hunt_Data[mobid][Hunt_drop]);
				#endif
			}
		} else {
			#if defined OnPlayerHuntDropStateChange
				new mobid = Hunt_GetActiveMob(playerid,HUNTING_STATE_DEAD);
				if(Hunt_GetPressTime(mobid) > 0){
					OnPlayerHuntDropStateChange(playerid,mobid,HUNTING_DROP_STATE_INTERRUPT);
				}
			#endif
		}
	}
	#if defined HUN_OnPlayerKeyStateChange
		HUN_OnPlayerKeyStateChange(playerid,newkeys,oldkeys);
	#endif
	return 1;
}

#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange HUN_OnPlayerKeyStateChange
#if defined HUN_OnPlayerKeyStateChange
	forward HUN_OnPlayerKeyStateChange(playerid,newkeys,oldkeys);
#endif

new bool:CRC_HuntingInit = true,
	bool:CRC_HuntingExit = true;

//Hook: OnFilterScriptInit
public OnFilterScriptInit(){
	if(CRC_HuntingInit){
		CRC_HuntingInit = false;
		Hunt_Timer = SetTimerEx("Hunt_OnUpdate",HUNTING_UPDATE_INTERVAL,true,"");
	}
	#if defined HUN_OnFilterScriptInit
		HUN_OnFilterScriptInit();
	#endif
	return 1;
}

#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit HUN_OnFilterScriptInit
#if defined HUN_OnFilterScriptInit
	forward HUN_OnFilterScriptInit();
#endif

//Hook: OnGameModeInit
public OnGameModeInit(){
	if(CRC_HuntingInit){
		CRC_HuntingInit = false;
		Hunt_Timer = SetTimerEx("Hunt_OnUpdate",HUNTING_UPDATE_INTERVAL,true,"");
	}
	#if defined HUN_OnGameModeInit
		HUN_OnGameModeInit();
	#endif
	return 1;
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit HUN_OnGameModeInit
#if defined HUN_OnGameModeInit
	forward HUN_OnGameModeInit();
#endif

//Hook: OnFilterScriptExit
public OnFilterScriptExit(){
	if(CRC_HuntingExit){
		CRC_HuntingExit = false;
		KillTimer(Hunt_Timer);
	}
	#if defined HUN_OnFilterScriptExit
		HUN_OnFilterScriptExit();
	#endif
	return 1;
}

#if defined _ALS_OnFilterScriptExit
	#undef OnFilterScriptExit
#else
	#define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit HUN_OnFilterScriptExit
#if defined HUN_OnFilterScriptExit
	forward HUN_OnFilterScriptExit();
#endif

//Hook: OnGameModeExit
public OnGameModeExit(){
	if(CRC_HuntingExit){
		CRC_HuntingExit = false;
		KillTimer(Hunt_Timer);
	}
	#if defined HUN_OnGameModeExit
		HUN_OnGameModeExit();
	#endif
	return 1;
}

#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit HUN_OnGameModeExit
#if defined HUN_OnGameModeExit
	forward HUN_OnGameModeExit();
#endif
