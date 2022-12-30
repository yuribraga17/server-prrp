
COMMAND:criarcofrel(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
    if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		CriarCOFRELDB(playerid);
		return 1;
	}
	return 1;
}
stock CriarCOFRELDB(playerid)
{
	new str[256];
    for(new i = 0; i < MAX_COFRE; i++)
    {
        if(cLoja[i][clSeteda] == 0)
        {
            cLoja[i][clSeteda] = 1;
            format(str,sizeof(str),"INSERT INTO rp_cLoja (setada) VALUES ('%d')", cLoja[i][clSeteda]);
   			mysql_function_query(Pipeline, str, false, "CriouCOFRELnaDB", "d",playerid);
   			return 1;
		}
	}
	return 1;
}
forward CriouCOFRELnaDB(playerid);
public CriouCOFRELnaDB(playerid)
{
    new Float:sys_pos_dono[3];
	new i = cache_insert_id();
    GetPlayerPos(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2]);

    cLoja[i][clID] = i;
	cLoja[i][clposX] = sys_pos_dono[0];
	cLoja[i][clposY] = sys_pos_dono[1]+2;
	cLoja[i][clposZ] = sys_pos_dono[2];

	cLoja[i][clObjeto] = CreateDynamicObject(-2900, sys_pos_dono[0], sys_pos_dono[1]+2, sys_pos_dono[2]-1, 0.000000, 0.000000, 0.0, 0);
   	//Streamer_UpdateEx(playerid, sys_pos_dono[0], sys_pos_dono[1], sys_pos_dono[2], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
   	Streamer_Update(playerid);
    EditDynamicObject(playerid, cLoja[i][clObjeto]);
    SetPVarInt(playerid, "EditCOFREL", 1);
    SetPVarInt(playerid, "EditCOFRELid", i);
    return 1;
}
forward SaveCOFREL(i);
public SaveCOFREL(i)
{
	new str[254];
	format(str,sizeof(str),"UPDATE `rp_cLoja` SET `posx`='%f',`posy`='%f',`posz`='%f',`posr`='%f' WHERE id=%d LIMIT 1",
 	cLoja[i][clposX],
	cLoja[i][clposY],
	cLoja[i][clposZ],
	cLoja[i][clposR],
	cLoja[i][clID]);
	mysql_function_query(Pipeline, str, false, "noReturnQuery", "");
	return 1;
}

		else if(GetPVarInt(playerid, "EditCOFREL") == 1)
		{
		    //SCM(playerid, -1, "DEBUG: Instalou caixa eletrônico | Salvou");
            SendClientMessage( playerid,COLOR_YELLOW,"Cofre loja instalado.");
            new id = GetPVarInt(playerid, "EditCOFRELID");
			cLoja[id][aposX] = x;
			cLoja[id][aposY] = y;
			cLoja[id][aposZ] = z;
			cLoja[id][clposR] = rz;
			SetPVarInt(playerid, "EditCOFREL", 0);
    		SetPVarInt(playerid, "EditCOFRELid", 0);
    		SaveCOFREL(id);

			if(IsValidDynamicObject(cLoja[id][clObjeto]))
				DestroyDynamicObject(cLoja[id][clObjeto]);

			cLoja[id][clObjeto] = CreateDynamicObject(-2900, x, y, z, 0.000000, 0.000000, rz);
    		return 1;
        }

mysql_function_query(Pipeline, "SELECT * FROM `rp_atms`", true, "QUERY_LOAD_ATMS", "");

mysql_function_query(Pipeline, "SELECT * FROM `rp_cloja`", true, "QUERY_LOAD_COFRELOJAS", "");


forward QUERY_LOAD_COFRELOJAS();
public QUERY_LOAD_COFRELOJAS()
{
	new b[256];
	new rows,fields;
	cache_get_data(rows, fields);
 	for(new i; i < rows; i++)
  	{
        cache_get_field_content(i,"id",b);  				cloja[i][clID] = strval(b);
        cache_get_field_content(i,"setada",b);         		cloja[i][clSeteda] = strval(b);
        cache_get_field_content(i,"posx",b);         		cloja[i][clposX] = floatstr(b);
        cache_get_field_content(i,"posy",b);         		cloja[i][clposY] = floatstr(b);
        cache_get_field_content(i,"posz",b);         		cloja[i][clposZ] = floatstr(b);
    	cache_get_field_content(i,"posr",b);         		cloja[i][clposR] = floatstr(b);


    	if(cloja[i][clSeteda] == 1)
    	{
    		cloja[i][clObjeto] = CreateDynamicObject(-2900, cloja[i][clposX], cloja[i][aposY], cloja[i][clposZ], 0.000000, 0.000000, cloja[i][clposR], 0);
		}
	}
	return 1;
}