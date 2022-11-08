	else if(IsPlayerInRangeOfPoint(playerid, 5, 2532.0464,-1916.4795,13.5480)) //comprar 24/7
	{
	    Dialog_Show(playerid, Dialog_247Rua, DIALOG_STYLE_LIST, "Item \tPreço\nCelular\tR$120\nGalão\tR$%d\nCaixa de Ferramentas\tR$%d\nCigarro\tR$%d\nRadio\tR$%d\nCâmera\tR$%d\nMascara\tR$%d\nBoombox\tR$%d\nLata de Spray\t R$50);
	
	}
	return 1;


Dialog:Dialog_247Rua(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	else
	{
		switch(listitem)
		{
		    case 0:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 120)
				{
	 		        if(CelularData[playerid][celNumero] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem um celular.");
		 		    new randphone = 100000 + random(800000);

					randphone = randphone+PlayerInfo[playerid][pID];

		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Celular comprado. (/ajudacelular)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

		 		    CelularData[playerid][celModo] = 1;
		 		    CelularData[playerid][celNumero] = randphone;
		 		    CelularData[playerid][celModelo] = 330;

					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-120;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 1:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 50)
		        {
					if(PlayerInfo[playerid][pGalao] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem um galão.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Galão de Gasolina comprado. (/galao)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);


 					PlayerInfo[playerid][pGalao] = 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-50;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 2:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 20)
		        {
					PlayerInfo[playerid][pPecasMecanicas][2]++;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você comprou um GPS por 20R$.");
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-20;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 3:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 30)
		        {
					PlayerInfo[playerid][pPecasMecanicas][3]++;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você comprou um Immob por 30R$.");
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-30;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 4:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 20)
		        {
					PlayerInfo[playerid][pPecasMecanicas][4]++;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você comprou um Tranca por 20R$.");
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-20;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
		}
	}
	return 1;
}