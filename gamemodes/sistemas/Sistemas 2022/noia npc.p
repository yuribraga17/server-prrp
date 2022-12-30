//Sistema de vender drogas npc - Yur$
COMMAND:venderdroga(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
	if(PlayerInfo[playerid][pLevel] < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 2 ou mais para vender drogas.");
    if(PlayerDroga[playerid][CocaB] < 1) return SendClientMessage(playerid COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de pelo menos 1g de cocaina boa.")
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
    if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
    if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver amarrado.");
	if(PlayerInfo[playerid][pArrombarDNV_C] != 0)
	{
		new vendadrogas[128];
		format(vendadrogas, sizeof(vendadrogas),"Aguarde %d segundos antes de vender mais drogas.", PlayerInfo[playerid][pArrombarDNV_C]);
		SendClientMessage(playerid,COLOR_LIGHTRED, vendadrogas);
		return 1;
	}

	for(new i = 0; i < MAX_VICIADOS; i++)
 	{
	     if (!IsPlayerInRangeOfPoint(playerid, 5.0, ViciadoInfo[i][viPos][0], ViciadoInfo[i][viPos][1], ViciadoInfo[i][viPos][2]))
        {
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está vendendo 1g de cocaina boa para o noiado.");
			
			SetTimerEx("VendendoDroga", 5, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s se aproxima do noia e pronuncia algumas palavras.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			
			new strl[126];
			format(strl, 126, "%s vendeu droga pro NPC. [/venderdroga]", PlayerName(playerid, 0));
			LogCMD_venderdroga(strl);

			return 1;
		}
        return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não está perto de um noia.");
	}
	return 1;
}


forward VendendoDroga(playerid);
public VendendoDroga(playerid)
{
	for(new i = 0; i < MAX_VICIADOS; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,5,ViciadoInfo[i][viPos][0], ViciadoInfo[i][viPos][1], ViciadoInfo[i][viPos][2]))
		{
			PlayerInfo[playerid][pArrombarDNV_C] = 15;
			
			PlayerDroga[playerid][CocaB]--;

			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);

			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você receberá o dinheiro em alguns segundos.");

			SetTimerEx("PegandoMoneyTrafico", 5, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s retira um pino de cocaina da bag e entrega ao usuário.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

		}
	}
    return 1;
}

forward PegandoMoneyTrafico(playerid);
public PegandoMoneyTrafico(playerid)
{
	for(new i = 0; i < MAX_VICIADOS; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,ViciadoInfo[i][viPos][0], ViciadoInfo[i][viPos][1], ViciadoInfo[i][viPos][2]))
		{

			PlayerInfo[playerid][pGrana] += 50;
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você recebeu 50 reais pela droga.");

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** O noia retira uma nota de R$50 e oferta a %s.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);


			TogglePlayerControllable(playerid, 0);
			SetTimerEx("PegouGranaTrafico", 200, false, "d", playerid);
		}
	}

    return 1;
}

forward PegouGranaTrafico(playerid);
public PegouGranaTrafico(playerid)
{

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}