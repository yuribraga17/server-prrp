

//=========================================== [ New's / Define's ]
new PlayerDrink[MAX_PLAYERS],
	EntregandoDrink[MAX_PLAYERS],
	RecebendoDrink[MAX_PLAYERS];

//=========================================== [ Forwards's ]
forward Drink_OnPlayerConnect(playerid);
forward Empresa_Comprar_Bar(playerid);

//=========================================== [ Public's ]
public Drink_OnPlayerConnect(playerid)
{
    PlayerDrink[playerid] = 0;
	return 1;
}

public Empresa_Comprar_Bar(playerid)
{
	new empNome[24];
 	format(empNome, sizeof(empNome), "Produtos - %s", EmpInfo[NaEmpresa][eNome]);

	format(string, sizeof(string), "Item \t Preço \nCelular \t $%d\nGalão \t $%d\nCaixa de Ferramentas \t $%d\nCigarro \t $%d\nRadio \t $%d\nCamera \t $%d\nLanche \t $%d\nMascara \t $%d\nBoombox \t $%d",
	EmpInfo[NaEmpresa][eCervejaPreco],
	EmpInfo[NaEmpresa][eCerveja2Preco],
	EmpInfo[NaEmpresa][eToolkitPreco],
	EmpInfo[NaEmpresa][eCigarroPreco],
	EmpInfo[NaEmpresa][eRadioPreco],
	EmpInfo[NaEmpresa][eCameraPreco],
	EmpInfo[NaEmpresa][eLanchePreco],
	EmpInfo[NaEmpresa][eMascPreco],
	EmpInfo[NaEmpresa][eBoomboxPreco]);
 	Dialog_Show(playerid, DIALOG_EMP_BAR, DIALOG_STYLE_TABLIST_HEADERS, empNome, string, "Selecionar", "Cancelar");
		
	return 1;
}

Dialog:DIALOG_EMP_BAR(playerid, response, listitem, inputtext[])
{
	if (!response) return 1;
	else
	{
	    if(PlayerDrink[playerid] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já está segurando alguma coisa.");
	    
	    new NaEmpresa = PlayerInfo[playerid][pEntrouEmpresa];
		if(NaEmpresa != -1)
		{
		    switch(listitem)
	 		{
	 		    case 0:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eCervejaPreco])
	 		        {
		 		        PlayerDrink[playerid] = 1486;
		 		        SetPlayerAttachedObject( playerid, 5, 1486, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
		 		        return 1;
					}
					else return SendClientMessage(playerid,COLOR_LIGHTRED,"Você não tem dinheiro o suficiente para isso.");
	 		    }
	 		    case 1:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eCerveja2Preco])
	 		        {
		 		        PlayerDrink[playerid] = 1484;
		 		       	SetPlayerAttachedObject( playerid, 5, 1484, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
		 		        return 1;
					}
					else return SendClientMessage(playerid,COLOR_LIGHTRED,"Você não tem dinheiro o suficiente para isso.");
	 		    }
	 		    case 2:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eToolkitPreco])
	 		        {
	 		            if(PlayerInfo[playerid][pToolKit] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem uma caixa de ferramentas.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Caixa de Ferramentas comprado.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eToolkitPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        PlayerInfo[playerid][pToolKit] = 1;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 3:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eCigarroPreco])
	 		        {
            			if(PlayerInfo[playerid][pCigarros] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem cigarros.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Cigarros comprados [20].");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eCigarroPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        PlayerInfo[playerid][pCigarros] = 20;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 4:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eRadioPreco])
	 		        {
	 		            if(PlayerInfo[playerid][pRadio] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem um rádio.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Rádio comprado, use /canalradio para alterar o canal de seu rádio.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eRadioPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        PlayerInfo[playerid][pRadio] = 1;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 5:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eCameraPreco])
	 		        {
	 		            if(PlayerInfo[playerid][pArmaMao] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem uma arma em mãos.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Camera comprada.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eCameraPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        EntregandoArmaSQL(playerid, 43, 99999, 0);
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 6:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eLanchePreco])
	 		        {
		 		        SendClientMessage(playerid,COLOR_WHITE,"Lanche comprado.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eLanchePreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        new Float:Vida, Float:VidaFinal;
		 		        GetPlayerHealth(playerid, Vida);
						VidaFinal = Vida+20;
		 		        if(VidaFinal > PlayerInfo[playerid][pHealthMax]) VidaFinal = PlayerInfo[playerid][pHealthMax];

		 		        SetPlayerHealth_CA(playerid, VidaFinal);
		 		        P_Health[playerid] = VidaFinal;
		 		        God_VidaAnterior2[playerid] = VidaFinal;
		 		        God_Aviso2[playerid] = 0;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 7:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eMascPreco])
	 		        {
	 		            if(PlayerInfo[playerid][pMascara] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem uma mascara.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Mascara comprada.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eMascPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        PlayerInfo[playerid][pMascara] = 1;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
				case 8:
	 		    {
	 		        if(PlayerInfo[playerid][pGrana] >= EmpInfo[NaEmpresa][eBoomboxPreco])
	 		        {
	 		            if(PlayerInfo[playerid][pBoombox] != 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já tem uma boombox.");
		 		        SendClientMessage(playerid,COLOR_WHITE,"Você comprou uma boombox.");
		 		        PlayerInfo[playerid][pGrana] -= EmpInfo[NaEmpresa][eBoomboxPreco];
		 		        PlayerPlaySound(playerid,1054, 0.0, 0.0, 0.0);
		 		        PlayerInfo[playerid][pBoombox] = 1;
		 		        ApplyAnimation(playerid,"DEALER","shop_pay",3.0,0,0,0,0,0,1);
	 		        	return 1;
					}
				}
			}
 		}
	}
	return 1;
}
