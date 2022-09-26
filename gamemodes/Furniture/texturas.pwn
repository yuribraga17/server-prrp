new VendoCategoriaTextura[MAX_PLAYERS];
//==============================================================================
//Basico
new Texturas_BasicosName[3][] =
{
    "Branco",
    "Preto",
    "Azul"
};
new Texturas_BasicosID[3][1] =
{
    {5},
    {6},
    {7}
};
//==============================================================================
//Paredes
new Texturas_ParedesName[44][] =
{
    "Retangular Branco", //130
    "Listra diagonal", //131
    "Custom Branca", //132
    "Tabuas de Madeira", //133
    "Custom c/ Ladrilhos", //134
    "Escura", //135
    "Clara", //136
    "Azul e Branca",//137
    "Blocos Brancos",//138
    "Marmore", //139
    "Container Azul",//140
    "Motel",//141
    "Tijolos",
    "Tijolos Escuros",
    "Amarela",
    "Pedras Grandes",
    "Tijolos Vermelhos",
    "Pedras Pequenas",
    "Ladrilhos Brancos",
    "Azul",
    "Branca e Azul",
	"Branca e Azul de Madeira",
	"Blocos Rusticos",
	"Cinza",
	"Bloquinhos",
	"Azul com Madeira (Bank)",
	"Pedras Azuis",
	"Madeira Velha",
	"Madeira Velha com Janela",
	"Verde suja",
	"Losangulos",
	"Amarela com Branco",
	"Tijolos Escuros",
	"Laranja Manchado",
	"Azul",
	"Branca e Verde",
	"Rosa",
	"Roxa",
	"24/7",
	"Ladrilhos Sujos",
	"Cinza claro",
	"Blocos Novos",
	"Motel Escuro",
	"Listras Brancas"
};
new Texturas_ParedesID[44][1] =
{
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
	{136},
	{137},
	{138},
	{139},
	{140},
	{141},
	{142},
	{143},
	{144},
	{145},
	{146},
	{147},
	{148},
	{149},
	{250},
	{251},
 	{252},
 	{253},
 	{254},
 	{255},
 	{256},
 	{257},
 	{258},
 	{259},//30
 	{260},
 	{261},
 	{262},
 	{263},
 	{264},
 	{265},
 	{266},
 	{267},
 	{268},
 	{269},
 	{270},
 	{271}, //42
 	{272},
 	{273}
};
//==============================================================================
//Figuras
new Texturas_FigurasName[23][] =
{
    "Pose do Diabo",
    "Porta pixada",
    "Casal",
    "Garota de Biquine",
    "Gata Armada",
    "2Pac",
    "Base 5",
    "Praia",
    "Barcos",
    "Outdor 1",
    "Outdor 2",
    "Outdor 3",
    "Usa Flag",
    "Arma Velha",
    "GTA Vice City Poster",
    "Grafite",
	"Desenhos",
	"Rostos",
	"Pixelado",
	"Gordão",
	"Moça",
	"Alvo",
	"Vinyl Records"
};
new Texturas_FigurasID[23][1] =
{
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
	{26},
	{27},
	{28},
	{29},
	{30},
    {31},
    {32},
    {33},
    {34},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227}
};
//==============================================================================
//Carros
new Texturas_CarrosName[6][] =
{
    "4 Carros",
	"Windsor",
	"Slamvan",
	"Monster",
	"Hustler",
	"Feltzer"
};
new Texturas_CarrosID[6][1] =
{
    {150},
    {151},
    {152},
    {153},
    {154},
    {155}
};
//==============================================================================
//Chãos
new Texturas_ChaosName[8][] =
{
    "Grama clara",
	"Grama",
	"Laje Marrom",
	"Tijolos com Tons marrons",
	"Cozinha",
	"Ladrilhos velhos",
	"Madeira",
	"Concreto Liso"
};
new Texturas_ChaosID[8][1] =
{
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47}
};
//==============================================================================
//Madeiras
new Texturas_MadeirasName[3][] =
{
    "Piso de madeira",
	"Madeira velha clara",
	"Pranchas de madeira"
};
new Texturas_MadeirasID[3][1] =
{
    {100},
    {101},
    {102}
};
//==============================================================================
//Patern
new Texturas_PaternName[2][] =
{
    "Amerelo e cinza na diagonal",
	"Linhas Amerelas e Brancas"
};
new Texturas_PaternID[2][1] =
{
    {80},
    {81}
};
//==============================================================================
//Outros
new Texturas_OutrosName[4][] =
{
    "Agua limpa",
	"Vidro",
	"Placa de Metal",
	"Janela"
};
new Texturas_OutrosID[4][1] =
{
    {60},
    {61},
    {62},
    {63}
};
//==============================================================================
//Portas
new Texturas_PortasName[6][] =
{
    "Branca",
	"Pixada",
	"Elegante",
	"Chique",
	"Branca Lisa",
	"Branca Detalhada"
};
new Texturas_PortasID[6][1] =
{
    {300},
    {301},
    {302},
    {303},
    {304},
    {305}
};
//==============================================================================
Movel_DialogTexturas(playerid, movelid, listitem)
{
    new c = -1, strCasa[64];
    if(PlayerInfo[playerid][pEntrouCasa] != -1)
	{
		c = PlayerInfo[playerid][pEntrouCasa];
		format(strCasa,sizeof(strCasa),"[Furniture] Casa: %d",c);
	}
 	else if(PlayerInfo[playerid][pEntrouEmpresa] != -1)
	{
		c = PlayerInfo[playerid][pEntrouEmpresa];
		format(strCasa,sizeof(strCasa),"[Furniture] Empresa: %d",c);
	}
	else if(PlayerInfo[playerid][pEntrouComplexo] != -1)
	{
		c = PlayerInfo[playerid][pEntrouComplexo];
		format(strCasa,sizeof(strCasa),"[Furniture] Complexo: %d",c);
	}
	else if(PlayerInfo[playerid][pEntrouGaragem] != -1)
	{
		c = PlayerInfo[playerid][pEntrouGaragem];
		format(strCasa,sizeof(strCasa),"[Furniture] Garagem: %d",c);
	}
	if(c == -1) return SCM(playerid, COLOR_LIGHTRED, "ERRO: Você não pode usar este comando aqui.");

    switch(listitem)
    {
    	case 0: { FurniInfo[movelid][mTextura] = 0; FurniInfo[movelid][mIndex] = 0; Movel_Refresh(playerid, movelid); }
     	case 1: { ShowTextureMenu(playerid, 1); }
      	case 2: { ShowTextureMenu(playerid, 2); }
      	case 3: { ShowTextureMenu(playerid, 3); }
		case 4: { ShowTextureMenu(playerid, 4); }
		case 5: { ShowTextureMenu(playerid, 5); }
		case 6: { ShowTextureMenu(playerid, 6); }
		case 7: { ShowTextureMenu(playerid, 8); }
		case 8: { ShowTextureMenu(playerid, 9); }
		case 9: { ShowTextureMenu(playerid, 7); }
	}
	return 1;
}

Movel_AbrirDialogTexturas(playerid)
{
    new c = -1, strCasa[64];
    if(PlayerInfo[playerid][pEntrouCasa] != -1)
	{
		c = PlayerInfo[playerid][pEntrouCasa];
		format(strCasa,sizeof(strCasa),"[Furniture] Casa: %d",c);
	}
 	else if(PlayerInfo[playerid][pEntrouEmpresa] != -1)
	{
		c = PlayerInfo[playerid][pEntrouEmpresa];
		format(strCasa,sizeof(strCasa),"[Furniture] Empresa: %d",c);
	}
	else if(PlayerInfo[playerid][pEntrouComplexo] != -1)
	{
		c = PlayerInfo[playerid][pEntrouComplexo];
		format(strCasa,sizeof(strCasa),"[Furniture] Complexo: %d",c);
	}
	else if(PlayerInfo[playerid][pEntrouGaragem] != -1)
	{
		c = PlayerInfo[playerid][pEntrouGaragem];
		format(strCasa,sizeof(strCasa),"[Furniture] Garagem: %d",c);
	}
	if(c == -1) return SCM(playerid, COLOR_LIGHTRED, "ERRO: Você não pode usar este comando aqui.");


    Dialog_Show(playerid, DIALOG_F_MOVEIS5, DIALOG_STYLE_LIST, strCasa, "Textura Original\nBasico\nFiguras\nChãos\nOutros\nPatern\nMadeira\nParedes\nCarros\nPortas", "Selecionar", "Fechar");
	return 1;
}

Dialog:DIALOG_F_MOVEIS5(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;
	else
	{
     	new FurniID = VendoFurniList[playerid][0];
	    Movel_DialogTexturas(playerid, FurniID, listitem);
	}
	return 1;
}

stock ShowTextureMenu(playerid, categoria)
{
    new dialog_string[2600];
    for(new i = 0; i < sizeof(Texturas_ParedesName); i++)
	{
	    VendoCategoriaTextura[playerid] = categoria;
	    switch(categoria)
	    {
	        case 1: {
	            if(i < sizeof(Texturas_BasicosName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_BasicosName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_BasicosName[i]);
        		}
			}
	        case 2: {
	            if(i < sizeof(Texturas_FigurasName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_FigurasName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_FigurasName[i]);
				}
			}
			case 3: {
			    if(i < sizeof(Texturas_ChaosName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_ChaosName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_ChaosName[i]);
				}
			}
			case 4: {
			    if(i < sizeof(Texturas_OutrosName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_OutrosName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_OutrosName[i]);
				}
			}
			case 5: {
			    if(i < sizeof(Texturas_PaternName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_PaternName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_PaternName[i]);
				}
			}
			case 6: {
			    if(i < sizeof(Texturas_MadeirasName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_MadeirasName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_MadeirasName[i]);
				}
			}
			case 7: {
			    if(i < sizeof(Texturas_PortasName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_PortasName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_PortasName[i]);
				}
			}
	        case 8: {
	            if(i < sizeof(Texturas_ParedesName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_ParedesName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_ParedesName[i]);
				}
			}
			case 9: {
			    if(i < sizeof(Texturas_CarrosName)){
        			if(!i) format(dialog_string, sizeof(dialog_string), Texturas_CarrosName[i]);
        			else format(dialog_string, sizeof(dialog_string), "%s\n%s", dialog_string, Texturas_CarrosName[i]);
                }
			}
		}
		Dialog_Show(playerid, Dialog_SetTexture, DIALOG_STYLE_LIST, "Alterar Textura", dialog_string, "Select", "Cancel");
    }
    return 1;
}

Dialog:Dialog_SetTexture(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    new FurniID = VendoFurniList[playerid][0],
	        categoria = VendoCategoriaTextura[playerid];

	    if(TexturaEdit[playerid] == 1)
	    {
	    	switch(categoria)
			{
			    case 1: { FurniInfo[FurniID][mTextura] = Texturas_BasicosID[listitem][0]; }
			    case 2: { FurniInfo[FurniID][mTextura] = Texturas_FigurasID[listitem][0]; }
			    case 3: { FurniInfo[FurniID][mTextura] = Texturas_ChaosID[listitem][0]; }
			    case 4: { FurniInfo[FurniID][mTextura] = Texturas_OutrosID[listitem][0]; }
			    case 5: { FurniInfo[FurniID][mTextura] = Texturas_PaternID[listitem][0]; }
			    case 6: { FurniInfo[FurniID][mTextura] = Texturas_MadeirasID[listitem][0]; }
			    case 7: { FurniInfo[FurniID][mTextura] = Texturas_PortasID[listitem][0]; }
				case 8: { FurniInfo[FurniID][mTextura] = Texturas_ParedesID[listitem][0]; }
				case 9: { FurniInfo[FurniID][mTextura] = Texturas_CarrosID[listitem][0]; }
			}
		}
		else
		{
	    	switch(categoria)
			{
			    case 1: { FurniInfo[FurniID][mIndex] = Texturas_BasicosID[listitem][0]; }
			    case 2: { FurniInfo[FurniID][mIndex] = Texturas_FigurasID[listitem][0]; }
			    case 3: { FurniInfo[FurniID][mIndex] = Texturas_ChaosID[listitem][0]; }
			    case 4: { FurniInfo[FurniID][mIndex] = Texturas_OutrosID[listitem][0]; }
			    case 5: { FurniInfo[FurniID][mIndex] = Texturas_PaternID[listitem][0]; }
			    case 6: { FurniInfo[FurniID][mIndex] = Texturas_MadeirasID[listitem][0]; }
			    case 7: { FurniInfo[FurniID][mIndex] = Texturas_PortasID[listitem][0]; }
				case 8: { FurniInfo[FurniID][mIndex] = Texturas_ParedesID[listitem][0]; }
				case 9: { FurniInfo[FurniID][mIndex] = Texturas_CarrosID[listitem][0]; }
			}
		}

   		Movel_Refresh(playerid, FurniID);
 	}
	return 1;
}
//==============================================================================
Movel_AplicarTextura(movelid)
{
    if (movelid != -1 && FurniInfo[movelid][mCriado])
	{
    	switch(FurniInfo[movelid][mTextura])
		{
      		case 0: {}
		    case 5: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 16150,	"ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
		    case 6: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 16150, "ufo_bar", "black32", 0xFFFFFFFF);
            case 7: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 1675, "wshxrefhse", "duskyblue_128", 0xFFFFFFFF);

		    case 20: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5134, "wasteland_las2", "mural05_LA", 0xFFFFFFFF);
		    case 21: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 18200, "w_town2cs_t", "Bow_door_graffiti_128", 0xFFFFFFFF);
		    case 22: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 2811, "gb_ornaments01", "GB_photo01", 0xFFFFFFFF);
		    case 23: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15054, "savesfmid", "cspornmag", 0xFFFFFFFF);
		    case 24: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15042, "svsfsm", "mural07_LA", 0xFFFFFFFF);
		    case 25: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15042, "svsfsm", "GB_rapposter01", 0xFFFFFFFF);
		    case 26: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15042, "svsfsm", "GB_rapposter03", 0xFFFFFFFF);
		    case 27: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15042, "svsfsm", "GB_canvas18", 0xFFFFFFFF);
		    case 28: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 15042, "svsfsm", "GB_canvas17", 0xFFFFFFFF);
		    case 29: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5422, "idlewood6_lae", "heat_04", 0xFFFFFFFF);
		    case 30: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5422, "idlewood6_lae", "homies_1", 0xFFFFFFFF);
		    case 31: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5474, "idlewood46_lae", "ads003 copy", 0xFFFFFFFF);
		    case 32: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12854, "cunte_gas01", "starspangban1_256", 0xFFFFFFFF);
		    case 33: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "lw_pistol_128", 0);
		    case 34: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14860, "gf1", "mp_apt1_pos4", 0);

		    case 40: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10754, "traindocks_sfse",	"dt_bmx_grass", 0xFFFFFFFF);
		    case 41: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10931, "traingen_sfse", "desgreengrass", 0xFFFFFFFF);
		    case 42: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8850, "vgeretl1grnd",	"ahoodfence2", 0xFFFFFFFF);
		    case 43: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 16150, "ufo_bar", "offwhitebrix", 0xFFFFFFFF);
		    case 44: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 16150, "ufo_bar", "dinerfloor01_128", 0xFFFFFFFF);
		    case 45: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 3980, "cityhall_lan", "man_cellarfloor128", 0xFFFFFFFF);
		    case 46: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);
		    case 47: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8531, "officeground", "parking2plain", 0xFFFFFFFF);

		    case 60: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 3947, "rczero_track", "waterclear256", 0xFFFFFFFF);
		    case 61: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5722, "sunrise01_lawn", "plainglass", 0xFFFFFFFF);
		    case 62: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5117, "traintrack_las2", "metpat64", 0xFFFFFFFF);
	     	case 63: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 4877, "downtown1_las", "GB_nastybar14", 0xFFFFFFFF);

		    case 80: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
		    case 81: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 4821, "union_las", "ws_carparkwall2", 0xFFFFFFFF);

		    case 100: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 16150, "ufo_bar", "sa_wood07_128", 0xFFFFFFFF);
		    case 101: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13002, "sw_smlfarm", "des_ghotwood1", 0xFFFFFFFF);
		    case 102: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12911, "sw_farm1", "boardwalk_la", 0xFFFFFFFF);
			//Paredes
		    case 130: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14526, "sweetsmain", "ab_kitchunit2", 0xFFFFFFFF);
		    case 131: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14526, "sweetsmain", "GB_Pan01", 0xFFFFFFFF);
		    case 132: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14471, "carls_kit1", "wall6", 0xFFFFFFFF);
		    case 133: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14471, "carls_kit1", "wall7", 0xFFFFFFFF);
		    case 134: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14471, "carls_kit1", "wall3", 0xFFFFFFFF);
		    case 135: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14746, "rylounge", "ab_wall3", 0xFFFFFFFF);
		    case 136: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14444, "carter_block_2", "mp_carter_wallpaper", 0xFFFFFFFF);
		    case 137: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5422, "idlewood6_lae", "crakwall1_LAe2", 0xFFFFFFFF);
		    case 138: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5418, "idlewood3_lae", "ws_sandstone2", 0xFFFFFFFF);
		    case 139: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13813, "vinewood01_lahills", "des_ranchwall1", 0xFFFFFFFF);
            case 140: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10789, "xenon_sfse", "corugwall2-1", 0xFFFFFFFF);
            case 141: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5174, "warehus_las2", "newall1-1128", 0xFFFFFFFF);
            case 142: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0xFFFFFFFF);
            case 143: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8503, "vgs_shop5", "vegaspawnwall02_128", 0xFFFFFFFF);
            case 144: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8849, "vgeretail1", "alleywallyell", 0xFFFFFFFF);
            case 145: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8565, "vgsebuild01", "ws_stonewall", 0xFFFFFFFF);
            case 146: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8567, "vgsebuild02", "newall11-1", 0xFFFFFFFF);
            case 147: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
            case 148: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8390, "vegasemulticar", "Bow_sub_walltiles", 0xFFFFFFFF);
            case 149: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 3759, "venchouse_lax", "bluapartwall1_256", 0xFFFFFFFF);

		    case 150: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10249, "ottos2_sfw", "ottos_pics_sfe", 0);
		    case 151: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "Auto_windsor", 0);
		    case 152: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "Auto_Slamvan2", 0);
		    case 153: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "Auto_monstera", 0);
		    case 154: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "Auto_hustler", 0);
		    case 155: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 14530, "estate2", "Auto_feltzer", 0);

		    case 220: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5150, "wiresetc_las2", "cleargraf02_LA", 0xFFFFFFFF);
		    case 221: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8399, "vgs_shops", "vegasclub01_128", 0xFFFFFFFF);
		    case 222: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8399, "vgs_shops", "vegasclub02_128", 0xFFFFFFFF);
		    case 223: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8463, "vgseland", "triadcarpet", 0xFFFFFFFF);
		    case 224: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 9184, "vgebillboards", "base5_1", 0xFFFFFFFF);
		    case 225: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 1583, "targets", "target3", 0xFFFFFFFF);
		    case 226: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 1583, "targets", "target4", 0xFFFFFFFF);
      		case 227: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6357, "sunstrans_law2", "recshop02_LA", 0xFFFFFFFF);
      		
      		//Paredes Continuação
      		case 250: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 3167, "trailers", "trail_wall4", 0xFFFFFFFF);
      		case 251: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12925, "sw_sheds", "sw_shedwall03", 0xFFFFFFFF);
      		case 252: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13015, "sw_genstore", "sw_wallbrick_03", 0xFFFFFFFF);
      		case 253: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12983, "sw_med1", "ws_carparkwall1", 0xFFFFFFFF);
      		case 254: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12979, "sw_block9", "newall10", 0xFFFFFFFF);
      		case 255: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);
      		case 256: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12862, "sw_block03", "sw_wall02", 0xFFFFFFFF);
      		case 257: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12862, "sw_block03", "sw_woodwall1", 0xFFFFFFFF);
      		case 258: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 12862, "sw_block03", "sw_woodwall2", 0xFFFFFFFF);
      		case 259: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5765, "sunsetbittyu", "lawshopwall1", 0xFFFFFFFF);
      		case 260: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5870, "sunst18_lawn", "tiledwall01_LA", 0xFFFFFFFF);
      		case 261: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 13012, "sw_apartflat5", "des_donutwall", 0xFFFFFFFF);
      		case 262: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6354, "sunset03_law2", "comptwall33", 0xFFFFFFFF);
      		case 263: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6354, "sunset03_law2", "comptwall36", 0xFFFFFFFF);
      		case 264: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6328, "sunset04_law2", "LAbluewall", 0xFFFFFFFF);
      		case 265: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 6341, "rodeo03_law2", "poundwall1_sfe", 0xFFFFFFFF);
      		case 266: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10621, "pinkcarpark_sfs", "ws_pink_wall1", 0xFFFFFFFF);
      		case 267: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 17925, "lae2fake_int", "burglry_wall4", 0xFFFFFFFF);
      		case 268: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5474, "idlewood46_lae", "decoacwallbtmb21_256", 0xFFFFFFFF);
      		case 269: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10447, "hashupass_sfs", "Bow_sub_wallGrime", 0xFFFFFFFF);
      		case 270: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 5708, "hospital_lawn", "Bow_Warehousewall", 0xFFFFFFFF);
      		case 271: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 4020, "fighot", "sl_lavicdtwall1", 0xFFFFFFFF);
      		case 272: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8565, "vgsebuild01", "newall1-3seamless", 0xFFFFFFFF);
      		case 273: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 10041, "archybuild10", "rooftop_gz3", 0xFFFFFFFF);
      		
      		//Portas
      		case 300: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 1675, "wshxrefhse", "decodoor5256", 0xFFFFFFFF);
      		case 301: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 18200, "w_town2cs_t", "Bow_door_graffiti_128", 0xFFFFFFFF);
      		case 302: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8412, "wddngchpl", "vegdoor1_int", 0xFFFFFFFF);
      		case 303: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8675, "wddngchpl02", "wddngchapeldoor01_128", 0xFFFFFFFF);
      		case 304: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 8399, "vgs_shops", "vgsclubdoor01_128", 0xFFFFFFFF);
      		case 305: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 0, 9495, "vict_sfw", "gz_vicdoor2", 0xFFFFFFFF);
		    default: {}
		}
  		switch(FurniInfo[movelid][mIndex])
  		{
  		    case 0: {}
		    case 5: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 16150,	"ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
		    case 6: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 16150, "ufo_bar", "black32", 0xFFFFFFFF);
            case 7: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 1675, "wshxrefhse", "duskyblue_128", 0xFFFFFFFF);

		    case 20: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5134, "wasteland_las2", "mural05_LA", 0xFFFFFFFF);
		    case 21: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 18200, "w_town2cs_t", "Bow_door_graffiti_128", 0xFFFFFFFF);
		    case 22: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 2811, "gb_ornaments01", "GB_photo01", 0xFFFFFFFF);
		    case 23: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15054, "savesfmid", "cspornmag", 0xFFFFFFFF);
		    case 24: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15042, "svsfsm", "mural07_LA", 0xFFFFFFFF);
		    case 25: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15042, "svsfsm", "GB_rapposter01", 0xFFFFFFFF);
		    case 26: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15042, "svsfsm", "GB_rapposter03", 0xFFFFFFFF);
		    case 27: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15042, "svsfsm", "GB_canvas18", 0xFFFFFFFF);
		    case 28: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 15042, "svsfsm", "GB_canvas17", 0xFFFFFFFF);
		    case 29: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5422, "idlewood6_lae", "heat_04", 0xFFFFFFFF);
		    case 30: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5422, "idlewood6_lae", "homies_1", 0xFFFFFFFF);
		    case 31: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5474, "idlewood46_lae", "ads003 copy", 0xFFFFFFFF);
		    case 32: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12854, "cunte_gas01", "starspangban1_256", 0xFFFFFFFF);
		    case 33: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "lw_pistol_128", 0);
		    case 34: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14860, "gf1", "mp_apt1_pos4", 0);

		    case 40: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10754, "traindocks_sfse",	"dt_bmx_grass", 0xFFFFFFFF);
		    case 41: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10931, "traingen_sfse", "desgreengrass", 0xFFFFFFFF);
		    case 42: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8850, "vgeretl1grnd",	"ahoodfence2", 0xFFFFFFFF);
		    case 43: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 16150, "ufo_bar", "offwhitebrix", 0xFFFFFFFF);
		    case 44: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 16150, "ufo_bar", "dinerfloor01_128", 0xFFFFFFFF);
		    case 45: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 3980, "cityhall_lan", "man_cellarfloor128", 0xFFFFFFFF);
		    case 46: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);
            case 47: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8531, "officeground", "parking2plain", 0xFFFFFFFF);
            
		    case 60: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 3947, "rczero_track", "waterclear256", 0xFFFFFFFF);
		    case 61: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5722, "sunrise01_lawn", "plainglass", 0xFFFFFFFF);
		    case 62: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5117, "traintrack_las2", "metpat64", 0xFFFFFFFF);

		    case 80: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
		    case 81: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 4821, "union_las", "ws_carparkwall2", 0xFFFFFFFF);

		    case 100: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 16150, "ufo_bar", "sa_wood07_128", 0xFFFFFFFF);
		    case 101: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13002, "sw_smlfarm", "des_ghotwood1", 0xFFFFFFFF);
		    case 102: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12911, "sw_farm1", "boardwalk_la", 0xFFFFFFFF);

		    case 130: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14526, "sweetsmain", "ab_kitchunit2", 0xFFFFFFFF);
		    case 131: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14526, "sweetsmain", "GB_Pan01", 0xFFFFFFFF);
		    case 132: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14471, "carls_kit1", "wall6", 0xFFFFFFFF);
		    case 133: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14471, "carls_kit1", "wall7", 0xFFFFFFFF);
		    case 134: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14471, "carls_kit1", "wall3", 0xFFFFFFFF);
		    case 135: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14746, "rylounge", "ab_wall3", 0xFFFFFFFF);
		    case 136: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14444, "carter_block_2", "mp_carter_wallpaper", 0xFFFFFFFF);
		    case 137: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5422, "idlewood6_lae", "crakwall1_LAe2", 0xFFFFFFFF);
		    case 138: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5418, "idlewood3_lae", "ws_sandstone2", 0xFFFFFFFF);
		    case 139: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13813, "vinewood01_lahills", "des_ranchwall1", 0xFFFFFFFF);
		    case 140: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10789, "xenon_sfse", "corugwall2-1", 0xFFFFFFFF);
            case 141: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5174, "warehus_las2", "newall1-1128", 0xFFFFFFFF);
            case 142: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8678, "wddngchplgrnd01", "vgschapelwall01_128", 0xFFFFFFFF);
            case 143: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8503, "vgs_shop5", "vegaspawnwall02_128", 0xFFFFFFFF);
            case 144: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8849, "vgeretail1", "alleywallyell", 0xFFFFFFFF);
            case 145: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8565, "vgsebuild01", "ws_stonewall", 0xFFFFFFFF);
            case 146: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8567, "vgsebuild02", "newall11-1", 0xFFFFFFFF);
            case 147: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
            case 148: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8390, "vegasemulticar", "Bow_sub_walltiles", 0xFFFFFFFF);
            case 149: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 3759, "venchouse_lax", "bluapartwall1_256", 0xFFFFFFFF);

		    case 150: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10249, "ottos2_sfw", "ottos_pics_sfe", 0xFFFFFFFF);
		    case 151: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "Auto_windsor", 0xFFFFFFFF);
		    case 152: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "Auto_Slamvan2", 0xFFFFFFFF);
		    case 153: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "Auto_monstera", 0xFFFFFFFF);
		    case 154: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "Auto_hustler", 0xFFFFFFFF);
		    case 155: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 14530, "estate2", "Auto_feltzer", 0xFFFFFFFF);

		    case 220: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5150, "wiresetc_las2", "cleargraf02_LA", 0xFFFFFFFF);
		    case 221: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8399, "vgs_shops", "vegasclub01_128", 0xFFFFFFFF);
		    case 222: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8399, "vgs_shops", "vegasclub02_128", 0xFFFFFFFF);
		    case 223: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8463, "vgseland", "triadcarpet", 0xFFFFFFFF);
		    case 224: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 9184, "vgebillboards", "base5_1", 0xFFFFFFFF);
		    case 225: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 1583, "targets", "target3", 0xFFFFFFFF);
		    case 226: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 1583, "targets", "target4", 0xFFFFFFFF);
		    case 227: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6357, "sunstrans_law2", "recshop02_LA", 0xFFFFFFFF);
		    
		    //Paredes Continuação
      		case 250: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 3167, "trailers", "trail_wall4", 0xFFFFFFFF);
      		case 251: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12925, "sw_sheds", "sw_shedwall03", 0xFFFFFFFF);
      		case 252: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13015, "sw_genstore", "sw_wallbrick_03", 0xFFFFFFFF);
      		case 253: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12983, "sw_med1", "ws_carparkwall1", 0xFFFFFFFF);
      		case 254: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12979, "sw_block9", "newall10", 0xFFFFFFFF);
      		case 255: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13007, "sw_bankint", "bank_wall1", 0xFFFFFFFF);
      		case 256: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12862, "sw_block03", "sw_wall02", 0xFFFFFFFF);
      		case 257: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12862, "sw_block03", "sw_woodwall1", 0xFFFFFFFF);
      		case 258: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 12862, "sw_block03", "sw_woodwall2", 0xFFFFFFFF);
      		case 259: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5765, "sunsetbittyu", "lawshopwall1", 0xFFFFFFFF);
      		case 260: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5870, "sunst18_lawn", "tiledwall01_LA", 0xFFFFFFFF);
      		case 261: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 13012, "sw_apartflat5", "des_donutwall", 0xFFFFFFFF);
      		case 262: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6354, "sunset03_law2", "comptwall33", 0xFFFFFFFF);
      		case 263: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6354, "sunset03_law2", "comptwall36", 0xFFFFFFFF);
      		case 264: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6328, "sunset04_law2", "LAbluewall", 0xFFFFFFFF);
      		case 265: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 6341, "rodeo03_law2", "poundwall1_sfe", 0xFFFFFFFF);
      		case 266: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10621, "pinkcarpark_sfs", "ws_pink_wall1", 0xFFFFFFFF);
      		case 267: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 17925, "lae2fake_int", "burglry_wall4", 0xFFFFFFFF);
      		case 268: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5474, "idlewood46_lae", "decoacwallbtmb21_256", 0xFFFFFFFF);
      		case 269: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10447, "hashupass_sfs", "Bow_sub_wallGrime", 0xFFFFFFFF);
      		case 270: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 5708, "hospital_lawn", "Bow_Warehousewall", 0xFFFFFFFF);
      		case 271: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 4020, "fighot", "sl_lavicdtwall1", 0xFFFFFFFF);
   			case 272: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8565, "vgsebuild01", "newall1-3seamless", 0xFFFFFFFF);
   			case 273: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 10041, "archybuild10", "rooftop_gz3", 0xFFFFFFFF);
   			
   			//Portas
   			case 300: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 1675, "wshxrefhse", "decodoor5256", 0xFFFFFFFF);
      		case 301: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 18200, "w_town2cs_t", "Bow_door_graffiti_128", 0xFFFFFFFF);
      		case 302: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8412, "wddngchpl", "vegdoor1_int", 0xFFFFFFFF);
      		case 303: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8675, "wddngchpl02", "wddngchapeldoor01_128", 0xFFFFFFFF);
      		case 304: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 8399, "vgs_shops", "vgsclubdoor01_128", 0xFFFFFFFF);
      		case 305: SetDynamicObjectMaterial(FurniInfo[movelid][mObjeto], 1, 9495, "vict_sfw", "gz_vicdoor2", 0xFFFFFFFF);
		    default: {}
  		}
	}
	return 1;
}
