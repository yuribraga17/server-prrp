#define TEMPO 1500
new BusJob[256];
new TimerBus[MAX_PLAYERS];
new RotaBusJob[MAX_PLAYERS] = 0;
 

public OnPlayerConnect(playerid)
{
    RotaBusJob[playerid] = 0;
    return 1;
}
 
CMD:iniciarrota(playerid)
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não está em um veículo.");
 	if(PlayerInfo[playerid][pJob] != JOB_MOTORISTA)  return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não é um motorista de onibus."); 
    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 437)
    {
        SendClientMessage(playerid, COLOR_WHITE,"Serviço iniciado com sucesso! Siga o ícone vermelho no mapa para chegar ao primeiro ponto de ônibus!");
        if(BusJob[playerid] == 0)
        {
            BusJob[playerid] = 1;
            SetPlayerCheckpoint(playerid,2183.8916,-2252.5754,14.7710, 3.0);
            TimerBus[playerid] = SetTimerEx("RotaBus", TEMPO, false, "i",playerid);
        }
    }
    SendClientMessage(playerid, COLOR_LIGHTRED,"ERRO: Você tem que estar em uma ônibus para começar a rota!");
    return 1;
}
 
public OnPlayerEnterCheckpoint(playerid)
{
    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 437)
    {
        if(BusJob[playerid] == 1)
        {
            BusJob[playerid] = 2;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2029.1879,-2106.7595,13.0503,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 2)
        {
            BusJob[playerid] = 3;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1965.0934,-1879.8435,13.0460,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 3)
        {
            BusJob[playerid] = 4;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1825.0763,-1641.5555,13.0406,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 4)
        {
            BusJob[playerid] = 5;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1661.4106,-1513.8069,13.0394,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 5)
        {
            BusJob[playerid] = 6;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1718.1519,-1355.8612,13.0379,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 6)
        {
            BusJob[playerid] = 7;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1515.8977,-1157.4445,23.5693,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 7)
        {
            BusJob[playerid] = 8;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1007.3337,-1137.6353,23.3041,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 8)
        {
            BusJob[playerid] = 9;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,913.9140,-1512.6134,13.0294,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 9)
        {
            BusJob[playerid] = 10;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,668.9059,-1735.8870,13.1442,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 10)
        {
            BusJob[playerid] = 11;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,716.0936,-1323.2404,13.0542,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 11)
        {
            BusJob[playerid] = 12;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1105.4869,-1284.3621,13.0984,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 12)
        {
            BusJob[playerid] = 13;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1248.8213,-1152.4312,23.2720,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 13)
        {
            BusJob[playerid] = 14;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1598.3813,-1164.2426,23.5697,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 14)
        {
            BusJob[playerid] = 15;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,1931.6448,-1139.5239,24.7676,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 15)
        {
            BusJob[playerid] = 16;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2113.3770,-1304.4203,23.5052,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 16)
        {
            BusJob[playerid] = 17;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2349.2502,-1304.5952,23.6209,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 17)
        {
            BusJob[playerid] = 18;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2598.7876,-1260.2065,46.9628,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 18)
        {
            BusJob[playerid] = 19;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2677.5920,-1051.4144,69.0702,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 19)
        {
            BusJob[playerid] = 20;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2834.8110,-1140.3776,24.4193,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 20)
        {
            BusJob[playerid] = 21;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2830.0747,-1602.7433,10.5848,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 21)
        {
            BusJob[playerid] = 22;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2819.3320,-1923.2450,10.5925,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 22)
        {
            BusJob[playerid] = 23;
            TogglePlayerControllable(playerid,0);
            SetPlayerCheckpoint(playerid,2646.7800,-2151.7402,10.5687,10);
            SendClientMessage(playerid, COLOR_WHITE,"Os passageiros estão saindo e/ou entrando no ônibus! Aguarde...");
            TimerBus[playerid] = SetTimerEx("RotaBus", 1000, false, "i",playerid);
            return 1;
        }
        if(BusJob[playerid] == 23)
        {
            BusJob[playerid] = 0;
            DisablePlayerCheckpoint(playerid);
            SendClientMessage(playerid, COLOR_WHITE,"Serviço finalizado! Você recebeu R$300 por ter completado todo o percurso!");
            SendClientMessage(playerid, COLOR_WHITE,"Volte ao spawn da profissão e inicie o serviço para fazer o percurso novamente!");
            GivePlayerMoney(playerid,300);
        }
    }
    return 1;
}
 
forward RotaBus(playerid);
public RotaBus(playerid)
{
    TimerBus[playerid] = SetTimerEx("MsgBus", 100, false, "i",playerid);
    TogglePlayerControllable(playerid,1);
    return 1;
}
 
forward MsgBus(playerid);
public MsgBus(playerid)
{
    new quantia = 80;
    new msg[256];
    format(msg, sizeof(msg),"| INFO | Você recebeu R$%d! Siga o checkpoint no mapa para chegar ao próximo ponto de ônibus [ %d / 23]", quantia, BusJob[playerid]);
    SendClientMessage(playerid, COLOR_WHITE, msg);
    return 1;
}