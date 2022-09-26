
ALTCOMMAND:anim->animlist;
ALTCOMMAND:anims->animlist;
CMD:animlist(playerid, params[])
{
    new var;
	if (sscanf(params, "I(1)",var))
	{
	}
	else
	{
	    if(var == 1)
	    {
	        SendClientMessage(playerid, COLOR_LIGHTGREEN, "______________________Animações______________________");
			SendClientMessage(playerid, COLOR_ANIMS, "/camera /crack /handsup /urinar /tapabunda /bebado /cair /bar /baseball /sentar /bastao");
			SendClientMessage(playerid, COLOR_ANIMS, "/bravo /mirar /gsign /animgang /cpr /rir /crossarms /deitar /acenar /relaxar /cair /machucado");
			SendClientMessage(playerid, COLOR_ANIMS, "/levartapa /convidar1 /convidar2 /arranhar /bomba /vomitar /comer /chuteporta /animrevistar");
			SendClientMessage(playerid, COLOR_ANIMS, "/beber /negociar /chat /fucku /taichi /chorar /bracojanela /alongar /chant /ghand /cansado");
			SendClientMessage(playerid, COLOR_ANIMS, "/fumarnocarro /basquete /lancar /abrir /pcaixa /dcaixa /medo /fumar /spray /lean");
			SendClientMessage(playerid, COLOR_ANIMS, "/supino /dancar /rap /punheta /strip /sexy /bj /cotovelada /levantarguarda /gpunch");
			SendClientMessage(playerid, COLOR_ANIMS, "/airkick /gkick /dpunch /alevantar /animalgemar /rimando /eatsit /esquivar /segurar");
			SendClientMessage(playerid, COLOR_ANIMS, "/sinuca /gfunk /vadiar /box /revistacapo /observar /seguir /facepalm /cobrir ");
			SendClientMessage(playerid, COLOR_ANIMS, "/fixcar /lowrider /animgritar /puton /esquerda /direita /gwalk /andar /animcelular");
			SendClientMessage(playerid, 0xf0f8ffFF, "/maosfrente /maostras /sh ");
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "__________________________________________________________");
			return 1;
	    }
	    if(var == 2)
	    {
			return 1;
	    }
	    else if(var == 3)
	    {
			return 1;
	    }
	}
 	return 1;
}

COMMAND:maosfrente(playerid, params[])
{
	PlayerPlaySound(playerid, 1130, 0.0, 0.0, 10.0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return true;
}

COMMAND:maostras(playerid, params[])
{
	PlayerPlaySound(playerid, 1130, 0.0, 0.0, 10.0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
	return true;
}

COMMAND:sh(playerid, params[]) // sair do H dentro do veiculo
{
	ApplyAnimation(playerid, "ped", "CAR_sit", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

COMMAND:animcelular(playerid, params[])
{
 	if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:andar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gwalk [1-11]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
            case 4: ApplyAnimation(playerid,"FAT","FatWalk",4.1,1,1,1,1,1);
		    case 1: ApplyAnimation(playerid,"PED","WALK_civi",4.1,1,1,1,1,1);
		    case 2: ApplyAnimation(playerid,"PED","WALK_gang1",4.1,1,1,1,1,1);
		    case 3: ApplyAnimation(playerid,"PED","WALK_gang2",4.1,1,1,1,1,1);
		    case 5: ApplyAnimation(playerid,"PED","WALK_old",4.1,1,1,1,1,1);
		    case 6: ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,1);
		    case 7: ApplyAnimation(playerid,"PED","WOMAN_walkbusy",4.1,1,1,1,1,1);
		    case 8: ApplyAnimation(playerid,"PED","WOMAN_walknorm",4.1,1,1,1,1,1);
		    case 9: ApplyAnimation(playerid,"PED","WOMAN_walkpro",4.1,1,1,1,1,1);
		    case 10: ApplyAnimation(playerid,"PED","WOMAN_walksexy",4.1,1,1,1,1,1);
		    case 11: ApplyAnimation(playerid,"POOL","POOL_Walk",4.1,1,1,1,1,1);
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:animped(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /animped [1-255]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"PED","abseil",4.1,0,1,1,1,1);
	 	    case 2: ApplyAnimation(playerid,"PED","ARRESTgun",4.1,0,1,1,1,1);
            case 3: ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
			case 4: ApplyAnimation(playerid,"PED","BIKE_elbowL",4.1,0,1,1,1,1);
			case 5: ApplyAnimation(playerid,"PED","BIKE_elbowR",4.1,0,1,1,1,1);
			case 6: ApplyAnimation(playerid,"PED","BIKE_fallR",4.1,0,1,1,1,1);
			case 7: ApplyAnimation(playerid,"PED","BIKE_fall_off",4.1,0,1,1,1,1);
			case 8: ApplyAnimation(playerid,"PED","BIKE_pickupL",4.1,0,1,1,1,1);
			case 9: ApplyAnimation(playerid,"PED","BIKE_pickupR",4.1,0,1,1,1,1);
			case 10: ApplyAnimation(playerid,"PED","BIKE_pullupL",4.1,0,1,1,1,1);
			case 11: ApplyAnimation(playerid,"PED","BIKE_pullupR",4.1,0,1,1,1,1);
			case 12: ApplyAnimation(playerid,"PED","bomber",4.1,0,1,1,1,1);
			case 13: ApplyAnimation(playerid,"PED","CAR_alignHI_LHS",4.1,0,1,1,1,1);
			case 14: ApplyAnimation(playerid,"PED","CAR_alignHI_RHS",4.1,0,1,1,1,1);
			case 15: ApplyAnimation(playerid,"PED","CAR_align_LHS",4.1,0,1,1,1,1);
			case 16: ApplyAnimation(playerid,"PED","CAR_align_RHS",4.1,0,1,1,1,1);
			case 17: ApplyAnimation(playerid,"PED","CAR_closedoorL_LHS",4.1,0,1,1,1,1);
			case 18: ApplyAnimation(playerid,"PED","CAR_closedoorL_RHS",4.1,0,1,1,1,1);
			case 19: ApplyAnimation(playerid,"PED","CAR_closedoor_LHS",4.1,0,1,1,1,1);
			case 20: ApplyAnimation(playerid,"PED","CAR_closedoor_RHS",4.1,0,1,1,1,1);
			case 21: ApplyAnimation(playerid,"PED","CAR_close_LHS",4.1,0,1,1,1,1);
			case 22: ApplyAnimation(playerid,"PED","CAR_close_RHS",4.1,0,1,1,1,1);
			case 23: ApplyAnimation(playerid,"PED","CAR_crawloutRHS",4.1,0,1,1,1,1);
			case 24: ApplyAnimation(playerid,"PED","CAR_dead_LHS",4.1,0,1,1,1,1);
			case 25: ApplyAnimation(playerid,"PED","CAR_dead_RHS",4.1,0,1,1,1,1);
			case 26: ApplyAnimation(playerid,"PED","CAR_doorlocked_LHS",4.1,0,1,1,1,1);
			case 27: ApplyAnimation(playerid,"PED","CAR_doorlocked_RHS",4.1,0,1,1,1,1);
			case 28: ApplyAnimation(playerid,"PED","CAR_fallout_LHS",4.1,0,1,1,1,1);
			case 29: ApplyAnimation(playerid,"PED","CAR_fallout_RHS",4.1,0,1,1,1,1);
			case 30: ApplyAnimation(playerid,"PED","CAR_getinL_LHS",4.1,0,1,1,1,1);
			case 31: ApplyAnimation(playerid,"PED","CAR_getinL_RHS",4.1,0,1,1,1,1);
			case 32: ApplyAnimation(playerid,"PED","CAR_getin_LHS",4.1,0,1,1,1,1);
			case 33: ApplyAnimation(playerid,"PED","CAR_getin_RHS",4.1,0,1,1,1,1);
			case 34: ApplyAnimation(playerid,"PED","CAR_getoutL_LHS",4.1,0,1,1,1,1);
			case 35: ApplyAnimation(playerid,"PED","CAR_getoutL_RHS",4.1,0,1,1,1,1);
			case 36: ApplyAnimation(playerid,"PED","CAR_getout_LHS",4.1,0,1,1,1,1);
			case 37: ApplyAnimation(playerid,"PED","CAR_getout_RHS",4.1,0,1,1,1,1);
			case 38: ApplyAnimation(playerid,"PED","car_hookertalk",4.1,0,1,1,1,1);
			case 39: ApplyAnimation(playerid,"PED","CAR_jackedLHS",4.1,0,1,1,1,1);
			case 40: ApplyAnimation(playerid,"PED","CAR_jackedRHS",4.1,0,1,1,1,1);
			case 41: ApplyAnimation(playerid,"PED","CAR_jumpin_LHS",4.1,0,1,1,1,1);
			case 42: ApplyAnimation(playerid,"PED","CAR_LB",4.1,0,1,1,1,1);
			case 43: ApplyAnimation(playerid,"PED","CAR_LB_pro",4.1,0,1,1,1,1);
			case 44: ApplyAnimation(playerid,"PED","CAR_LB_weak",4.1,0,1,1,1,1);
			case 45: ApplyAnimation(playerid,"PED","CAR_LjackedLHS",4.1,0,1,1,1,1);
			case 46: ApplyAnimation(playerid,"PED","CAR_LjackedRHS",4.1,0,1,1,1,1);
			case 47: ApplyAnimation(playerid,"PED","CAR_Lshuffle_RHS",4.1,0,1,1,1,1);
			case 48: ApplyAnimation(playerid,"PED","CAR_Lsit",4.1,0,1,1,1,1);
			case 49: ApplyAnimation(playerid,"PED","CAR_open_LHS",4.1,0,1,1,1,1);
			case 50: ApplyAnimation(playerid,"PED","CAR_open_RHS",4.1,0,1,1,1,1);
			case 51: ApplyAnimation(playerid,"PED","CAR_pulloutL_LHS",4.1,0,1,1,1,1);
			case 52: ApplyAnimation(playerid,"PED","CAR_pulloutL_RHS",4.1,0,1,1,1,1);
			case 53: ApplyAnimation(playerid,"PED","CAR_pullout_LHS",4.1,0,1,1,1,1);
			case 54: ApplyAnimation(playerid,"PED","CAR_pullout_RHS",4.1,0,1,1,1,1);
			case 55: ApplyAnimation(playerid,"PED","CAR_Qjacked",4.1,0,1,1,1,1);
			case 56: ApplyAnimation(playerid,"PED","CAR_rolldoor",4.1,0,1,1,1,1);
			case 57: ApplyAnimation(playerid,"PED","CAR_rolldoorLO",4.1,0,1,1,1,1);
			case 58: ApplyAnimation(playerid,"PED","CAR_rollout_LHS",4.1,0,1,1,1,1);
			case 59: ApplyAnimation(playerid,"PED","CAR_rollout_RHS",4.1,0,1,1,1,1);
			case 60: ApplyAnimation(playerid,"PED","CAR_shuffle_RHS",4.1,0,1,1,1,1);
			case 61: ApplyAnimation(playerid,"PED","CAR_sit",4.1,0,1,1,1,1);
			case 62: ApplyAnimation(playerid,"PED","CAR_sitp",4.1,0,1,1,1,1);
			case 63: ApplyAnimation(playerid,"PED","CAR_sitpLO",4.1,0,1,1,1,1);
			case 64: ApplyAnimation(playerid,"PED","CAR_sit_pro",4.1,0,1,1,1,1);
			case 65: ApplyAnimation(playerid,"PED","CAR_sit_weak",4.1,0,1,1,1,1);
			case 66: ApplyAnimation(playerid,"PED","CAR_tune_radio",4.1,0,1,1,1,1);
			case 67: ApplyAnimation(playerid,"PED","CLIMB_idle",4.1,0,1,1,1,1);
			case 68: ApplyAnimation(playerid,"PED","CLIMB_jump",4.1,0,1,1,1,1);
			case 69: ApplyAnimation(playerid,"PED","CLIMB_jump2fall",4.1,0,1,1,1,1);
			case 70: ApplyAnimation(playerid,"PED","CLIMB_jump_B",4.1,0,1,1,1,1);
			case 71: ApplyAnimation(playerid,"PED","CLIMB_Pull",4.1,0,1,1,1,1);
			case 72: ApplyAnimation(playerid,"PED","CLIMB_Stand",4.1,0,1,1,1,1);
			case 73: ApplyAnimation(playerid,"PED","CLIMB_Stand_finish",4.1,0,1,1,1,1);
			case 74: ApplyAnimation(playerid,"PED","cower",4.1,0,1,1,1,1);
			case 75: ApplyAnimation(playerid,"PED","Crouch_Roll_L",4.1,0,1,1,1,1);
			case 76: ApplyAnimation(playerid,"PED","Crouch_Roll_R",4.1,0,1,1,1,1);
			case 77: ApplyAnimation(playerid,"PED","DAM_armL_frmBK",4.1,0,1,1,1,1);
			case 78: ApplyAnimation(playerid,"PED","DAM_armL_frmFT",4.1,0,1,1,1,1);
			case 79: ApplyAnimation(playerid,"PED","DAM_armL_frmLT",4.1,0,1,1,1,1);
			case 80: ApplyAnimation(playerid,"PED","DAM_armR_frmBK",4.1,0,1,1,1,1);
			case 81: ApplyAnimation(playerid,"PED","DAM_armR_frmFT",4.1,0,1,1,1,1);
			case 82: ApplyAnimation(playerid,"PED","DAM_armR_frmRT",4.1,0,1,1,1,1);
			case 83: ApplyAnimation(playerid,"PED","DAM_LegL_frmBK",4.1,0,1,1,1,1);
			case 84: ApplyAnimation(playerid,"PED","DAM_LegL_frmFT",4.1,0,1,1,1,1);
			case 85: ApplyAnimation(playerid,"PED","DAM_LegL_frmLT",4.1,0,1,1,1,1);
			case 86: ApplyAnimation(playerid,"PED","DAM_LegR_frmBK",4.1,0,1,1,1,1);
			case 87: ApplyAnimation(playerid,"PED","DAM_LegR_frmFT",4.1,0,1,1,1,1);
			case 88: ApplyAnimation(playerid,"PED","DAM_LegR_frmRT",4.1,0,1,1,1,1);
			case 89: ApplyAnimation(playerid,"PED","DAM_stomach_frmBK",4.1,0,1,1,1,1);
			case 90: ApplyAnimation(playerid,"PED","DAM_stomach_frmFT",4.1,0,1,1,1,1);
			case 91: ApplyAnimation(playerid,"PED","DAM_stomach_frmLT",4.1,0,1,1,1,1);
			case 92: ApplyAnimation(playerid,"PED","DAM_stomach_frmRT",4.1,0,1,1,1,1);
			case 93: ApplyAnimation(playerid,"PED","DOOR_LHinge_O",4.1,0,1,1,1,1);
			case 94: ApplyAnimation(playerid,"PED","DOOR_RHinge_O",4.1,0,1,1,1,1);
			case 95: ApplyAnimation(playerid,"PED","DrivebyL_L",4.1,0,1,1,1,1);
			case 96: ApplyAnimation(playerid,"PED","DrivebyL_R",4.1,0,1,1,1,1);
			case 97: ApplyAnimation(playerid,"PED","Driveby_L",4.1,0,1,1,1,1);
			case 98: ApplyAnimation(playerid,"PED","Driveby_R",4.1,0,1,1,1,1);
			case 99: ApplyAnimation(playerid,"PED","DRIVE_BOAT",4.1,0,1,1,1,1);
			case 100: ApplyAnimation(playerid,"PED","DRIVE_BOAT_back",4.1,0,1,1,1,1);
			case 101: ApplyAnimation(playerid,"PED","DRIVE_BOAT_L",4.1,0,1,1,1,1);
			case 102: ApplyAnimation(playerid,"PED","DRIVE_BOAT_R",4.1,0,1,1,1,1);
			case 103: ApplyAnimation(playerid,"PED","Drive_L",4.1,0,1,1,1,1);
			case 104: ApplyAnimation(playerid,"PED","Drive_LO_l",4.1,0,1,1,1,1);
			case 105: ApplyAnimation(playerid,"PED","Drive_LO_R",4.1,0,1,1,1,1);
			case 106: ApplyAnimation(playerid,"PED","Drive_L_pro",4.1,0,1,1,1,1);
			case 107: ApplyAnimation(playerid,"PED","Drive_L_pro_slow",4.1,0,1,1,1,1);
			case 108: ApplyAnimation(playerid,"PED","Drive_L_slow",4.1,0,1,1,1,1);
			case 109: ApplyAnimation(playerid,"PED","Drive_L_weak",4.1,0,1,1,1,1);
			case 110: ApplyAnimation(playerid,"PED","Drive_L_weak_slow",4.1,0,1,1,1,1);
			case 111: ApplyAnimation(playerid,"PED","Drive_R",4.1,0,1,1,1,1);
			case 112: ApplyAnimation(playerid,"PED","Drive_R_pro",4.1,0,1,1,1,1);
			case 113: ApplyAnimation(playerid,"PED","Drive_R_pro_slow",4.1,0,1,1,1,1);
			case 114: ApplyAnimation(playerid,"PED","Drive_R_slow",4.1,0,1,1,1,1);
			case 115: ApplyAnimation(playerid,"PED","Drive_R_weak",4.1,0,1,1,1,1);
			case 116: ApplyAnimation(playerid,"PED","Drive_R_weak_slow",4.1,0,1,1,1,1);
			case 117: ApplyAnimation(playerid,"PED","Drive_truck",4.1,0,1,1,1,1);
			case 118: ApplyAnimation(playerid,"PED","DRIVE_truck_back",4.1,0,1,1,1,1);
			case 119: ApplyAnimation(playerid,"PED","DRIVE_truck_L",4.1,0,1,1,1,1);
			case 120: ApplyAnimation(playerid,"PED","DRIVE_truck_R",4.1,0,1,1,1,1);
			case 121: ApplyAnimation(playerid,"PED","Drown",4.1,0,1,1,1,1);
			case 122: ApplyAnimation(playerid,"PED","DUCK_cower",4.1,0,1,1,1,1);
			case 123: ApplyAnimation(playerid,"PED","endchat_01",4.1,0,1,1,1,1);
			case 124: ApplyAnimation(playerid,"PED","endchat_02",4.1,0,1,1,1,1);
			case 125: ApplyAnimation(playerid,"PED","endchat_03",4.1,0,1,1,1,1);
			case 126: ApplyAnimation(playerid,"PED","EV_dive",4.1,0,1,1,1,1);
			case 127: ApplyAnimation(playerid,"PED","EV_step",4.1,0,1,1,1,1);
			case 128: ApplyAnimation(playerid,"PED","facanger",4.1,0,1,1,1,1);
			case 129: ApplyAnimation(playerid,"PED","facanger",4.1,0,1,1,1,1);
			case 130: ApplyAnimation(playerid,"PED","facgum",4.1,0,1,1,1,1);
			case 131: ApplyAnimation(playerid,"PED","facsurp",4.1,0,1,1,1,1);
			case 132: ApplyAnimation(playerid,"PED","facsurpm",4.1,0,1,1,1,1);
			case 133: ApplyAnimation(playerid,"PED","factalk",4.1,0,1,1,1,1);
			case 134: ApplyAnimation(playerid,"PED","facurios",4.1,0,1,1,1,1);
			case 135: ApplyAnimation(playerid,"PED","FALL_back",4.1,0,1,1,1,1);
			case 136: ApplyAnimation(playerid,"PED","FALL_collapse",4.1,0,1,1,1,1);
			case 137: ApplyAnimation(playerid,"PED","FALL_fall",4.1,0,1,1,1,1);
			case 138: ApplyAnimation(playerid,"PED","FALL_front",4.1,0,1,1,1,1);
			case 139: ApplyAnimation(playerid,"PED","FALL_glide",4.1,0,1,1,1,1);
			case 140: ApplyAnimation(playerid,"PED","FALL_land",4.1,0,1,1,1,1);
			case 141: ApplyAnimation(playerid,"PED","FALL_skyDive",4.1,0,1,1,1,1);
			case 142: ApplyAnimation(playerid,"PED","Fight2Idle",4.1,0,1,1,1,1);
			case 143: ApplyAnimation(playerid,"PED","FightA_1",4.1,0,1,1,1,1);
			case 144: ApplyAnimation(playerid,"PED","FightA_2",4.1,0,1,1,1,1);
			case 145: ApplyAnimation(playerid,"PED","FightA_3",4.1,0,1,1,1,1);
			case 146: ApplyAnimation(playerid,"PED","FightA_block",4.1,0,1,1,1,1);
			case 147: ApplyAnimation(playerid,"PED","FightA_G",4.1,0,1,1,1,1);
			case 148: ApplyAnimation(playerid,"PED","FightA_M",4.1,0,1,1,1,1);
			case 149: ApplyAnimation(playerid,"PED","FIGHTIDLE",4.1,0,1,1,1,1);
			case 150: ApplyAnimation(playerid,"PED","FightShB",4.1,0,1,1,1,1);
			case 151: ApplyAnimation(playerid,"PED","FightShF",4.1,0,1,1,1,1);
			case 152: ApplyAnimation(playerid,"PED","FightSh_BWD",4.1,0,1,1,1,1);
			case 153: ApplyAnimation(playerid,"PED","FightSh_FWD",4.1,0,1,1,1,1);
			case 154: ApplyAnimation(playerid,"PED","FightSh_Left",4.1,0,1,1,1,1);
			case 155: ApplyAnimation(playerid,"PED","FightSh_Right",4.1,0,1,1,1,1);
			case 156: ApplyAnimation(playerid,"PED","flee_lkaround_01",4.1,0,1,1,1,1);
			case 157: ApplyAnimation(playerid,"PED","FLOOR_hit",4.1,0,1,1,1,1);
			case 158: ApplyAnimation(playerid,"PED","FLOOR_hit_f",4.1,0,1,1,1,1);
			case 159: ApplyAnimation(playerid,"PED","fucku",4.1,0,1,1,1,1);
			case 160: ApplyAnimation(playerid,"PED","gang_gunstand",4.1,0,1,1,1,1);
			case 161: ApplyAnimation(playerid,"PED","gas_cwr",4.1,0,1,1,1,1);
			case 162: ApplyAnimation(playerid,"PED","getup",4.1,0,1,1,1,1);
			case 163: ApplyAnimation(playerid,"PED","getup_front",4.1,0,1,1,1,1);
			case 164: ApplyAnimation(playerid,"PED","gum_eat",4.1,0,1,1,1,1);
			case 165: ApplyAnimation(playerid,"PED","GunCrouchBwd",4.1,0,1,1,1,1);
			case 166: ApplyAnimation(playerid,"PED","GunCrouchFwd",4.1,0,1,1,1,1);
			case 167: ApplyAnimation(playerid,"PED","GunMove_BWD",4.1,0,1,1,1,1);
			case 168: ApplyAnimation(playerid,"PED","GunMove_FWD",4.1,0,1,1,1,1);
			case 169: ApplyAnimation(playerid,"PED","GunMove_L",4.1,0,1,1,1,1);
			case 170: ApplyAnimation(playerid,"PED","GunMove_R",4.1,0,1,1,1,1);
			case 171: ApplyAnimation(playerid,"PED","Gun_2_IDLE",4.1,0,1,1,1,1);
			case 172: ApplyAnimation(playerid,"PED","GUN_BUTT",4.1,0,1,1,1,1);
			case 173: ApplyAnimation(playerid,"PED","GUN_BUTT_crouch",4.1,0,1,1,1,1);
			case 174: ApplyAnimation(playerid,"PED","Gun_stand",4.1,0,1,1,1,1);
			case 175: ApplyAnimation(playerid,"PED","handscower",4.1,0,1,1,1,1);
			case 176: ApplyAnimation(playerid,"PED","handsup",4.1,0,1,1,1,1);
			case 177: ApplyAnimation(playerid,"PED","HitA_1",4.1,0,1,1,1,1);
			case 178: ApplyAnimation(playerid,"PED","HitA_2",4.1,0,1,1,1,1);
			case 179: ApplyAnimation(playerid,"PED","HitA_3",4.1,0,1,1,1,1);
			case 180: ApplyAnimation(playerid,"PED","HIT_back",4.1,0,1,1,1,1);
			case 181: ApplyAnimation(playerid,"PED","HIT_behind",4.1,0,1,1,1,1);
			case 182: ApplyAnimation(playerid,"PED","HIT_front",4.1,0,1,1,1,1);
			case 183: ApplyAnimation(playerid,"PED","HIT_GUN_BUTT",4.1,0,1,1,1,1);
			case 184: ApplyAnimation(playerid,"PED","HIT_L",4.1,0,1,1,1,1);
			case 185: ApplyAnimation(playerid,"PED","HIT_R",4.1,0,1,1,1,1);
			case 186: ApplyAnimation(playerid,"PED","HIT_walk",4.1,0,1,1,1,1);
			case 187: ApplyAnimation(playerid,"PED","HIT_wall",4.1,0,1,1,1,1);
			case 188: ApplyAnimation(playerid,"PED","Idlestance_fat",4.1,0,1,1,1,1);
			case 189: ApplyAnimation(playerid,"PED","idlestance_old",4.1,0,1,1,1,1);
			case 190: ApplyAnimation(playerid,"PED","IDLE_armed",4.1,0,1,1,1,1);
			case 191: ApplyAnimation(playerid,"PED","IDLE_chat",4.1,0,1,1,1,1);
			case 192: ApplyAnimation(playerid,"PED","IDLE_csaw",4.1,0,1,1,1,1);
			case 193: ApplyAnimation(playerid,"PED","Idle_Gang1",4.1,0,1,1,1,1);
			case 194: ApplyAnimation(playerid,"PED","IDLE_HBHB",4.1,0,1,1,1,1);
			case 195: ApplyAnimation(playerid,"PED","IDLE_ROCKET",4.1,0,1,1,1,1);
			case 196: ApplyAnimation(playerid,"PED","IDLE_stance",4.1,0,1,1,1,1);
			case 197: ApplyAnimation(playerid,"PED","IDLE_taxi",4.1,0,1,1,1,1);
			case 198: ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,1,1);
			case 199: ApplyAnimation(playerid,"PED","Jetpack_Idle",4.1,0,1,1,1,1);
			case 200: ApplyAnimation(playerid,"PED","JOG_femaleA",4.1,0,1,1,1,1);
			case 201: ApplyAnimation(playerid,"PED","JOG_maleA",4.1,0,1,1,1,1);
			case 202: ApplyAnimation(playerid,"PED","JUMP_glide",4.1,0,1,1,1,1);
			case 203: ApplyAnimation(playerid,"PED","JUMP_land",4.1,0,1,1,1,1);
			case 204: ApplyAnimation(playerid,"PED","JUMP_launch",4.1,0,1,1,1,1);
			case 205: ApplyAnimation(playerid,"PED","JUMP_launch_R",4.1,0,1,1,1,1);
			case 206: ApplyAnimation(playerid,"PED","KART_drive",4.1,0,1,1,1,1);
			case 207: ApplyAnimation(playerid,"PED","KART_L",4.1,0,1,1,1,1);
			case 208: ApplyAnimation(playerid,"PED","KART_LB",4.1,0,1,1,1,1);
			case 209: ApplyAnimation(playerid,"PED","KART_R",4.1,0,1,1,1,1);
			case 210: ApplyAnimation(playerid,"PED","KD_left",4.1,0,1,1,1,1);
			case 211: ApplyAnimation(playerid,"PED","KD_right",4.1,0,1,1,1,1);
			case 212: ApplyAnimation(playerid,"PED","KO_shot_face",4.1,0,1,1,1,1);
			case 213: ApplyAnimation(playerid,"PED","KO_shot_front",4.1,0,1,1,1,1);
			case 214: ApplyAnimation(playerid,"PED","KO_shot_stom",4.1,0,1,1,1,1);
			case 215: ApplyAnimation(playerid,"PED","KO_skid_back",4.1,0,1,1,1,1);
			case 216: ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,1);
			case 217: ApplyAnimation(playerid,"PED","KO_spin_L",4.1,0,1,1,1,1);
			case 218: ApplyAnimation(playerid,"PED","KO_spin_R",4.1,0,1,1,1,1);
			case 219: ApplyAnimation(playerid,"PED","pass_Smoke_in_car",4.1,0,1,1,1,1);
			case 220: ApplyAnimation(playerid,"PED","phone_in",4.1,0,1,1,1,1);
			case 221: ApplyAnimation(playerid,"PED","phone_out",4.1,0,1,1,1,1);
			case 222: ApplyAnimation(playerid,"PED","phone_talk",4.1,0,1,1,1,1);
			case 223: ApplyAnimation(playerid,"PED","Player_Sneak",4.1,0,1,1,1,1);
			case 224: ApplyAnimation(playerid,"PED","Player_Sneak_walkstart",4.1,0,1,1,1,1);
			case 225: ApplyAnimation(playerid,"PED","roadcross",4.1,0,1,1,1,1);
			case 226: ApplyAnimation(playerid,"PED","roadcross_female",4.1,0,1,1,1,1);
			case 227: ApplyAnimation(playerid,"PED","roadcross_gang",4.1,0,1,1,1,1);
			case 228: ApplyAnimation(playerid,"PED","roadcross_old",4.1,0,1,1,1,1);
			case 229: ApplyAnimation(playerid,"PED","run_1armed",4.1,0,1,1,1,1);
			case 230: ApplyAnimation(playerid,"PED","run_armed",4.1,0,1,1,1,1);
			case 231: ApplyAnimation(playerid,"PED","run_civi",4.1,0,1,1,1,1);
			case 232: ApplyAnimation(playerid,"PED","run_csaw",4.1,0,1,1,1,1);
			case 233: ApplyAnimation(playerid,"PED","run_fat",4.1,0,1,1,1,1);
			case 234: ApplyAnimation(playerid,"PED","run_fatold",4.1,0,1,1,1,1);
			case 235: ApplyAnimation(playerid,"PED","run_gang1",4.1,0,1,1,1,1);
			case 236: ApplyAnimation(playerid,"PED","run_left",4.1,0,1,1,1,1);
			case 237: ApplyAnimation(playerid,"PED","run_old",4.1,0,1,1,1,1);
			case 238: ApplyAnimation(playerid,"PED","run_player",4.1,0,1,1,1,1);
			case 239: ApplyAnimation(playerid,"PED","run_right",4.1,0,1,1,1,1);
			case 240: ApplyAnimation(playerid,"PED","run_rocket",4.1,0,1,1,1,1);
			case 241: ApplyAnimation(playerid,"PED","Run_stop",4.1,0,1,1,1,1);
			case 242: ApplyAnimation(playerid,"PED","Run_stopR",4.1,0,1,1,1,1);
			case 243: ApplyAnimation(playerid,"PED","Run_Wuzi",4.1,0,1,1,1,1);
			case 244: ApplyAnimation(playerid,"PED","SEAT_down",4.1,0,1,1,1,1);
			case 245: ApplyAnimation(playerid,"PED","SEAT_idle",4.1,0,1,1,1,1);
			case 246: ApplyAnimation(playerid,"PED","SEAT_up",4.1,0,1,1,1,1);
			case 247: ApplyAnimation(playerid,"PED","SHOT_leftP",4.1,0,1,1,1,1);
			case 248: ApplyAnimation(playerid,"PED","SHOT_partial",4.1,0,1,1,1,1);
			case 249: ApplyAnimation(playerid,"PED","SHOT_partial_B",4.1,0,1,1,1,1);
			case 250: ApplyAnimation(playerid,"PED","SHOT_rightP",4.1,0,1,1,1,1);
			case 251: ApplyAnimation(playerid,"PED","Shove_Partial",4.1,0,1,1,1,1);
			case 252: ApplyAnimation(playerid,"PED","Smoke_in_car",4.1,0,1,1,1,1);
			case 253: ApplyAnimation(playerid,"PED","sprint_civi",4.1,0,1,1,1,1);
			case 254: ApplyAnimation(playerid,"PED","sprint_panic",4.1,0,1,1,1,1);
			case 255: ApplyAnimation(playerid,"PED","Sprint_Wuzi",4.1,0,1,1,1,1);
			case 256: ApplyAnimation(playerid,"PED","swat_run",4.1,0,1,1,1,1);
			case 257: ApplyAnimation(playerid,"PED","Swim_Tread",4.1,0,1,1,1,1);
			case 258: ApplyAnimation(playerid,"PED","Tap_hand",4.1,0,1,1,1,1);
			case 259: ApplyAnimation(playerid,"PED","Tap_handP",4.1,0,1,1,1,1);
			case 260: ApplyAnimation(playerid,"PED","turn_180",4.1,0,1,1,1,1);
			case 261: ApplyAnimation(playerid,"PED","Turn_L",4.1,0,1,1,1,1);
			case 262: ApplyAnimation(playerid,"PED","Turn_R",4.1,0,1,1,1,1);
			case 263: ApplyAnimation(playerid,"PED","WALK_armed",4.1,0,1,1,1,1);
			case 264: ApplyAnimation(playerid,"PED","WALK_civi",4.1,0,1,1,1,1);
			case 265: ApplyAnimation(playerid,"PED","WALK_csaw",4.1,0,1,1,1,1);
			case 266: ApplyAnimation(playerid,"PED","Walk_DoorPartial",4.1,0,1,1,1,1);
			case 267: ApplyAnimation(playerid,"PED","WALK_drunk",4.1,0,1,1,1,1);
			case 268: ApplyAnimation(playerid,"PED","WALK_fat",4.1,0,1,1,1,1);
			case 269: ApplyAnimation(playerid,"PED","WALK_fatold",4.1,0,1,1,1,1);
			case 270: ApplyAnimation(playerid,"PED","WALK_gang1",4.1,0,1,1,1,1);
			case 271: ApplyAnimation(playerid,"PED","WALK_gang2",4.1,0,1,1,1,1);
			case 272: ApplyAnimation(playerid,"PED","WALK_old",4.1,0,1,1,1,1);
			case 273: ApplyAnimation(playerid,"PED","WALK_player",4.1,0,1,1,1,1);
			case 274: ApplyAnimation(playerid,"PED","WALK_rocket",4.1,0,1,1,1,1);
			case 275: ApplyAnimation(playerid,"PED","WALK_shuffle",4.1,0,1,1,1,1);
			case 276: ApplyAnimation(playerid,"PED","WALK_start",4.1,0,1,1,1,1);
			case 277: ApplyAnimation(playerid,"PED","WALK_start_armed",4.1,0,1,1,1,1);
			case 278: ApplyAnimation(playerid,"PED","WALK_start_csaw",4.1,0,1,1,1,1);
			case 279: ApplyAnimation(playerid,"PED","WALK_start_rocket",4.1,0,1,1,1,1);
			case 280: ApplyAnimation(playerid,"PED","Walk_Wuzi",4.1,0,1,1,1,1);
			case 281: ApplyAnimation(playerid,"PED","WEAPON_crouch",4.1,0,1,1,1,1);
			case 282: ApplyAnimation(playerid,"PED","woman_idlestance",4.1,0,1,1,1,1);
			case 283: ApplyAnimation(playerid,"PED","woman_run",4.1,0,1,1,1,1);
			case 284: ApplyAnimation(playerid,"PED","WOMAN_runbusy",4.1,0,1,1,1,1);
			case 285: ApplyAnimation(playerid,"PED","WOMAN_runfatold",4.1,0,1,1,1,1);
			case 286: ApplyAnimation(playerid,"PED","woman_runpanic",4.1,0,1,1,1,1);
			case 287: ApplyAnimation(playerid,"PED","WOMAN_runsexy",4.1,0,1,1,1,1);
			case 288: ApplyAnimation(playerid,"PED","WOMAN_walkbusy",4.1,0,1,1,1,1);
			case 289: ApplyAnimation(playerid,"PED","WOMAN_walkfatold",4.1,0,1,1,1,1);
			case 290: ApplyAnimation(playerid,"PED","WOMAN_walknorm",4.1,0,1,1,1,1);
			case 291: ApplyAnimation(playerid,"PED","WOMAN_walkold",4.1,0,1,1,1,1);
			case 292: ApplyAnimation(playerid,"PED","WOMAN_walkpro",4.1,0,1,1,1,1);
			case 293: ApplyAnimation(playerid,"PED","WOMAN_walksexy",4.1,0,1,1,1,1);
			case 294: ApplyAnimation(playerid,"PED","WOMAN_walkshop",4.1,0,1,1,1,1);
			case 295: ApplyAnimation(playerid,"PED","XPRESSscratch",4.1,0,1,1,1,1);
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:gwalk(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gwalk [1-2]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"PED","WALK_gang1",4.1,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"PED","WALK_gang2",4.1,1,1,1,1,1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gwalk [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:animgang(playerid, params[])
{
	if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		
	new animid;
	if(sscanf(params, "i", animid)) SendClientMessage(playerid, COLOR_GREY, "USE: /animgang [1-33]");
	else
	{
		switch(animid)
		{
			case 1: ApplyAnimation(playerid,"GANGS","DEALER_DEAL",4.1,0,1,1,1,1);
			case 2: ApplyAnimation(playerid,"GANGS","DEALER_IDLE",4.1,0,1,1,1,1);
			case 3: ApplyAnimation(playerid,"GANGS","drnkbr_prtl",4.1,0,1,1,1,1);
			case 4: ApplyAnimation(playerid,"GANGS","drnkbr_prtl_F",4.1,0,1,1,1,1);
			case 5: ApplyAnimation(playerid,"GANGS","DRUGS_BUY",4.1,0,1,1,1,1);
			case 6: ApplyAnimation(playerid,"GANGS","hndshkaa",4.1,0,1,1,1,1);
			case 7: ApplyAnimation(playerid,"GANGS","hndshkba",4.1,0,1,1,1,1);
			case 8: ApplyAnimation(playerid,"GANGS","hndshkca",4.1,0,1,1,1,1);
			case 9: ApplyAnimation(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);
			case 10: ApplyAnimation(playerid,"GANGS","hndshkda",4.1,0,1,1,1,1);
			case 11: ApplyAnimation(playerid,"GANGS","hndshkea",4.1,0,1,1,1,1);
			case 12: ApplyAnimation(playerid,"GANGS","hndshkfa",4.1,0,1,1,1,1);
			case 13: ApplyAnimation(playerid,"GANGS","hndshkfa_swt",4.1,0,1,1,1,1);
			case 14: ApplyAnimation(playerid,"GANGS","Invite_No",4.1,0,1,1,1,1);
			case 15: ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1,0,1,1,1,1);
			case 16: ApplyAnimation(playerid,"GANGS","leanIDLE",4.1,0,1,1,1,1);
			case 17: ApplyAnimation(playerid,"GANGS","leanIN",4.1,0,1,1,1,1);
			case 18: ApplyAnimation(playerid,"GANGS","leanOUT",4.1,0,1,1,1,1);
			case 19: ApplyAnimation(playerid,"GANGS","prtial_gngtlkA",4.1,0,1,1,1,1);
			case 20: ApplyAnimation(playerid,"GANGS","prtial_gngtlkB",4.1,0,1,1,1,1);
			case 21: ApplyAnimation(playerid,"GANGS","prtial_gngtlkCt",4.1,0,1,1,1,1);
			case 22: ApplyAnimation(playerid,"GANGS","prtial_gngtlkD",4.1,0,1,1,1,1);
			case 23: ApplyAnimation(playerid,"GANGS","prtial_gngtlkE",4.1,0,1,1,1,1);
			case 24: ApplyAnimation(playerid,"GANGS","prtial_gngtlkF",4.1,0,1,1,1,1);
			case 25: ApplyAnimation(playerid,"GANGS","prtial_gngtlkG",4.1,0,1,1,1,1);
			case 26: ApplyAnimation(playerid,"GANGS","prtial_gngtlkH",4.1,0,1,1,1,1);
			case 27: ApplyAnimation(playerid,"GANGS","prtial_hndshk_01",4.1,0,1,1,1,1);
			case 28: ApplyAnimation(playerid,"GANGS","prtial_hndshk_biz_01",4.1,0,1,1,1,1);
			case 29: ApplyAnimation(playerid,"GANGS","shake_cara",4.1,0,1,1,1,1);
			case 30: ApplyAnimation(playerid,"GANGS","shake_carK",4.1,0,1,1,1,1);
			case 31: ApplyAnimation(playerid,"GANGS","shake_carSH",4.1,0,1,1,1,1);
			case 32: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1,0,1,1,1,1);
			case 33: ApplyAnimation(playerid,"GANGS","smkcig_prtl_F",4.1,0,1,1,1,1);
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}
COMMAND:puton(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "goggles", "goggles_put_on", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:animgritar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "RIOT", "RIOT_shout", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:lowrider(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /lowrider [1-8]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "LOWRIDER","lrgirl_hair", 4.0, 0, 1, 1, 1, -1, 1);
		    case 2: ApplyAnimation(playerid, "LOWRIDER","lrgirl_hurry", 4.0, 0, 1, 1, 1, -1, 1);
		    case 3: ApplyAnimation(playerid, "LOWRIDER","lrgirl_idleloop", 4.0, 0, 1, 1, 1, -1, 1);
		    case 4: ApplyAnimation(playerid, "LOWRIDER","lrgirl_idle_to_l0", 4.0, 0, 1, 1, 1, -1, 1);
		    case 5: ApplyAnimation(playerid, "LOWRIDER","lrgirl_l0_loop", 4.0, 0, 1, 1, 1, -1, 1);
		    case 6: ApplyAnimation(playerid, "LOWRIDER","lrgirl_l1_loop", 4.0, 0, 1, 1, 1, -1, 1);
		    case 7: ApplyAnimation(playerid, "LOWRIDER","lrgirl_l1_to_l2", 4.0, 0, 1, 1, 1, -1, 1);
		    case 8: ApplyAnimation(playerid, "LOWRIDER","lrgirl_l2_to_l3", 4.0, 0, 1, 1, 1, -1, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /lowrider [1-8]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:fixcar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /fixcar [1-2]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "CAR","Fixn_Car_Loop", 4.0, 1, 0, 0, 1, 0, 1);
            case 2: ApplyAnimation(playerid, "CAR","Fixn_Car_Out", 3.0, 0, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /fixcar [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:cobrir(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /cobrir [1-6]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
            case 1: ApplyAnimation(playerid, "SWAT", "swt_wllshoot_in_L", 4.0, 0, 1, 1, 1, -1, 1);
            case 2: ApplyAnimation(playerid, "SWAT", "swt_wllshoot_in_R", 4.0, 0, 1, 1, 1, -1, 1);
            case 3: ApplyAnimation(playerid, "SWAT", "swt_wllshoot_out_L", 4.0, 0, 1, 1, 1, -1, 1);
            case 4: ApplyAnimation(playerid, "SWAT", "swt_wllshoot_out_R", 4.0, 0, 1, 1, 1, -1, 1);
            case 5: ApplyAnimation(playerid, "SWAT", "swt_wllpk_L", 4.0, 0, 1, 1, 1, -1, 1);
            case 6: ApplyAnimation(playerid, "SWAT", "swt_wllpk_R", 4.0, 0, 1, 1, 1, -1, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /cobrir [1-6]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:facepalm(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

	ApplyAnimation(playerid, "MISC", "plyr_shkhead", 4.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:seguir(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:observar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:revistacapo(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:box(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"GYMNASIUM","gym_shadowbox",4.1,1,1,1,1,1,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:vadiar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /vadiar [1-4]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "PED", "IDLE_HBHB", 4.0, 1, 0, 0, 1, 0,1);
		    case 2: ApplyAnimation(playerid, "PLAYIDLES", "shift", 4.0,1,1,1,1,0,1);
		    case 3: ApplyAnimation(playerid, "PLAYIDLES", "shldr", 4.0,1,1,1,1,0,1);
		    case 4: ApplyAnimation(playerid, "PLAYIDLES", "strleg", 4.0,1,1,1,1,0,1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /vadiar [1-4]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:gfunk(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gfunk [1-17]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GFUNK","DANCE_LOOP",4.0, 1, 0, 0, 1, 0, 1);
		    case 2: ApplyAnimation(playerid,"GFUNK","DANCE_G3",4.0, 1, 0, 0, 1, 0, 1);
		    case 3: ApplyAnimation(playerid,"GFUNK","DANCE_G4",4.0, 1, 0, 0, 1, 0, 1);
		    case 4: ApplyAnimation(playerid,"GFUNK","DANCE_G2",4.0, 1, 0, 0, 1, 0, 1);
		    case 5: ApplyAnimation(playerid,"GFUNK","DANCE_G1",4.0, 1, 0, 0, 1, 0, 1);
		    case 6: ApplyAnimation(playerid,"GFUNK","DANCE_G10",4.0, 1, 0, 0, 1, 0, 1);
		    case 7: ApplyAnimation(playerid,"GFUNK","DANCE_G9",4.0, 1, 0, 0, 1, 0, 1);
		    case 8: ApplyAnimation(playerid,"GFUNK","DANCE_G11",4.0, 1, 0, 0, 1, 0, 1);
		    case 9: ApplyAnimation(playerid,"GFUNK","DANCE_G12",4.0, 1, 0, 0, 1, 0, 1);
		    case 10: ApplyAnimation(playerid,"WOP","DANCE_LOOP",4.0, 1, 0, 0, 1, 0, 1);
		    case 11: ApplyAnimation(playerid,"WOP","DANCE_G10",4.0, 1, 0, 0, 1, 0, 1);
		    case 12: ApplyAnimation(playerid,"WOP","DANCE_G9",4.0, 1, 0, 0, 1, 0, 1);
		    case 13: ApplyAnimation(playerid,"WOP","DANCE_G12",4.0, 1, 0, 0, 1, 0, 1);
		    case 14: ApplyAnimation(playerid,"WOP","DANCE_G11",4.0, 1, 0, 0, 1, 0, 1);
		    case 15: ApplyAnimation(playerid,"WOP","DANCE_G2",4.0, 1, 0, 0, 1, 0, 1);
		    case 16: ApplyAnimation(playerid,"WOP","DANCE_G1",4.0, 1, 0, 0, 1, 0, 1);
		    case 17: ApplyAnimation(playerid,"WOP","DANCE_G4",4.0, 1, 0, 0, 1, 0, 1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gfunk [1-17]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:sinuca(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /sinuca [1-11]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.0, 0, 1, 1, 1, -1, 1);
		    case 2: ApplyAnimation(playerid,"POOL","POOL_Idle_Stance",4.0, 0, 1, 1, 1, -1, 1);
		    case 3: ApplyAnimation(playerid,"POOL","POOL_Long_Shot",4.0, 0, 1, 1, 1, -1, 1);
		    case 4: ApplyAnimation(playerid,"POOL","POOL_Long_Start",4.0, 0, 1, 1, 1, -1, 1);
		    case 5: ApplyAnimation(playerid,"POOL","POOL_Med_Shot",4.0, 0, 1, 1, 1, -1, 1);
		    case 6: ApplyAnimation(playerid,"POOL","POOL_Med_Start",4.0, 0, 1, 1, 1, -1, 1);
		    case 7: ApplyAnimation(playerid,"POOL","POOL_Place_White",4.0, 0, 1, 1, 1, -1, 1);
		    case 8: ApplyAnimation(playerid,"POOL","POOL_Short_Shot",4.0, 0, 1, 1, 1, -1, 1);
		    case 9: ApplyAnimation(playerid,"POOL","POOL_Short_Start",4.0, 0, 1, 1, 1, -1, 1);
		    case 10: ApplyAnimation(playerid,"POOL","POOL_XLong_Shot",4.0, 0, 1, 1, 1, -1, 1);
		    case 11: ApplyAnimation(playerid,"POOL","POOL_XLong_Start",4.0, 0, 1, 1, 1, -1, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /sinuca [1-11]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:segurar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "ped", "IDLE_armed", 4.0, 1, 0, 0, 1, 0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:esquivar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /esquivar [1-3]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
            case 1: ApplyAnimation(playerid,"ped","Crouch_Roll_L",4.0,0,1,1,0,0,1);
            case 2: ApplyAnimation(playerid,"ped","Crouch_Roll_R",4.0,0,1,1,0,0,1);
            case 3: ApplyAnimation(playerid,"ped","EV_dive",4.0,0,1,1,0,0,1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /dive [1-3]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:eatsit(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FOOD","FF_Sit_Loop", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:rimando(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"benchpress","gym_bp_celebrate", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:animalgemar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_shake",4.0, 0, 1, 1, 1, -1, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:alevantar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"PED","getup",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:dpunch(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_B","FightB_1",4.0,0,1,1,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:gkick(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_D","FightD_G",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:airkick(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_C","FightC_M",4.0,0,1,1,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:gpunch(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_B","FightB_G",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:levantarguarda(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.0,1,1,1,1,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:cotovelada(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.0,0,1,1,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:bj(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /bj [1-18]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_P",4.1,0,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_W",4.1,0,1,1,1,1,1);
            case 3: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_P",4.1,0,1,1,1,1,1);
            case 4: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.1,0,1,1,1,1,1);
            case 5: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_END_P",4.1,0,1,1,1,1,1);
            case 6: ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_END_W",4.1,0,1,1,1,1,1);
            case 7: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_START_P",4.1,0,1,1,1,1,1);
            case 8: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_START_W",4.1,0,1,1,1,1,1);
            case 9: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_LOOP_P",4.1,0,1,1,1,1,1);
            case 10: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_LOOP_W",4.1,0,1,1,1,1,1);
            case 11: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_END_P",4.1,0,1,1,1,1,1);
            case 12: ApplyAnimation(playerid,"BLOWJOBZ","BJ_STAND_END_W",4.1,0,1,1,1,1,1);
            case 13: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_START_W", 4.0, 0, 1, 1, 1, -1,1);
		    case 14: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_START_P", 4.0, 0, 1, 1, 1, -1,1);
		    case 15: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_LOOP_W", 4.0, 1, 1, 1, 1, 0,1);
		    case 16: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_LOOP_P", 4.0, 1, 1, 1, 1, 0,1);
		    case 17: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_END_W", 4.0, 0, 1, 1, 1, -1,1);
		    case 18: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_END_P", 4.0, 0, 1, 1, 1, -1,1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /bj [1-18]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:sexy(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /sexy [1-8]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"SNM","SPANKING_IDLEW",4.1,0,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"SNM","SPANKING_IDLEP",4.1,0,1,1,1,1,1);
            case 3: ApplyAnimation(playerid,"SNM","SPANKINGW",4.1,0,1,1,1,1,1);
            case 4: ApplyAnimation(playerid,"SNM","SPANKINGP",4.1,0,1,1,1,1,1);
            case 5: ApplyAnimation(playerid,"SNM","SPANKEDW",4.1,0,1,1,1,1,1);
            case 6: ApplyAnimation(playerid,"SNM","SPANKEDP",4.1,0,1,1,1,1,1);
            case 7: ApplyAnimation(playerid,"SNM","SPANKING_ENDW",4.1,0,1,1,1,1,1);
            case 8: ApplyAnimation(playerid,"SNM","SPANKING_ENDP",4.1,0,1,1,1,1,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /sexy [1-8]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:strip(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /strip [1-7]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"STRIP","strip_A",4.0,1,1,1,1,0,1);
            case 2: ApplyAnimation(playerid,"STRIP","strip_B",4.0,1,1,1,1,0,1);
            case 3: ApplyAnimation(playerid,"STRIP","strip_C",4.0,1,1,1,1,0,1);
            case 4: ApplyAnimation(playerid,"STRIP","strip_D",4.0,1,1,1,1,0,1);
            case 5: ApplyAnimation(playerid,"STRIP","strip_E",4.0,1,1,1,1,0,1);
            case 6: ApplyAnimation(playerid,"STRIP","strip_F",4.0,1,1,1,1,0,1);
            case 7: ApplyAnimation(playerid,"STRIP","strip_G",4.0,1,1,1,1,0,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /strip [1-7]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:punheta(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /punheta [1-3]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"PAULNMAC","wank_in",4.0,1,1,1,1,0,1);
            case 2: ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.0, 1, 0, 0, 1, 0,1);
            case 3: ApplyAnimation(playerid,"PAULNMAC","wank_out",4.0,1,1,1,1,0,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /punheta [1-3]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:rap(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /rap [1-3]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"RAPPING","RAP_A_Loop",4.0,1,1,1,1,0, 1);
            case 2: ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,1,1,1,0, 1);
            case 3: ApplyAnimation(playerid,"RAPPING","RAP_C_Loop",4.0,1,1,1,1,0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /rap [1-3]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:dancar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /dancar [1-15]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
            case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
            case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
            case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
            case 5: ApplyAnimation(playerid,"DANCING","bd_clap",4.0, 1, 0, 0, 1, 0, 1);
            case 6: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.0, 1, 0, 0, 1, 0, 1);
            case 7: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.0, 1, 0, 0, 1, 0, 1);
            case 8: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.0, 1, 0, 0, 1, 0, 1);
            case 9: ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.0, 1, 0, 0, 1, 0, 1);
            case 10: ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.0, 1, 0, 0, 1, 0, 1);
            case 11: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.0, 1, 0, 0, 1, 0, 1);
            case 12: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.0, 1, 0, 0, 1, 0, 1);
            case 13: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.0, 1, 0, 0, 1, 0, 1);
            case 14: ApplyAnimation(playerid,"DANCING","dnce_M_d",4.0, 1, 0, 0, 1, 0, 1);
            case 15: ApplyAnimation(playerid,"DANCING","dnce_M_e",4.0, 1, 0, 0, 1, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /dance [1-15]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:supino(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /supino [1-5]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"benchpress","gym_bp_geton",4.0,0,0,0,1,0,1);
		    case 2: ApplyAnimation(playerid,"benchpress","gym_bp_getoff",4.0,0,0,0,1,0,1);
		    case 3: ApplyAnimation(playerid,"benchpress","gym_bp_down",4.0,0,0,0,1,0,1);
		    case 4: ApplyAnimation(playerid,"benchpress","gym_bp_up_A",4.0,0,0,0,1,0,1);
		    case 5: ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.0,0,0,0,1,0,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /supino [1-5]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:lean(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /lean [1-3]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GANGS","leanIDLE",4.0,0,0,0,1,0,1);
            case 2: ApplyAnimation(playerid,"MISC","Plyrlean_loop",4.0,0,0,0,1,0,1);
            case 3: ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 1, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /lean [1-3]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:spray(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /spray [1-4]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GRAFFITI", "graffiti_Chkout", 4.0,1,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.0,0,1,1,1,1,1);
            case 3: ApplyAnimation(playerid,"SPRAYCAN","spraycan_fire",4.0,0,1,1,1,1,1);
            case 4: ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.0,0,1,1,1,1,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /sray [1-4]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:fumar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.0,0,1,1,1,1, 1);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:medo(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:pcaixa(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:dcaixa(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "CARRY", "putdwn", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:abrir(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "AIRPORT", "thrw_barl_thrw", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:lancar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "GRENADE", "WEAPON_throw", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:basquete(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /basquete [1-7]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop", 4.0, 1, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop", 4.0, 1, 0, 0, 0, 0, 1);
            case 3: ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0, 1);
            case 4: ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0, 1);
            case 5: ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.1,0,1,1,1,1, 1);
            case 6: ApplyAnimation(playerid,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1, 1);
            case 7: ApplyAnimation(playerid,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /basquete [1-7]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:fumarnocarro(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"PED","Smoke_in_car", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:cansado(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"FAT","IDLE_tired", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:ghand(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /ghand [1-5]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GHANDS","gsign1LH",4.0,0,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"GHANDS","gsign2LH",4.0,0,1,1,1,1,1);
            case 3: ApplyAnimation(playerid,"GHANDS","gsign3LH",4.0,0,1,1,1,1,1);
            case 4: ApplyAnimation(playerid,"GHANDS","gsign4LH",4.0,0,1,1,1,1,1);
            case 5: ApplyAnimation(playerid,"GHANDS","gsign5LH",4.0,0,1,1,1,1,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /ghand [1-5]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:chant(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	ApplyAnimation(playerid,"RIOT","RIOT_CHANT", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:alongar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"PLAYIDLES","stretch",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:bracojanela(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"CAR","Tap_hand", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:chorar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USO: /chorar [1-2]");
	else
	{
       	if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop", 4.0, 1, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop", 4.0, 1, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USO: /chorar [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:taichi(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"PARK","Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:fucku(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"PED","fucku",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:chat(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /chat [1-9]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
 		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1,1);
            case 2: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkA", 4.0, 0, 1, 1, 1, -1,1);
            case 3: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkB", 4.0, 0, 1, 1, 1, -1,1);
            case 4: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkC", 4.0, 0, 1, 1, 1, -1,1);
            case 5: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkD", 4.0, 0, 1, 1, 1, -1,1);
            case 6: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkE", 4.0, 0, 1, 1, 1, -1,1);
            case 7: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkF", 4.0, 0, 1, 1, 1, -1,1);
            case 8: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkG", 4.0, 0, 1, 1, 1, -1,1);
            case 9: ApplyAnimation(playerid, "GANGS", "prtial_gngtlkH", 4.0, 0, 1, 1, 1, -1,1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /chat [1-9]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:negociar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USAGE: /USE [1-2]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
 		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 3.0, 0, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"DEALER","DRUGS_BUY", 4.0, 0, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /negociar [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:beber(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
 	ApplyAnimation(playerid, "GANGS", "drnkbr_prtl", 3.0,1,1,1,1,1, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:animrevistar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /animrevistar [1-2]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    	switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "POLICE", "plc_drgbst_01", 3.0, 0, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid, "POLICE", "plc_drgbst_02", 3.0, 0, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USE: /animrevistar [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:chuteporta(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid, "POLICE", "Door_Kick", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:comer(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:vomitar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0, 1); // Vomit BAH!
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:bomba(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1); // Place Bomb
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:arranhar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:convidar2(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid,"GANGS","Invite_No",4.1,0,1,1,1,1,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:convidar1(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1,0,1,1,1,1,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:levartapa(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid,"SWEET","ho_ass_slapped",4.0,0,0,0,0,0,1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:machucado(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USO: /machucado [1-2]");
	else
	{
	    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
  		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
  		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"SWEET","Sweet_injuredloop", 	4.0, 1, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"SWAT","gnstwall_injurd", 		4.0, 1, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_GREY, "USO: /machucado [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:cair(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USO: /cair [1-6]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
   		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
  		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
  		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "ped", "FLOOR_hit", 4.0, 0, 1, 1, 1, -1, 1);
		    case 2: ApplyAnimation(playerid, "ped", "FLOOR_hit_f", 4.0, 0, 1, 1, 1, -1, 1);
		    case 3: ApplyAnimation(playerid, "ped", "KO_shot_front", 4.0, 0, 1, 1, 1, -1, 1);
		    case 4: ApplyAnimation(playerid, "ped", "KO_shot_stom", 4.0, 0, 1, 1, 1, -1, 1);
            case 5: ApplyAnimation(playerid, "ped", "BIKE_fall_off", 4.0, 0, 1, 1, 1, -1, 1);
			case 6: ApplyAnimation(playerid, "FINALE", "FIN_Land_Die", 4.0, 0, 1, 1, 1, -1, 1);
            default: return SendClientMessage(playerid, COLOR_GREY, "USO: /cair [1-6]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:relaxar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /relaxar [1-2]");
	else
	{
	    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
  		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
  		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop", 4.0, 1, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /relaxar [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:acenar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
  	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
  	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:deitar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
  	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
  	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:crossarms(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /crossarms [1-5]");
	else
	{
    	if(PlayerInfo[playerid][pLogado] == 0) return 1;
   		if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
   		if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
   		if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1, 1);
            case 2: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 		4.0, 0, 1, 1, 1, -1, 1);
            case 3: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_01", 	4.0, 0, 1, 1, 1, -1, 1);
            case 4: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_02", 	4.0, 0, 1, 1, 1, -1, 1);
            case 5: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_03", 	4.0, 0, 1, 1, 1, -1, 1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /crossarms [1-5]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:rir(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
   	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
   	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:cpr(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
   	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
   	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
   	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	ApplyAnimation(playerid,"MEDIC","CPR", 4.0, 1, 0, 0, 0, 0, 1);
	ComAnim[playerid] = 1;
    return 1;
}

COMMAND:gsign(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_GREY, "USE: /gsign [1-10]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
    	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"GHANDS","gsign1",4.0,0,1,1,1,1,1);
            case 2: ApplyAnimation(playerid,"GHANDS","gsign2",4.0,0,1,1,1,1,1);
            case 3: ApplyAnimation(playerid,"GHANDS","gsign3",4.0,0,1,1,1,1,1);
            case 4: ApplyAnimation(playerid,"GHANDS","gsign4",4.0,0,1,1,1,1,1);
            case 5: ApplyAnimation(playerid,"GHANDS","gsign5",4.0,0,1,1,1,1,1);
			case 6: ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1,0,1,1,1,1);
			case 7: ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1,0,1,1,1,1);
			case 8: ApplyAnimation(playerid,"GHANDS","gsign3LH",4.1,0,1,1,1,1);
			case 9: ApplyAnimation(playerid,"GHANDS","gsign4LH",4.1,0,1,1,1,1);
			case 10: ApplyAnimation(playerid,"GHANDS","gsign5LH",4.1,0,1,1,1,1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /gsign [1-10]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:kttrtap(playerid, params[]){
    LoadGetWayFRZ(playerid);
	return 1;
}

COMMAND:mirar(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /mirar [1-7]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
    	if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    	if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    	switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"PED","gang_gunstand",		4.0, 1, 1, 1, 1, 1, 1);
            case 2: ApplyAnimation(playerid, "SHOP", "SHP_Gun_Aim", 	4.0, 0, 1, 1, 1, -1, 1);
            case 3: ApplyAnimation(playerid,"PED","Driveby_L",			4.0, 0, 1, 1, 1, -1, 1);
            case 4: ApplyAnimation(playerid,"PED","Driveby_R",			4.0, 0, 1, 1, 1, -1, 1);
            case 5: ApplyAnimation(playerid,"ped", "ARRESTgun", 		4.0, 0, 1, 1, 1, -1, 1);
            case 6: ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0, 1);
            case 7: ApplyAnimation(playerid, "PED", "GUN_STAND", 		4.0, 1, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /aim [1-7]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:bravo(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    
	ApplyAnimation(playerid,"RIOT","RIOT_ANGRY",4.0,0,0,0,0,0, 1);
	ComAnim[playerid] = 1;
	return 1;
}

COMMAND:bastao(playerid, params[])
{
	new aimid;
	if(sscanf(params, "i", aimid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /bastao [1-2]");
	else
	{
        if(PlayerInfo[playerid][pLogado] == 0) return 1;
	    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
	    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

		switch(aimid)
		{
		    case 1: ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0, 1);
            case 2: ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_02", 4.0, 1, 0, 0, 0, 0, 1);
            default: SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /bastao [1-2]");
		}
		ComAnim[playerid] = 1;
	}
	return 1;
}

COMMAND:chairsit(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

	ApplyAnimation(playerid,"PED","SEAT_idle", 4.0, 1, 0, 0, 0, 0,1);
	ComAnim[playerid] = 1;
	return 1;
}

CMD:sentar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    
    new anim;
 	if(sscanf(params, "i", anim)) return SendClientMessage(playerid, 0xfce80cFF, "/sentar [1-17]");
 	if(anim < 1 || anim > 17) return SendClientMessage(playerid, 0xfce80cFF, "/sentar [1-17]");
	switch(anim)
	{
	    case 1: ApplyAnimation(playerid,"PED","SEAT_down",					4.1, 0, 1, 1, 1, 0, 1);
   		case 2: ApplyAnimation(playerid,"MISC","seat_lr",					2.0, 1, 0, 0, 0, 0, 1);
		case 3: ApplyAnimation(playerid,"MISC","seat_talk_01",				2.0, 1, 0, 0, 0, 0, 1);
  		case 4: ApplyAnimation(playerid,"MISC","seat_talk_02",				2.0, 1, 0, 0, 0, 0, 1);
  		case 5: ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 			4.0, 1, 0, 0, 0, 0, 1);
  		case 6: ApplyAnimation(playerid,"BEACH", "ParkSit_W_loop", 			4.0, 1, 0, 0, 0, 0, 1);
		case 7: ApplyAnimation(playerid,"INT_OFFICE", "FF_Dam_Fwd", 		4.1, 1, 1, 0, 0, 0, 1);
		case 8: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_2Idle_180", 	4.1, 0, 1, 0, 0, 0, 1);
		case 9: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Bored_Loop", 4.1, 1, 1, 0, 0, 0, 1);
		case 10: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Crash", 	4.1, 1, 1, 0, 0, 0, 1);
		case 11: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Drink", 	4.1, 1, 1, 0, 0, 0, 1);
		case 12: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Idle_Loop", 4.1, 1, 1, 0, 0, 0, 1);
		case 13: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_In", 		4.1, 0, 1, 0, 0, 0, 1);
		case 14: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Read", 		4.1, 1, 1, 0, 0, 0, 1);
		case 15: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Type_Loop", 4.1, 1, 1, 0, 0, 0, 1);
		case 16: ApplyAnimation(playerid,"INT_OFFICE", "OFF_Sit_Watch", 	4.1, 1, 1, 0, 0, 0, 1);
		case 17: ApplyAnimation(playerid,"PED", "SEAT_idle", 				4.0, 1, 0, 0, 0, 0, 1);
	}
	ComAnim[playerid] = 1;
    return 1;
}

CMD:baseball(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    
    new anim;
 	if(sscanf(params, "i", anim)) return SendClientMessage(playerid, 0xfce80cFF, "/baseball [1-13]");
	if( 0 < anim < 14)
	{
		switch(anim)
		{
		    case 1: ApplyAnimation(playerid, "BASEBALL", "Bat_1", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 2: ApplyAnimation(playerid, "BASEBALL", "Bat_2", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 3: ApplyAnimation(playerid, "BASEBALL", "Bat_3", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 4: ApplyAnimation(playerid, "BASEBALL", "Bat_4", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 5: ApplyAnimation(playerid, "BASEBALL", "Bat_block", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 6: ApplyAnimation(playerid, "BASEBALL", "Bat_Hit_1", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 7: ApplyAnimation(playerid, "BASEBALL", "Bat_Hit_2", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 8: ApplyAnimation(playerid, "BASEBALL", "Bat_Hit_3", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 9: ApplyAnimation(playerid, "BASEBALL", "Bat_IDLE", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 10: ApplyAnimation(playerid, "BASEBALL", "Bat_M", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 11: ApplyAnimation(playerid, "BASEBALL", "BAT_PART", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 12: ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0, 1);
            case 13: ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_02", 4.0, 1, 0, 0, 0, 0, 1);
		}
		ComAnim[playerid] = 1;
	}
    return 1;
}

CMD:bar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver na água!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    
    new anim;
 	if(sscanf(params, "i", anim)) return SendClientMessage(playerid, 0xfce80cFF, "/bar [1-12]");
	if( 0 < anim < 13)
	{
		switch(anim)
		{
		    case 1: ApplyAnimation(playerid, "BAR", "Barcustom_get", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 2: ApplyAnimation(playerid, "BAR", "Barcustom_loop", 	4.1, 1, 1, 1, 1, 0, 1);
		    case 3: ApplyAnimation(playerid, "BAR", "Barcustom_order", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 4: ApplyAnimation(playerid, "BAR", "BARman_idle", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 5: ApplyAnimation(playerid, "BAR", "Barserve_bottle", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 6: ApplyAnimation(playerid, "BAR", "Barserve_give", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 7: ApplyAnimation(playerid, "BAR", "Barserve_glass", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 8: ApplyAnimation(playerid, "BAR", "Barserve_in", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 9: ApplyAnimation(playerid, "BAR", "Barserve_loop", 	4.1, 1, 1, 1, 1, 0, 1);
		    case 10: ApplyAnimation(playerid, "BAR", "Barserve_order", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 11: ApplyAnimation(playerid, "BAR", "dnk_stndF_loop", 	4.1, 1, 1, 1, 1, 0, 1);
		    case 12: ApplyAnimation(playerid, "BAR", "dnk_stndM_loop", 	4.1, 1, 1, 1, 1, 0, 1);
		}
		ComAnim[playerid] = 1;
	}
    return 1;
}

COMMAND:bebado(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    
    ComAnim[playerid] = 1;
    ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1, 1);
	return 1;
}

COMMAND:tapabunda(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ComAnim[playerid] = 1;
    ApplyAnimation(playerid,"SWEET","sweet_ass_slap",4.0,0,0,0,0,0, 1);
	return 1;
}

COMMAND:urinar(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ComAnim[playerid] = 1;
    SetPlayerSpecialAction(playerid, 68);
	return 1;
}

COMMAND:handsup(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
    ComAnim[playerid] = 1;
    ApplyAnimation(playerid, "ROB_BANK", "SHP_HandsUp_Scr", 4.0, 0, 1, 1, 1, 0, 1);
    ComAnim[playerid] = 1;
	return 1;
}

COMMAND:crack(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 1, 1, 1, 0, 1);
    ComAnim[playerid] = 1;
	return 1;
}

CMD:camera(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

    new anim;
 	if(sscanf(params, "i", anim)) SendClientMessage(playerid, 0xfce80cFF, "/camera [1-14]");
	if(anim > 0 && anim < 15)
	{
		switch(anim)
		{
		    case 1: ApplyAnimation(playerid, "camera", "camcrch_cmon", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 2: ApplyAnimation(playerid, "camera", "camcrch_idleloop", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 3: ApplyAnimation(playerid, "camera", "camcrch_stay", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 4: ApplyAnimation(playerid, "camera", "camcrch_to_camstnd", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 5: ApplyAnimation(playerid, "camera", "camstnd_cmon", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 6: ApplyAnimation(playerid, "camera", "camstnd_idleloop", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 7: ApplyAnimation(playerid, "camera", "camstnd_lkabt", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 8: ApplyAnimation(playerid, "camera", "camstnd_to_camcrch", 	4.1, 0, 1, 1, 1, 0, 1);
		    case 9: ApplyAnimation(playerid, "camera", "piccrch_in", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 10: ApplyAnimation(playerid, "camera", "piccrch_out", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 11: ApplyAnimation(playerid, "camera", "piccrch_take", 		4.1, 0, 1, 1, 1, 0, 1);
		    case 12: ApplyAnimation(playerid, "camera", "picstnd_in", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 13: ApplyAnimation(playerid, "camera", "picstnd_out", 			4.1, 0, 1, 1, 1, 0, 1);
		    case 14: ApplyAnimation(playerid, "camera", "picstnd_take", 		4.1, 0, 1, 1, 1, 0, 1);
		}
		ComAnim[playerid] = 1;
	}
    return 1;
}

ALTCOMMAND:sa->pararanim;
ALTCOMMAND:stopanim->pararanim;
CMD:pararanim(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
	if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");
	if(IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0, 1);
    ComAnim[playerid] = 0;
    ClearAnimations(playerid, 1);
    FumandoMaconha[playerid] = 0;
	return 1;
}

COMMAND:esquerda(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

    ApplyAnimation(playerid, "MISC","hiker_pose_l", 4.0, 0, 1, 1, 1, 0, 1);
    ComAnim[playerid] = 1;
	return 1;
}

COMMAND:direita(playerid, params[])
{
    if(PlayerInfo[playerid][pLogado] == 0) return 1;
    if(PlayerInfo[playerid][pMorto] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver morto!");
    if(IsPlayerInWater(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver naágua!");
    if(TomouTazer[playerid] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "Você não pode utilizar este comando enquanto estiver sob efeito do tazer!");

    ApplyAnimation(playerid, "MISC","hiker_pose", 4.0, 0, 1, 1, 1, 0, 1);
    ComAnim[playerid] = 1;
	return 1;
}


