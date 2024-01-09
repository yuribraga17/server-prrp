#if !defined foreach || !defined Iter_Add
	#include <YSI\y_iterate>
#endif

#if !defined timer || !defined defer
	#include <YSI\y_timers>
#endif

#if !defined _streamer_included
	#include <streamer>
#endif

#if !defined MAX_TRAPS
	#define MAX_TRAPS (128)
#endif

#define INVALID_TRAP_ID (-1)
#define TRAP_STREAMER_AREA_IDENTIFIER (700)

/**
 * Tempo em milissegundos.
 * Atualmente 30 segundos.
 */
#if !defined TRAP_RELEASE_TIME
	#define TRAP_RELEASE_TIME (30000)
#endif

enum E_TRAP_DATA
{
	Float:E_TRAP_X,
	Float:E_TRAP_Y,
	Float:E_TRAP_Z,
	Float:E_TRAP_DETECTION_RANGE,
	E_TRAP_OBJECT_ID,
	E_TRAP_AREA_ID,
	Text3D:E_TRAP_3DTEXT_ID,
	E_TRAP_OWNER_ID,
	E_TRAP_TRIGGER_ID
}

static
	g_sTrap@Data[MAX_TRAPS][E_TRAP_DATA],
	Iterator:g_sTrap@Index<MAX_TRAPS>,
	g_sPlayer@NearTrap[MAX_PLAYERS] = {INVALID_TRAP_ID, ...};

#if defined OnPlayerTriggerTrap
	forward OnPlayerTriggerTrap(playerid, trapid);
#endif

stock CreateTrap(Float:x, Float:y, Float:z, Float:detection_range = 5.0, playerid = INVALID_PLAYER_ID)
{
	static
		trapid = INVALID_TRAP_ID;

	if ((trapid = Iter_Free(g_sTrap@Index)) == INVALID_TRAP_ID)
		return INVALID_TRAP_ID;

	g_sTrap@Data[trapid][E_TRAP_X] = x;
	g_sTrap@Data[trapid][E_TRAP_Y] = y;
	g_sTrap@Data[trapid][E_TRAP_Z] = z;
	g_sTrap@Data[trapid][E_TRAP_DETECTION_RANGE] = detection_range;
	g_sTrap@Data[trapid][E_TRAP_OBJECT_ID] = CreateDynamicObject(2945, x, y, z, 90.0, 0.0, 0.0);
	g_sTrap@Data[trapid][E_TRAP_AREA_ID] = CreateDynamicSphere(x, y, z, detection_range);
	g_sTrap@Data[trapid][E_TRAP_3DTEXT_ID] = CreateDynamic3DTextLabel(#, -1, x, y, z, detection_range);
	g_sTrap@Data[trapid][E_TRAP_OWNER_ID] = playerid;
	g_sTrap@Data[trapid][E_TRAP_TRIGGER_ID] = INVALID_PLAYER_ID;

	static
		data[2];

	data[0] = TRAP_STREAMER_AREA_IDENTIFIER;
	data[1] = trapid;

	Streamer_SetArrayData(STREAMER_TYPE_AREA, g_sTrap@Data[trapid][E_TRAP_AREA_ID], E_STREAMER_EXTRA_ID, data, sizeof(data));

	Iter_Add(g_sTrap@Index, trapid);
	return trapid;
}

stock DestroyTrap(trapid)
{
	if (!Iter_Contains(g_sTrap@Index, trapid))
		return 0;

	Iter_Remove(g_sTrap@Index, trapid);

	DestroyDynamicObject(g_sTrap@Data[trapid][E_TRAP_OBJECT_ID]);
	DestroyDynamicArea(g_sTrap@Data[trapid][E_TRAP_AREA_ID]);
	DestroyDynamic3DTextLabel(g_sTrap@Data[trapid][E_TRAP_3DTEXT_ID]);

	g_sTrap@Data[trapid][E_TRAP_X] =
	g_sTrap@Data[trapid][E_TRAP_Y] =
	g_sTrap@Data[trapid][E_TRAP_Z] =
	g_sTrap@Data[trapid][E_TRAP_DETECTION_RANGE] = 0.0;
	g_sTrap@Data[trapid][E_TRAP_OBJECT_ID] = INVALID_OBJECT_ID;
	g_sTrap@Data[trapid][E_TRAP_AREA_ID] = -1;
	g_sTrap@Data[trapid][E_TRAP_3DTEXT_ID] = Text3D:-1;
	g_sTrap@Data[trapid][E_TRAP_OWNER_ID] =
	g_sTrap@Data[trapid][E_TRAP_TRIGGER_ID] = INVALID_PLAYER_ID;
	return 1;
}

stock IsValidTrap(trapid)
	return Iter_Contains(g_sTrap@Index, trapid);

stock GetTrapPos(trapid, &Float:x, &Float:y, &Float:z)
{
	if (!Iter_Contains(g_sTrap@Index, trapid))
		return 0;

	x = g_sTrap@Data[trapid][E_TRAP_X];
	y = g_sTrap@Data[trapid][E_TRAP_Y];
	z = g_sTrap@Data[trapid][E_TRAP_Z];
	return 1;
}

stock Float:GetTrapDetectionRange(trapid)
	return (Iter_Contains(g_sTrap@Index, trapid)) ? (g_sTrap@Data[trapid][E_TRAP_DETECTION_RANGE]) : (0.0);

stock GetTrapObjectID(trapid)
	return (Iter_Contains(g_sTrap@Index, trapid)) ? (g_sTrap@Data[trapid][E_TRAP_OBJECT_ID]) : (INVALID_OBJECT_ID);

stock GetTrapAreaID(trapid)
	return (Iter_Contains(g_sTrap@Index, trapid)) ? (g_sTrap@Data[trapid][E_TRAP_AREA_ID]) : (-1);

stock GetTrapOwnerID(trapid)
	return (Iter_Contains(g_sTrap@Index, trapid)) ? (g_sTrap@Data[trapid][E_TRAP_OWNER_ID]) : (INVALID_PLAYER_ID);

stock GetTrapTriggerID(trapid)
	return (Iter_Contains(g_sTrap@Index, trapid)) ? (g_sTrap@Data[trapid][E_TRAP_TRIGGER_ID]) : (INVALID_PLAYER_ID);

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	static
		data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, sizeof(data));

	if (data[0] == TRAP_STREAMER_AREA_IDENTIFIER && Iter_Contains(g_sTrap@Index, data[1]))
	{
		g_sPlayer@NearTrap[playerid] = data[1];

		if (GetTrapOwnerID(data[1]) == playerid || GetTrapTriggerID(data[1]) != INVALID_PLAYER_ID)
			return 1;

		#if defined OnPlayerTriggerTrap
			if (!OnPlayerTriggerTrap(playerid, data[1]))
				return 1;
		#endif

		PutPlayerInTrap(playerid, data[1]);
	}
	#if defined TRAP@OnPlayerEnterDynamicArea
		return TRAP@OnPlayerEnterDynamicArea(playerid, areaid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerEnterDynamicArea
	#undef OnPlayerEnterDynamicArea
#else
	#define _ALS_OnPlayerEnterDynamicArea
#endif

#define OnPlayerEnterDynamicArea TRAP@OnPlayerEnterDynamicArea
#if defined TRAP@OnPlayerEnterDynamicArea
	forward TRAP@OnPlayerEnterDynamicArea(playerid, areaid);
#endif

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	static
		data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data, sizeof(data));

	if (data[0] == TRAP_STREAMER_AREA_IDENTIFIER)
		g_sPlayer@NearTrap[playerid] = INVALID_TRAP_ID;

	#if defined TRAP@OnPlayerLeaveDynamicArea
		return TRAP@OnPlayerLeaveDynamicArea(playerid, areaid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerLeaveDynamicArea
	#undef OnPlayerLeaveDynamicArea
#else
	#define _ALS_OnPlayerLeaveDynamicArea
#endif

#define OnPlayerLeaveDynamicArea TRAP@OnPlayerLeaveDynamicArea
#if defined TRAP@OnPlayerLeaveDynamicArea
	forward TRAP@OnPlayerLeaveDynamicArea(playerid, areaid);
#endif

PutPlayerInTrap(playerid, trapid)
{
	if (!IsPlayerConnected(playerid) || !Iter_Contains(g_sTrap@Index, trapid))
		return;

	ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 1, 0, 1);
	ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 1, 0, 1);

	static
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

	DestroyDynamicObject(g_sTrap@Data[trapid][E_TRAP_OBJECT_ID]);

	g_sTrap@Data[trapid][E_TRAP_OBJECT_ID] = CreateDynamicObject(2068, x, y, z - 1.25, 180.0, 0.0, 0.0);
	g_sTrap@Data[trapid][E_TRAP_TRIGGER_ID] = playerid;

	defer RemovePlayerFromTrapTimer(playerid, trapid);
}

timer RemovePlayerFromTrapTimer[TRAP_RELEASE_TIME](playerid, trapid)
{
	if (!IsPlayerConnected(playerid))
		return;

	RemovePlayerFromTrap(playerid, trapid);
}

stock RemovePlayerFromTrap(playerid, trapid)
{
	if (GetPlayerTrapID(playerid) != trapid || !Iter_Contains(g_sTrap@Index, trapid))
		return;

	DestroyTrap(trapid);

	Streamer_Update(playerid);

	ClearAnimations(playerid);
}

stock IsPlayerInAnyTrap(playerid)
{
	if (!IsPlayerConnected(playerid))
		return false;

	foreach (new i : g_sTrap@Index)
	{
		if (g_sTrap@Data[i][E_TRAP_OWNER_ID] != playerid && g_sTrap@Data[i][E_TRAP_TRIGGER_ID] == playerid)
			return true;
	}
	return false;
}

stock GetPlayerTrapID(playerid)
{
	if (!IsPlayerConnected(playerid))
		return INVALID_TRAP_ID;

	foreach (new i : g_sTrap@Index)
	{
		if (g_sTrap@Data[i][E_TRAP_OWNER_ID] != playerid && g_sTrap@Data[i][E_TRAP_TRIGGER_ID] == playerid)
			return i;
	}
	return INVALID_TRAP_ID;
}

stock GetPlayerNearbyTrap(playerid)
	return (IsPlayerConnected(playerid)) ? (g_sPlayer@NearTrap[playerid]) : (INVALID_TRAP_ID);

public OnPlayerDisconnect(playerid, reason)
{
	static
		trapid = INVALID_TRAP_ID;

	if ((trapid = GetPlayerTrapID(playerid)) != INVALID_TRAP_ID)
		DestroyTrap(trapid);

	#if defined TRAP@OnPlayerDisconnect
		return TRAP@OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect TRAP@OnPlayerDisconnect
#if defined TRAP@OnPlayerDisconnect
	forward TRAP@OnPlayerDisconnect(playerid, reason);
#endif
