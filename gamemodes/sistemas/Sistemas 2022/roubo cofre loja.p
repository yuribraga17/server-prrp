//Sistema roubo
COMMAND:explodircaixa(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
	if(PlayerInfo[playerid][pLevel] < 5) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 5 ou mais para explodir o caixa.");
	if(PlayerInfo[playerid][pBomba] < 1) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de 1 dinamite para explodir o caixa.");
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
    if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
    if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver amarrado.");
	if(PlayerInfo[playerid][pArrombarDNV_C] != 0)
	{
		new stringroubo2[128];
		format(stringroubo2, sizeof(stringroubo2),"Aguarde %d segundos antes de explodir um caixa novamente.", PlayerInfo[playerid][pArrombarDNV_C]);
		SendClientMessage(playerid,COLOR_LIGHTRED, stringroubo2);
		return 1;
	}

	for(new i = 0; i < MAX_ATM; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]))
    	{

			new PolicesOnline = 0;
			for(new cops = 0; cops < MAX_PLAYERS; cops++)
			{
				if(IsPlayerConnected(cops))
				{
					if(PlayerInfo[cops][pLogado])
					{
						if(FacInfo[GetFactionBySqlId(PlayerInfo[cops][pFac])][fTipo] == FAC_TIPO_PMERJ)
						{
							if(PlayerInfo[cops][pEmServico] == 1)
							{
								PolicesOnline++;
							}
						}
					}
				}
				if(PolicesOnline < 6) return 
					SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} É preciso ter pelo menos 6 policiais em serviço para executar essa ação.");
			}

            new location[MAX_ZONE_NAME];
            Get2DZone(location, TOTAL_ZONE_NAME, ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]);

    		TaNaATM[playerid] = i;
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você armou uma dinamite.");
			
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "PLAYIDLES", "shldr", 4.0,1,1,1,1,0,1);
			SetTimerEx("ExplodindoCaixa", 8500, false, "d", playerid);

			new stringCaixaF[256];
			format(stringCaixaF,sizeof(stringCaixaF),"** %s está armando uma dinamite no caixa eletronico.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringCaixaF,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);


			format(stringCaixaF, sizeof(stringCaixaF), "* Barulho de explosão são escutados nas próximidades *");
			ProxDetector(500.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			format(string, sizeof(stringCaixaF), "** MARE 0: Um caixa eletronico explodiu em %s.**", location);
   			SendFacMessage(0x6666CCFF,1,stringCaixaF);
   			SendFacMessage(0x6666CCFF,2,stringCaixaF);

			SendAdminAlert(COLOR_LIGHTRED, "AdmCmd:{FFFFFF} %s acaba de utilizar o comando /explodircaixa.", PlayerName(playerid, 0));
			
			new strl[126];
			format(strl, 126, "%s explodiu um caixa eletronico. [/setararma]", PlayerName(playerid, 0));
			LogCMD_explodircaixa(strl);

			return 1;
		}
	}
	return 1;
}

COMMAND:pegardinheiro(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você precisa estar logado.");
	if(PlayerInfo[playerid][pLevel] < 5) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 5 ou mais para pegar a grana.");
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
    if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
    if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver amarrado.");
	if(PlayerInfo[playerid][pArrombarDNV_C] != 0)
	{
		new stringroubo2[128];
		format(stringroubo2, sizeof(stringroubo2),"Aguarde %d segundos antes de explodir um caixa novamente.", PlayerInfo[playerid][pArrombarDNV_C]);
		SendClientMessage(playerid,COLOR_LIGHTRED, stringroubo2);
		return 1;
	}

	for(new i = 0; i < MAX_ATM; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]) && ATMs[i][aRrombado] == 1) 
    	{
			PlayerInfo[playerid][pGrana] += 5000;
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está colhetando 5 mil reais.");

			new stringCaixaF[256];	
			format(stringCaixaF,sizeof(stringCaixaF),"** %s se abaixa e começa a recolher o dinheiro do chão.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringCaixaF,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			SetTimerEx("PegandoGrana", 1, false, "d", playerid);
			return 1;
		}
	}
	return 1;
}

forward ExplodindoCaixa(playerid);
public ExplodindoCaixa(playerid)
{
	for(new i = 0; i < MAX_ATM; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]))
		{
			PlayerInfo[playerid][pArrombarDNV_C] = 3600;
			
			CreateExplosion(ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ], 13, 0);
			ATMs[i][aRrombado] = 1;
			PlayerInfo[playerid][pBomba]--;

			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Use /pegardinheiro.");

			new stringCaixaF[256];
			format(stringCaixaF, sizeof(stringCaixaF), "* O caixa eletronico explode e o dinheiro se espalha *");
			ProxDetector(500.0, playerid, stringCaixaF, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

		}
	}
    return 1;
}

forward PegandoGrana(playerid);
public PegandoGrana(playerid)
{
	for(new i = 0; i < MAX_ATM; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]))
		{
			ATMs[i][aRrombado] = 0;

			TogglePlayerControllable(playerid, 0);
			SetTimerEx("AnimGrana", 5500, false, "d", playerid);
		}
	}

    return 1;
}


forward AnimGrana(playerid);
public AnimGrana(playerid)
{
	ApplyAnimation(playerid,"FAT","IDLE_tired", 4.0, 1, 0, 0, 0, 0, 1);

    return 1;
}

forward PegouGrana(playerid);
public PegouGrana(playerid)
{

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}