//Sistema de vender drogas npc - Yur$
COMMAND:traficar(playerid,params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
	new idx = 0;
	new tmp[256];
	tmp = strtok(params,idx);
	if(!strlen(tmp))
	{
        SendClientMessage(playerid, COLOR_VEICULO,"____________________________________________________");
		SendClientMessage(playerid, COLOR_VEICULO,"USE: /traficar [ação]");
		SendClientMessage(playerid, COLOR_VEICULO,"USE: cocainaE - Para vender cocaína excelente para o actor.");
		SendClientMessage(playerid, COLOR_VEICULO,"USE: cocainaB - Para vender cocaína boa para o actor.");
		SendClientMessage(playerid, COLOR_VEICULO,"USE: maconhaE - Para vender maconha excelente para o actor.");
		SendClientMessage(playerid, COLOR_VEICULO,"____________________________________________________");
		return 1;
	}

	if(strcmp(tmp,"cocainaE",true) == 0)
	{
		if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
		if(PlayerInfo[playerid][pLevel] < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 2 ou mais para vender drogas.");
		if(PlayerDroga[playerid][CocaE] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de pelo menos 1g de cocaina excelente.");
		if(PlayerInfo[playerid][pTrafico] > 6) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já traficou bastante neste PayDay, volte após seu payday.");
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
		if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
		if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você nãopode utilizar este comando enquanto estiver amarrado.");

		if(IsPlayerInRangeOfPoint(playerid,10.0,2573.5181,-1124.5466,65.3464) || IsPlayerInRangeOfPoint(playerid,10.0,2577.3850,-1130.1652,65.1935) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.5320,-1111.5963,67.4365) || IsPlayerInRangeOfPoint(playerid,10.0,2589.0232,-1112.6173,66.9152) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.9336,-962.2279,81.1852) || IsPlayerInRangeOfPoint(playerid,10.0,2585.7937,-955.1824,81.3715) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2557.9902,-956.3238,82.7591) || IsPlayerInRangeOfPoint(playerid,10.0,1850.6703,-2000.5491,14.1094) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1846.1360,-2004.2552,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1841.3813,-2008.3091,13.5469) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1731.6779,-2123.5327,12.7954) || IsPlayerInRangeOfPoint(playerid,10.0,1727.1029,-2127.2014,12.7933) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1726.0736,-2122.7458,12.7933) || IsPlayerInRangeOfPoint(playerid,10.0,2226.6240,-1458.6040,24.0754) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2222.3228,-1457.7727,24.0000) || IsPlayerInRangeOfPoint(playerid,10.0,2669.5825,-1460.8533,30.5523) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2671.0518,-1468.1061,30.5604) || IsPlayerInRangeOfPoint(playerid,10.0,2683.7068,-1471.5103,30.5612) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2687.3025,-1459.4653,30.6193) || IsPlayerInRangeOfPoint(playerid,10.0,2709.9211,-1447.3977,30.6297) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2056.5154,-1821.0952,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1891.0433,-1785.9810,13.5544))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está vendendo 2g de cocaina excelente para o noiado.");	
			SetTimerEx("VendendoCocainaE", 5000, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s se aproxima do Noiado e pronuncia algumas palavras.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			format(stringvendeu,sizeof(stringvendeu),"%s diz: Da o papo, tu quer o que hoje?", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Quero aquela que matou o chorão para cheirar.");
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			new location[MAX_ZONE_NAME];
			GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
			new str[126];
			SendFacMessage(COLOR_LIGHTBLUE, 1, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Situação: Tem uma pessoa vendendo cocaína, possivelmente armada e drogada.");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Situação: Tem uma pessoa vendendo cocaína, possivelmente armada e drogada.");
			format(str, sizeof(str), "Local: %s",location);
			SendFacMessage(COLOR_LIGHTBLUE, 1, str);
			SendFacMessage(COLOR_LIGHTBLUE, 2, str);
		
			new strl[126];
			format(strl, 126, "%s vendeu droga pro Actor. [/traficar cocainaE]", PlayerName(playerid, 0));
			LogCMD_venderdroga(strl);
		}
	}
	if(strcmp(tmp,"cocainaB",true) == 0)
	{
		if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
		if(PlayerInfo[playerid][pLevel] < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 2 ou mais para vender drogas.");
		if(PlayerDroga[playerid][CocaB] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de pelo menos 1g de cocaina boa.");
		if(PlayerInfo[playerid][pTrafico] > 6) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já traficou bastante neste PayDay, volte após seu payday.");
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
		if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
		if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você nãopode utilizar este comando enquanto estiver amarrado.");

		if(IsPlayerInRangeOfPoint(playerid,10.0,2573.5181,-1124.5466,65.3464) || IsPlayerInRangeOfPoint(playerid,10.0,2577.3850,-1130.1652,65.1935) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.5320,-1111.5963,67.4365) || IsPlayerInRangeOfPoint(playerid,10.0,2589.0232,-1112.6173,66.9152) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.9336,-962.2279,81.1852) || IsPlayerInRangeOfPoint(playerid,10.0,2585.7937,-955.1824,81.3715) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2557.9902,-956.3238,82.7591) || IsPlayerInRangeOfPoint(playerid,10.0,1850.6703,-2000.5491,14.1094) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1846.1360,-2004.2552,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1841.3813,-2008.3091,13.5469) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1731.6779,-2123.5327,12.7954) || IsPlayerInRangeOfPoint(playerid,10.0,1727.1029,-2127.2014,12.7933) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1726.0736,-2122.7458,12.7933) || IsPlayerInRangeOfPoint(playerid,10.0,2226.6240,-1458.6040,24.0754) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2222.3228,-1457.7727,24.0000) || IsPlayerInRangeOfPoint(playerid,10.0,2669.5825,-1460.8533,30.5523) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2671.0518,-1468.1061,30.5604) || IsPlayerInRangeOfPoint(playerid,10.0,2683.7068,-1471.5103,30.5612) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2687.3025,-1459.4653,30.6193) || IsPlayerInRangeOfPoint(playerid,10.0,2709.9211,-1447.3977,30.6297) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2056.5154,-1821.0952,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1891.0433,-1785.9810,13.5544))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está vendendo 1g de cocaina boa para o noiado.");	
			SetTimerEx("VendendoCocainaB", 5000, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s se aproxima do Noiado e pronuncia algumas palavras.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			format(stringvendeu,sizeof(stringvendeu),"%s diz: Da o papo, tu quer o que hoje?", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Quero um pino para cheirar.");
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			new location[MAX_ZONE_NAME];
			GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
			new str[126];
			SendFacMessage(COLOR_LIGHTBLUE, 1, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Situação: Tem uma pessoa vendendo cocaína, possivelmente armada e drogada.");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Situação: Tem uma pessoa vendendo cocaína, possivelmente armada e drogada.");
			format(str, sizeof(str), "Local: %s",location);
			SendFacMessage(COLOR_LIGHTBLUE, 1, str);
			SendFacMessage(COLOR_LIGHTBLUE, 2, str);
		
			new strl[126];
			format(strl, 126, "%s vendeu droga pro Actor. [/traficar cocaina]", PlayerName(playerid, 0));
			LogCMD_venderdroga(strl);
		}
	}
	if(strcmp(tmp,"MaconhaE",true) == 0)
	{
		if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
		if(PlayerInfo[playerid][pLevel] < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 2 ou mais para vender drogas.");
		if(PlayerDroga[playerid][MaconhaE] < 24) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de pelo menos 25g de maconha excelente.");
		if(PlayerInfo[playerid][pTrafico] > 6) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já traficou bastante neste PayDay, volte após seu payday.");
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
		if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
		if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você nãopode utilizar este comando enquanto estiver amarrado.");

		if(IsPlayerInRangeOfPoint(playerid,10.0,2573.5181,-1124.5466,65.3464) || IsPlayerInRangeOfPoint(playerid,10.0,2577.3850,-1130.1652,65.1935) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.5320,-1111.5963,67.4365) || IsPlayerInRangeOfPoint(playerid,10.0,2589.0232,-1112.6173,66.9152) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2595.9336,-962.2279,81.1852) || IsPlayerInRangeOfPoint(playerid,10.0,2585.7937,-955.1824,81.3715) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2557.9902,-956.3238,82.7591) || IsPlayerInRangeOfPoint(playerid,10.0,1850.6703,-2000.5491,14.1094) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1846.1360,-2004.2552,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1841.3813,-2008.3091,13.5469) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1731.6779,-2123.5327,12.7954) || IsPlayerInRangeOfPoint(playerid,10.0,1727.1029,-2127.2014,12.7933) || 
		IsPlayerInRangeOfPoint(playerid,10.0,1726.0736,-2122.7458,12.7933) || IsPlayerInRangeOfPoint(playerid,10.0,2226.6240,-1458.6040,24.0754) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2222.3228,-1457.7727,24.0000) || IsPlayerInRangeOfPoint(playerid,10.0,2669.5825,-1460.8533,30.5523) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2671.0518,-1468.1061,30.5604) || IsPlayerInRangeOfPoint(playerid,10.0,2683.7068,-1471.5103,30.5612) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2687.3025,-1459.4653,30.6193) || IsPlayerInRangeOfPoint(playerid,10.0,2709.9211,-1447.3977,30.6297) || 
		IsPlayerInRangeOfPoint(playerid,10.0,2056.5154,-1821.0952,13.5469) || IsPlayerInRangeOfPoint(playerid,10.0,1891.0433,-1785.9810,13.5544))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está vendendo 25g de maconha excelente para o noiado.");	
			SetTimerEx("VendendoMaconhaE", 5000, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s se aproxima do Noiado e pronuncia algumas palavras.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			format(stringvendeu,sizeof(stringvendeu),"%s diz: Da o papo, tu quer o que hoje?", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Quero o boldin do bom.");
			ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

			new location[MAX_ZONE_NAME];
			GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
			new str[126];
			SendFacMessage(COLOR_LIGHTBLUE, 1, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "|__________EMERGENCIA POLICIAL__________|");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Relator: Anonimo, Contato: Orelhão");
			SendFacMessage(COLOR_LIGHTBLUE, 1, "Situação: Tem uma pessoa vendendo maconha, possivelmente armada e drogada.");
			SendFacMessage(COLOR_LIGHTBLUE, 2, "Situação: Tem uma pessoa vendendo maconha, possivelmente armada e drogada.");
			format(str, sizeof(str), "Local: %s",location);
			SendFacMessage(COLOR_LIGHTBLUE, 1, str);
			SendFacMessage(COLOR_LIGHTBLUE, 2, str);
		
			new strl[126];
			format(strl, 126, "%s vendeu droga pro Actor. [/traficar MaconhaE]", PlayerName(playerid, 0));
			LogCMD_venderdroga(strl);
		}
	}
	return 1;
}

forward VendendoCocainaE(playerid);
public VendendoCocainaE(playerid)
{
			
	PlayerDroga[playerid][CocaE]--;

	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);

	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você receberá o dinheiro em alguns segundos.");

	SetTimerEx("PegandoGranaCocaETrf", 10000, false, "d", playerid);

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"> %s retira um pino de cocaina da bag e entrega ao usuário.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	format(stringvendeu, sizeof(stringvendeu), "* %s retira um pino de cocaina da bag e entrega ao usuário.", PlayerName(playerid, 1));
    SetPlayerChatBubble(playerid, stringvendeu, COLOR_PURPLE, 20.0, 10000);

	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Esse tá bem servido, hein? Gostei.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
	format(stringvendeu,sizeof(stringvendeu),"** O Noiado sorri ao ver o pino de cocaína cheio.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

    return 1;
}

forward PegandoGranaCocaETrf(playerid);
public PegandoGranaCocaETrf(playerid)
{

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"* O Noiado retira algumas notas e oferta a %s.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Amanhã eu volto pra entupir meu nariz mais uma vez.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

	TogglePlayerControllable(playerid, 0);
	SetTimerEx("PegouGranaCocaETrf", 3000, false, "d", playerid);


    return 1;
}

forward PegouGranaCocaETrf(playerid);
public PegouGranaCocaETrf(playerid)
{

	PlayerInfo[playerid][pGranaSuja] += 900;
	//PlayerInfo[playerid][pTrafico]++;
	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você recebeu 900 reais sujo pela cocaina excelente.");

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"%s diz: Fé. Tamo junto!", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}

forward VendendoCocainaB(playerid);
public VendendoCocainaB(playerid)
{
			
	PlayerDroga[playerid][CocaB]-= 2;

	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);

	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você receberá o dinheiro em alguns segundos.");

	SetTimerEx("PegandoGranaCocaBTrf", 10000, false, "d", playerid);

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"> %s retira um pino de cocaina da bag e entrega ao usuário.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	format(stringvendeu, sizeof(stringvendeu), "* %s retira um pino de cocaina da bag e entrega ao usuário.", PlayerName(playerid, 1));
    SetPlayerChatBubble(playerid, stringvendeu, COLOR_PURPLE, 20.0, 10000);

	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Esse tá bem servido, hein? Gostei.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
	format(stringvendeu,sizeof(stringvendeu),"** O Noiado sorri ao ver o pino de cocaína cheio.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

    return 1;
}

forward PegandoGranaCocaBTrf(playerid);
public PegandoGranaCocaBTrf(playerid)
{

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"* O Noiado retira algumas notas e oferta a %s.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Amanhã eu volto pra entupir meu nariz mais uma vez.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

	TogglePlayerControllable(playerid, 0);
	SetTimerEx("PegouGranaCocaBTrf", 3000, false, "d", playerid);


    return 1;
}

forward PegouGranaCocaBTrf(playerid);
public PegouGranaCocaBTrf(playerid)
{

	PlayerInfo[playerid][pGranaSuja] += 300;
	//PlayerInfo[playerid][pTrafico]++;
	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você recebeu 300 reais sujo pela cocaina.");

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"%s diz: Fé. Tamo junto!", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}

forward VendendoMaconhaE(playerid);
public VendendoMaconhaE(playerid)
{
			
	PlayerDroga[playerid][MaconhaE]-= 25;

	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);

	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você receberá o dinheiro em alguns segundos.");

	SetTimerEx("PegandoGranaErvaETrf", 10000, false, "d", playerid);

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"> %s retira um ziplock de maconha excelente e entrega ao usuário.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	format(stringvendeu, sizeof(stringvendeu), "* %s retira um ziplock de maconha excelente e entrega ao usuário.", PlayerName(playerid, 1));
    SetPlayerChatBubble(playerid, stringvendeu, COLOR_PURPLE, 20.0, 10000);

	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Esse tá bem servido, hein? Gostei.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);
	format(stringvendeu,sizeof(stringvendeu),"** O Noiado sorri ao ver o ziplock de 25g de maconha.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

    return 1;
}

forward PegandoGranaErvaETrf(playerid);
public PegandoGranaErvaETrf(playerid)
{

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"* O Noiado retira algumas notas e oferta a %s.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	format(stringvendeu,sizeof(stringvendeu),"Noiado diz: Amanhã eu volto para pegar mais.");
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

	TogglePlayerControllable(playerid, 0);
	SetTimerEx("PegouGranaErvaETrf", 3000, false, "d", playerid);


    return 1;
}

forward PegouGranaErvaETrf(playerid);
public PegouGranaErvaETrf(playerid)
{

	PlayerInfo[playerid][pGranaSuja] += 900;
	//PlayerInfo[playerid][pTrafico]++;
	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você recebeu 900 reais sujo pela cocaina excelente.");

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"%s diz: Fé. Tamo junto!", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE);

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}