	else if(IsPlayerInRangeOfPoint(playerid, 5, 2532.0464,-1916.4795,13.5480))
	{
	    Dialog_Show(playerid, DIALOGLJROUPAS, DIALOG_STYLE_LIST, "JOALHERIA", "Relógios", "Selecionar", "Cancelar");
	}

Dialog:DIALOGJOIAS(playerid, response, listitem, inputtext[])
{
	if (!response) return 1;
	else
	{
 		switch(listitem)
 		{
      		case 0: ShowModelSelectionMenu(playerid, "Relogios", MODEL_SELECTION_RELOGIOS, LOJA_RELOGIOS, sizeof(LOJA_RELOGIOS), 16.0, 0.0, 55.0);
 		}
	}
	return 1;
}
#define MAX_JOIA 2
enum aJoalheria
{
	jlID,
	jlSeteda,
	Float:jlposX,
	Float:jlposY,
	Float:jlposZ,
	Float:jlposR,
	jlObjeto,
	jlRrombado
};
static joalheria[MAX_COFRE][aJoalheria];

COMMAND:criarjoia(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
    if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		CriarJOIA(playerid);
		return 1;
	}
	return 1;
}
stock CriarJOIA(playerid)
{
	new str[256];
    for(new i = 0; i < MAX_JOIA; i++)
    {
        if(joalheria[i][jlSeteda] == 0)
        {
            joalheria[i][jlSeteda] = 1;
            format(str,sizeof(str),"INSERT INTO rp_joias (setada) VALUES ('%d')", joalheria[i][jlSeteda]);
   			mysql_function_query(Pipeline, str, false, "CriouJOIAnaDB", "d",playerid);
   			return 1;
		}
	}
	return 1;
}
forward CriouJOIAnaDB(playerid);
public CriouJOIAnaDB(playerid)
{
    new Float:sys_pos_dono[3];
	new i = cache_insert_id();
    GetPlayerPos(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2]);

    joalheria[i][jlID] = i;
	joalheria[i][jlposX] = sys_pos_dono[0];
	joalheria[i][jlposY] = sys_pos_dono[1]+2;
	joalheria[i][jlposZ] = sys_pos_dono[2];

	joalheria[i][jlObjeto] = CreateDynamicObject(2332, sys_pos_dono[0], sys_pos_dono[1]+2, sys_pos_dono[2]-1, 0.000000, 0.000000, 0.0, 0);
   	//Streamer_UpdateEx(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
   	Streamer_Update(playerid);
    EditDynamicObject(playerid, joalheria[i][jlObjeto]);
    SetPVarInt(playerid, "EditJOIA", 1);
    SetPVarInt(playerid, "EditJOIAID", i);
    return 1;
}
forward SaveJOIA(i);
public SaveJOIA(i)
{
	new str[254];
	format(str,sizeof(str),"UPDATE `rp_joias` SET `posx`='%f',`posy`='%f',`posz`='%f',`posr`='%f' WHERE id=%d LIMIT 1",
 	joalheria[i][jlposX],
	joalheria[i][jlposY],
	joalheria[i][jlposZ],
	joalheria[i][jlposR],
	joalheria[i][jlID]);
	mysql_function_query(Pipeline, str, false, "noReturnQuery", "");
	return 1;
}

		else if(GetPVarInt(playerid, "EditJOIA") == 1)
		{
            SendClientMessage( playerid,COLOR_YELLOW,"Cofre da joalheria instalado.");
            new id = GetPVarInt(playerid, "EditJOIAID");
			joalheria[id][jlposX] = x;
			joalheria[id][jlposY] = y;
			joalheria[id][jlposZ] = z;
			joalheria[id][jlposR] = rz;
			SetPVarInt(playerid, "EditJOIA", 0);
    		SetPVarInt(playerid, "EditJOIAID", 0);
    		SaveCOFREB(id);

			if(IsValidDynamicObject(joalheria[id][jlObjeto]))
				DestroyDynamicObject(joalheria[id][jlObjeto]);

			joalheria[id][jlObjeto] = CreateDynamicObject(2332, x, y, z, 0.000000, 0.000000, rz);
    		return 1;
        }

forward QUERY_LOAD_JOIAS();
public QUERY_LOAD_JOIAS()
{
	new b[256];
	new rows,fields;
	cache_get_data(rows, fields);
 	for(new i; i < rows; i++)
  	{
        cache_get_field_content(i,"id",b);  				joalheria[i][jlID] = strval(b);
        cache_get_field_content(i,"setada",b);         		joalheria[i][jlSeteda] = strval(b);
        cache_get_field_content(i,"posx",b);         		joalheria[i][jlposX] = floatstr(b);
        cache_get_field_content(i,"posy",b);         		joalheria[i][jlposY] = floatstr(b);
        cache_get_field_content(i,"posz",b);         		joalheria[i][jlposZ] = floatstr(b);
    	cache_get_field_content(i,"posr",b);         		joalheria[i][jlposR] = floatstr(b);


    	if(joalheria[i][jlSeteda] == 1)
    	{
    		joalheria[i][jlObjeto] = CreateDynamicObject(2332, joalheria[i][jlposX], joalheria[i][jlposY], joalheria[i][jlposZ], 0.000000, 0.000000, joalheria[i][jlposR], 0);
			//gerarcofrebanco();
		}
	}
	return 1;
}
	if(strcmp(tmp,"joalheria",true) == 0)
	{
		if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você  precisa estar logado.");
		if(PlayerInfo[playerid][pLevel] < 5) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 5 ou mais para explodir o caixa.");
		if(PlayerInfo[playerid][pBomba] < 1) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de 1 dinamite para explodir o caixa.");
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
		if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
		if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver amarrado.");
		if(PlayerInfo[playerid][pArrombarDNV_C] != 0)
		{
			new stringcofreroubo[128];
			format(stringcofreroubo, sizeof(stringcofreroubo),"Aguarde %d segundos antes de explodir um banco novamente.", PlayerInfo[playerid][pArrombarDNV_C]);
			SendClientMessage(playerid,COLOR_LIGHTRED, stringcofreroubo);
			return 1;
		}
		for(new i = 0; i < MAX_JOIA; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid,1.5,joalheria[i][jlposX], joalheria[i][jlposY], joalheria[i][jlposZ])) 
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
					SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} é preciso ter pelo menos 8 policiais em serviço para executar essa ação.");
					new location[MAX_ZONE_NAME];
					Get2DZone(location, TOTAL_ZONE_NAME, ATMs[i][aposX], ATMs[i][aposY], ATMs[i][aposZ]);

					TaNoJOALHERIA[playerid] = i;
					SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você armou uma dinamite.");
						
					TogglePlayerControllable(playerid, 0);
					ApplyAnimation(playerid, "PLAYIDLES", "shldr", 4.0,1,1,1,1,0,1);
					SetTimerEx("ExplodindoCaixa", 15000, false, "d", playerid);

					new stringCaixaF[256];
					format(stringCaixaF,sizeof(stringCaixaF),"** %s está armando uma dinamite no caixa eletronico.", PlayerName(playerid, 1));
					ProxDetector(20.0, playerid, stringCaixaF,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);


					format(stringCaixaF, sizeof(stringCaixaF), "* Barulho de explosão são escutados nas proximidades *");
					ProxDetector(500.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

					new str[126];
					SendFacMessage(COLOR_LIGHTBLUE, 1, "|__________EMERGENCIA POLICIAL__________|");
					SendFacMessage(COLOR_LIGHTBLUE, 2, "|__________EMERGENCIA POLICIAL__________|");
					SendFacMessage(COLOR_LIGHTBLUE, 1, "Relator: Anonimo, Contato: Orelhão");
					SendFacMessage(COLOR_LIGHTBLUE, 2, "Relator: Anonimo, Contato: Orelhão");
					SendFacMessage(COLOR_LIGHTBLUE, 1, "Situação: Socorro, estão roubando a joalheria, venham rápido.");
					SendFacMessage(COLOR_LIGHTBLUE, 2, "Situação: Socorro, estão explodindo a joalheria venham rápido.");
					format(str, sizeof(str), "Local: %s",location);
					SendFacMessage(COLOR_LIGHTBLUE, 1, str);
					SendFacMessage(COLOR_LIGHTBLUE, 2, str);

					SendAdminAlert(COLOR_LIGHTRED, "AdmCmd:{FFFFFF} %s acaba de utilizar o comando /explodir banco.", PlayerName(playerid, 0));
						
					new strl[126];
					format(strl, 126, "%s explodiu um caixa eletronico. [//explodir banco]", PlayerName(playerid, 0));
					LogCMD_explodircaixa(strl);
				}
			}
		}
	}


	if(strcmp(tmp,"joias",true) == 0)
	{
		if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você precisa estar logado.");
		if(PlayerInfo[playerid][pLevel] < 5) return SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 25 ou mais para pegar a grana.");
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
		if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
		if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver amarrado.");
		if(PlayerInfo[playerid][pArrombarDNV_C] != 0)

		for(new i = 0; i < MAX_JOIA; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid,1.5,joalheria[i][jlposX], joalheria[i][jlposY], joalheria[i][jlposZ]) && joalheria[i][jlRrombado] == 1) 
			{

				new stringBCofre[256];	
				format(stringBCofre,sizeof(stringBCofre),"** %s se abaixa e começa a recolher os pertences.", PlayerName(playerid, 1));
				ProxDetector(20.0, playerid, stringBCofre,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

				SetTimerEx("PegandoGranaJoalheria", 120000, false, "d", playerid);
				return 1;
			}
		}
	}

forward PegandoGranaJoalheria(playerid);
public PegandoGranaJoalheria(playerid)
{
	for(new i = 0; i < MAX_COFREB; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,joalheria[i][jlposX], joalheria[i][jlposY], joalheria[i][jlposZ]))
		{
            PlayerInfo[playerid][pGranaSuja] += 6000;
            PlayerInfo[playerid][pOuro] += 10;
            PlayerInfo[playerid][pPrata] += 5;
            PlayerInfo[playerid][pBronze] += 4;
			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você está colhetando as joias e a grana.");
			joalheria[i][jlRrombado] = 0;


			TogglePlayerControllable(playerid, 0);
			SetTimerEx("AnimGranaJL", 120000, false, "d", playerid);
		}
	}

    return 1;
}


forward AnimGranaJL(playerid);
public AnimGranaJL(playerid)
{
	ApplyAnimation(playerid,"FAT","IDLE_tired", 4.0, 1, 0, 0, 0, 0, 1);
	SetTimerEx("PegouGranaJL", 8000, false, "d", playerid);

    return 1;
}

forward PegouGranaJL(playerid);
public PegouGranaJL(playerid)
{

    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);

    return 1;
}



CMD:contrabando(playerid,params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
	{
	   	if (IsPlayerInRangeOfPoint(playerid, 5, 1096.8484,-1528.9009,22.7434))
			Dialog_Show(playerid, DIALOG_VENDERJOIAS, DIALOG_STYLE_LIST, "Contrabando", "1x Ouro [R$2500]\n1x Prata [R$1600]\n1x Bronze [R$900]", "Vender", "Voltar");
		else {
  			SetPlayerCheckpoint(playerid, 1096.8484,-1528.9009,22.7434, 5.0);
			cp_target[playerid] = 1;
			SendClientMessage(playerid, COLOR_LIGHTRED, "Você não está no local de contrabando.");
			return 1;
		}
	}
    return 1;
}

Dialog:DIALOG_VENDERJOIAS(playerid, response, listitem, inputtext[])
{
	if (!response) return 1;
	else
	{
	    new NaEmpresa = PlayerInfo[playerid][pEntrouEmpresa];

	    switch(listitem)
		{
		    case 0:
		    {
		        if(EmpInfo[NaEmpresa][eBank] >= 0)
				{
				    if(PlayerInfo[playerid][pOuro] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não tem um Ouro.");
					PlayerInfo[playerid][pOuro]--;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "[Peças] Você vendeu uma barra de ouro por R$2500.");
					PlayerInfo[playerid][pGranaSuja] = PlayerInfo[playerid][pGranaSuja]+2500;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} A empresa não tem dinheiro o suficiente.");
			}
			case 1:
		    {
		        if(EmpInfo[NaEmpresa][eBank] >= 0)
		        {
		            if(PlayerInfo[playerid][pPrata] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não tem uma barra de prata.");

					PlayerInfo[playerid][pPrata]--;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "[Peças] Você vendeu uma barra de prata por R$1600.");
					PlayerInfo[playerid][pGranaSuja] = PlayerInfo[playerid][pGranaSuja]+1600;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} A empresa não tem dinheiro o suficiente.");
			}
			case 2:
		    {
		        if(EmpInfo[NaEmpresa][eBank] >= 0)
		        {
		            if(PlayerInfo[playerid][pPrata] < 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não tem uma barra de bronze.");

					PlayerInfo[playerid][pPrata]--;
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "[Peças] Você vendeu uma barra de bronze por R$900.");
					PlayerInfo[playerid][pGranaSuja] = PlayerInfo[playerid][pGranaSuja]+900;
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} A empresa não tem dinheiro o suficiente.");
			}
		}

	}
}