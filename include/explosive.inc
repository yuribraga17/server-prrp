#if !defined MAX_EXPLOSIVES
	#define MAX_EXPLOSIVES (128)
#endif
#if !defined EXP_STREAMER_AREA_IDENTIFIER
	#define EXP_STREAMER_AREA_IDENTIFIER (680)
#endif
#if !defined MAX_EXPLOSIVE_TIME
	#define MAX_EXPLOSIVE_TIME (30000)
#endif
#define INVALID_EXPLOSIVE_ID (-1)

enum
	e_TRIGGER
{
	/**
	 * NOTE: O gatilho MOVEMENT ainda não foi implementado.
	 */
	TIME,
	RADIO,
	PROXIMITY,
	MOVEMENT
}

enum
	e_DETECT
{
	ALL,
	PLAYER,
	VEHICLE
}

enum
	e_EXPLOSION
{
	TINY_1,
	LARGE,
	MEDIUM,
	NORMAL,
	SMALL,
	TINY_2
}

enum
	E_EXPLOSIVE_DATA
{
	Float:E_EXPLOSIVE_X,
	Float:E_EXPLOSIVE_Y,
	Float:E_EXPLOSIVE_Z,

	e_TRIGGER:E_EXPLOSIVE_TRIGGER,
	e_DETECT:E_EXPLOSIVE_DETECT,
	e_EXPLOSION:E_EXPLOSIVE_EXPLOSION,

	/**
	 * NOTE: Apenas para explosivos com gatilho TIME.
	 */
	Timer:E_EXPLOSIVE_TIMER,

	/**
	 * NOTE: O jogador que armou o explosivo.
	 */
	E_EXPLOSIVE_OWNER,

	E_EXPLOSIVE_OBJECT,
	E_EXPLOSIVE_AREA
}

static
	g_sExplosive@Data[MAX_EXPLOSIVES][E_EXPLOSIVE_DATA];

new
	Iterator:Explosive<MAX_EXPLOSIVES>;

static
	g_sExplosive@ID;

static
	g_sPlayer@NearestExplosive[MAX_PLAYERS] = {INVALID_EXPLOSIVE_ID, ...};

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	static
		data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA,
		areaid,
		E_STREAMER_EXTRA_ID, data, 2);

	if (data[0] != EXP_STREAMER_AREA_IDENTIFIER)
		return 1;

	if (!Iter_Contains(Explosive, data[1]))
	{
		printf("Streamer Area contém um ID de item inválido. (%i)", data[1]);
		return 1;
	}

	if (g_sExplosive@Data[data[1]][E_EXPLOSIVE_AREA] != areaid)
	{
		printf("A área do item (%i) não corresponde à área acionada (%i).",
			g_sExplosive@Data[data[1]][E_EXPLOSIVE_AREA],
			areaid);
		return 1;
	}

	g_sPlayer@NearestExplosive[playerid] = data[1];

	if (g_sExplosive@Data[data[1]][E_EXPLOSIVE_DETECT] == ALL)
	{
		if (g_sExplosive@Data[data[1]][E_EXPLOSIVE_TRIGGER] == PROXIMITY)
		{
			EXP@__:

			ExplodeExplosive(data[1]);
		}
	}

	if (g_sExplosive@Data[data[1]][E_EXPLOSIVE_DETECT] == PLAYER
		&& !IsPlayerInAnyVehicle(playerid))
		goto EXP@__;

	if (g_sExplosive@Data[data[1]][E_EXPLOSIVE_DETECT] == VEHICLE
		&& IsPlayerInAnyVehicle(playerid))
		goto EXP@__;

	printf("Explosivo %i desencadeado por %i.", data[1], playerid);

	#if defined EXP@OnPlayerEnterDynamicArea
		return EXP@OnPlayerEnterDynamicArea(playerid, areaid);
	#else
		return 1;
	#endif
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	static
		data[2];

	Streamer_GetArrayData(STREAMER_TYPE_AREA,
		areaid,
		E_STREAMER_EXTRA_ID, data, 2);

	if (data[0] != EXP_STREAMER_AREA_IDENTIFIER)
		return 1;

	g_sPlayer@NearestExplosive[playerid] = INVALID_EXPLOSIVE_ID;

	#if defined EXP@OnPlayerLeaveDynamicArea
		return EXP@OnPlayerLeaveDynamicArea(playerid, areaid);
	#else
		return 1;
	#endif
}

CreateExplosive(Float:x, Float:y, Float:z,
	e_TRIGGER:trigger = PROXIMITY, e_DETECT:detect = ALL, e_EXPLOSION:explosion = NORMAL,
	time = MAX_EXPLOSIVE_TIME, playerid = INVALID_PLAYER_ID)
{
	if (INVALID_EXPLOSIVE_ID == (g_sExplosive@ID = Iter_Free(Explosive)))
	{
		print("O limite de criação de explosivos foi atingido.");
		return
			INVALID_EXPLOSIVE_ID;
	}

	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_X] = x;
	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_Y] = y;
	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_Z] = z;

	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_TRIGGER] = trigger;
	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_DETECT] = detect;
	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_EXPLOSION] = explosion;

	if (trigger == TIME)
		g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_TIMER] = defer ExplodeTimer[time](g_sExplosive@ID);

	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_OWNER] = playerid;

	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_OBJECT] = CreateDynamicObject(19602,
		x,
		y,
		z,
		0.0,
		0.0,
		0.0);
	g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_AREA] = CreateDynamicSphere(
		x,
		y,
		z,
		1.5);

	static
		data[2];

	data[0] = EXP_STREAMER_AREA_IDENTIFIER;
	data[1] = g_sExplosive@ID;

	Streamer_SetArrayData(STREAMER_TYPE_AREA,
		g_sExplosive@Data[g_sExplosive@ID][E_EXPLOSIVE_AREA],
		E_STREAMER_EXTRA_ID, data, 2);

	Iter_Add(Explosive, g_sExplosive@ID);
	return
		g_sExplosive@ID;
}

DestroyExplosive(explosiveid)
{
	if (!Iter_Contains(Explosive, explosiveid))
		return;

	DestroyDynamicObject(g_sExplosive@Data[explosiveid][E_EXPLOSIVE_OBJECT]);
	DestroyDynamicArea(g_sExplosive@Data[explosiveid][E_EXPLOSIVE_AREA]);

	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_X] =
	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_Y] =
	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_Z] = 0.0;

	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_TRIGGER] = PROXIMITY;
	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_DETECT] = ALL;
	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_EXPLOSION] = NORMAL;

	stop g_sExplosive@Data[explosiveid][E_EXPLOSIVE_TIMER];

	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_OWNER] = INVALID_PLAYER_ID;

	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_OBJECT] = INVALID_OBJECT_ID;
	g_sExplosive@Data[explosiveid][E_EXPLOSIVE_AREA] = -1;

	Iter_Remove(Explosive, explosiveid);
}

ExplodeExplosive(explosiveid)
{
	if (!Iter_Contains(Explosive, explosiveid))
		return;

	CreateExplosion(
		g_sExplosive@Data[explosiveid][E_EXPLOSIVE_X],
		g_sExplosive@Data[explosiveid][E_EXPLOSIVE_Y],
		g_sExplosive@Data[explosiveid][E_EXPLOSIVE_Z],
		g_sExplosive@Data[explosiveid][E_EXPLOSIVE_EXPLOSION],
		5.0);

	DestroyExplosive(explosiveid);
}

DefuseExplosive(explosiveid)
{
	if (!Iter_Contains(Explosive, explosiveid))
		return;

	if (random(100) <= 3)
	{
		ExplodeExplosive(explosiveid);
		return;
	}

	DestroyExplosive(explosiveid);
}

GetExplosiveOwner(explosiveid)
	return ((Iter_Contains(Explosive, explosiveid))
			? (g_sExplosive@Data[explosiveid][E_EXPLOSIVE_OWNER])
			: (INVALID_PLAYER_ID));

GetPlayerNearestExplosive(playerid)
	return ((IsPlayerConnected(playerid))
			? (g_sPlayer@NearestExplosive[playerid])
			: (INVALID_EXPLOSIVE_ID));

timer ExplodeTimer[0](explosiveid)
{
	ExplodeExplosive(explosiveid);
}

#if defined _ALS_OnPlayerEnterDynamicArea
	#undef OnPlayerEnterDynamicArea
#else
	#define _ALS_OnPlayerEnterDynamicArea
#endif

#define OnPlayerEnterDynamicArea EXP@OnPlayerEnterDynamicArea
#if defined EXP@OnPlayerEnterDynamicArea
	forward EXP@OnPlayerEnterDynamicArea(playerid, areaid);
#endif

#if defined _ALS_OnPlayerLeaveDynamicArea
	#undef OnPlayerLeaveDynamicArea
#else
	#define _ALS_OnPlayerLeaveDynamicArea
#endif

#define OnPlayerLeaveDynamicArea EXP@OnPlayerLeaveDynamicArea
#if defined EXP@OnPlayerLeaveDynamicArea
	forward EXP@OnPlayerLeaveDynamicArea(playerid, areaid);
#endif
