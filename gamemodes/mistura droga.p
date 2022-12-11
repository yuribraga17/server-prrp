#define MAX_LABO 200
enum aLaboDroga
{
	ldID,
	ldSeteda,
	Float:ldposX,
	Float:ldposY,
	Float:ldposZ,
	Float:ldposR,
	ldObjeto,
	ldRrombado
};
static LaboDrug[MAX_COFRE][aLaboDroga];


//=================[SISTEMA DE LABOLATORIO]======================
COMMAND:criarlabo(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
    if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		CriarFABRICADROGA(playerid);
		return 1;
	}
	return 1;
}
stock CriarFABRICADROGA(playerid)
{
	new str[256];
    for(new i = 0; i < MAX_COFREB; i++)
    {
        if(LaboDrug[i][ldSeteda] == 0)
        {
            LaboDrug[i][ldSeteda] = 1;
            format(str,sizeof(str),"INSERT INTO rp_laboratorio (setada) VALUES ('%d')", LaboDrug[i][ldSeteda]);
   			mysql_function_query(Pipeline, str, false, "CriouFABRICAnaDB", "d",playerid);
   			return 1;
		}
	}
	return 1;
}
forward CriouFABRICAnaDB(playerid);
public CriouFABRICAnaDB(playerid)
{
    new Float:sys_pos_dono[3];
	new i = cache_insert_id();
    GetPlayerPos(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2]);

    LaboDrug[i][ldID] = i;
	LaboDrug[i][ldposX] = sys_pos_dono[0];
	LaboDrug[i][ldposY] = sys_pos_dono[1]+2;
	LaboDrug[i][ldposZ] = sys_pos_dono[2];

	LaboDrug[i][ldObjeto] = CreateDynamicObject(2332, sys_pos_dono[0], sys_pos_dono[1]+2, sys_pos_dono[2]-1, 0.000000, 0.000000, 0.0, 0);
   	//Streamer_UpdateEx(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
   	Streamer_Update(playerid);
    EditDynamicObject(playerid, LaboDrug[i][ldObjeto]);
    SetPVarInt(playerid, "EditFABRICAD", 1);
    SetPVarInt(playerid, "EditFABRICADID", i);
    return 1;
}
forward SaveFABRICAD(i);
public SaveFABRICAD(i)
{
	new str[254];
	format(str,sizeof(str),"UPDATE `rp_laboratorio` SET `posx`='%f',`posy`='%f',`posz`='%f',`posr`='%f' WHERE id=%d LIMIT 1",
 	LaboDrug[i][ldposX],
	LaboDrug[i][ldposY],
	LaboDrug[i][ldposZ],
	LaboDrug[i][ldposR],
	LaboDrug[i][ldID]);
	mysql_function_query(Pipeline, str, false, "noReturnQuery", "");
	return 1;
}

forward QUERY_LOAD_LABOTARIO();
public QUERY_LOAD_LABOTARIO()
{
	new b[256];
	new rows,fields;
	cache_get_data(rows, fields);
 	for(new i; i < rows; i++)
  	{
        cache_get_field_content(i,"id",b);  				LaboDrug[i][ldID] = strval(b);
        cache_get_field_content(i,"setada",b);         		LaboDrug[i][ldSeteda] = strval(b);
        cache_get_field_content(i,"posx",b);         		LaboDrug[i][ldposX] = floatstr(b);
        cache_get_field_content(i,"posy",b);         		LaboDrug[i][ldposY] = floatstr(b);
        cache_get_field_content(i,"posz",b);         		LaboDrug[i][ldposZ] = floatstr(b);
    	cache_get_field_content(i,"posr",b);         		LaboDrug[i][ldposR] = floatstr(b);


    	if(LaboDrug[i][ldSeteda] == 1)
    	{
    		LaboDrug[i][ldObjeto] = CreateDynamicObject(2332, LaboDrug[i][ldposX], LaboDrug[i][ldposY], LaboDrug[i][ldposZ], 0.000000, 0.000000, LaboDrug[i][ldposR], 0);
		}
	}
	return 1;
}

		else if(GetPVarInt(playerid, "EditFABRICAD") == 1)
		{
            SendClientMessage( playerid,COLOR_YELLOW,"Fabrica de drogas criada.");
            new id = GetPVarInt(playerid, "EditFABRICADID");
			LaboDrug[id][ldposX] = x;
			LaboDrug[id][ldposY] = y;
			LaboDrug[id][ldposZ] = z;
			LaboDrug[id][ldposR] = rz;
			SetPVarInt(playerid, "EditFABRICAD", 0);
    		SetPVarInt(playerid, "EditFABRICADID", 0);
    		SaveCOFREB(id);

			if(IsValidDynamicObject(LaboDrug[id][ldObjeto]))
				DestroyDynamicObject(LaboDrug[id][ldObjeto]);

			LaboDrug[id][ldObjeto] = CreateDynamicObject(2332, x, y, z, 0.000000, 0.000000, rz);
    		return 1;
        }

COMMAND:misturarcoca(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa estar logado.");
	if(PlayerInfo[playerid][pLevel] < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de TC 2 ou mais para misturar a cocaina.");
    if(PlayerDroga[playerid][CocaE] < 9) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de pelo menos 10g de cocaina Excelente.");
	if(PlayerInfo[playerid][pFabricouD] > 6) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você já fabricou droga o bastante neste PayDay, volte após seu payday.");
	if(PlayerDroga[playerid][Acloridrico] < 9) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de 10ml de Acido cloridrico.");
	if(PlayerDroga[playerid][Efedrina] < 9) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa de 10gm de Efedrina.");
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode usar este comando enquanto estiver morto!");
    if(OutrasInfos[playerid][oAlgemado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não pode utilizar este comando enquanto estiver algemado.");
    if(OutrasInfos[playerid][oAmarrado] != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você nãopode utilizar este comando enquanto estiver amarrado.");

	for(new i = 0; i < MAX_LABO; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.5,LaboDrug[i][ldposX], LaboDrug[i][ldposY], LaboDrug[i][ldposZ]))
    	{

			SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você começou o processo de mistura de cocaina.");	
			SetTimerEx("MisturandoCoca", 10000, false, "d", playerid);

			new stringvendeu[256];
			format(stringvendeu,sizeof(stringvendeu),"** %s se aproxima da bancada, pega um triturador de comprimidos e coloca a Efedrina no pote. Começa a tritura-la.", PlayerName(playerid, 1));
			ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

			new strl[126];
			format(strl, 126, "%s Misturou a cocaina. [/venderdroga]", PlayerName(playerid, 0));
			LogCMD_venderdroga(strl);
		}

	}
	return 1;
}

forward MisturandoCoca(playerid);
public MisturandoCoca(playerid)
{
			
	PlayerDroga[playerid][CocaB]-9;
	PlayerDroga[playerid][Acloridrico]-9;
	PlayerDroga[playerid][Efedrina]-9;

	TogglePlayerControllable(playerid, 0);
	ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);

	SetTimerEx("FinalizandoCoca", 50000, false, "d", playerid);

	format(stringvendeu,sizeof(stringvendeu),"** %s Pega a Efedrina triturada e pega também o litro com o Acido, mistura os dois e acrescenta a cocaina excelente.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	format(stringvendeu,sizeof(stringvendeu),"** %s mistura todos os ingredientes, passa para a panela.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);


    return 1;
}

forward FinalizandoCoca(playerid);
public FinalizandoCoca(playerid)
{

	format(stringvendeu,sizeof(stringvendeu),"** %s deixa a panela alguns segundos no fogo e fica mexendo a mistura. Depois passa tudo para um pano e vai para a prensa, termina de tirar o liquido.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	format(stringvendeu,sizeof(stringvendeu),"** %s mistura todos os ingredientes, passa tudo para um pano e coloca na panela para secar um pouco.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	TogglePlayerControllable(playerid, 0);
	SetTimerEx("PegouCocaRuim", 10000, false, "d", playerid);


    return 1;
}

forward PegouCocaRuim(playerid);
public PegouCocaRuim(playerid)
{

	new stringvendeu[256];
	format(stringvendeu,sizeof(stringvendeu),"** %s retira o pano da prensa junto da droga. Começa a esfarelar a droga e embalar em pinos.", PlayerName(playerid, 1));
	ProxDetector(20.0, playerid, stringvendeu,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	PlayerDroga[playerid][CocaR]+25;
	PlayerInfo[playerid][pFabricouD]++;
	SendClientMessage(playerid, COLOR_LIGHTRED, "INFO:{FFFFFF} Você recebeu 100 reais pela cocaina.");


    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid, 1);
    RemovePlayerAttachedObject(playerid, 6);

    return 1;
}
