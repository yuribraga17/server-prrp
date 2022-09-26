forward MostrarCavalos();
forward HorseStartHideTimer();
forward DevolverDinheiroAposta(playerid);
forward DestruirCavalos();
forward AtualizarCavalosPos();
forward HorseStartTimer();
forward Iniciar_HorseBetSys();
forward SortearCavalosNovaCorrida();
forward PontuarCavaloCampeao(horseWon);
forward IniciarCavalos();
forward SalvarCavalo(horseid);
forward IsPlayerInBetHouse(playerid);
forward IsPlayerInBetPoint(playerid);
//Contadores / Tempos
forward TimerSegundos();
forward MinuteTimer();
forward Horse_OnGameModeExit();
forward Horse_OnPlayerConnect(playerid);
forward Horse_OnPlayerDisconnect(playerid);

new Text:Horse1, Text:Horse2, Text:Horse3, Text:Horse4, Text:Horse5, Text:BG1, Text:BG2, Text:Start, Text:Finish, Text:Start2,
	Text:Finish2, HorseCD, Text:CDTextDraw, Text:HorseNum1, Text:HorseNum2, Text:HorseNum3, Text:HorseNum4, Text:HorseNum5, HorseAnimCount;

new Float:HorsePosX1, Float:HorsePosX2, Float:HorsePosX3, Float:HorsePosX4, Float:HorsePosX5, HorseStop;
new MoneyBet[MAX_PLAYERS],
	BetOnHorse[MAX_PLAYERS],
	RaceStarted,
	Watching[MAX_PLAYERS],
	ApostandoNoCavalo[MAX_PLAYERS];

new TempoAteACorrida = 0,
    AvisouCorrida = 0;

#define ORANGE 0xF97804FF
#define ApostaMinima 50
#define ApostaMaxima 2000
#define MaxCavalos  20

#define TempoParaNovaCorrida 60

#define Cavalo1_Pos     200
#define Cavalo1N_Pos    Cavalo1_Pos + 4

#define Cavalo2_Pos     Cavalo1_Pos + 30
#define Cavalo2N_Pos    Cavalo2_Pos + 4

#define Cavalo3_Pos     Cavalo2_Pos + 30
#define Cavalo3N_Pos    Cavalo3_Pos + 4

#define Cavalo4_Pos     Cavalo3_Pos + 30
#define Cavalo4N_Pos    Cavalo4_Pos + 4

#define Cavalo5_Pos     Cavalo4_Pos + 30
#define Cavalo5N_Pos    Cavalo5_Pos + 4

enum cavalosData {
	SQLID,
	criado,
	horseNome[32],
	Float:horseChance,
	corridas,
	vitorias,
	derrotas,
	rateio,
	naCorrida
};
new Cavalos[MaxCavalos][cavalosData];

new JockeyClub_Race = 0;

public Horse_OnPlayerConnect(playerid)
{
	Watching[playerid] = 0;
	return 1;
}

public Horse_OnPlayerDisconnect(playerid)
{
	if(MoneyBet[playerid] > 0) DevolverDinheiroAposta(playerid);

	MoneyBet[playerid] = 0;
	BetOnHorse[playerid] = 0;
	Watching[playerid] = 0;
	return 1;
}

public Horse_OnGameModeExit()
{
    TextDrawDestroy(BG2);
    TextDrawDestroy(BG1);
    TextDrawDestroy(Start2);
    TextDrawDestroy(Finish2);
    TextDrawDestroy(Horse1);
    TextDrawDestroy(Horse2);
	TextDrawDestroy(Horse3);
 	TextDrawDestroy(Horse4);
 	TextDrawDestroy(Horse5);
 	TextDrawDestroy(HorseNum1);
 	TextDrawDestroy(HorseNum2);
 	TextDrawDestroy(HorseNum3);
 	TextDrawDestroy(HorseNum4);
 	TextDrawDestroy(HorseNum5);
 	TextDrawDestroy(Start);
 	TextDrawDestroy(Finish);
	return 1;
}

public IniciarCavalos(){
	mysql_query(Pipeline, "SELECT * FROM `jockeyclub`");

    new rows = cache_num_rows();
    if(!rows)
        print("|-- Nenhum cavalo existente");
    else
    {
        new str[124];
        new cavalo_name[32];

        format(str, 124, "|-- Carregando cavalos: %d", rows);
		for(new i = 0; i < rows; i++)
		{
		    cache_get_field_content(i, "id", cavalo_name);
		    Cavalos[i][SQLID] = strval(cavalo_name);
		    cache_get_field_content(i, "nome", cavalo_name);
		    Cavalos[i][horseNome] = cavalo_name;
		    cache_get_field_content(i, "vitorias", cavalo_name);
		    Cavalos[i][vitorias] = strval(cavalo_name);
		    cache_get_field_content(i, "derrotas", cavalo_name);
		    Cavalos[i][derrotas] = strval(cavalo_name);
		    cache_get_field_content(i, "corridas", cavalo_name);
		    Cavalos[i][corridas] = strval(cavalo_name);

    		Cavalos[i][rateio] = 1;
    		Cavalos[i][criado] = 1;
    		Cavalos[i][naCorrida] = 0;

    	}
	}

	//Iniciar JockeyClub
	mysql_query(Pipeline, "SELECT corrida FROM `jockeyclub_info` WHERE `id`='1'");
 	new corrida_num[15];
 	
	cache_get_field_content(0, "corrida", corrida_num);
	JockeyClub_Race = strval(corrida_num);
	return 1;
}

public PontuarCavaloCampeao(horseWon){
    for(new i = 0; i < MaxCavalos; i++)
    {
        if(Cavalos[i][naCorrida] > 0)
		{
	    	if(Cavalos[i][naCorrida] == horseWon)
				Cavalos[i][vitorias]++;
			else
			    Cavalos[i][derrotas]++;

            Cavalos[i][corridas]++;
            SalvarCavalo(i);
		}
	}
	return 1;
}

public SalvarCavalo(horseid){
	new str[124];
	format(str, 124, "UPDATE `jockeyclub` SET `vitorias`='%d',`derrotas`='%d',`corridas`='%d' WHERE `id`='%d'",
			Cavalos[horseid][vitorias],
			Cavalos[horseid][derrotas],
			Cavalos[horseid][corridas],
			Cavalos[horseid][SQLID]);
    mysql_query(Pipeline, str);
}

stock RetornarCavaloID(horseWon){
	new retorno = -1;
    for(new i = 0; i < MaxCavalos; i++)
    {
        if(Cavalos[i][naCorrida] == horseWon)
		{
	    	retorno = i;
		}
	}
	return retorno;
}

public SortearCavalosNovaCorrida(){

	//Zerar Cavalos na corrida
	for(new i = 0; i < MaxCavalos; i++){
 		if(Cavalos[i][criado] == 1) {
		 	Cavalos[i][naCorrida] = 0;
	  	}
	}

	//Sortear os novos
	new cavalos_in_race = 0;
	new Float:chance_h = 0;

	while(cavalos_in_race < 5){
	    new rand = random(MaxCavalos-1);
		if(Cavalos[rand][criado] == 1){
		    if(Cavalos[rand][naCorrida] == 0){
                Cavalos[rand][naCorrida] = cavalos_in_race+1;

                if(Cavalos[rand][vitorias] > 0 && Cavalos[rand][corridas] > 0)
                {
					chance_h = ((float(Cavalos[rand][vitorias])/float(Cavalos[rand][corridas]))+0.20)*100;

					if(chance_h <= 10){
						Cavalos[rand][rateio] = random(5)+2;
						Cavalos[rand][horseChance] = 0;
					}
	                else if(chance_h > 10 && chance_h < 35){
						Cavalos[rand][rateio] = random(4)+2;
						Cavalos[rand][horseChance] = 0.02;
					}
	                else if(chance_h >= 35 && chance_h < 50){
						Cavalos[rand][rateio] = random(3)+2;
						Cavalos[rand][horseChance] = 0.05;
					}
	                else if(chance_h >= 50 && chance_h < 75){
						Cavalos[rand][rateio] = random(3);
						Cavalos[rand][horseChance] = 0.1;
					}
	                else if(chance_h >= 75){
						Cavalos[rand][rateio] = 2;
				     	Cavalos[rand][horseChance] = 0.13;
	     			}
				}
				if(Cavalos[rand][rateio] <= 1) Cavalos[rand][rateio] = 2;

                cavalos_in_race++;
		    }
		}
	}
	return 1;
}

forward SalvarJockeyInfo();
public SalvarJockeyInfo(){
	format(string, 124, "UPDATE `jockeyclub_info` SET `corrida`='%d' WHERE `id`='1'", JockeyClub_Race);
    mysql_query(Pipeline, string);
	return 1;
}

stock AbrirDialogApostas(playerid){
	new cav_s_1[32],
	    cav_s_2[32],
	    cav_s_3[32],
	    cav_s_4[32],
	    cav_s_5[32];

	for(new i = 0; i < MaxCavalos; i++){
	    if(Cavalos[i][criado] == 1){
		    switch(Cavalos[i][naCorrida])
   			{
   			    case 1:
   			    {
   			        format(cav_s_1, 32, "%s\t%d/1", Cavalos[i][horseNome], Cavalos[i][rateio]);
   			    }
   			    case 2:
   			    {
   			        format(cav_s_2, 32, "%s\t%d/1", Cavalos[i][horseNome], Cavalos[i][rateio]);
   			    }
   			    case 3:
   			    {
   			        format(cav_s_3, 32, "%s\t%d/1", Cavalos[i][horseNome], Cavalos[i][rateio]);
   			    }
   			    case 4:
   			    {
   			        format(cav_s_4, 32, "%s\t%d/1", Cavalos[i][horseNome], Cavalos[i][rateio]);
   			    }
   			    case 5:
   			    {
   			        format(cav_s_5, 32, "%s\t%d/1", Cavalos[i][horseNome], Cavalos[i][rateio]);
   			    }

		    }
		}
	}
	format(string, 256, "nº\tCavalo\tRateio\n1\t%s\n2\t%s\n3\t%s\n4\t%s\n5\t%s\n", cav_s_1, cav_s_2, cav_s_3, cav_s_4, cav_s_5);
	new str_tittle[32];
	format(str_tittle, 32, "Jockey Club - Corrida #%d", JockeyClub_Race);

    Dialog_Show(playerid, JockeyClub, DIALOG_STYLE_TABLIST_HEADERS, str_tittle, string, "Apostar", "Cancelar");
    return 1;
}

Dialog:JockeyClub(playerid, response, listitem, inputtext[])
{
    if(!IsPlayerInBetHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em uma casa de apostas.");
	if(!IsPlayerInBetPoint(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em um ponto de apostas, vá ao caixa.");
	if(RaceStarted == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: A corrida já começou... Espere a próxima para apostar.");

	new str2[64];

    if (response)
    {
        new cavalo_id = -1;
        for(new i = 0; i < MaxCavalos; i++){
            if(Cavalos[i][criado] == 1)
            {
		    	if(Cavalos[i][naCorrida] == (listitem+1)){
		    	    cavalo_id = i;
		    	    break;
		    	}
   			}
		}
		ApostandoNoCavalo[playerid] = cavalo_id;
        format(str2, 64, "Apostando no Cavalo %d: %s.\nO rateio está em %d/1.", (listitem+1), Cavalos[cavalo_id][horseNome], Cavalos[cavalo_id][rateio]);
        new str_tittle[32];
		format(str_tittle, 32, "Jockey Club SA - Corrida #%d", JockeyClub_Race);
        Dialog_Show(playerid, JockeyClub_2, DIALOG_STYLE_INPUT, str_tittle, str2, "Apostar", "Cancelar");
    }
    return 1;
}

Dialog:JockeyClub_2(playerid, response, listitem, inputtext[]){
    if (response)
    {
        if(!IsPlayerInBetHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em uma casa de apostas.");
		if(!IsPlayerInBetPoint(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em um ponto de apostas, vá ao caixa.");
        if (RaceStarted == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: A corrida já começou... Espere a próxima para apostar.");
        if (MoneyBet[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você já tem uma aposta ativa, aguarde o término da corrida.");

        if(strval(inputtext) < ApostaMinima || strval(inputtext) > ApostaMaxima)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Aposta mínima $50, aposta máxima $2000.");
		if(PlayerInfo[playerid][pGrana] < strval(inputtext))
		    return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não tem todo este dinheiro.");

		new str[124];
		format(str, 124, "[Jockey Club] {FFFFFF}Você apostou %d no %s, cavalo %d, %s.", strval(inputtext), Cavalos[ApostandoNoCavalo[playerid]][horseNome], Cavalos[ApostandoNoCavalo[playerid]][naCorrida], retornarCorCavalo(Cavalos[ApostandoNoCavalo[playerid]][naCorrida]));
		SendClientMessage(playerid, -1, str);
		PlayerInfo[playerid][pGrana] = PlayerInfo[playerid][pGrana]-strval(inputtext);
        MoneyBet[playerid] = strval(inputtext);
		BetOnHorse[playerid] = Cavalos[ApostandoNoCavalo[playerid]][naCorrida];
    }
    return 1;
}


COMMAND:apostar(playerid, params[])
{
	if(!IsPlayerInBetHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em uma casa de apostas.");
	if(!IsPlayerInBetPoint(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: Você não está em um ponto de apostas, vá ao caixa.");
    if (RaceStarted == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO: A corrida já começou... Espere a próxima para apostar.");
	AbrirDialogApostas(playerid);
	return 1;
}

stock retornarCorCavalo(horseid){
	new strcolor[12];
	switch(horseid)
	{
	    case 1: format(strcolor, 12, "Azul");
	    case 2: format(strcolor, 12, "Vermelho");
	    case 3: format(strcolor, 12, "Amarelo");
	    case 4: format(strcolor, 12, "Roxo");
	    case 5: format(strcolor, 12, "Verde");
	}
	return strcolor;
}

stock HorseInfo(Text:horseid)
{
    TextDrawFont(horseid, 4);
    TextDrawColor(horseid,0xFFFFFFFF);
    TextDrawTextSize(horseid,64,64);
}

stock HorseNumInfo(Text:horsenumid)
{
    TextDrawFont(horsenumid, 4);
    TextDrawColor(horsenumid,0xFFFFFFFF);
    TextDrawTextSize(horsenumid,32,32);
}

public Iniciar_HorseBetSys(){
	print("|-- Corrida de Cavalos: Carregado");
	SetTimer("TimerSegundos", 1000, 1);

	IniciarCavalos();

	RaceStarted = 0;

	TempoAteACorrida = TempoParaNovaCorrida;
    AvisouCorrida = 0;

	SetTimer("MinuteTimer", 60000, 1);

	BG2 = TextDrawCreate(0, 0, "LD_OTB:bckgrnd");
 	TextDrawFont(BG2, 4);
  	TextDrawColor(BG2,0xFFFFFFFF);
   	TextDrawTextSize(BG2,640,200);

	BG1 = TextDrawCreate(0, 0, "LD_OTB:trees");
 	TextDrawFont(BG1, 4);
  	TextDrawColor(BG1,0xFFFFFFFF);
   	TextDrawTextSize(BG1,640,480);

	Start2 = TextDrawCreate(-170, 145, "LD_OTB:pole2");
 	TextDrawFont(Start2, 4);
  	TextDrawColor(Start2,0xFFFFFFFF);
   	TextDrawTextSize(Start2,256,200);

	Finish2 = TextDrawCreate(365, 145, "LD_OTB:pole2");
 	TextDrawFont(Finish2, 4);
  	TextDrawColor(Finish2,0xFFFFFFFF);
   	TextDrawTextSize(Finish2,256,200);

	Horse1 = TextDrawCreate(0, Cavalo1_Pos, "LD_OTB:hrs8");
	HorseInfo(Horse1);
	HorsePosX1 = 0;

	Horse2 = TextDrawCreate(0, Cavalo2_Pos, "LD_OTB:hrs8");
	HorseInfo(Horse2);
	HorsePosX2 = 0;

	Horse3 = TextDrawCreate(0, Cavalo3_Pos, "LD_OTB:hrs8");
	HorseInfo(Horse3);
	HorsePosX3 = 0;

	Horse4 = TextDrawCreate(0, Cavalo4_Pos, "LD_OTB:hrs8");
	HorseInfo(Horse4);
	HorsePosX4 = 0;

	Horse5 = TextDrawCreate(0, Cavalo5_Pos, "LD_OTB:hrs8");
	HorseInfo(Horse5);
	HorsePosX5 = 0;

	HorseNum1 = TextDrawCreate(15, Cavalo1N_Pos, "LD_OTB2:Ric1");
	HorseNumInfo(HorseNum1);

	HorseNum2 = TextDrawCreate(15, Cavalo2N_Pos, "LD_OTB2:Ric2");
	HorseNumInfo(HorseNum2);

	HorseNum3 = TextDrawCreate(15, Cavalo3N_Pos, "LD_OTB2:Ric3");
	HorseNumInfo(HorseNum3);

	HorseNum4 = TextDrawCreate(15, Cavalo4N_Pos, "LD_OTB2:Ric4");
	HorseNumInfo(HorseNum4);

	HorseNum5 = TextDrawCreate(15, Cavalo5N_Pos, "LD_OTB2:Ric5");
	HorseNumInfo(HorseNum5);

	Start = TextDrawCreate(-170, 338, "LD_OTB:pole2");
	TextDrawFont(Start, 4);
	TextDrawColor(Start,0xFFFFFFFF);
	TextDrawTextSize(Start,256,200);

	Finish = TextDrawCreate(365, 338, "LD_OTB:pole2");
	TextDrawFont(Finish, 4);
	TextDrawColor(Finish,0xFFFFFFFF);
	TextDrawTextSize(Finish,256,200);

	CDTextDraw = TextDrawCreate(310,235,"3");
	TextDrawAlignment(CDTextDraw,0);
	TextDrawBackgroundColor(CDTextDraw,0x000000ff);
	TextDrawFont(CDTextDraw,2);
	TextDrawLetterSize(CDTextDraw,0.5,2);
	TextDrawColor(CDTextDraw,0x00ff0099);
	TextDrawSetOutline(CDTextDraw,1);
	TextDrawSetProportional(CDTextDraw,1);
	TextDrawSetShadow(CDTextDraw,1);

	SortearCavalosNovaCorrida();
}

public MinuteTimer()
{
	if(TempoAteACorrida > 0)
    	TempoAteACorrida--;

	return 1;
}

public TimerSegundos()
{
	if (TempoAteACorrida == 0) // Começar corrida
	{
	    TempoAteACorrida = -1;
	    AvisouCorrida = 0;

        for(new i = 0; i < MAX_PLAYERS; i++)
	 	{
	  		if (MoneyBet[i] > 0)
			{
				SendClientMessage(i, ORANGE, "[Jockey Club] {FFFFFF}A corrida de cavalos está começando, escreva /assistir para assistir!");
			}
		}
		MostrarCavalos();
		SetTimer("HorseStartTimer", 2000, 0);
		RaceStarted = 1;
	}
	else if (TempoAteACorrida == 1) // Preparar corrida
	{
		HorseCD = 3;
		HorseStop = 0;

		HorseAnimCount = 1;
		if(AvisouCorrida == 0)
		{
		    AvisouCorrida = 2;

			DestruirCavalos();

			Horse1 = TextDrawCreate(0, Cavalo1_Pos, "LD_OTB:hrs8");
			HorseInfo(Horse1);
			HorsePosX1 = 0;

			Horse2 = TextDrawCreate(0, Cavalo2_Pos, "LD_OTB:hrs8");
			HorseInfo(Horse2);
			HorsePosX2 = 0;

			Horse3 = TextDrawCreate(0, Cavalo3_Pos, "LD_OTB:hrs8");
			HorseInfo(Horse3);
			HorsePosX3 = 0;

			Horse4 = TextDrawCreate(0, Cavalo4_Pos, "LD_OTB:hrs8");
			HorseInfo(Horse4);
			HorsePosX4 = 0;

			Horse5 = TextDrawCreate(0, Cavalo5_Pos, "LD_OTB:hrs8");
			HorseInfo(Horse5);
			HorsePosX5 = 0;

			HorseNum1 = TextDrawCreate(15, Cavalo1N_Pos, "LD_OTB2:Ric1");
			HorseNumInfo(HorseNum1);

			HorseNum2 = TextDrawCreate(15, Cavalo2N_Pos, "LD_OTB2:Ric2");
			HorseNumInfo(HorseNum2);

			HorseNum3 = TextDrawCreate(15, Cavalo3N_Pos, "LD_OTB2:Ric3");
			HorseNumInfo(HorseNum3);

			HorseNum4 = TextDrawCreate(15, Cavalo4N_Pos, "LD_OTB2:Ric4");
			HorseNumInfo(HorseNum4);

			HorseNum5 = TextDrawCreate(15, Cavalo5N_Pos, "LD_OTB2:Ric5");
			HorseNumInfo(HorseNum5);

			MostrarCavalos();
		}
	}
}

public HorseStartTimer()
{
	if (HorseCD > 0)
	{
		format(string, sizeof(string), "%d",HorseCD);
		TextDrawColor(CDTextDraw,0xff0000ff);
		TextDrawSetString(CDTextDraw, string);
		HorseCD -= 1;
		SetTimer("HorseStartTimer", 2000, 0);
	}
	else
	{
		TextDrawColor(CDTextDraw,0x00ff00ff);
		TextDrawSetString(CDTextDraw, "Go!");
		for(new i = 0; i < MAX_PLAYERS; i++)
	    	if(IsPlayerInBetHouse(i) || Watching[i] == 1)
				PlayerPlaySound(i, 3201, 0.0, 0.0, 0.0);
				
		SetTimer("AtualizarCavalosPos", 100, 0);
	}
	
	for(new i = 0; i < MAX_PLAYERS; i++)
		if(MoneyBet[i] > 0)
		    if(Watching[i] == 1)
				TextDrawShowForPlayer(i,CDTextDraw);
			
	SetTimer("HorseStartHideTimer", 1000, 0);
	return 1;
}

COMMAND:assistir(playerid, params[])
{
	new pertoTv = 0;
    if(PlayerInfo[playerid][pEntrouCasa] != -1 || PlayerInfo[playerid][pEntrouGaragem] != -1 || PlayerInfo[playerid][pEntrouEmpresa] != -1 || PlayerInfo[playerid][pEntrouComplexo] != -1)
    {
    	for(new m; m < MAX_MOVEIS; m++)
    	{
   			if(FurniInfo[m][mCriado] != 0)
   			{
   				if(IsPlayerInRangeOfPoint(playerid, 10, FurniInfo[m][mX], FurniInfo[m][mY], FurniInfo[m][mZ]) && GetPlayerVirtualWorld(playerid) == FurniInfo[m][mWorld] && GetPlayerInterior(playerid) == FurniInfo[m][mInt])
   				{
		    		if(ObjetoETelevisao(FurniInfo[m][mModelo]))
		    		{
                        pertoTv = 1;
						break;
        			}
				}
			}
		}
	}
	
	if(!IsPlayerInBetHouse(playerid) && pertoTv == 0) return SendClientMessage(playerid, 0xFF0000FF, "[ERRO]: Você não está em uma casa de apostas ou perto de uma televisão.");
	new str[80];
	if (Watching[playerid] == 0)
	{
	    new horse_id = RetornarCavaloID(BetOnHorse[playerid]);
		format(string, sizeof(string), "[Jockey Club] {FFFFFF}Você apostou $%d no cavalo %d, %s. Rateio: %d/1.",MoneyBet[playerid],BetOnHorse[playerid], Cavalos[horse_id][horseNome], Cavalos[horse_id][rateio]);
		SendClientMessage(playerid, 0x00FFFFFF, string);
		
		TogglePlayerControllable(playerid, 0);
	 	TextDrawShowForPlayer(playerid,BG2);
	  	TextDrawShowForPlayer(playerid,BG1);
	   	TextDrawShowForPlayer(playerid,Start2);
	    TextDrawShowForPlayer(playerid,Finish2);
		TextDrawShowForPlayer(playerid, Horse1);
		TextDrawShowForPlayer(playerid,Horse2);
		TextDrawShowForPlayer(playerid,Horse3);
		TextDrawShowForPlayer(playerid,Horse4);
		TextDrawShowForPlayer(playerid,Horse5);
		TextDrawShowForPlayer(playerid,HorseNum1);
	 	TextDrawShowForPlayer(playerid,HorseNum2);
	  	TextDrawShowForPlayer(playerid,HorseNum3);
	   	TextDrawShowForPlayer(playerid,HorseNum4);
	   	TextDrawShowForPlayer(playerid,HorseNum5);
	    TextDrawShowForPlayer(playerid,Start);
	    TextDrawShowForPlayer(playerid,Finish);
	    Watching[playerid] = 1;
		if(RaceStarted != 1)
		{
	    	format(str, 80, "[Jockey Club] {FFFFFF}A próxima corrida começa em %d minutos.", TempoAteACorrida);
	  		SendClientMessage(playerid, 0xFFFF00FF, str);
	    }
  	}
  	else
  	{
  		TogglePlayerControllable(playerid, 1);
	    TextDrawHideForPlayer(playerid,BG2);
	    TextDrawHideForPlayer(playerid,BG1);
	    TextDrawHideForPlayer(playerid,Start2);
	    TextDrawHideForPlayer(playerid,Finish2);
		TextDrawHideForPlayer(playerid, Horse1);
	    TextDrawHideForPlayer(playerid,Horse2);
	    TextDrawHideForPlayer(playerid,Horse3);
	    TextDrawHideForPlayer(playerid,Horse4);
	    TextDrawHideForPlayer(playerid,Horse5);
	    TextDrawHideForPlayer(playerid,HorseNum1);
	    TextDrawHideForPlayer(playerid,HorseNum2);
	    TextDrawHideForPlayer(playerid,HorseNum3);
	    TextDrawHideForPlayer(playerid,HorseNum4);
     	TextDrawHideForPlayer(playerid,HorseNum5);
	    TextDrawHideForPlayer(playerid,Start);
	    TextDrawHideForPlayer(playerid,Finish);
		Watching[playerid] = 0;

	    SendClientMessage(playerid, 0x00FF00, "[Jockey Club] {FFFFFF}Você parou de assistir a corrida de cavalos.");
  	}
	return 1;
}

COMMAND:minhaaposta(playerid, params[])
{
	if (MoneyBet[playerid] > 0 && BetOnHorse[playerid] > 0)
	{
		new horse_id = RetornarCavaloID(BetOnHorse[playerid]);

		format(string, sizeof(string), "[Jockey Club] {FFFFFF}Você apostou $%d no cavalo %d, %s. Rateio: %d/1.",MoneyBet[playerid],BetOnHorse[playerid], Cavalos[horse_id][horseNome], Cavalos[horse_id][rateio]);
		SendClientMessage(playerid, 0x00FFFFFF, string);
	}
	return 1;
}

public AtualizarCavalosPos()
{
	new HorseWon;
 	format(string, sizeof(string), "LD_OTB:hrs%i", HorseAnimCount);
 	HorseAnimCount++;
 	if (HorseAnimCount == 9) HorseAnimCount = 1;

 	new Float:cancheHorse[5];
 	for(new i = 0; i < MaxCavalos; i++){
	    if(Cavalos[i][criado] == 1){
		    switch(Cavalos[i][naCorrida])
   			{
   			    case 1: cancheHorse[0] = Cavalos[i][horseChance];
   			    case 2: cancheHorse[1] = Cavalos[i][horseChance];
   			    case 3: cancheHorse[2] = Cavalos[i][horseChance];
   			    case 4: cancheHorse[3] = Cavalos[i][horseChance];
   			    case 5: cancheHorse[4] = Cavalos[i][horseChance];
			}
		}
  	}

  	HorsePosX1 = HorsePosX1 + (random(500) / 100) + 0.6 + cancheHorse[0];
  	HorsePosX2 = HorsePosX2 + (random(500) / 100) + 0.6 + cancheHorse[1];
  	HorsePosX3 = HorsePosX3 + (random(500) / 100) + 0.6 + cancheHorse[2];
  	HorsePosX4 = HorsePosX4 + (random(500) / 100) + 0.6 + cancheHorse[3];
  	HorsePosX5 = HorsePosX5 + (random(500) / 100) + 0.6 + cancheHorse[4];

  	DestruirCavalos();

    Horse1 = TextDrawCreate(HorsePosX1, Cavalo1_Pos, string);
    HorseInfo(Horse1);
    Horse2 = TextDrawCreate(HorsePosX2, Cavalo2_Pos, string);
    HorseInfo(Horse2);
    Horse3 = TextDrawCreate(HorsePosX3, Cavalo3_Pos, string);
    HorseInfo(Horse3);
    Horse4 = TextDrawCreate(HorsePosX4, Cavalo4_Pos, string);
    HorseInfo(Horse4);
    Horse5 = TextDrawCreate(HorsePosX5, Cavalo5_Pos, string);
    HorseInfo(Horse5);
    HorseNum1 = TextDrawCreate(HorsePosX1 + 15, Cavalo1N_Pos, "LD_OTB2:Ric1");
    HorseNumInfo(HorseNum1);
    HorseNum2 = TextDrawCreate(HorsePosX2 + 15, Cavalo2N_Pos, "LD_OTB2:Ric2");
    HorseNumInfo(HorseNum2);
    HorseNum3 = TextDrawCreate(HorsePosX3 + 15, Cavalo3N_Pos, "LD_OTB2:Ric3");
    HorseNumInfo(HorseNum3);
    HorseNum4 = TextDrawCreate(HorsePosX4 + 15, Cavalo4N_Pos, "LD_OTB2:Ric4");
    HorseNumInfo(HorseNum4);
    HorseNum5 = TextDrawCreate(HorsePosX5 + 15, Cavalo5N_Pos, "LD_OTB2:Ric5");
    HorseNumInfo(HorseNum5);

	MostrarCavalos();

	if (HorsePosX1 >= 560)
	{
  		HorseStop = 1;
		HorseWon = 1;
	}
	else if (HorsePosX2 >= 560)
	{
		HorseStop = 1;
		HorseWon = 2;
	}
	else if (HorsePosX3 >= 560)
	{
		HorseStop = 1;
		HorseWon = 3;
	}
	else if (HorsePosX4 >= 560)
	{
		HorseStop = 1;
		HorseWon = 4;
	}
	else if (HorsePosX5 >= 560)
	{
		HorseStop = 1;
		HorseWon = 5;
	}

	if (HorseStop == 0) SetTimer("AtualizarCavalosPos", 100, 0);
	else
 	{
 	    JockeyClub_Race++;
 	    PontuarCavaloCampeao(HorseWon);
		new horse_id = RetornarCavaloID(HorseWon);

        new str[124];
		for(new i = 0; i < MAX_PLAYERS; i++)
	 	{
	  		if (BetOnHorse[i] == HorseWon)
	  		{
	  		    format(str, 124, "[Jockey Club] {FFFFFF}%s foi o campeão, com o rateio de $%d para $1, você recebeu $%d.", Cavalos[horse_id][horseNome], Cavalos[horse_id][rateio], (MoneyBet[i]*Cavalos[horse_id][rateio]));
		        SendClientMessage(i, 0xFFFF00FF, str);
				PlayerInfo[i][pBanco] = PlayerInfo[i][pBanco]+(MoneyBet[i]*Cavalos[horse_id][rateio]);
			}
			else if (MoneyBet[i] != 0 && BetOnHorse[i] != HorseWon)
			{
				format(str, 78, "[Jockey Club] {FFFFFF}O %s foi o campeão!", Cavalos[horse_id][horseNome]);
				SendClientMessage(i, 0xFFFF00FF, str);
			}
            BetOnHorse[i] = 0;
            MoneyBet[i] = 0;
		}

		SortearCavalosNovaCorrida();
		TempoAteACorrida = TempoParaNovaCorrida;
		HorseStop = 1;
		RaceStarted = 0;

		SalvarJockeyInfo();
	}
}

public DestruirCavalos(){
    TextDrawDestroy(Horse1);
  	TextDrawDestroy(Horse2);
  	TextDrawDestroy(Horse3);
  	TextDrawDestroy(Horse4);
  	TextDrawDestroy(Horse5);
  	TextDrawDestroy(HorseNum1);
  	TextDrawDestroy(HorseNum2);
  	TextDrawDestroy(HorseNum3);
  	TextDrawDestroy(HorseNum4);
  	TextDrawDestroy(HorseNum5);
}

public MostrarCavalos(){
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
 	{
  		if (Watching[playerid] == 1)
    	{
			TextDrawShowForPlayer(playerid,Horse1);
			TextDrawShowForPlayer(playerid,Horse2);
			TextDrawShowForPlayer(playerid,Horse3);
			TextDrawShowForPlayer(playerid,Horse4);
			TextDrawShowForPlayer(playerid,Horse5);
			TextDrawShowForPlayer(playerid,HorseNum1);
			TextDrawShowForPlayer(playerid,HorseNum2);
			TextDrawShowForPlayer(playerid,HorseNum3);
			TextDrawShowForPlayer(playerid,HorseNum4);
			TextDrawShowForPlayer(playerid,HorseNum5);
	    }
	}
}

public HorseStartHideTimer(){
	TextDrawHideForAll(CDTextDraw);
}

public DevolverDinheiroAposta(playerid){

	PlayerInfo[playerid][pGrana] += MoneyBet[playerid];
	return 1;
}

public IsPlayerInBetPoint(playerid){

	if(IsPlayerInRangeOfPoint(playerid, 1.0, 833.5998,3.2805,1004.1797) || IsPlayerInRangeOfPoint(playerid, 1.0, 830.6833,-0.2773,1004.1797)
	|| IsPlayerInRangeOfPoint(playerid, 2.0, 822.0098,1.6496,1004.1797) || IsPlayerInRangeOfPoint(playerid, 2.0, 822.0102,4.9779,1004.1797))
	    return 1;
	return 0;
}

public IsPlayerInBetHouse(playerid){

	if(IsPlayerInRangeOfPoint(playerid, 30.0, 826.5333,4.1312,1004.1870)) return 1;
	return 0;
}
