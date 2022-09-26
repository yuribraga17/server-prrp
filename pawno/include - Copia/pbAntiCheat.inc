////////////////////////////////////////////////////////////////////////////////
//
//
//        #### ########   ######     ######## ########    ###    ##     ##
//         ##  ##     ## ##    ##       ##    ##         ## ##   ###   ###
//         ##  ##     ## ##             ##    ##        ##   ##  #### ####
//         ##  ########   ######        ##    ######   ##     ## ## ### ##
//         ##  ##              ##       ##    ##       ######### ##     ##
//         ##  ##        ##    ##       ##    ##       ##     ## ##     ##
//        #### ##         ######        ##    ######## ##     ## ##     ##
//
//
//          Por Bruno da Silva (iPs DraKiNs) e  Paulo (iPs Paulo)
//
//          Acesse meu blog sobre programação www.brunodasilva.com
//
//			--------------------------------------------
//
//			Detectar:
//				Bot,
//				Death Flood,
//				Surf Vehicle,
//				Car Teleport,
//				State Hack,
//				No-Reload,
//				Ammo Hack,
//				Freeze Hack,
//				Score Hack,
//				Health Hack,
//				Armour Hack,
//				Publish Text,
//				Offend Text,
//				Flood Text,
//				Teleport Hack,
//				Air Break,
//				Player Bugger,
//				High Ping,
//				Spider Hack,
//				CP Race Hack,
//				Speed Hack,
//				Player Speed Hack,
//				Fly Hack
//
//			--------------------------------------------
//
//					www.brunodasilva.com
// *  Bruno da Silva (email@brunodasilva.com) 
//
//					Ingresse também na [iPs]TeaM
//					wwww.ips-team.forumeiros.com
//
//////////////////////////////////////////////////////////////////////////////////

enum {
	// Anti DDos Bots
	PLAYER_BOT_LEVEL3,
	PLAYER_BOT_LEVEL2,
	PLAYER_BOT_LEVEL1,

	// Anti Cleo4 Fake-kill
	PLAYER_DEATHFLOOD_LEVEL3,
	PLAYER_DEATHFLOOD_LEVEL2,
	PLAYER_DEATHFLOOD_LEVEL1,

	// Anti Bug Cars
	PLAYER_SURF_VEHICLE,
	PLAYER_CAR_TELEPORT,
	PLAYER_STATE_HACK,

	// hackings
	PLAYER_FREEZE_HACK,
	PLAYER_SCORE_HACK,
	PLAYER_HEALTH_HACK,
	PLAYER_ARMOUR_HACK,

	// Text Chat
	PLAYER_PUBLISH_TEXT,
	PLAYER_OFFEND_TEXT,
	PLAYER_FLOOD_TEXT,

	// pos cheat
	PLAYER_TELEPORT_HACK,
	PLAYER_AIRBREAK_HACK,
	PLAYER_BUGGER_HACK,

	// outros
	PLAYER_HIGH_PING,
	PLAYER_SPIDER_HACK,
	PLAYER_CPRACE_HACK,
	PLAYER_SPEED_HACK,
	PLAYER_PSPEED_HACK,
	PLAYER_FLY_HACK
}


new connect = -1,
	Float: g_ucPos[4],
	databaseIP[MAX_PLAYERS][20],
	Float:g_diferencasAngle[MAX_VEHICLES],
	vehVelocity[MAX_VEHICLES],
	bool: vehRespawn[MAX_VEHICLES],
	bool: pOPC,
	bool: pOPS,
	bool: pOPDI,
	bool: pOPT,
	bool: pOPD,
	bool: pOVM,
	bool: pOPERCP,
	bool: pOPU,
	bool: pOPSC,
	bool: pOUVU;

forward OnPlayerHacking(playerid, hackid);

#define INVALID_CHAT_BLOCK
#define SERVER_SIDE_DELAY   (0002)
#define MAX_DISTANCE_DEF    (83.1)
#define MAX_PING            (0800)


// =============================================================================
//
// OBSERVAÇõES IMPORTANTES:

// #define INVALID_CHAT_BLOCK
// Em caso de não quiser bloquear o texto em caso de texto inválido
// Texto inválido, spam, flood, palavreado, ofensa, publicação. etc

// Ping acima de 1 segundo (1000 ms) poderá ocorrer graves problemas de precisão no anti cheater.
// Em caso de ping muito elevado aconselha-se o uso de SERVER_SIDE_DELAY elevado para maior precisão

// SERVER_SIDE_DELAY equivale ao tempo de delay entre o uso de uma função registrada
// que influencia no detectamento do anti cheater. Aconselhável 1 a 5 segundos.
// Dependendo da conexão do servidor você coloca maior delay ou menor dealay

// MAX_DISTANCE_DEF é essencial para busca e detecção de anti-teleport e air break
// O número padrão foi calculado e não houve bugs por parte do sistema
// A única coisa que pode influenciar será o sistema de SetPlayerPos. Mas o SERVER_SIDE_DELAY supriu isto com precisão

// Este sistema apenas detecta cheaters. É aconselhavél a checagem de um administrador real antes de aplicar o banimento.

// ========================================================================================================

#define pFunction%0(%1) %0(%1); public%0(%1)
#define Hook%0(%1)  stock%0_pB(%1)

// ---------------------------------------------
//  Nesta parte aparecem funções hookeadas
//  Elas são essenciais para ter controle server-side detalhado
//  Essencial para qualquer anti-hack. Controle minucioso
//  Para o funcionamento disto precisa do filterscript
//	Hookei apenas as mais importantes callbacks nativas da sa:mp.
//	Daria muito trabalho "hookear" todas
// ---------------------------------------------

Hook SetPlayerScore(playerid, value){
	return SetPVarInt(playerid, #registerScore, value), SetPlayerScore(playerid, value);
}

Hook PutPlayerInVehicle(playerid,vehicleid, seatid) {
	return SetPVarInt(playerid, #registerState, (gettime() - SERVER_SIDE_DELAY)), PutPlayerInVehicle(playerid, vehicleid, seatid);
}

Hook SetVehicleVelocity(vehicleid, Float: pX, Float: pY, Float: pZ) {
	return vehVelocity[vehicleid] = gettime(), SetVehicleVelocity(vehicleid, pX, pY, pZ);
}

Hook SetVehiclePos(vehicleid, Float: pX, Float: pY, Float: pZ) {

	for( new i = GetMaxPlayers() - 1; i > -1;  --i ) {
		if( GetPlayerVehicleID(i) == vehicleid ) {
			SetPVarInt(i, #tPosSet, gettime());
			break;
		}
	}

	return SetVehiclePos(vehicleid, pX, pY, pZ);
}

Hook SetPlayerPos(playerid, Float: pX, Float: pY, Float: pZ) {
	return SetPVarInt(playerid, #tPosSet, gettime()), SetPlayerPos(playerid, pX, pY, pZ);
}

Hook TogglePlayerC(playerid, {bool, _}: control) {
	if(control) {
		static Float: pX, Float: pY, Float: pZ;

		GetPlayerPos(playerid, pX, pY, pZ);
		SetPVarFloat(playerid, "xPosControll", pX),
		SetPVarFloat(playerid, "yPosControll", pY),
		SetPVarFloat(playerid, "zPosControll", pZ);
	} else {
		SetPVarFloat(playerid, "xPosControll", 0.0);
		SetPVarFloat(playerid, "yPosControll", 0.0);
		SetPVarFloat(playerid, "zPosControll", 0.0);
	}
	TogglePlayerControllable(playerid, control);
	return SetPVarInt(playerid, "PlayerControllable", _:!control);
}

Hook SetPlayerHealth(playerid, Float:health) {
	return SetPVarFloat(playerid, #pHealth, health), SetPlayerHealth(playerid, health);
}

Hook SetPlayerArmour(playerid, Float:armour) {
	return SetPVarFloat(playerid, #pArmour, armour), SetPlayerArmour(playerid, armour);
}

Hook SetVehicleToRespawn(vehicleid) {
	return vehRespawn[vehicleid] = true, SetVehicleToRespawn(vehicleid);
}

isPlayerInWater_pB(playerid) { //Coords By Synchro
	static Float:fX, Float:fY, Float:fZ; GetPlayerPos(playerid, fX, fY, fZ);
	if((fX >= 2044.6 && fX <= 2192.984 && fY >= 1206.358 && fY <= 1376.552) && fZ < 0xA) return 1;
	else if((fX >= 2048.504 && fX <= 2185.174 && fY >= 1063.239 && fY <= 1202.49) && fZ < 0xA) return 1;
	else if((fX >= 2204.698 && fX <= 2204.698 && fY >= 1426.837 && fY <= 1430.705) && fZ < 0xA) return 1;
	else if((fX >= 2032.885 && fX <= 2114.887 && fY >= 1852.325 && fY <= 1991.575) && fZ < 0xC) return 1;
	else if((fX >= 2517.086 && fX <= 2606.897 && fY >= 2316.493 && fY <= 2420.93) && fZ < 0x16) return 1;
	else if((fX >= 2554.5996 && fX <= 2507.7683 && fY >= 1548.6178 && fY <= 1588.9154) && fZ < 0xF) return 1;
	else if((fX >= -2043.628 && fX <= -1973.561 && fY >= -980.9415 && fY <= -724.0283) && fZ < 0x20) return 1;
	else if((fX >= -2753.912 && fX <= -2665.071 && fY >= -522.3632 && fY <= -380.3444) && fZ < 0x05) return 1;
	else if((fX >= 1219.864 && fX <= 1292.118 && fY >= -2435.881 && fY <= -2325.344) && fZ < 0xF) return 1;
	else if((fX >= 1923.388 && fX <= 2010.854 && fY >= -1223.924 && fY <= -1168.656) && fZ < 0x16) return 1;
	else if((fX >= 1269.301 && fX <= 1314.935 && fY >= -837.0452 && fY <= -781.7769) && fZ < 0x5A) return 1;
	else if((fX >= 1087.3953 && fX <= 1102.3138 && fY >= -682.6734 && fY <= -663.0043) && fZ < 0x71) return 1;
	else if((fX >= 1268.6118 && fX <= 1291.8774 && fY >= -784.2910 && fY <= -764.6104) && fZ < 0x43D) return 1;
	else if(fZ < 0xF) return 1;
	return 0;
}

isPlayerUsingSwimAnim_pB(playerid) { // By Synchro
	if(IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;
	static animlib[32], animname[32];
	GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
	if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_GLIDE", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_BREAST", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_CRAWL", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_UNDER", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_DIVE_GLIDE", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_UNDER", true)) return 1;
	else if(!strcmp(animlib, "SWIM", true) && !strcmp(animname, "SWIM_TREAD", true)) return 1;
	return 0;
}

getPlayerSpeed_pB(playerid) {
	static Float: ST[3];
	GetVehicleVelocity(GetPlayerVehicleID(playerid), ST[0], ST[1], ST[2]);
	return floatround(floatmul(floatsqroot(floatadd(floatpower(ST[0], 2), floatpower(ST[1], 2))), 170.0));
}

#if !defined varGet
#define varGet(%0)	getproperty(0,%0)
#endif

#if !defined varSet
#define varSet(%0,%1) setproperty(0, %0, %1)
#endif

public OnGameModeInit() {
	pOPC = funcidx(#ExOnPlayerConnect) != -1;
	pOPS = funcidx(#ExOnPlayerSpawn) != -1;
	pOPDI = funcidx(#ExOnPlayerDisconnect) != -1;
	pOPT = funcidx(#ExOnPlayerText) != -1;
	pOPD = funcidx(#ExOnPlayerDeath) != -1;
	pOVM = funcidx(#ExOnVehicleMod) != -1;
	pOPERCP = funcidx(#ExOnPlayerEnterRaceCP) != -1;
	pOPU = funcidx(#ExOnPlayerUpdate) != -1;
	pOPSC = funcidx(#ExOnPlayerStateChange) != -1;
	pOUVU = funcidx(#ExOnUnoccupiedVehicleUpdate) != -1;
	return CallLocalFunction(#ExOnGameModeInit, #);
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit ExOnGameModeInit
forward ExOnGameModeInit();

public OnPlayerConnect(playerid) {
	CallLocalFunction("registrarJogador_pB", "i", playerid);
	return (pOPC ? CallLocalFunction("ExOnPlayerConnect", "i", playerid) : 1);
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect ExOnPlayerConnect
forward ExOnPlayerConnect(playerid);

public OnPlayerSpawn(playerid) {
	if(!GetPVarInt(playerid, "pSpawned")) SetPVarInt(playerid, "pSpawned", true);
	SetPVarFloat(playerid, #pHealth, 100.0);
	SetPVarFloat(playerid, #pArmour, 0.0);
	SetPlayerHealth(playerid, 100.0);
	SetPlayerArmour(playerid, 0.0);
	return (pOPS ? CallLocalFunction("ExOnPlayerSpawn", "i", playerid) : 1);
}

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#define OnPlayerSpawn ExOnPlayerSpawn
forward ExOnPlayerSpawn(playerid);

public OnPlayerDisconnect(playerid, reason) {
	// Não retire está parte. Isto serve para não enviar mensagens de desconecção quando o player é bot ddos
	if(GetPVarInt(playerid, #jogadorDisponivel)) return false;
	return (pOPDI ? CallLocalFunction("ExOnPlayerDisconnect", "is", playerid, reason) : 1);
}

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect ExOnPlayerDisconnect
forward ExOnPlayerDisconnect(playerid,reason);

new const palavreado[][24] = {
	"daputa", "babaca", "baitola", "piranha", "bicha", "bichona", "biscat", "bitch", "bix", "boiola", "boiolona", "buceta", "bucetudo", "cuzona", "bund", "burr", "fude", "cacet", "viad",
	"caral", "vadi", "carai", "rola", "chup", "idiot", "corno", "nocu", "eucu", "ocu", "cusa", "cusi", "cuza", "cuzinho", "piroca", "embecil", "fdp", "foda", "fode", "fuck", "fud", 
	"hetard", "homo", "imbess", "jegu", "kacet", "karai", "karaleo", "kct", "kral", "krl", "noku", "lasarent", "lazarent", "mula", "otari", "pnc", "pereb", "penis","pint", "prosti",
	"punhet", "put", "retardado", "tnc", "viad", "viadi", "vsf", "vtnc", "sobe", "vogelz", "baranga", "vagab", "broxa", "ignorant", "comed", "ejacu", "prosti", "cachorr", "surub", "peni",
	"chup", "pau", "viad", "perere", "bucet", "bicha", "bixa", "gay", "desgra", "troxa", "tomanocu", "seucu"
};

public OnPlayerText(playerid, text[]) {

	/*--------------------------------------------------
	*
	*  Anti Publicação de IP Inteligente
	*   Usando OnPlayerText com manipulação de strings e outros
	*   A precisão deste sistema está em torno de 95%
	*
	* Detecta: 127.0.0.1 | 1 2    7 .   0  0 1 etc
	-------------------------------------------------*/

	static szText[128], numerosNochat, pontosNochat, j;

	numerosNochat = -1, pontosNochat = -1, j = 0, szText[0] = EOS;

	for(new i; text[i]; i++) {

		if(text[i] >= '0' && '9' >= text[i] || (text[i] == '.' || text[i] == ':')) {
			if(text[i] == '.' || text[i] == ':') pontosNochat++;
			else numerosNochat++;
			if(numerosNochat >= 8 && pontosNochat >= 3) {
				CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_PUBLISH_TEXT);
				#if defined INVALID_CHAT_BLOCK
				return false;
				#else
				break;
				#endif
			}
		}

		switch(text[i]) {
			case '0':{ szText[j] = 'o'; j++; continue; }
			case '1':{ szText[j] = 'i'; j++; continue; }
			case '2':{ szText[j] = 'z'; j++; continue; }
			case '3':{ szText[j] = 'e'; j++; continue; }
			case '4':{ szText[j] = 'a'; j++; continue; }
			case '5':{ szText[j] = 's'; j++; continue; }
			case '6':{ szText[j] = 'g'; j++; continue; }
			case '7':{ szText[j] = 't'; j++; continue; }
			case '8':{ szText[j] = 'b'; j++; continue; }
			case 65 .. 90, 97 .. 122: { szText[j] = tolower(text[i]); j++; continue; }
		}
	}

	/*--------------------------------------------------
	*
	*  Anti Palavreado Inteligente
	*   Usando OnPlayerText com manipulação de strings e outros
	*   A precisão deste sistema está em torno de 85%
	*
	* Detecta: buceta, b - u c |e t-a, buc 3 7 4 etc
	-------------------------------------------------*/

	for(new i = 0; i < sizeof(palavreado); i++) {
		if(strfind(szText, palavreado[i], false) != -1) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_OFFEND_TEXT);

			#if defined INVALID_CHAT_BLOCK
			return false;
			#else
			break;
			#endif
		}
	}

	/*--------------------------------------------------
	*
	*  Anti Flood
	*   Usando OnPlayerText com gettime e outros
	*   A precisão deste sistema está em torno de 95%
	*
	-------------------------------------------------*/

	if((gettime() - GetPVarInt(playerid, #floodChat)) < 3) {
		CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_FLOOD_TEXT);
		#if defined INVALID_CHAT_BLOCK
		return false;
		#endif
	}

	SetPVarInt(playerid, #floodChat, gettime());
	return (pOPT ? CallLocalFunction("ExOnPlayerText", "is", playerid, text) : 1);
}

#if defined _ALS_OnPlayerText
	#undef OnPlayerText
#else
	#define _ALS_OnPlayerText
#endif

#define OnPlayerText ExOnPlayerText
forward ExOnPlayerText(playerid, text[]);

public OnPlayerDeath(playerid,killerid,reason) {

	/*--------------------------------------------------
	*
	*  Anti Fake Kill
	*   Usando OnPlayerDeath com gettime e outros
	*   A precisão deste sistema está dividido em partes
	*
	*  PLAYER_DEATHFLOOD_LEVEL1 -> 070%
	*  PLAYER_DEATHFLOOD_LEVEL2 -> 090%
	*  PLAYER_DEATHFLOOD_LEVEL3 -> 100%
	*
	*
	-------------------------------------------------*/

	if(gettime() - GetPVarInt(playerid, #registerDeath) < 20) {
		if(GetPVarInt(playerid, #registerValDeath) > 15) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_DEATHFLOOD_LEVEL1);
		}
		if(gettime() - GetPVarInt(playerid, #registerDeath) < 2) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_DEATHFLOOD_LEVEL2);
		}
		if(gettime() - GetPVarInt(playerid, #registerDeath) < 5) {
			if(GetPVarInt(playerid, #registerValDeath) > 3) {
				CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_DEATHFLOOD_LEVEL3);
			}
		}
	}
	SetPVarInt(playerid, #registerDeath, gettime());
	SetPVarInt(playerid, #registerValDeath, GetPVarInt(playerid, #registerValDeath) +1);

	return (pOPD ? CallLocalFunction("ExOnPlayerDeath", "i", playerid) : 1);
}

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath ExOnPlayerDeath
forward ExOnPlayerDeath(playerid, killerid, reason);

public OnVehicleMod(playerid, vehicleid, componentid) {
	if(!GetPlayerInterior(playerid)) {
		CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_CPRACE_HACK);
	}
	return (pOVM ? CallLocalFunction("ExOnVehicleMod", "ddd", playerid, vehicleid, componentid) : 1);
}

#if defined _ALS_OnVehicleMod
	#undef OnVehicleMod
#else
	#define _ALS_OnVehicleMod
#endif

#define OnVehicleMod ExOnVehicleMod
forward ExOnVehicleMod(playerid,vehicleid,componentid);

public OnPlayerEnterRaceCheckpoint(playerid) {
	if(IsPlayerInAnyVehicle(playerid)) {
		if(!getPlayerSpeed_pB(playerid)) {
			if(GetPVarInt(playerid, #checkHack) > 3) {
				CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_CPRACE_HACK);
				SetPVarInt(playerid, #checkHack, 0);
			}
			SetPVarInt(playerid, #checkHack, GetPVarInt(playerid, #checkHack)+1);
		}
	}
	return (pOPERCP ? CallLocalFunction("ExOnPlayerEnterRaceCP", "i", playerid) : 1);
}

#if defined _ALS_OnPlayerEnterRaceCP
	#undef OnPlayerEnterRaceCheckpoint
#else
	#define _ALS_OnPlayerEnterRaceCP
#endif

#define OnPlayerEnterRaceCheckpoint ExOnPlayerEnterRaceCP
forward ExOnPlayerEnterRaceCP(playerid);

public OnPlayerUpdate(playerid) {
	if(!IsPlayerNPC(playerid)) {
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {

			/*--------------------------------------------------
			*
			*  Anti Speed Hack
			*   Usando GetPlayerSpeedANTIHACK com variáveis
			*   A precisão deste sistema fica em torno de 100%
			*
			-------------------------------------------------*/

			if(GetPVarInt(playerid, #checkSpeedtime)) {
				if(gettime() - GetPVarInt(playerid, #checkSpeedtime) > 1) {
					TogglePlayerControllable(playerid, true);
					SetPVarInt(playerid, "checkSpeedtime", 0);
				}
			}
			if(getPlayerSpeed_pB(playerid) > 260) {
				if((gettime() - vehVelocity[GetPlayerVehicleID(playerid)]) > 10) {
					TogglePlayerControllable(playerid, false);
					SetPVarInt(playerid, "checkSpeedtime", gettime());
					return CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_SPEED_HACK), true;
				}
			}

			/*--------------------------------------------------
			*
			*  Anti Spider Car
			*   Usando GetVehicleRotationQuat
			*   A precisão deste sistema fica em torno de 75%
			*
			-------------------------------------------------*/

			static Float: pW, Float: pX, Float: pY, Float: pZ;

			GetVehicleRotationQuat(GetPlayerVehicleID(playerid), pW, pX, pY, pZ);

			pW = atan2(2 * ((pY * pZ) + (pX * pW)), (-(pX * pX) - (pY * pY) + (pZ * pZ) + (pW * pW)));

			// OBS: Inclinação de 5 graus. Construções mais inclinadas podem
			// fazer o veículo inclinar mais. Mas para evitar falsos reports deixe mais ou menos este valor

			if((85.0 < pW < 90.0) || (-85.0 > pW > -90.0)) {
				SetPVarInt(playerid, #spiderCar, GetPVarInt(playerid, #spiderCar) +1);
				if(GetPVarInt(playerid, #spiderCar) > 40) {
					CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_SPIDER_HACK);
					SetPVarInt(playerid, #spiderCar, 0);
				}
			}
		}
		
		/*--------------------------------------------------
		*
		*  Anti Health/Armour Hack
		*   Usando GetPlayer(Health/Armour) com variáveis server sided
		*   A precisão deste sistema fica em torno de 100%
		*
		-------------------------------------------------*/

		static Float: pLife;
		GetPlayerHealth(playerid, pLife);
		if(pLife > GetPVarFloat(playerid, #pHealth)) {
			SetPlayerHealth(playerid, GetPVarFloat(playerid, #pHealth));
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_HEALTH_HACK);
		}
		GetPlayerArmour(playerid, pLife);
		if(pLife > GetPVarFloat(playerid, #pArmour)) {
			SetPlayerArmour(playerid, GetPVarFloat(playerid, #pArmour));
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_ARMOUR_HACK);
		}

		/*--------------------------------------------------
		*
		*  Anti Player Bugger
		*   Usando GetPlayerPos com variáveis server sided
		*   A precisão deste sistema fica em torno de 99%
		*   Desbuga o jogador bugado e envia mensagem aos administradores
		*
		-------------------------------------------------*/

		static Float: pX, Float: pY, Float:pZ;
		GetPlayerPos(playerid, pX, pY, pZ);

		if(pX > 0xdbb9f && pY > 0xdbb9f && pZ > 0xdbb9f) {
			SetTimerEx("verifBugger_pB", 250, false, "i", playerid);
		}

		/*--------------------------------------------------
		*
		*  Anti Freeze Hack
		*   Usando GetPlayerPos com variáveis server sided
		*   A precisão deste sistema fica em torno de 90%
		*
		-------------------------------------------------*/

		else {
			// checar se realmente está está como MOVIMENTO FALSE
			if(!GetPVarInt(playerid, "PlayerControllable")) {
				GetPlayerPos(playerid, pX, pY, pZ);

				// Checar seus controle foram realmente bloqueados para diferentes de zero !

				if(GetPVarFloat(playerid,"xPosControll") && GetPVarFloat(playerid,"yPosControll") && GetPVarFloat(playerid,"zPosControll")) {
					if((GetPVarFloat(playerid,"xPosControll") != pX) ||  (GetPVarFloat(playerid,"yPosControll") != pY) || (GetPVarFloat(playerid,"zPosControll") != pZ)) {

						CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_FREEZE_HACK);

						// liberar jogador
						SetPVarInt(playerid, "PlayerControllable", 1);
					}
				}
			}

			GetPlayerPos(playerid, pX, pY, pZ);
			if(GetPVarFloat(playerid,"xposSet") != 0 && GetPVarFloat(playerid,"yposSet") != 0 && GetPVarFloat(playerid,"zposSet") != 0) {
				new Float:MAX_DISTANCE = MAX_DISTANCE_DEF;

				pX = GetPVarFloat(playerid,"xposSet") - pX;
				pY = GetPVarFloat(playerid,"yposSet") - pY;
				pZ = GetPVarFloat(playerid,"zposSet") - pZ;

				if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID) {
					MAX_DISTANCE = 7.0;
				}
				if((pX > MAX_DISTANCE || pX < -MAX_DISTANCE) || (pY > MAX_DISTANCE || pY < -MAX_DISTANCE) || (pZ > MAX_DISTANCE || pZ < -MAX_DISTANCE)) {
					if((gettime() - GetPVarInt(playerid, #tPosSet)) > 3 && GetPVarInt(playerid,"pSpawned")) {
						GetPlayerPos(playerid, pX, pY, pZ);
						SetTimerEx("checkPos_pB", 500, false, "ifff", playerid, pX, pY, pZ);
					}
				}
				MAX_DISTANCE = MAX_DISTANCE_DEF;
			}

			GetPlayerPos(playerid, pX, pY, pZ);

			SetPVarFloat(playerid,"xposSet", pX);
			SetPVarFloat(playerid,"yposSet", pY);
			SetPVarFloat(playerid,"zposSet", pZ);
		}

		/*--------------------------------------------------
		*
		*  Anti Ping Alto
		*   Usando GetPlayerScore com variáveis server sided
		*   A precisão deste sistema fica em torno de 90%
		*
		-------------------------------------------------*/

		if(GetPlayerPing(playerid) > MAX_PING) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_HIGH_PING);
		}

		/*--------------------------------------------------
		*
		*  Anti Score Hack
		*   Usando GetPlayerScore com variáveis server sided
		*   A precisão deste sistema fica em torno de 100%
		*
		-------------------------------------------------*/

		if(GetPlayerScore(playerid) > GetPVarInt(playerid, #registerScore)) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_SCORE_HACK);
			SetPlayerScore(playerid, GetPVarInt(playerid, #registerScore));
		}
		
		/*--------------------------------------------------
		*
		*  Anti Player Speed Hack
		*   Usando GetPlayerVelocity com variáveis server sided
		*   A precisão deste sistema fica em torno de 95%
		*
		-------------------------------------------------*/
		
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
			GetPlayerVelocity(playerid, pX, pY, pZ);
			if(floatround(floatsqroot(floatadd(floatpower(pX, 2), floatpower(pY, 2))) * 200) > 100) {
				if(!(GetPVarInt(playerid, #WarnsSpeed) % 50)) {
					CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_PSPEED_HACK);
				}
				SetPVarInt(playerid, #WarnsSpeed, (GetPVarInt(playerid, #WarnsSpeed) + 1));
			}
		}

		/*--------------------------------------------------
		*
		*   Anti Fly Hack
		*   Usando Posições e Animções.
		*   A precisão deste sistema fica em torno de 85%
		*
		-------------------------------------------------*/

		if(!isPlayerInWater_pB(playerid) && isPlayerUsingSwimAnim_pB(playerid)) {
			if(!(GetPVarInt(playerid, "FlyTime") % 50)) {
				CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_FLY_HACK);
				SetPVarInt(playerid, "FlyTime", 0);
			}
			SetPVarInt(playerid, "FlyTime", (GetPVarInt(playerid, "FlyTime") + 1));
		} else if(isPlayerInWater_pB(playerid) && isPlayerUsingSwimAnim_pB(playerid)) {
			SetPVarInt(playerid, "FlyTime", 0);
		}
		SetPVarInt(playerid, #registerScore, GetPlayerScore(playerid));
	}
	return (pOPU ? CallLocalFunction("ExOnPlayerUpdate", "i", playerid) : 1);
}

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#define OnPlayerUpdate ExOnPlayerUpdate
forward ExOnPlayerUpdate(playerid);

public OnPlayerStateChange(playerid, newstate, oldstate) {

	/*--------------------------------------------------
	*
	*  Anti State Hack
	*   Usando OnPlayerStateChange com gettime
	*   A precisão deste sistema fica em torno de 95%
	*
	-------------------------------------------------*/

	if(newstate == PLAYER_STATE_DRIVER) {
		if((gettime() - GetPVarInt(playerid, #registerState)) < 2 && (gettime() - GetPVarInt(playerid, #tPosSet)) > 3) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_STATE_HACK);
		}
		SetPVarInt(playerid, #registerState, gettime());
	}
	SetPVarInt(playerid, #spiderCar, 0);
	return (pOPSC ? CallLocalFunction("ExOnPlayerStateChange", "idi", playerid, newstate, oldstate) : 1);
}

#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif

#define OnPlayerStateChange ExOnPlayerStateChange
forward ExOnPlayerStateChange(playerid, newstate, oldstate);

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat) {

	/*--------------------------------------------------
	*
	*  Anti Surfer Vehicle
	*   Usando OnUnoccupiedVehicleUpdate com gettime e outros
	*   A precisão deste sistema fica em torno de 85%
	*
	-------------------------------------------------*/

	GetVehiclePos(vehicleid, g_ucPos[0], g_ucPos[1], g_ucPos[2]);

	if(IsPlayerInRangeOfPoint(playerid, 1.0, g_ucPos[0], g_ucPos[1], g_ucPos[2])) {
		GetVehicleZAngle(vehicleid, g_ucPos[3]);
		if(g_diferencasAngle[vehicleid] != g_ucPos[3]) {
			if(!IsPlayerInAnyVehicle(playerid)) {
				GetPlayerPos(vehicleid, g_ucPos[1], g_ucPos[1], g_ucPos[3]);
				if(g_ucPos[3] > g_ucPos[2]) {
					SetPVarInt(playerid, #registrosUAF, GetPVarInt(playerid, #registrosUAF) +1);
					if(GetPVarInt(playerid, #registrosUAF) > 40) {
						CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_SURF_VEHICLE);
					}
				}
			}
		}
		g_diferencasAngle[vehicleid] = g_ucPos[3];
		return true;
	}

	/*--------------------------------------------------
	*
	*  Anti Teleport Vehicle
	*   Usando OnUnoccupiedVehicleUpdate com gettime e outros
	*   A precisão deste sistema fica em torno de 85%
	*
	-------------------------------------------------*/

	else if(!IsPlayerInRangeOfPoint(playerid, 40.0, g_ucPos[0], g_ucPos[1], g_ucPos[2])) {
		if(!IsPlayerInAnyVehicle(playerid) && (gettime() - GetPVarInt(playerid, #tPosSet) > 3) && !vehRespawn[vehicleid]) {
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_CAR_TELEPORT);
		} else if(vehRespawn[vehicleid]) vehRespawn[vehicleid] = false;
	}
	return (pOUVU ? CallLocalFunction("ExOnUnoccupiedVehicleUpdate", "idi", vehicleid, playerid, passenger_seat) : 1);
}

#if defined _ALS_OnUnoccupiedVehicleUpdate
	#undef OnUnoccupiedVehicleUpdate
#else
	#define _ALS_OnUnoccupiedVehicleUpdate
#endif

#define OnUnoccupiedVehicleUpdate ExOnUnoccupiedVehicleUpdate
forward ExOnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat);

pFunction checkPos_pB(i, Float: pX, Float: pY, Float: pZ) {
	if(gettime() - GetPVarInt(i, #airBreakSet) < 10)
	return false;

	/*--------------------------------------------------
	*
	*  Anti Teleport Hack
	*   Usando GetPlayerPos com variáveis server sided
	*   A precisão deste sistema fica em torno de 95%
	*
	-------------------------------------------------*/

	if(IsPlayerInRangeOfPoint(i, 2.012837, pX, pY, pZ)) {
		CallLocalFunction("OnPlayerHacking", "ii", i, PLAYER_TELEPORT_HACK);
	}

	/*--------------------------------------------------
	*
	*  Anti AirBreak Hack
	*   Usando GetPlayerPos e SetPlayerPos com variáveis server sided
	*   A precisão deste sistema fica em torno de 95%
	*
	-------------------------------------------------*/

	else {
		CallLocalFunction("OnPlayerHacking", "ii", i, PLAYER_AIRBREAK_HACK);
		SetPVarInt(i, #airBreakSet, gettime());
	}
	return true;
}

pFunction verifBugger_pB(playerid) {
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);
	if(x > 0xdbb9f && y > 0xdbb9f && z > 0xdbb9f) SetPlayerPos(playerid, GetPVarFloat(playerid,"xposSet"),  GetPVarFloat(playerid,"yposSet"),  GetPVarFloat(playerid,"zposSet"));
	else CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_BUGGER_HACK);
	return 1;
}

pFunction registerBot_pB(playerid) {

	/*--------------------------------------------------
	*
	*  Anti DDos Bots
	*   Usando GetPlayerPing/OnPlayerConnect com gettime e outros
	*   A precisão deste sistema está dividido em partes
	*
	*  PLAYER_BOT_LEVEL1 -> 70%
	*  PLAYER_BOT_LEVEL2 -> 90%
	*  PLAYER_BOT_LEVEL3 -> 100%
	*
	*
	-------------------------------------------------*/

	if(GetPlayerPing(playerid) != 0xFFFF && GetPlayerPing(playerid)  != 0) SetPVarInt(playerid, #jogadorDisponivel, 1);
	if(IsPlayerConnected(playerid) && GetPlayerPing(playerid)  == 0xFFFF) {
		static tmpip[20];
		GetPlayerIp(playerid, tmpip, 20);
		if(0x1c5 > (gettime() - varGet(tmpip))) {
			tmpip[(strlen(tmpip) - 1)] = 'x';
			if(varGet(tmpip) > 3) {
				return CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_BOT_LEVEL3);
			}
			CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_BOT_LEVEL2);
		}
		CallLocalFunction("OnPlayerHacking", "ii", playerid, PLAYER_BOT_LEVEL1);
		SetTimerEx("registerBot_pB", 700, false, #i , playerid);
	}
	return false;
}

pFunction registrarJogador_pB(playerid) {
	static tmpip[20];

	g_diferencasAngle[playerid] = 0;
	GetPlayerIp(playerid, tmpip, 20);
	varSet(tmpip, gettime()); ++connect;

	if(connect == MAX_PLAYERS - 1) {
		for(connect = 0; databaseIP[connect][0]; connect++) continue;
	}
	SetTimerEx("resetBot_pB", 50000, false, "i", connect);

	tmpip[strlen(tmpip)-1] = 'x';
	format(databaseIP[connect], 20, tmpip);
	varSet(tmpip, varGet(tmpip) +1);

	SetPVarInt(playerid, #tPosSet, gettime());
	return SetTimerEx("registerBot_pB", 700, false, #i , playerid);
}

pFunction resetBot_pB(botid) {
	varSet(databaseIP[botid], 0);
	return databaseIP[botid][0] = EOS;
}
#define SetPlayerScore				SetPlayerScore_pB
#define PutPlayerInVehicle			PutPlayerInVehicle_pB
#define SetPlayerArmour				SetPlayerArmour_pB
#define SetPlayerHealth				SetPlayerHealth_pB
#define	TogglePlayerControllable	TogglePlayerC_pB
#define	SetPlayerPos  				SetPlayerPos_pB
#define	SetVehiclePos  				SetVehiclePos_pB

#define	SetVehicleVelocity			SetVehicleVelocity_pB
#define	SetVehicleToRespawn			SetVehicleToRespawn_pB

forward OnPlayerHacking(playerid, hackid);
