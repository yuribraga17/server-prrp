//Forward
forward SairDoHospital(playerid);
forward ZerarDamages(playerid);
forward ProxDamage(playerid,DescDamage[]);


forward SetPlayerMorto(playerid, status);
public SetPlayerMorto(playerid, status) {

	if(!PlayerInfo[playerid][pLogado]) return 1;
	
	switch(status)
	{
	    case 1: // Player Gravemente Ferido
	    {
	        if(PlayerInfo[playerid][pMorto] == 1) return 1;
	        
	        SetPlayerHealth(playerid, 20);
	        P_Health[playerid] = 20;

			PlayerInfo[playerid][pMorto] = 1;
			AcabouDeMorrer[playerid] = 2;
			SetPVarInt(playerid, "TempoParaSerLevantado", 300);

			TogglePlayerControllable(playerid, 0);
			SendClientMessage(playerid, COLOR_LIGHTRED, "Você está ferido, você pode aguardar um médico chegar ou aceitar a morte daqui a 3 minutos. ((Se o anim bugar, use /morto))");

			PlayerInfo[playerid][pMancando] = 0;

	       	if (IsValidDynamic3DTextLabel(TextMorto[playerid])) DestroyDynamic3DTextLabel(TextMorto[playerid]);
			TextMorto[playerid] = CreateDynamic3DTextLabel("(( Este player está ferido /ferimentos para mais informações))", 0xFF4B00FF, 0.0, 0.0, 0.7, DISTANCIA_FERIMENTOS, playerid, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid));
					
			TempoDesistir[playerid] = 600;

			SetarAnimMorto(playerid);
		    SetarItensDoPlayer(playerid);
	    }
	    case 2: // Player Morto
	    {
	        if(PlayerInfo[playerid][pMorto] == 2) return 1;
	        
	        PlayerInfo[playerid][pMorto] = 2;

  			SetPlayerHealth(playerid, 15);
			P_Health[playerid] = 15;

			if (IsValidDynamic3DTextLabel(TextMorto[playerid])) DestroyDynamic3DTextLabel(TextMorto[playerid]);
			TextMorto[playerid] = CreateDynamic3DTextLabel("(( Este jogador está morto ))", 0xFF4B00FF, 0.0, 0.0, 0.7, DISTANCIA_FERIMENTOS, playerid, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid));

			PlayerInfo[playerid][pMancando] = 0;
			SetarAnimMorto(playerid);

			SendClientMessage(playerid, COLOR_YELLOW, "-> Agora você está morto. você poderá utilizar /aceitarmorte daqui a 5 minutos, para respawnar.");
			TempoDesistir[playerid] = 600;

			TogglePlayerControllable(playerid, 0);
			TextDrawShowForPlayer(playerid,Telinha);
			SetarAnimMorto(playerid);
			SetarAnimMorto(playerid);
	    }
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason) {
    //RemovePlayerFromVehicle(playerid);
    ClearAnimations(playerid);
	//=========================================
    SetPVarInt(playerid, "ChamouOnPlayerDeath", 1);
    basket_OnPlayerDeath(playerid);

    new Float:X,Float:Y,Float:Z,Float:A;
	GetPlayerPos(playerid, X, Y, Z);

    PlayerInfo[playerid][pPos][0] = X;
    PlayerInfo[playerid][pPos][1] = Y;
    PlayerInfo[playerid][pPos][2] = Z;

    KillTimer(HJLimitTimer);
	HackerJob[playerid] = 0;

    AppLigado[playerid] = 0;
    Retiroupedido[playerid] = 0;
    Entregando[playerid] = 0;
    TemCorrida[playerid] = 0;

	PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
	PlayerInfo[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

    //Dropar Caixa
    if(PlayerInfo[playerid][pLoadCrate] != -1) {
   		GetPlayerFacingAngle(playerid,A);

		X = X-1;
		Z = Z-0.65;

    	CaixaInfo[PlayerInfo[playerid][pLoadCrate]][cObj] = CreateDynamicObject(1271, X,Y,Z,   0.00000, 0.00000, A);
    	CaixaInfo[PlayerInfo[playerid][pLoadCrate]][cPosX] = X;
    	CaixaInfo[PlayerInfo[playerid][pLoadCrate]][cPosY] = Y;
    	CaixaInfo[PlayerInfo[playerid][pLoadCrate]][cPosZ] = Z;

    	new tipp = CaixaInfo[PlayerInfo[playerid][pLoadCrate]][cTipo];
    	format(StringBarco,sizeof(StringBarco), "%s", GetCargaTipo(tipp));
    	CaixaInfo[PlayerInfo[playerid][pLoadCrate]][TextTipo] = CreateDynamic3DTextLabel(StringBarco, 0xFFFFFFFF, X, Y, Z+0.6, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

		RemovePlayerAttachedObject(playerid, 0);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		PlayerInfo[playerid][pLoadCrate] = -1;
 	}
  	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], X,Y,Z, 0, 0, 0, 0, 0, 0, 0);
    SpawnPlayer(playerid);
	return 1;
}

public SairDoHospital(playerid)
{
    PlayerInfo[playerid][pPos][0] = 1173.1841;
    PlayerInfo[playerid][pPos][1] = -1323.3143;
    PlayerInfo[playerid][pPos][2] = 15.3952;

	SetPlayerPosFreeze(playerid, 1173.1841,-1323.3143,15.3952, 1);
	PlayerInfo[playerid][pMorto] = 0;
	SetPVarInt(playerid, "ChamouOnPlayerDeath", 0);
	PlayerInfo[playerid][pTomouAlgumTiro] = 0;
	PlayerInfo[playerid][pTomouTiroPesado] = 0;
    PlayerInfo[playerid][pTomouTiroBrancas] = 0;
	SocosMorto[playerid] = 0;
	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	PlayerInfo[playerid][pEmServico] = 0;
	SetCameraBehindPlayer(playerid);
	ZerarDamages(playerid);
    PlayerInfo[playerid][pMancando] = 0;

	//PlayerInfo[playerid][pHealth] = 100;
	SetPlayerHealth(playerid, PlayerInfo[playerid][pHealthMax]);
	P_Health[playerid] = PlayerInfo[playerid][pHealthMax];
	God_VidaAnterior2[playerid] = PlayerInfo[playerid][pHealthMax];
	God_Aviso2[playerid] = 0;
	TempoDesistir[playerid] = 0;
	PlayerInfo[playerid][pTempoMorto] = 0;

	if(PlayerInfo[playerid][pConvenio] == 0)
	{
		PlayerInfo[playerid][pBanco] -= GovInfo[gTaxaHP];

		SendClientMessage(playerid, 0x009C65FF, "|==== [ TAXA MÉDICA ] ====|");
		format(string, sizeof(string), "Taxa Governamental médica: $%d.",GovInfo[gTaxaHP]);
		SendClientMessage(playerid, 0x009C65FF, string);
		SendClientMessage(playerid, 0x009C65FF, "Valor descontado de sua conta bancaria.");
	}
	else
	{
		SendClientMessage(playerid, 0x009C65FF, "você foi insento do pagamento de sua taxa hospitalar devido ao seu convenio.");
	}

	return 1;
}

CMD:aceitarmorte(playerid,params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
	if(PlayerInfo[playerid][pMorto] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: {FFFFFF}você não pode aceitar a morte agora.");
    if(PodeAceitarMorte[playerid] == 1)
    {
        if (IsValidDynamic3DTextLabel(TextMorto[playerid])) DestroyDynamic3DTextLabel(TextMorto[playerid]);

    	TempoDesistir[playerid] = 0;
        PlayerInfo[playerid][pMorto] = 3;
		TextDrawHideForPlayer(playerid,Telinha);

  		//PlayerInfo[playerid][pHealth] = 50;
		SetPlayerHealth(playerid,50);
		P_Health[playerid] = 50;
		God_VidaAnterior2[playerid] = 50;
		God_Aviso2[playerid] = 0;
  		TogglePlayerControllable(playerid,0);
        PlayerInfo[playerid][pMancando] = 0;

		format(string,sizeof(string),"(( %s aceitou morte. ))", PlayerName(playerid,1));
		ProxDetector(10.0, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

		new armaid = PlayerInfo[playerid][pArmaMao];
		new Int = GetPlayerInterior(playerid);
		PlayerInfo[playerid][pInterior] = Int;
		new World = GetPlayerVirtualWorld(playerid);
		PlayerInfo[playerid][pWorld] = 0;
		LastShoter[playerid] = 0;

	    if(PlayerInfo[playerid][pDrogaTime] > 0)
		{
			PlayerInfo[playerid][pMenosDanoTiro] = 0.0;
			PlayerInfo[playerid][pDrogaTime] = 0;
			//SetPlayerWeather(playerid, WeatherGlobal);
			PlayerInfo[playerid][pTremorAtirar] = PlayerInfo[playerid][pSkillTiro];
			SendClientMessage(playerid,-1,"O efeito das drogas passou.");

			RemoverVidaMaxDrug(playerid);

			PlayerInfo[playerid][pUsouDroga] = 0;
		}

	    new ArmasInv = 0;

	    if(PlayerInfo[playerid][pSlot1] != 0)
		{
		    switch(ArmaData[PlayerInfo[playerid][pSlot1]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pSlot1]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pSlot1]][ArmaCom] = 0;

					PlayerInfo[playerid][pSlot1] = 0;
					PlayerInfo[playerid][pSlot1a] = 0;
					ArmasInv++;
				}
			}
		}
		if(PlayerInfo[playerid][pSlot2] != 0)
		{
			switch(ArmaData[PlayerInfo[playerid][pSlot2]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pSlot2]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pSlot2]][ArmaCom] = 0;

					PlayerInfo[playerid][pSlot2] = 0;
					PlayerInfo[playerid][pSlot2a] = 0;
					ArmasInv++;
				}
			}
		}
		if(PlayerInfo[playerid][pSlot3] != 0)
		{
		    switch(ArmaData[PlayerInfo[playerid][pSlot3]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pSlot3]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pSlot3]][ArmaCom] = 0;

					PlayerInfo[playerid][pSlot3] = 0;
					PlayerInfo[playerid][pSlot3a] = 0;
					ArmasInv++;
				}
			}
		}
		if(PlayerInfo[playerid][pSlot4] != 0)
		{
		    switch(ArmaData[PlayerInfo[playerid][pSlot4]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pSlot4]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pSlot4]][ArmaCom] = 0;

					PlayerInfo[playerid][pSlot4] = 0;
					PlayerInfo[playerid][pSlot4a] = 0;
					ArmasInv++;
				}
			}
		}
		if(PlayerInfo[playerid][pSlot5] != 0)
		{
		    switch(ArmaData[PlayerInfo[playerid][pSlot5]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pSlot5]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pSlot5]][ArmaCom] = 0;

					PlayerInfo[playerid][pSlot5] = 0;
					PlayerInfo[playerid][pSlot5a] = 0;
					ArmasInv++;
				}
			}
		}
		if(PlayerInfo[playerid][pColde] > 0)
		{
		    switch(ArmaData[PlayerInfo[playerid][pColde]][ArmaModelo])
		    {
				case 22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40:
				{
				    ArmaData[PlayerInfo[playerid][pColde]][ArmaCor] = 1;
		        	ArmaData[PlayerInfo[playerid][pColde]][ArmaCom] = 0;

		        	RemovePlayerAttachedObject(playerid, 2);

					PlayerInfo[playerid][pColde] = 0;
					PlayerInfo[playerid][pColdreA] = 0;
					ArmasInv++;
				}
			}
		}
		if(ArmasInv > 0) SendClientMessage(playerid,COLOR_LIGHTRED,"|- As suas armas do inventário foram removidas pelos médicos.");

	    if(PlayerInfo[playerid][pMun9mm] > 0 || PlayerInfo[playerid][pMunCart] > 0 || PlayerInfo[playerid][pMun556] > 0 || PlayerInfo[playerid][pMun127] > 0)
        {
            PlayerInfo[playerid][pMun9mm] = 0;
			PlayerInfo[playerid][pMunCart] = 0;
			PlayerInfo[playerid][pMun556] = 0;
			PlayerInfo[playerid][pMun127] = 0;
			SendClientMessage(playerid,COLOR_LIGHTRED,"|- As suas munições do inventário foram removidas pelos médicos.");
        }

	    if(PlayerDroga[playerid][MaconhaR] > 0 || PlayerDroga[playerid][MaconhaB] > 0 || PlayerDroga[playerid][MaconhaE] > 0 ||
	    PlayerDroga[playerid][CocaR] > 0 || PlayerDroga[playerid][CocaB] > 0 || PlayerDroga[playerid][CocaE] > 0 ||
	    PlayerDroga[playerid][CrackR] > 0 || PlayerDroga[playerid][CrackB] > 0 || PlayerDroga[playerid][CrackE] > 0 ||
		PlayerDroga[playerid][LSDR] > 0 || PlayerDroga[playerid][LSDB] > 0 || PlayerDroga[playerid][LSDE] > 0 ||
		PlayerDroga[playerid][MetR] > 0 || PlayerDroga[playerid][MetB] > 0 || PlayerDroga[playerid][MetE] > 0 ||
		PlayerDroga[playerid][Sementes]) SendClientMessage(playerid,COLOR_LIGHTRED,"|- As suas drogas do inventário foram removidas pelos médicos.");

	    ResetPlayerDrugs(playerid);

		if(armaid != 0)
		{
			//========================================
		    DesarmandoPlayer[playerid] = 2;
			ResetPlayerWeapons(playerid);
			PlayerInfo[playerid][pArmaMao] = 0;
			RemovePlayerAttachedObject(playerid, 0);
			//========================================
			if(FacInfo[PlayerInfo[playerid][pFac]][fTipo] != FAC_TIPO_PMERJ && FacInfo[PlayerInfo[playerid][pFac]][fTipo] != FAC_TIPO_PCERJ)
			{
				RemovePlayerAttachedObject(playerid, 0);
				ArmaData[armaid][ArmaInt] = Int;
				ArmaData[armaid][ArmaWorld] = World;
				//ArmaData[armaid][ArmaAmmo] = GunAmmo;
				ArmaData[armaid][ArmaNoChao] = 1;
				ArmaData[armaid][ArmaEditando] = 0;
				ArmaData[armaid][ArmaCom] = 0;
				GetPlayerPos(playerid, ArmaData[armaid][ArmaX], ArmaData[armaid][ArmaY], ArmaData[armaid][ArmaZ]);
				ArmaData[armaid][ArmaRX] = 93.7;
				ArmaData[armaid][ArmaRY] = 120.0;
				ArmaData[armaid][ArmaRZ] = 120.0;
				ArmaData[armaid][ArmaZ] = ArmaData[armaid][ArmaZ]-1;
				//ArmaData[armaid][ArmaObj] = CreateDynamicObject(GunObjects[ArmaData[armaid][ArmaModelo]], ArmaData[armaid][ArmaX], ArmaData[armaid][ArmaY], ArmaData[armaid][ArmaZ]-1, 93.7, 120.0, 120.0,ArmaData[armaid][ArmaWorld],ArmaData[armaid][ArmaInt]);

	            if(ArmaData[armaid][ArmaExtra] == 1) ArmaData[armaid][ArmaObj] = CreateDynamicObject(2045, ArmaData[armaid][ArmaX], ArmaData[armaid][ArmaY], ArmaData[armaid][ArmaZ], 93.7, 120.0, 120.0,ArmaData[armaid][ArmaWorld],ArmaData[armaid][ArmaInt]);
	        	else ArmaData[armaid][ArmaObj] = CreateDynamicObject(GunObjects[ArmaData[armaid][ArmaModelo]], ArmaData[armaid][ArmaX], ArmaData[armaid][ArmaY], ArmaData[armaid][ArmaZ]-1, 93.7, 120.0, 120.0,ArmaData[armaid][ArmaWorld],ArmaData[armaid][ArmaInt]);

				SalvarArma(armaid);
			}
	    }

	    if(PlayerInfo[playerid][pPrisao] == 1)
		{
			format(string, sizeof(string), "AVISO: você está na prisão por %d minuto(s)", PlayerInfo[playerid][pTemPreso]);
			SendClientMessage(playerid, COLOR_LIGHTRED, string);
			SetPlayerPos(playerid, 264.6407,77.6321,1001.0391);

			SetPlayerVirtualWorld(playerid, 1052);

			PlayerInfo[playerid][pEntrouEmpresa] = -1;
	   		PlayerInfo[playerid][pEntrouCasa] = -1;
	   		PlayerInfo[playerid][pEntrouGaragem] = -1;
	    	PlayerInfo[playerid][pEntrouComplexo] = 52;

	    	TogglePlayerControllable(playerid, 1);
			CaindoInt[playerid] = 0;
	   		CaindoInt_Av[playerid] = 0;
		}
		else
		{
		    SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid,0);

			SetPlayerPos(playerid,1162.5776, -1344.0281, 13.2223);
			SetPlayerCameraPos(playerid, 1261.9004, -1423.1548, 28.3268);
			SetPlayerCameraLookAt(playerid, 1261.2498, -1422.3973, 28.2017);

   			new tempomorto;

			if(PlayerInfo[playerid][pDoador] == 1) tempomorto = 60;
			else if(PlayerInfo[playerid][pDoador] == 2) tempomorto = 60;
			else if(PlayerInfo[playerid][pDoador] == 3) tempomorto = 60;
			else if(PlayerInfo[playerid][pConvenio] == 1) tempomorto = 400;
			else tempomorto = 800;

			PlayerInfo[playerid][pTempoMorto] = gettime()+tempomorto;

			new temporestante = (PlayerInfo[playerid][pTempoMorto]-gettime());

			format(string, sizeof(string), "você está sendo tratado, aguarde %d segundos. (Use /tempomorto para ver o tempo restante)", temporestante);
			SendClientMessage(playerid,COLOR_LIGHTRED,string);
		}
    }
    else
    {
        SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} você ainda não pode aceitar a morte.");
    }
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
    if(IsAFK[playerid]) return true;
    if(AcabouDeLogarVida[playerid] > 0) return true;
    
    new Float:Life,Float:LifeFinal;
    GetPlayerHealth(playerid, Life);
    
    if(issuerid != INVALID_PLAYER_ID && (issuerid > MAX_PLAYERS || TazerPlayer[issuerid]))
        return SetPlayerHealth(playerid, Life);

    if(weaponid == 41)
        return SetPlayerHealth(playerid, Life);
    
    if(SetandoPos[playerid] == 1 || GetPVarInt(playerid, "FreezadoEnt"))
    	return SetPlayerHealth(playerid, Life);
    	
    if(PlayerInfo[playerid][pMorto] > 0)
    	return SetPlayerHealth(playerid, 20.0);

	if(!IsPlayerInAnyVehicle(playerid) && issuerid == INVALID_PLAYER_ID) {
		LifeFinal = Life-amount;
		if(LifeFinal > 20.0) {
			SetPlayerHealth(playerid, LifeFinal);
            P_Health[playerid] = LifeFinal;
            return 1;
		}
	    else{
	        SetPlayerHealth(playerid, 19);
         	SetPlayerMorto(playerid, 1);
         	return 1;
		}
	}
	else if(IsPlayerInAnyVehicle(playerid) && issuerid == INVALID_PLAYER_ID) {
	    if(amount > Life){
	        SetPlayerHealth(playerid, 19);
         	SetPlayerMorto(playerid, 1);
         	return 1;
 		}
	}
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    new Float:Colete,Float:oX,Float:oY,Float:oZ;
	GetPlayerArmour(damagedid, Colete);
	GetPlayerPos(damagedid, oX, oY, oZ);
	new Float:Life,Float:LifeFinal;
	GetPlayerHealth(damagedid, Life);

	if(SetandoPos[damagedid] == 1 || GetPVarInt(damagedid, "FreezadoEnt") || weaponid == 41){
 		SetPlayerHealth(damagedid, Life);
   		return 1;
   	}
   	LastShoter[damagedid] = playerid;
    //==========================================================================
	//Anti Mod Cleo Tirar vida
  	if(weaponid > 0)
	{
	    if(TazerPlayer[playerid] == 0 || (TazerPlayer[playerid] == 1 && weaponid != 23))
	    {
			new IdArma = PlayerInfo[playerid][pArmaMao];
			if(IdArma == 0){
			    SetPlayerHealth(damagedid, Life);
				TogglePlayerControllable(playerid, false);
	 			format(string, sizeof(string), "[ANTI-CHEAT] %s[%d] foi banido por tentar criar armas.", PlayerName(playerid, 0), playerid);
				SendAdminMessage(COLOR_LIGHTRED,string);
				SendClientMessage(playerid, -1, "<!> O anti-cheat de armas está ativo.");
	   			PlayerInfo[playerid][pBanido] = 1;
				//========================================
	  			DesarmandoPlayer[playerid] = 2;
				ResetPlayerWeapons(playerid);
				//SetPlayerAmmo(playerid, weaponid, 0);
				PlayerInfo[playerid][pArmaMao] = 0;
				RemovePlayerAttachedObject(playerid, 0);
				//=======================================
				Banir(PrintPlayerIP(playerid),GetUserName(playerid),PlayerInfo[playerid][pID], "Anti Cheat","Weapon Hack");
	 			SetTimerEx("TimerKick", 500, 0, "d", playerid);
			}
		}
	}
	//==========================================================================
	new Float:Damage = 0;
	new hour, mins, sec, StringDamage[56];
	gettime(hour,mins,sec);

 	amount = 0;

	if(weaponid >= 22 && weaponid <= 38) {
		SetPVarInt(playerid, "HitMark", 1);
  		TextDrawShowForPlayer(playerid, HitMark);
	}
	if(TazerPlayer[playerid] == 1) {
 		if(GetDistanceBetweenPlayers(playerid,damagedid) < 15.0) {
      		format(string, sizeof(string),"~y~Eletrocutado");
			GameTextForPlayer(damagedid,string,10000,1);
			TomouTazer[damagedid] = 60;
			TogglePlayerControllable(damagedid, 0);
			ApplyAnimation(damagedid, "CRACK", "crckdeth2", 4.0, 0, 1, 1, 1, 0, 1);
			
			format(string, sizeof(string), "** %s foi atingido por um dardo de taser.", PlayerName(damagedid, 1));
			ProxDetector(20.0, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		SetPlayerHealth(damagedid, Life);
  		return 1;
	}

 	if(PlayerInfo[damagedid][pMorto] > 0)
	 { //Player já está Ferido
  		SetPlayerHealth(damagedid, 20);
	    P_Health[damagedid] = 20;
	    if(AcabouDeMorrer[damagedid] == 0){
	 		if(PlayerInfo[damagedid][pMorto] == 1){
    			if( ( weaponid == 0 || weaponid == 1 || weaponid ==  5 || weaponid == 6 || weaponid == 7 || weaponid == 15) && SocosMorto[damagedid] < 20) {
       				SetPlayerHealth(damagedid, 15);
			        P_Health[damagedid] = 15;
			        SocosMorto[damagedid]++;
			        if(SocosMorto[damagedid] == 1) {
		        		format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
					Damage = 0;
  				}
		    	else {
					SetPlayerHealth(damagedid, 15);
					P_Health[damagedid] = 15;
     				PlayerInfo[damagedid][pTomouAlgumTiro]++;

					if( weaponid == 25 || weaponid == 30 || weaponid ==  31 || weaponid == 33 || weaponid == 34)
    					PlayerInfo[damagedid][pTomouTiroPesado]++;

         			if (IsValidDynamic3DTextLabel(TextMorto[damagedid])) DestroyDynamic3DTextLabel(TextMorto[damagedid]);
					TextMorto[damagedid] = CreateDynamic3DTextLabel("(( Este jogador está morto ))", 0xFF4B00FF, 0.0, 0.0, 0.7, DISTANCIA_FERIMENTOS, damagedid, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(damagedid));


					new StrQmMatou[82];
					//Mensagem Morto
					if(GetPVarInt(playerid, "TogMsgMatou") == 0) {
						format(StrQmMatou, 82,"(( você matou %s. ))", PlayerName(damagedid, 1));
						SendClientMessage(playerid, COLOR_LIGHTRED, StrQmMatou);
					}
					if(GetPVarInt(damagedid, "TogMsgMatou") == 0) {
						format(StrQmMatou, 82,"(( você foi morto por %s. ))", PlayerName(playerid, 1));
						SendClientMessage(damagedid, COLOR_LIGHTRED, StrQmMatou);
					}

     				SendClientMessage(damagedid, COLOR_YELLOW, "-> Agora você está morto. você poderá utilizar /aceitarmorte daqui a 5 minutos, para respawnar.");
	 				TempoDesistir[playerid] = 300;
	 				PlayerInfo[damagedid][pMorto] = 2;

					TogglePlayerControllable(damagedid, 0);
					TextDrawShowForPlayer(damagedid,Telinha);

					SetarAnimMorto(damagedid);

					new slot;
					for(new m; m < MAX_ITENS; m++){
						if(ItemInfo[m][iCriado] == 1){
							if(ItemInfo[m][iCom] == PlayerInfo[damagedid][pID]) {
 								if(ItemInfo[m][iUsando] == 1){
   									switch(ItemInfo[m][iTipo]) {
										case 1: { slot = 9; }
    									case 2: { slot = 8; }
									    case 3: { slot = 7; }
									    case 4: { slot = 6; }
   									}
		   							if(ItemInfo[m][iBone] == 0) ItemInfo[m][iBone] = 1;
		   							SetPlayerAttachedObject(damagedid, slot, ItemInfo[m][iObj], ItemInfo[m][iBone], ItemInfo[m][iX], ItemInfo[m][iY], ItemInfo[m][iZ], ItemInfo[m][iRX], ItemInfo[m][iRY], ItemInfo[m][iRZ], ItemInfo[m][iSX], ItemInfo[m][iSY], ItemInfo[m][iSZ]);
								}
							}
						}
					}
					if(PlayerInfo[damagedid][pColde] > 0) AttachArmaCorpo(damagedid, ArmaData[PlayerInfo[damagedid][pColde]][ArmaModelo], PlayerInfo[playerid][pColdreBone]);
					switch(weaponid)
					{
	    					case 0:
							{
						        format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
						    }
						    case 1,2,5,6,7:
							{
								format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
							case 3:
							{
	                            format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 4:
							{
								format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
							case 8:
							{
								format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 9:
							{
								format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 22:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
					        case 23:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 24:
							{
				 				if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 25:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 28:
			        		{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 29:
			        		{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 30:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 31:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 32:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
		    				}
			        		case 33:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
							}
			        		case 34:
							{
								if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
								ProxDamage(damagedid, StringDamage);
					    	}
				    }
				    Damage = 0;
				}
			}
		}
		else
			Damage = 0;
	}
	else {
 		new armaid = PlayerInfo[playerid][pArmaMao];
		switch(weaponid) {
	  			case 0:
				{
	   				new Float:DanoSoco = SOCODANO;
				    if(PlayerInfo[playerid][pForca] == 10) DanoSoco = DanoSoco+0.1;
				    else if(PlayerInfo[playerid][pForca] == 20) DanoSoco = DanoSoco+0.2;
				    else if(PlayerInfo[playerid][pForca] == 30) DanoSoco = DanoSoco+0.4;
				    else if(PlayerInfo[playerid][pForca] == 40) DanoSoco = DanoSoco+0.6;
				    else if(PlayerInfo[playerid][pForca] == 50) DanoSoco = DanoSoco+0.8;
				    else if(PlayerInfo[playerid][pForca] == 60) DanoSoco = DanoSoco+1.0;
				    else if(PlayerInfo[playerid][pForca] == 70) DanoSoco = DanoSoco+1.2;
				    else if(PlayerInfo[playerid][pForca] == 80) DanoSoco = DanoSoco+1.4;
				    else if(PlayerInfo[playerid][pForca] == 90) DanoSoco = DanoSoco+1.6;
				    else if(PlayerInfo[playerid][pForca] == 100) DanoSoco = DanoSoco+1.8;

					if(PlayerInfo[playerid][pUsouDroga] == 51) DanoSoco = DanoSoco+2.0;
	    			else if(PlayerInfo[playerid][pUsouDroga] == 52) DanoSoco = DanoSoco+2.2;
	   				else if(PlayerInfo[playerid][pUsouDroga] == 53) DanoSoco = DanoSoco+2.4;
					Damage = DanoSoco; //soco
					format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
	   			case 1,2,5,6,7:
				{
					Damage = OBJETOSDANO;
					PlayerInfo[damagedid][pTomouTiroBrancas]++;

					format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
				case 3:
				{
				    if(ArmaData[armaid][ArmaExtra] == 1) Damage = 10;
				    else Damage = OBJETOSDANO;
				    PlayerInfo[damagedid][pTomouTiroBrancas]++;

				    format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
		        case 4:
				{
					Damage = KNIFEDANO;
                    PlayerInfo[damagedid][pTomouAlgumTiro]++;
   					PlayerInfo[damagedid][pTomouTiroBrancas]++;
					format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
				case 8:
				{
					Damage = KATANADANO;
                    PlayerInfo[damagedid][pTomouAlgumTiro]++;
                    PlayerInfo[damagedid][pTomouTiroBrancas]++;



					format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
		        case 9:
				{
					Damage = SERRADANO;
					PlayerInfo[damagedid][pTomouAlgumTiro]++;
                    PlayerInfo[damagedid][pTomouTiroBrancas]++;



					format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
					ProxDamage(damagedid, StringDamage);
				}
		        case 22:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroBrancas]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
						Damage = COLTDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 23:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
					else
					{
						Damage = SILENCEDDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 24:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;

						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
			 			Damage = EAGLEDANO;
			 			PlayerInfo[damagedid][pTomouAlgumTiro]++;

			 			if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 25:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else if(ProxDetectorS(8.0, playerid, damagedid))
		    		{
						Damage = SHOTGDANO+90;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;

						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				    else if(ProxDetectorS(15.0, playerid, damagedid))
		    		{
						Damage = SHOTGDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
					else if(ProxDetectorS(20.0, playerid, damagedid))
		    		{
		    		    Damage = SHOTGDANO-5;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;
		    		    PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(25.0, playerid, damagedid))
		    		{
		    		    Damage = SHOTGDANO-10;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;
		    		    PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(30.0, playerid, damagedid))
		    		{
		    		    Damage = SHOTGDANO-20;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;
		    		    PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else
		    		{
		    		    Damage = SHOTGDANO-30;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;
		    		    PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
				}
		        case 26:
		        {
					Damage = 0;
				}
		        case 28:
		        {
		            if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
		            else if(ProxDetectorS(15.0, playerid, damagedid))
		    		{
						Damage = UZIDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
					else if(ProxDetectorS(20.0, playerid, damagedid))
		    		{
		    		    Damage = UZIDANO-2;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(25.0, playerid, damagedid))
		    		{
		    		    Damage = UZIDANO-5;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(30.0, playerid, damagedid))
		    		{
		    		    Damage = UZIDANO-7;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(60.0, playerid, damagedid))
		    		{
		    		    Damage = UZIDANO-9;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;

						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else
		    		{
		    		    Damage = UZIDANO-11;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
				}
		        case 29:
		        {
		            if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;

						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
		            else if(ProxDetectorS(20.0, playerid, damagedid))
		    		{
						Damage = MP5DANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
					else if(ProxDetectorS(30.0, playerid, damagedid))
		    		{
		    		    Damage = MP5DANO-5;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(40.0, playerid, damagedid))
		    		{
		    		    Damage = MP5DANO-8;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(50.0, playerid, damagedid))
		    		{
		    		    Damage = MP5DANO-12;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else if(ProxDetectorS(80.0, playerid, damagedid))
		    		{
		    		    Damage = MP5DANO-15;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
		    		else
		    		{
		    		    Damage = MP5DANO-17;
		    		    PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
		    		}
				}
		        case 30:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
						Damage = AKDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 31:
				{
				    if(ProxDetectorS(2.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
						Damage = M4DANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 32:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
						Damage = TECDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 33:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else
				    {
						Damage = RIFLEDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 34:
				{
				    if(ProxDetectorS(1.0, playerid, damagedid))
				    {
				        Damage = CORONHADA;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tSim - %d:%d", Damage, BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\tCoronhada\t%s\tnão - %d:%d", Damage, BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
				    else if(ProxDetectorS(100.0, playerid, damagedid))
				    {
				        Damage = SNIPERDANO+50;
				        PlayerInfo[damagedid][pTomouAlgumTiro]++;
				        PlayerInfo[damagedid][pTomouTiroPesado]++;



						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
				    }
					else
					{
						Damage = SNIPERDANO;
						PlayerInfo[damagedid][pTomouAlgumTiro]++;
						PlayerInfo[damagedid][pTomouTiroPesado]++;
						if(bodypart == 3 && Colete > 0) format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tSim - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						else format(StringDamage,sizeof StringDamage,"%.1f\t%s\t%s\tnão - %d:%d", Damage, GunNames[weaponid], BodyName(bodypart), hour, mins);
						ProxDamage(damagedid, StringDamage);
					}
				}
		        case 35:
				{
					Damage = 0;
				}
		        case 36:
				{
					Damage = 0;
				}
		        case 37:
				{
					Damage = 0;
				}
		        case 38:
				{
					Damage = 0;
				}
				case 41:
				{
				    Damage = 0;
				}
    	}
	    switch(bodypart)
	    {
		        case 3:
				{
					if(weaponid > 22 ) Damage = Damage+5;
		        }
		        case 4:
		        {
					if(weaponid > 22 ) Damage = Damage+5;
		        }
		        case 5:
		        {

		        }
		        case 6:
		        {

		        }
		        case 7:
		        {
		            if(PlayerInfo[damagedid][pMancando] == 0)
					{
						PlayerInfo[damagedid][pMancando] = 1;
						SendClientMessage(damagedid, COLOR_LIGHTRED, "-> Você foi atingido na perna. você não vai poder correr muito e nem pular.");
					}
		        }
		        case 8:
		        {
		            if(PlayerInfo[damagedid][pMancando] == 0)
		            {
						PlayerInfo[damagedid][pMancando] = 1;
						SendClientMessage(damagedid, COLOR_LIGHTRED, "-> Você foi atingido na perna. você não vai poder correr muito e nem pular.");
					}
		        }
		        case 9:
		        {
					if(weaponid > 22 ) Damage = Damage+15;
		        }
		}
		if(weaponid > 21) {
			Damage = Damage-(PlayerInfo[damagedid][pMenosDanoTiro]/2);
			if(Damage < SOCODANO) Damage = SOCODANO;
		}
		
		
  		if(Colete > 0 && bodypart == 3 && weaponid > 21 && weaponid != 30 && weaponid != 31)
  		{
				if(Damage > Colete)
				{
			 		LifeFinal = (Life+Colete)-Damage;
		    		SetPlayerArmour_CA(damagedid, 0.0);
		    		P_Armour[damagedid] = 0.0;
		    		if(LifeFinal > 20) {
						SetPlayerHealth(damagedid, LifeFinal);
                        P_Health[damagedid] = LifeFinal;
					}
		    		else
		    		    SetPlayerMorto(damagedid, 1);
	       		}
	        	else {
					Colete = Colete - Damage;
	  				SetPlayerArmour_CA(damagedid, Colete);
	    			P_Armour[damagedid] = Colete;
				}
				if(Colete < 0 || Colete > 200) {
		 			SetPlayerArmour_CA(damagedid, 0.0);
				 	P_Armour[damagedid] = 0.0;
			 	}
    	}
	    else {
     		new Float:Vida_Des = Life-Damage;

            if(Colete > 0) SetPlayerArmour_CA(damagedid, Colete);

			if(Vida_Des > Life) {
   				Vida_Des = 15;
       			SetPlayerHealth(damagedid, 15);
          		P_Health[damagedid] = 15;
       		}
			if(Vida_Des <= 20)
				SetPlayerMorto(damagedid, 1);
   			else {
				if(Vida_Des > 20.0) {
					SetPlayerHealth(damagedid, Vida_Des);
					P_Health[damagedid] = Vida_Des;
				}
				else
                    SetPlayerMorto(damagedid, 1);
			}
		}
	}
	//Anti God Mod

	if(PlayerInfo[damagedid][pMorto] == 0 && IsAFK[damagedid] == false) {

			new Float:Vedas;
			GetPlayerHealth(damagedid, Vedas);

			new Float:Colethe;
			GetPlayerArmour(damagedid, Colethe);

			if(Colethe == 0)
			{
				if(God_Aviso2[damagedid] == 0)
				{
				    God_VidaAnterior2[damagedid] = Vedas;
				    God_Aviso2[damagedid]++;
				}
				else
				{
    				//if(Vedas > (God_VidaAnterior2[damagedid]+30))
    				if(Vedas >= (God_VidaAnterior2[damagedid]+20))
		  			{
            			format(string, sizeof(string), "O ANTI-CHEAT %s[%d] pode estar de God Mod. (2) [VIDA: %.4f | A.G: %.4f]", PlayerName(damagedid,0), damagedid, Vedas, God_VidaAnterior2[damagedid]);
						SendAdminMessage(COLOR_LIGHTRED,string);
      					God_Aviso2[damagedid] = 0;
						//BanEx(damagedid, "God Mod");
   					}
				    else
				    {
				        GetPlayerHealth(damagedid, God_VidaAnterior2[damagedid]);
        				God_Aviso2[damagedid] = 0;
					}
				}
			}
	}
	return 1;
}

stock BodyName(bodypart)
{
	new stttr[22];
	switch(bodypart)
	{
	    case 3: format(stttr, sizeof(stttr),"Torso");
	    case 4: format(stttr, sizeof(stttr),"Virilha");
	    case 5: format(stttr, sizeof(stttr),"Braço Esquerdo");
	    case 6: format(stttr, sizeof(stttr),"Braço Direito");
	    case 7: format(stttr, sizeof(stttr),"Perna Esquerda");
	    case 8: format(stttr, sizeof(stttr),"Perna Direita");
	    case 9: format(stttr, sizeof(stttr),"Cabeça");
	    default: format(stttr, sizeof(stttr),"");
	}
	return stttr;
}

public ProxDamage(playerid,DescDamage[])
{
	new _string[126];
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage18]);
    strmid(PlayerInfo[playerid][pDamage19], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage17]);
    strmid(PlayerInfo[playerid][pDamage18], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage16]);
    strmid(PlayerInfo[playerid][pDamage17], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage15]);
    strmid(PlayerInfo[playerid][pDamage16], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage14]);
    strmid(PlayerInfo[playerid][pDamage15], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage13]);
    strmid(PlayerInfo[playerid][pDamage14], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage12]);
    strmid(PlayerInfo[playerid][pDamage13], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage11]);
    strmid(PlayerInfo[playerid][pDamage12], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage10]);
    strmid(PlayerInfo[playerid][pDamage11], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage9]);
    strmid(PlayerInfo[playerid][pDamage10], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage8]);
    strmid(PlayerInfo[playerid][pDamage9], _string, 0, 255, 255);
	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage7]);
    strmid(PlayerInfo[playerid][pDamage8], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage6]);
    strmid(PlayerInfo[playerid][pDamage7], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage5]);
    strmid(PlayerInfo[playerid][pDamage6], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage4]);
    strmid(PlayerInfo[playerid][pDamage5], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage3]);
    strmid(PlayerInfo[playerid][pDamage4], _string, 0, 255, 255);
    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage2]);
    strmid(PlayerInfo[playerid][pDamage3], _string, 0, 255, 255);

    format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage1]); format(PlayerInfo[playerid][pDamage2], 66,"%s", PlayerInfo[playerid][pDamage1]);

	format(_string, sizeof(_string),"%s", PlayerInfo[playerid][pDamage0]); format(PlayerInfo[playerid][pDamage1], 66,"%s", PlayerInfo[playerid][pDamage0]);

	format(_string, sizeof(_string),"%s", DescDamage); strmid(PlayerInfo[playerid][pDamage0], _string, 0, 255, 255);

	return 1;
}

public ZerarDamages(playerid)
{
    format(PlayerInfo[playerid][pDamage0], 50, "");
	format(PlayerInfo[playerid][pDamage1], 50, "");
	format(PlayerInfo[playerid][pDamage2], 50, "");
	format(PlayerInfo[playerid][pDamage3], 50, "");
	format(PlayerInfo[playerid][pDamage4], 50, "");
	format(PlayerInfo[playerid][pDamage5], 50, "");
	format(PlayerInfo[playerid][pDamage6], 50, "");
	format(PlayerInfo[playerid][pDamage7], 50, "");
	format(PlayerInfo[playerid][pDamage8], 50, "");
	format(PlayerInfo[playerid][pDamage9], 50, "");
	format(PlayerInfo[playerid][pDamage10], 50, "");
	format(PlayerInfo[playerid][pDamage11], 50, "");
	format(PlayerInfo[playerid][pDamage12], 50, "");
	format(PlayerInfo[playerid][pDamage13], 50, "");
	format(PlayerInfo[playerid][pDamage14], 50, "");
	format(PlayerInfo[playerid][pDamage15], 50, "");
	format(PlayerInfo[playerid][pDamage16], 50, "");
	format(PlayerInfo[playerid][pDamage17], 50, "");
	format(PlayerInfo[playerid][pDamage18], 50, "");
	format(PlayerInfo[playerid][pDamage19], 50, "");
	return 1;
}
