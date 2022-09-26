#define FILTERSCRIPT
#include <a_samp>

new
	BuilderActor,
	Working[MAX_PLAYERS],
	LastSkin[MAX_PLAYERS],
	BuilderCP[MAX_PLAYERS];

public OnFilterScriptInit()
{
	BuilderActor = CreateActor(16, 1254.1410, -1265.7305, 13.3705, 358.4537);
	SetActorInvulnerable(BuilderActor, true);
	ApplyActorAnimation(BuilderActor, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);

	AddStaticPickup(1275, 23, 1254.1210, -1265.0613, 13.2784);
    Create3DTextLabel("{006EFF}Trabalho de Construtor!{FFFFFF}\nUse o comando /startwork para iniciar o trabalho.\nE /stopwork para parar o trabalho.", -1, 1254.1210, -1265.0613, 13.2784, 10.0,0);

	// Builder
	CreateObject(11081, 1253.47888, -1238.73682, 21.98707,   0.00000, 0.00000, 0.00000);
	CreateObject(1684, 1257.44678, -1268.18860, 13.92266,   0.00000, 0.00000, -180.00000);
	CreateObject(3504, 1248.59839, -1269.02271, 13.85367,   0.00000, 0.00000, 0.00000);
	CreateObject(3504, 1245.22815, -1269.02271, 13.85370,   0.00000, 0.00000, 0.00000);
	CreateObject(3504, 1241.80103, -1269.02271, 13.85370,   0.00000, 0.00000, 0.00000);
	CreateObject(1380, 1242.71594, -1255.90039, 36.20860,   0.00000, 0.00000, 0.00000);
	CreateObject(1391, 1242.84509, -1256.15466, 67.51294,   0.00000, 0.00000, 0.00000);
	CreateObject(1388, 1242.78784, -1256.14575, 78.81348,   3.14159, 0.00000, -36.32735);
	CreateObject(944, 1280.83032, -1238.00964, 13.88971,   0.00000, 0.00000, 0.00000);
	CreateObject(944, 1280.82617, -1239.37219, 13.88971,   0.00000, 0.00000, 0.00000);
	CreateObject(944, 1280.81775, -1240.77649, 13.88971,   0.00000, 0.00000, 0.00000);
	CreateObject(944, 1280.82617, -1239.37219, 15.26536,   0.00000, 0.00000, 0.00000);
	CreateObject(2359, 1280.74414, -1240.79858, 14.79832,   0.00000, 0.00000, 0.00000);
	CreateObject(925, 1264.98474, -1236.76953, 17.18457,   0.00000, 0.00000, 88.80002);
	CreateObject(3573, 1262.30530, -1249.57727, 15.40564,   0.00000, 0.00000, 0.00000);
	CreateObject(2567, 1268.85315, -1232.81580, 17.88041,   0.00000, 0.00000, 0.00000);
	CreateObject(3796, 1265.99060, -1251.27612, 18.09540,   0.00000, 0.00000, 0.00000);
	CreateObject(2669, 1271.85730, -1251.04346, 14.35794,   6.00000, 0.00000, 0.00000);
	CreateObject(2669, 1246.29199, -1256.84241, 13.53976,   0.00000, 0.00000, -268.85983);
	CreateObject(1465, 1282.14600, -1267.90417, 13.61396,   0.00000, 0.00000, -90.47998);
	CreateObject(1465, 1282.14600, -1265.25549, 13.63090,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1281.98218, -1262.63489, 12.24269,   0.00000, -18.00000, 1.80000);
	CreateObject(1465, 1282.14600, -1259.91467, 13.63090,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1257.23779, 13.63090,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1257.23779, 15.48013,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1259.91467, 15.48010,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1262.59583, 15.48010,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1265.25549, 15.48010,   0.00000, 0.00000, -90.48000);
	CreateObject(1465, 1282.14600, -1267.90417, 15.48010,   0.00000, 0.00000, -90.48000);
	CreateObject(3864, 1281.10425, -1248.87158, 18.57323,   0.00000, 0.00000, 0.00000);
	CreateObject(3864, 1266.49414, -1268.06592, 18.57320,   0.00000, 0.00000, -90.00000);
	CreateObject(19791, 1268.58093, -1236.00977, 6.05160,   0.00000, 0.00000, 0.00000);
	CreateObject(19357, 1242.21143, -1256.64771, 35.47490,   0.00000, 90.00000, 0.00000);
	CreateObject(19357, 1242.20984, -1253.93250, 35.47490,   0.00000, 90.00000, 0.00000);
	CreateObject(19357, 1244.22314, -1257.11230, 35.47490,   0.00000, 90.00000, 0.00000);
	CreateObject(1473, 1271.83289, -1241.87573, 15.56858,   0.00000, 0.00000, 0.00000);
	CreateObject(1473, 1274.27112, -1235.94006, 15.38793,   11.00000, 0.00000, 90.63998);
	CreateObject(1473, 1275.77148, -1235.92285, 14.32175,   11.00000, 0.00000, 90.63998);
	return 1;
}

public OnPlayerConnect(playerid)
{
	Working[playerid] = 0;
	LastSkin[playerid] = 0;
	BuilderCP[playerid] = 0;

	// Map
	RemoveBuildingForPlayer(playerid, 1388, 1238.3750, -1258.2813, 57.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1391, 1238.3750, -1258.2734, 44.6641, 0.25);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid, 1265.9968, -1251.3204, 18.0954);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp("/startwork", cmdtext, true, 10) == 0)
	{
		if(!PlayerToPoint(5.0, playerid, 1254.1210, -1265.0613, 13.2784)) return 1;
		if(Working[playerid] == 0)
		{
			Working[playerid] = 1;
			LastSkin[playerid] = GetPlayerSkin(playerid);
			SetPlayerSkin(playerid, 16);
			new x = random(2);
			if(x == 0) {
				SetPlayerCheckpoint(playerid, 1280.0118, -1262.7102, 13.5107, 2.0);
			}
			if(x == 1) {
				SetPlayerCheckpoint(playerid, 1280.9083, -1242.0677, 13.9160, 2.0);
			}
			if(x == 2 || x == 3) {
				SetPlayerCheckpoint(playerid, 1268.9485, -1234.4961, 17.0519, 2.0);
			}
			BuilderCP[playerid] = 1;
		}
		else SendClientMessage(playerid, 0xA8FA82FF, "Você já está trabalhando! Se você não quiser mais trabalhar, use /stopwork.");
		return 1;
	}
	
	if(strcmp("/stopwork", cmdtext, true, 10) == 0)
	{
		if(!PlayerToPoint(5.0, playerid, 1254.1210, -1265.0613, 13.2784)) return 1;
		if(Working[playerid] == 1)
		{
			SetPlayerSkin(playerid, LastSkin[playerid]);
			DisablePlayerCheckpoint(playerid);
			RemovePlayerAttachedObject(playerid,0);
		 	ClearAnimations(playerid);
		 	SetPlayerSpecialAction(playerid, 0);
			BuilderCP[playerid] = 0;
			Working[playerid] = 0;
		}
		else SendClientMessage(playerid, 0xA8FA82FF, "Você parou o trabalho.");
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(BuilderCP[playerid] == 1)
	{
		DisablePlayerCheckpoint(playerid);
		new randobj = random(3);
		if(randobj == 0) {
			SetPlayerAttachedObject( playerid, 0, 3632, 1, 0.280445, 0.445938, 0.000000, 0.000000, 0.000000, 0.000000, 0.935883, 1.000000, 0.508070 );
		}
		else if(randobj == 1) {
			SetPlayerAttachedObject( playerid, 0, 2040, 1, 0.132374, 0.415244, 0.000000, 0.000000, 0.000000, 0.000000, 1.338602, 1.000000, 2.515828 );
		}
		else if(randobj == 2) {
			SetPlayerAttachedObject( playerid, 0, 1353, 1, 0.238547, 0.448155, 0.000000, 277.985870, 87.919158, 352.250915, 0.317783, 1.000000, 0.308136 );
		}
		else if(randobj == 3) {
			SetPlayerAttachedObject( playerid, 0, 2060, 1, 0.178045, 0.407681, -0.025817, 3.533153, 102.484672, 350.146301, 1.000000, 1.000000, 1.000000 );
		}

		new x = random(3);
		if(x == 0 || x == 1) {
			SetPlayerCheckpoint(playerid, 1271.8511, -1254.3572, 13.6028, 2.0);
		}
		if(x == 2 || x == 3) {
			SetPlayerCheckpoint(playerid, 1250.0131, -1256.7892, 13.6028, 2.0);
		}

		BuilderCP[playerid] = 2;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	}
	else if(BuilderCP[playerid] == 2)
	{
		DisablePlayerCheckpoint(playerid);
		RemovePlayerAttachedObject(playerid,0);
	 	ClearAnimations(playerid);

		new x = random(3);
		if(x == 0) {
			SetPlayerCheckpoint(playerid, 1280.0118, -1262.7102, 13.5107, 2.0);
		}
		if(x == 1) {
			SetPlayerCheckpoint(playerid, 1280.9083, -1242.0677, 13.9160, 2.0);
		}
		if(x == 2 || x == 3) {
			SetPlayerCheckpoint(playerid, 1268.9485, -1234.4961, 17.0519, 2.0);
		}
		SetPlayerSpecialAction(playerid, 0);
        BuilderCP[playerid] = 1;

	    new
			message[256],
	    	salar = 5000 + random(5000);

		format(message, sizeof(message), "~g~+R$%d", salar);
		GameTextForPlayer(playerid, message, 2000, 1);
		GivePlayerMoney(playerid, salar);
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(!PlayerToPoint(50.0, playerid, 1265.9968, -1251.3204, 18.0954) && Working[playerid] == 1)
	{
		Working[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		RemovePlayerAttachedObject(playerid,0);
	 	ClearAnimations(playerid);
	 	SetPlayerSpecialAction(playerid, 0);
		BuilderCP[playerid] = 0;

		if(IsPlayerInAnyVehicle(playerid))
		{
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid, -1, "Você foi expulso do veículo porque abandonou o trabalho.");
		}
		else
		{
			SendClientMessage(playerid, -1, "Foi devolvida a roupa porque você abandonou o trabalho.");
		}
		SetPlayerSkin(playerid, LastSkin[playerid]);
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

