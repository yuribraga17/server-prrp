public OnPlayerUpdate(playerid)
{
    if(AppLigado[playerid] == 1 && Entregando[playerid] != 1 && TemCorrida[playerid] == 0)
    {
        Entregando[playerid] = 1;
        new pseudorand = random(sizeof(Temporizador));
        buscandocorridas[playerid] = SetTimerEx("ChamarEntrega", Temporizador[pseudorand][0], false,"i", playerid);
    }
    return 1;
}
public OnPlayerConnect(playerid)
{
    AppLigado[playerid] = 0;
    Retiroupedido[playerid] = 0;
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;

    return 1;
}
 
public OnPlayerDisconnect(playerid, reason)
{
    AppLigado[playerid] = 0;
    Retiroupedido[playerid] = 0;
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;
    return 1;
}
 
public OnPlayerSpawn(playerid)
{
    AppLigado[playerid] = 0;
    Retiroupedido[playerid] = 0;
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;
    return 1;
}
 
public OnPlayerDeath(playerid, killerid, reason)
{
    AppLigado[playerid] = 0;
    Retiroupedido[playerid] = 0;
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;
    return 1;
}
 
 
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (PRESSED (KEY_YES))
    {
        if(Entregando[playerid] == 1 && AppLigado[playerid] == 1 && TemCorrida[playerid] == 1)
        {
            KillTimer(TempoDeResposta[playerid]);
            KillTimer(buscandocorridas[playerid]);
            TemCorrida[playerid] = 0;
            StopAudioStreamForPlayer(playerid);
            SendClientMessage(playerid,COLOR_WHITE, "[iFood] Nova entrega recebida, você possui 10s para aceitar");
            SendClientMessage(playerid,COLOR_WHITE, "[iFood] Pressione 'Y' para aceitar.");
            new rand = random(sizeof(Restaurantes));
            SetPlayerCheckpoint(playerid,Restaurantes[rand][BrX],Restaurantes[rand][BrY],Restaurantes[rand][BrZ], 5);
        }
    }
    return 1;
}
 
public OnPlayerEnterCheckpoint(playerid)
{
    if(Entregando[playerid] == 1 && Retiroupedido[playerid] != 1)
    {
        DisablePlayerCheckpoint(playerid);
        SetTimerEx("SigaEntrega",2000,false,"i",playerid);
        TogglePlayerControllable(playerid,false);
    }
    if(Entregando[playerid] == 1 && Retiroupedido[playerid] == 1)
    {
        DisablePlayerCheckpoint(playerid);
        SetTimerEx("FinalizandoEntrega",2000,false,"i",playerid);
        TogglePlayerControllable(playerid,false);
    }
    return 1;
}
 
#define GANHO_MIN   16 //GANHO MINIMO POR ENTREGA
#define GANHO_MAX   87 //GANHO MAXIMO POR ENTREGA
#define ID_MOTOCA   448  //ID DA MOTOCA DE ENTREGAS
 
#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
 
new AppLigado[MAX_PLAYERS];
new iFood[MAX_PLAYERS];
new Entregando[MAX_PLAYERS];
new Retiroupedido[MAX_PLAYERS];
new buscandocorridas[MAX_PLAYERS];
new TempoDeResposta[MAX_PLAYERS];
new TemCorrida[MAX_PLAYERS];
 
 
new Temporizador[][1] = //TEMPO DE ESPERA ENTRE CADA ENTREGA
{
    {5000},
    {8000},
    {10000},
    {12000},
    {16000}
};
 
enum Rests
{
    Float:BrX,
    Float:BrY,
    Float:BrZ,
    Local[64]
}
 
new Restaurantes[][Rests] = //ADICIONE QUANTOS RESTAURANTES QUISER :D ESQUEMA -> (X,Y,Z,"NOME")
{
    {953.6340,-1379.8330,13.3438, "Cluckin' Bell"},// Cluckin Bells
    {1045.5018,-1269.2733,13.6790, "China's Food"},//Chinese Food
    {1126.0450,-1372.2838,13.9844, "Loja de bebidas"},// Loja de bebidas
    {1196.8871,-921.3952,43.0530, "Burguer Shot"},//Burguer Shot
    {1300.6167,-1156.1165,23.8281, "Disk Bebidas"},// Conveniencia 24hrs
    {421.7389,-1758.9269,8.1689, "Pizzaria da Praia"}// Pizzaria Praia
};
new Float:Entregas_ifood[][3] =
{
    {1247.3604,-1101.0178,26.6719},
    {1243.1884,-1076.3695,31.5547},
    {856.1241,-1687.5447,13.5550},
    {840.9093,-1477.0052,13.5930}    //ADICIONE QUANTAS CASAS QUISER, SEGUINDO O ESQUEMA: {X,Y,Z},
};
 
forward SigaEntrega(playerid);
public SigaEntrega(playerid)
{
    new rand = random(sizeof(Entregas_ifood));
    Retiroupedido[playerid] = 1;
    SetPlayerCheckpoint(playerid,Entregas_ifood[rand][0],Entregas_ifood[rand][1],Entregas_ifood[rand][2], 5);
    SendClientMessage(playerid, COLOR_WHITE, "[iFood] Siga para a entrega.");
    TogglePlayerControllable(playerid, true);
    return 1;
}
forward FinalizandoEntrega(playerid);
public FinalizandoEntrega(playerid)
{
    SendClientMessage(playerid, COLOR_WHITE, "[iFood] Entrega realizada com sucesso.");
    GivePlayerMoney(playerid, randomEspecial(GANHO_MIN, GANHO_MAX));
    Entregando[playerid] = 0;
    Retiroupedido[playerid] = 0;
    TemCorrida[playerid] = 0;
    AppLigado[playerid] = 1;
    TogglePlayerControllable(playerid, true);
    return 1;
}

forward ChamarEntrega(playerid);
public ChamarEntrega(playerid)
{
    TempoDeResposta[playerid] = SetTimerEx("PerdeuEntrega", 10000,false,"i",playerid);
    TemCorrida[playerid] = 1;
    PlayAudioStreamForPlayer(playerid, "https://www.fetchtube.com/Mp3Download.php/Did%20I%20Miss%20Request%20New%20%23Uber%20Ringtone%20%F0%9F%98%8E.mp3?filename=9d12b0d588b5f65d2b21191765d66ae6");
    for(new t=0; t < 15; t++)
    {
        SendClientMessage(playerid, -1, "");
    }
    SendClientMessage(playerid,COLOR_WHITE, "[iFood] Nova entrega recebida, você possui 10s para aceitar");
    SendClientMessage(playerid,COLOR_WHITE, "[iFood] Pressione 'Y' para aceitar.");
    return 1;
}
 
forward PerdeuEntrega(playerid);
public PerdeuEntrega(playerid)
{
    DisablePlayerCheckpoint(playerid);
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;
    StopAudioStreamForPlayer(playerid);
    SendClientMessage(playerid,COLOR_WHITE, "[iFood] Você perdeu a entrega.");
    KillTimer(TempoDeResposta[playerid]);
    return 1;
}
 
stock randomEspecial(minimo,maximo)
{
    new valor = random(maximo-minimo)+minimo;
    return valor;
}
 
CMD:ifood(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
 	if(PlayerInfo[playerid][pJob] != JOB_MOTOBOY) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não é um entregador do ifood.");
    AppLigado[playerid] = 0;
    iFood[playerid] = 1;
    SendClientMessage(playerid, COLOR_WHITE, "[iFood] Comandos: /ifood - /ligarapp - /desligarapp");
    return 1;
}
CMD:ligarapp(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
 	if(PlayerInfo[playerid][pJob] != JOB_MOTOBOY) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não é um entregador do ifood.");

    if(AppLigado[playerid] == 1)
        return SendClientMessage(playerid, COLOR_WHITE ,"[iFood] Você já está conectado");
    else
    {
        if(iFood[playerid] == 1)
        {
            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA)
            else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA2)
			else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA3)
            else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA4)
			else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA5)
            else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA6)
			else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA7)
            else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == ID_MOTOCA8)
            {
                SendClientMessage(playerid, COLOR_WHITE, "[iFood] Aplicativo habilitado para receber entregas!");
                AppLigado[playerid] = 1;
            }
            else
            {
                SendClientMessage(playerid,COLOR_WHITE,"[iFood] Desculpe, não aceitamos este modelo de veiculo!");
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_WHITE,"[iFood] Falha na autenticação");
        }
    }
    return 1;
}
CMD:desligarapp(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
 	if(PlayerInfo[playerid][pJob] != JOB_MOTOBOY) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não é um entregador do ifood.");

    if(AppLigado[playerid] != 1)
        return SendClientMessage(playerid, COLOR_WHITE,"[iFood] Você já está desconectado");
    else
    {
        AppLigado[playerid] = 0;
        Entregando[playerid] = 0;
        Retiroupedido[playerid] = 0;
        KillTimer(buscandocorridas[playerid]);
        DisablePlayerCheckpoint(playerid);
        SendClientMessage(playerid, COLOR_WHITE, "[iFood] Obrigado pelas entregas, até breve!");
    }
    return 1;
}
CMD:aceitarentrega(playerid, params[])
{
	if(Entregando[playerid] == 1 && AppLigado[playerid] == 1 && TemCorrida[playerid] == 1)
	{
	    KillTimer(TempoDeResposta[playerid]);
		KillTimer(buscandocorridas[playerid]);
		TemCorrida[playerid] = 0;
		StopAudioStreamForPlayer(playerid);
		SendClientMessage(playerid,COLOR_WHITE, "[iFood] Nova entrega recebida, você possui 10s para aceitar");
		new rand = random(sizeof(Restaurantes));
		SetPlayerCheckpoint(playerid,Restaurantes[rand][BrX],Restaurantes[rand][BrY],Restaurantes[rand][BrZ], 5);
	}
    return 1;
}