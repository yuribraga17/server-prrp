	else if(IsPlayerInRangeOfPoint(playerid, 5, 1917.8755,-1776.0514,13.6094)) //comprar 24/7
	{
		Dialog_Show(playerid, Dialog_247Rua, DIALOG_STYLE_TABLIST_HEADERS, "24/7", "Produto\tPreço\n\
		{878787}ELETRÔNICOS\n\
		Celular\tR$120\n\
		Radio\tR$190\n\
		Câmera\tR$50\n\
		Boombox\tR$140\n\
		{878787}VARIADOS\n\
		Galão\tR$50\n\
		Caixa de Ferramentas\tR$180\n\
		Cigarro\tR$8\n\
		Mascara\tR$500\n\
		Lata de Spray\tR$50\n\
		{878787}BEBIDAS E COMIDA\n\
		Lata de Spray\tR$50\n\
		Pizza Pequena\tR$8\n\
		Pizza + Refri\tR$12\n\
		Combo Completo\tR$18 \
		", "Comprar", "Cancelar");
	}


Dialog:Dialog_247Rua(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	else
	{
		switch(listitem)
		{
		    case 0:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 1200000)
				{
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-1200000;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
		    case 1:
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
			case 2:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 190)
		        {
					if(PlayerInfo[playerid][pRadio] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem um Rádio Comunicador.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Rádio Comunicador comprado (/ajudaradio)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pRadio] = 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-190;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 3:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 50)
		        {
					if(PlayerInfo[playerid][pArmaMao] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem uma arma em mãos (/ga).");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Camêra comprado.");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					EntregandoArmaSQL(playerid, 43, 0, 0, 0);
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-50;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 4:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 140)
		        {
					if(PlayerInfo[playerid][pBoombox] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem uma JBL.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"JBL comprado. (/boombox)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pBoombox] = 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-140;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
		    case 5:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 1200000)
				{
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-1200000;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 6:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 50)
		        {
					if(PlayerInfo[playerid][pGalao] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem um galão.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Galão de Gasolina comprado. (/galao)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pGalao] += 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-50;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 7:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 180)
		        {
					if(PlayerInfo[playerid][pToolKit] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem uma caixa de ferramentas.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Caixa de ferramentas comprada.");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pToolKit] = 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-180;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 8:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 8)
		        {
					if(PlayerInfo[playerid][pCigarros] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem um galão.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Maço de cigarro comprado [20 unidades de cigarro].");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pCigarros] += 20;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-8;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 9:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 500)
		        {
                    if(PlayerInfo[playerid][pLevel] < 5) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você precisa de TC5 para comprar uma mascara.");
					if(PlayerInfo[playerid][pMascara] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já tem uma mascara.");
		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Mascara comprada. (/mascara)");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

 					PlayerInfo[playerid][pMascara] = 1;
					
					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-500;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
			case 10:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 50)
		        {
		 		    if(PlayerInfo[playerid][pLevel] < 10) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa ser TC10 para comprar uma lata de spray.");
					if(PlayerInfo[playerid][pArmaMao] > 0) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você já tem uma arma em mãos, guarde-a antes.");
					EntregandoArmaSQL(playerid, 41, 0, 0, 0);

		 		    SendClientMessage(playerid,COLOR_LIGHTGREEN,"Lata de spray comprada.");
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

					PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-50;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
		    case 11:
		    {
		        if(PlayerInfo[playerid][pGrana] >= 8)
				{
		 		    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);

					SendClientMessage(playerid,COLOR_LIGHTGREEN,"Você comprou uma Pizza Pequena.");
					PlayerInfo[playerid][pGrana] -= 8;

				    PlayerInfo[playerid][pFome] += 20;
				    PlayerInfo[playerid][pSede] += 20;

	 		        new Float:Vida, Float:VidaFinal;
	 		        GetPlayerHealth(playerid, Vida);
					VidaFinal = Vida+20;
	 		        if(VidaFinal > PlayerInfo[playerid][pHealthMax]) VidaFinal = PlayerInfo[playerid][pHealthMax];
                    P_Health[playerid] = VidaFinal;
	 		        God_VidaAnterior2[playerid] = VidaFinal;
	 		        God_Aviso2[playerid] = 0;

	 		        EmpInfo[NaEmpresa][eBank]+=8;
                    EmpInfo[NaEmpresa][eProdutos]-=1;
	 		        SetPlayerHealth(playerid, VidaFinal);
					updateTextDrawFomeSede(playerid);
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "Você não tem dinheiro o suficiente.");
			}
 		    case 12:
 		    {
 		        if(PlayerInfo[playerid][pGrana] >= 12)
 		        {
					SendClientMessage(playerid,COLOR_LIGHTGREEN,"Você comprou uma Pizza + Refri.");
				    PlayerInfo[playerid][pGrana] -= 12;

				    PlayerInfo[playerid][pFome] += 30;
				    PlayerInfo[playerid][pSede] += 30;

				    PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
	 		        new Float:Vida, Float:VidaFinal;
	 		        GetPlayerHealth(playerid, Vida);
					VidaFinal = Vida+35;
	 		        if(VidaFinal > PlayerInfo[playerid][pHealthMax]) VidaFinal = PlayerInfo[playerid][pHealthMax];
                    P_Health[playerid] = VidaFinal;
	 		        God_VidaAnterior2[playerid] = VidaFinal;
	 		        God_Aviso2[playerid] = 0;

	 		        EmpInfo[NaEmpresa][eBank]+=12;
                    EmpInfo[NaEmpresa][eProdutos]-=1;
	 		        SetPlayerHealth(playerid, VidaFinal);
					updateTextDrawFomeSede(playerid);
				    return 1;
				}
 		    }
 		    case 13:
 		    {
 		        if(PlayerInfo[playerid][pGrana] >= 18)
 		        {
					SendClientMessage(playerid,COLOR_LIGHTGREEN,"Você comprou um Combo Completo.");
					PlayerInfo[playerid][pGrana] -= 18;

					PlayerInfo[playerid][pFome] = 100;
					PlayerInfo[playerid][pSede] = 100;

					PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		    new Float:Vida, Float:VidaFinal;
		 		    GetPlayerHealth(playerid, Vida);
					VidaFinal = Vida+35;
		 		    if(VidaFinal > PlayerInfo[playerid][pHealthMax]) VidaFinal = PlayerInfo[playerid][pHealthMax];
                    P_Health[playerid] = VidaFinal;
		 		    God_VidaAnterior2[playerid] = VidaFinal;
		 		    God_Aviso2[playerid] = 0;

		 		    EmpInfo[NaEmpresa][eBank]+=18;
                    EmpInfo[NaEmpresa][eProdutos]-=1;
		 		    SetPlayerHealth(playerid, VidaFinal);
					updateTextDrawFomeSede(playerid);
					return 1;
				}
	 		}
		}
	}
	return 1;
}