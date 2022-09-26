#include <a_samp>
#include <zcmd>

//======== Sweper ===========
#define sweperpoint1 1300.1277,-1746.0057,13.3828
#define sweperpoint2 1198.3400,-1706.6813,13.5469
#define sweperpoint3 1040.1805,-1695.5941,13.3828
#define sweperpoint4 1041.1193,-1559.6353,13.3828
#define sweperpoint5 1065.2335,-1408.1826,13.3828
#define sweperpoint6 1175.8345,-1407.7174,13.3828
#define sweperpoint7 1328.8345,-1408.1843,13.3828
#define sweperpoint8 1344.8881,-1436.1655,13.3828
#define sweperpoint9 1295.4325,-1557.7495,13.3828
#define sweperpoint10 1295.0022,-1698.7495,13.3828
#define sweperpoint11 1301.3141,-1819.2825,13.3828
#define sweperpoint12 1302.6243,-1863.4994,13.5469

#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_DARKGOLD 0x808000AA
#define COLOR_RED 0xFF0000AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE 0xFF9900AA

#define WH              "{FFFFFF}"
#define KN              "{FFFF00}"
#define GR              "{33FF33}"
#define BL              "{0080FF}"

new sweper = 0;

public OnFilterScriptInit()
{
	//Sweper
	CreateObject(3627, 1296.18176, -1881.76978, 16.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(640, 1297.15051, -1864.86804, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateObject(640, 1297.14563, -1870.21826, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateObject(640, 1289.98572, -1869.97119, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateObject(640, 1289.92334, -1864.86902, 13.30000,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1295.16333, -1862.52271, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1291.86365, -1862.54199, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1299.02112, -1862.56763, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1302.37183, -1862.58130, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(737, 1307.42175, -1859.41516, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(737, 1288.07764, -1859.23279, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1305.63318, -1862.59021, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1287.82056, -1862.48315, 12.54455,   0.00000, 0.00000, 0.00000);
	CreateObject(10281, 1296.74866, -1860.64551, 19.67450,   0.00000, 0.00000, 180.00000);
	CreateVehicle(574, 1303.5151, -1878.5725, 14.0000, 0.0000, -1, -1, 100);
	CreateVehicle(574, 1301.2148, -1878.5293, 14.0000, 0.0000, -1, -1, 100);
	CreateVehicle(574, 1298.8950, -1878.4896, 14.0000, 0.0000, -1, -1, 100);
	CreateVehicle(574, 1295.0103, -1878.3979, 14.0000, 0.0000, -1, -1, 100);
	CreateVehicle(574, 1291.9260, -1878.4087, 14.0000, 0.0000, -1, -1, 100);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if((sweper) == 1)
	{
	    sweper = 0;
	    SendClientMessage(playerid, COLOR_RED, "Você saiu do seu veículo, retorne para o mesmo!");

	}else if((sweper) == 0){


 }
}

public OnPlayerDeath(playerid, killerid, reason)
{
    DisablePlayerCheckpoint(playerid);
	sweper = 0;
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	new veh;
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 574)
	 {
	    if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint1))
	    {
	        SetPlayerCheckpoint(playerid, sweperpoint2, 7.0);
			GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
		if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint2))
		{
		    SetPlayerCheckpoint(playerid, sweperpoint3, 7.0);
		    GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint3))
        {
            SetPlayerCheckpoint(playerid, sweperpoint4, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint4))
        {
            SetPlayerCheckpoint(playerid, sweperpoint5, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint5))
        {
            SetPlayerCheckpoint(playerid, sweperpoint6, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint6))
        {
            SetPlayerCheckpoint(playerid, sweperpoint7, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
		if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint7))
		{
		    SetPlayerCheckpoint(playerid, sweperpoint8, 7.0);
		    GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
		if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint8))
		{
		    SetPlayerCheckpoint(playerid, sweperpoint9, 7.0);
		    GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint9))
        {
            SetPlayerCheckpoint(playerid, sweperpoint10, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint10))
        {
            SetPlayerCheckpoint(playerid, sweperpoint11, 7.0);
            GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
		if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint11))
		{
		    SetPlayerCheckpoint(playerid, sweperpoint12, 7.0);
		    GameTextForPlayer(playerid, "~g~Limpando!", 1000, 3);
		}
        if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint12))
        {
	 		 GivePlayerMoney(playerid, 1000);
    		 GameTextForPlayer(playerid, "~g~Você foi pago em R$1000", 1000, 3);
      		 SendClientMessage(playerid, COLOR_RED, ""GR"[TRABALHO]:"WH" Você concluiu seu trabalho! Você foi pago em{33FF33} 1000$");
             DisablePlayerCheckpoint(playerid);
             veh = GetPlayerVehicleID(playerid);
             SetVehicleToRespawn(veh);
             sweper = 0;
         }
       }
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	 if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 574)
	 {
	     SendClientMessage(playerid, COLOR_RED, ""GR"[INFO]:"WH" Você pode trabalhar como gerente de estrada /sweper");
     }
     return 0;
}
//========================= Commands ===========================================
CMD:telesweper(playerid, params[])
{
	new string[64], pName[MAX_PLAYER_NAME];
    GetPlayerName(playerid,pName,MAX_PLAYER_NAME);
    format(string,sizeof string,"[TP]: %s "KN"Teletransportou-se para o local de trabalho do Sweeper",pName);
	SetPlayerPos(playerid, 1304.4872,-1844.1119,13.5469);
	SetPlayerFacingAngle(playerid, 162.5891);
	SendClientMessage(playerid, COLOR_RED, ""BL"[INFO]: "WH"Bem-vindo ao local de trabalho Sweeper");
	SendClientMessageToAll(0xFFFFFFAA,string);
	return 1;
}

CMD:sweper(playerid, params[])
{
  	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 574)
   	{
   	    sweper = 1;
   	    SetPlayerCheckpoint(playerid, sweperpoint1, 3.0);
   	    GameTextForPlayer(playerid, "~g~Você agora é um gerente na estrada.", 1000, 3);
   	    new name [MAX_PLAYER_NAME], string[48];
   	    GetPlayerName(playerid, name, sizeof(name));
   	    format(string, sizeof(string), ".:: %s Agora seja o gerente na estrada ::.", name);
   	    SendClientMessageToAll(COLOR_ORANGE, string);
   	    return 1;
	}
	SendClientMessage(playerid, COLOR_RED,"[ERROR]: Você deve estar no carro varredor se você quer começar o trabalho.");
	return 1;
}
