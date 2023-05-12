#define JOB_DESMANCHE       7

enum O_Infos
{
	Float:oDesmancheX,
	Float:oDesmancheY,
	Float:oDesmancheZ,
	Float:oDesmancheR,
	oDesmancheTime
};

new OutrasInfos[MAX_PLAYERS][O_Infos];

forward ResetVarsPlayerInfo(extraid);
public ResetVarsPlayerInfo(extraid)
{
	OutrasInfos[extraid][oDesmancheX] = 0;
	OutrasInfos[extraid][oDesmancheY] = 0;
	OutrasInfos[extraid][oDesmancheZ] = 0;
	OutrasInfos[extraid][oDesmancheR] = 0;

	OutrasInfos[extraid][oDesmancheTime] = 0;
}

		format(query,sizeof(query),"UPDATE `accounts` SET `tempodesman`='%d' WHERE `ID` = '%d'",
			OutrasInfos[playerid][oDesmancheTime],

			PlayerInfo[playerid][pID]);
		mysql_function_query(Pipeline, query, false, "", "");

        cache_get_field_content(0, "desmanx", tmp);  OutrasInfos[extraid][oDesmancheX] = floatstr(tmp);
        cache_get_field_content(0, "desmany", tmp);  OutrasInfos[extraid][oDesmancheY] = floatstr(tmp);
        cache_get_field_content(0, "desmanz", tmp);  OutrasInfos[extraid][oDesmancheZ] = floatstr(tmp);
        cache_get_field_content(0, "desmanr", tmp);  OutrasInfos[extraid][oDesmancheR] = floatstr(tmp);
        cache_get_field_content(0, "tempodesman", tmp);  OutrasInfos[extraid][oDesmancheTime] = strval(tmp);

CMD:ajudaemprego(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
	switch(PlayerInfo[playerid][pJob])
	{
		case JOB_DESMANCHE:
	    {
	        SendClientMessage(playerid, COLOR_LIGHTGREEN, "_______________________________________");
	        SendClientMessage(playerid, COLOR_WHITE, "Seu atual emprego é:");
	        SendClientMessage(playerid, COLOR_GREY, " Mêcanico Ilegal");
	        SendClientMessage(playerid, COLOR_YELLOW, "Comandos: {ffffff}Utilize {FFFF00}/desmanchar {ffffff}para desmanchar um veículo.");
	        SendClientMessage(playerid, COLOR_YELLOW, "Comandos: {ffffff}Utilize {FFFF00}/minhaspecas {ffffff}para checar suas atuais peças.");
	        SendClientMessage(playerid, COLOR_YELLOW, "Comandos: {ffffff}Utilize {FFFF00}/parardemanche {ffffff}para parar de desmanchar.");
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "_______________________________________");
		}
    }
    return 1;
}

COMMAND:pontodesmanche(playerid, params[])
{
    if (PlayerInfo[playerid][pLogado] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ACESSO NEGADO: {FFFFFF}você deve estar conectado antes de usar algum comando.");
    if(PlayerInfo[playerid][pAdmin] < 5) return 1;
	new targetid, inter;
	if(sscanf(params, "ui", targetid, inter)) SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} /pontodesmanche [id] [range]");
	else
	{
	    if (PlayerInfo[targetid][pLogado] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} O jogador não está logado.");
	    if (!IsPlayerConnected(targetid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Este jogador não está conectado!");
	    new Float:xls,Float:yls,Float:zls;
		GetPlayerPos(targetid,xls,yls,zls);

		OutrasInfos[targetid][oDesmancheX] = xls;
		OutrasInfos[targetid][oDesmancheY] = yls;
		OutrasInfos[targetid][oDesmancheZ] = zls;
		OutrasInfos[targetid][oDesmancheR] = inter;

		new query[528];
		format(query,sizeof(query),"UPDATE `accounts` SET `desmanx`='%.4f',`desmany`='%.4f',`desmanz`='%.4f',`desmanr`='%.4f' WHERE `ID` = '%d'",
		OutrasInfos[targetid][oDesmancheX],
		OutrasInfos[targetid][oDesmancheY],
		OutrasInfos[targetid][oDesmancheZ],
		OutrasInfos[targetid][oDesmancheR],
		PlayerInfo[targetid][pID]);
		mysql_function_query(Pipeline, query, true, "OnQueryFinish", "ii", THREAD_NO_RESULT, playerid);
        

		format(string,sizeof(string),"AdmCmd: Você setou o ponto de desmanche de %s.",PlayerName(targetid, 0));
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
	}
	return 1;
}

CMD:minhaspecas(playerid,params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não está logado!");
	//if(PlayerInfo[playerid][pJob] != JOB_MECANICO && PlayerInfo[playerid][pJob] != JOB_DESMANCHE) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não é um mecânico.");
	format(string,sizeof(string),"_______Peças de %s:_______", PlayerName(playerid, 0));
	SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
	format(string,sizeof(string),"[Rádio (%d)] [Neon (%d)] [GPS (%d)]", PlayerInfo[playerid][pPecasMecanicas][0], PlayerInfo[playerid][pPecasMecanicas][1], PlayerInfo[playerid][pPecasMecanicas][2]);
    SendClientMessage(playerid,-1,string);
    format(string,sizeof(string),"[Immob (%d)] [Tranca (%d)] [Peça de Reparo (%d)]", PlayerInfo[playerid][pPecasMecanicas][3], PlayerInfo[playerid][pPecasMecanicas][4], PlayerInfo[playerid][pPecasMecanicas][5]);
    SendClientMessage(playerid,-1,string);
    SendClientMessage(playerid,COLOR_CINZA, "Você pode usar o comando /darpeca para entregar uma a alguém.");
	return 1;
}

CMD:desmanchar(playerid, params[])
{
    if(PlayerInfo[playerid][pJob] != JOB_DESMANCHE) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você não é um perito de desmanche.");

	new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsATruck(vehicleid) && !IsASUV(vehicleid) && !IsAVan(vehicleid) && !IsAPopularCar(vehicleid) && !IsASportCar(vehicleid) && !IsAUnique(vehicleid) && !IsABike(vehicleid) && !IsABicicleta(vehicleid))
        return SendClientMessage(playerid,COLOR_LIGHTRED,"Este veículo não pode ser desmanchado.");

    new partes[7];
    GetVehicleParamsEx(vehicleid, partes[0], partes[1], partes[2], partes[3], partes[4], partes[5], partes[6]);

	if(!IsPlayerInRangeOfPoint(playerid,OutrasInfos[playerid][oDesmancheR], OutrasInfos[playerid][oDesmancheX], OutrasInfos[playerid][oDesmancheY], OutrasInfos[playerid][oDesmancheZ]))
		return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} Você não está no seu ponto de desmanche.");

	if(OutrasInfos[playerid][oDesmancheTime] > 0)
	    return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} Você ainda não pode desmanchar outro veículo.");

	if(partes[0]) return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} O veículo precisa estar desligado.");

    if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você precisa ser o motorista para usar este comando.");

	new Float:btc, veh = GetPlayerVehicleID(playerid);
 	GetVehicleHealth(veh, btc);
  	if(btc <= 300) return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} O motor deste veículo está quebrado!");

    if(!IsEngineVehicle(veh)) return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} Este veículo não pode ser desmanchado!");

	if(PlayerInfo[playerid][pToolKit] == 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"ERRO:{FFFFFF} Você não possui um kit de ferramentas.");

	if (JaEstaDesmanchando[playerid] > 0) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você já está desmanchando.");

	new slot = GetVehicleSlot(veh);
	if(slot > -1)
	{
		if(VehicleInfo[slot][vLocked]) return SendClientMessage(playerid,COLOR_LIGHTRED,"Você não pode desmanchar um veículo trancado.");
	    //TogglePlayerControllable(playerid, 0);
		JaEstaDesmanchando[playerid] = veh;
		Desmanchando[playerid] = SetTimerEx("DesmanchandoVeh", 60000, 0, "ii", playerid, 1);

		format(string, sizeof(string), "* %s retira uma ferramenta do kit e começa a desmanchar o veículo.", PlayerName(playerid, 1));
	 	ProxDetector(8.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	 	SCM(playerid, COLOR_LIGHTRED, "ATENÇÃO: Se você sair do veículo antes do desmanche terminar, ele será cancelado.");
	}
	else
	{
	    SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Este veículo não pode ser desmanchado.");
	}
	return 1;
}

forward DesmanchandoVeh(playerid, parte);
public DesmanchandoVeh(playerid, parte)
{
    new vid = GetPlayerVehicleID(playerid), panels, doors, lights, tires;
    if(vid != JaEstaDesmanchando[playerid])
	{
 		KillTimer(Desmanchando[playerid]);
		JaEstaDesmanchando[playerid] = 0;
 		//TogglePlayerControllable(playerid, 1);
	 	SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você saiu do veículo que estava sendo desmanchado.");
   		return 1;
	}
	if(!IsEngineVehicle(vid)) return SendClientMessage(playerid,COLOR_LIGHTRED, "ERRO:{FFFFFF} O veículo não pode estar ligado para ser desmanchado!");

	switch(parte)
	{
	    case 1:
		{
			GetVehicleDamageStatus(vid, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(vid, panels, 4, lights, 15);
			Desmanchando[playerid] = SetTimerEx("DesmanchandoVeh", 30000, 0, "ii", playerid, 2);
		}
		case 2:
		{
			GetVehicleDamageStatus(vid, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(vid, panels, 1024, lights, 15);
		 	Desmanchando[playerid] = SetTimerEx("DesmanchandoVeh", 30000, 0, "ii", playerid, 3);
		}
		case 3:
		{
		    GetVehicleDamageStatus(vid, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(vid, panels, 262144, lights, 15);
			Desmanchando[playerid] = SetTimerEx("DesmanchandoVeh", 30000, 0, "ii", playerid, 4);
		}
		case 4:
		{
		    GetVehicleDamageStatus(vid, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(vid, panels, 67108864, lights, 15);
			if(IsATruck(vid))
			{
				PlayerInfo[playerid][pPecasMecanicas][5]+= 32;
				PlayerInfo[playerid][pGranaSuja] += 9000;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 32 peças de carro e R$9,000 sujo por desmanchar este veículo.");
			}
			else if(IsASUV(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 25;
				PlayerInfo[playerid][pGranaSuja] += 7000;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 25 peças de carro e R$7,000 sujo por desmanchar este veículo.");
			}
			else if(IsASportCar(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 20;
				PlayerInfo[playerid][pGranaSuja] += 6000;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 20 peças de carro e R$6,000 sujo por desmanchar este veículo.");
			}
			else if(IsAVan(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 27;
				PlayerInfo[playerid][pGranaSuja] += 5500;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 27 peças de carro e R$5,500 sujo por desmanchar este veículo.");
			}
			else if(IsAPopularCar(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 18;
				PlayerInfo[playerid][pGranaSuja] += 4000;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 18 peças de carro e R$4,000 sujo por desmanchar este veículo.");
			}
			else if(IsAUnique(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 17;
				PlayerInfo[playerid][pGranaSuja] += 3600;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 17 peças de carro e R$3,600 sujo por desmanchar este veículo.");
			}
			else if(IsABike(vid))
			{
		 		PlayerInfo[playerid][pPecasMecanicas][5]+= 2;
				PlayerInfo[playerid][pGranaSuja] += 1200;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 6 peças de carro e R$1,200 sujo por desmanchar este veículo.");
			}
			else if(IsABicicleta(vid))
			{
				PlayerInfo[playerid][pPecasMecanicas][5]+= 1;
				PlayerInfo[playerid][pGranaSuja] += 900;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 4 peças de carro e R$900 sujo por desmanchar este veículo.");
			}
			else
			{
			    PlayerInfo[playerid][pPecasMecanicas][5]+= 3;
				PlayerInfo[playerid][pGranaSuja] += 500;
				SCM(playerid, COLOR_LIGHTGREEN, "Você recebeu 3 peças de carro e R$500 sujo por desmanchar este veículo.");
			}
			new slot = GetVehicleSlot(vid);
			if(slot > -1)
			{
			    if(VehicleInfo[slot][vRadio] != 0)
			    {
			        new certoornot = randomEx(0,1);
			    	VehicleInfo[slot][vRadio] = 0;
					if(certoornot == 1)
					{
						PlayerInfo[playerid][pPecasMecanicas][0]++;
						SCM(playerid, COLOR_LIGHTGREEN, "- Você retirou um rádio do veículo.");
					}
					else
					{
					    SCM(playerid, COLOR_LIGHTGREEN, "- Você estragou o rádio do veículo tentando tira-lo.");
					}
				}
				if(VehicleInfo[slot][vImmob] > 0)
				{
				    new totalpecas = randomEx(0,VehicleInfo[slot][vImmob]);
		  			PlayerInfo[playerid][pPecasMecanicas][3] += totalpecas;

		            if(VehicleInfo[slot][vImmob] == 0) format(string, sizeof(string), "- Você estragou as peças de imob do veículo.");
		  			else if(VehicleInfo[slot][vImmob] == 1) format(string, sizeof(string), "- Você retirou %d peça de imob do veículo.", totalpecas);
					else format(string, sizeof(string), "- Você retirou %d peças de imob do veículo.", totalpecas);
					SCM(playerid, COLOR_LIGHTGREEN, string);

					VehicleInfo[slot][vImmob] = 0;
				}
				if(VehicleInfo[slot][vLock] > 0)
				{
					new totalpecas = randomEx(0,VehicleInfo[slot][vLock]);
		   			PlayerInfo[playerid][pPecasMecanicas][4] += totalpecas;

					if(VehicleInfo[slot][vImmob] == 0) format(string, sizeof(string), "- Você estragou as peças de tranca do veículo.");
		  			else if(VehicleInfo[slot][vImmob] == 1) format(string, sizeof(string), "- Você retirou %d peça de tranca do veículo.", totalpecas);
					else format(string, sizeof(string), "- Você retirou %d peças de tranca do veículo.", totalpecas);
					SCM(playerid, COLOR_LIGHTGREEN, string);

					VehicleInfo[slot][vLock] = 0;
				}

		        if(!IsABike(vid) && !IsABicicleta(vid))
				{
			        new Float:VehX, Float:VehY, Float:VehZ, Float:VehAngle; //Aqui eu crio umas variáveis pra armazenar a posição do veículo
					GetVehiclePos(vid, VehX, VehY, VehZ); //Pego a posição X, Y e Z do veículo
					GetVehicleZAngle(vid, VehAngle); //E o angulo do veículo
					Carcaca[vid] = CreateDynamicObject(3594, VehX, VehY, VehZ, 0.0, 0.0, VehAngle);
			        CarcacaCar[vid] = 0;
			        SetPlayerPos(playerid, VehX, VehY, VehZ+1.5);
				}

				new vname[256];
				new Float:X, Float:Y, Float:Z, Float:R;
		 		SaveVehicleDamage(vid);
				GetVehiclePos(vid,X,Y,Z);
				GetVehicleZAngle(vid,R);

				VehicleInfo[slot][vDesmanchado] = 1;
				VehicleInfo[slot][vSpawnR] = 0.0;
				VehicleInfo[slot][vInterior] = 0;
				VehicleInfo[slot][vWorld] = 0;

				ResetTuning(slot);
				ChangeVehiclePaintjob( vid, 3 );

				GetVehicleNameByModel(VehicleInfo[slot][vModel],vname);
				VehicleInfo[slot][vNeonState] = 0;
				if(VehicleInfo[slot][vSirene][0] != 0)
				{
					if(IsValidDynamicObject(VehicleInfo[slot][vSirene][0])) DestroyDynamicObject(VehicleInfo[slot][vSirene][0]);
					VehicleInfo[slot][vSirene][0] = 0;
				}
				DestruirObjetosCarro(slot,VehicleInfo[slot][vVehicle]);
			    VehicleInfo[slot][vTuned] = false;

				DestroyVehicle(VehicleInfo[slot][vVehicle]);
				VehicleInfo[slot][vVehicle] = -1;

				SaveVehicle(slot);
			}

			if(PlayerInfo[playerid][pDoador] >= 2) OutrasInfos[playerid][oDesmancheTime] = 60;
			else OutrasInfos[playerid][oDesmancheTime] = 300;

			KillTimer(Desmanchando[playerid]);
			JaEstaDesmanchando[playerid] = 0;
			SetVehicleHealth(vid, 300);
			TogglePlayerControllable(playerid, 1);
		}
	}
	return 1;
}

forward IsABicicleta(carid);
public IsABicicleta(carid)
{
	new id = GetVehicleModel (carid);
   	if(id == 481 || id == 509 || id == 510) {
	   return 1;
   }
 	return 0;
}

forward IsABike(carid);
public IsABike(carid)
{
	new id = GetVehicleModel (carid);
   	if(id == 461 || id == 462 || id == 463 || id == 468 || id == 521 || id == 522 || id == 581 || id == 586 || id == 471) {
	   return 1;
   }
 	return 0;
}

forward IsATruck(carid);
public IsATruck(carid)
{
	new id = GetVehicleModel (carid);
   	if(id == 403 || id == 406 || id == 408 || id == 414 || id == 423 || id == 428 || id == 431 || id == 433 || id == 437 || id == 443 || id == 455 || id == 456 || id == 498 || id == 514 || id == 515 || id == 524 || id == 532 || id == 573 || id == 578 || id == 609) {
	   return 1;
   }
 	return 0;
}

forward IsASUV(carid);
public IsASUV(carid)
{
	new id = GetVehicleModel (carid);
	if (id == 400 || id ==  404 || id == 470 || id == 489 || id == 495 || id == 500 || id == 505 || id == 579 || id == 424 || id == 508)
	{
		return 1;
	}
  	return 0;
}

forward IsASportCar(carid);
public IsASportCar(carid)
{
	new id = GetVehicleModel(carid);
	if (id == 411 || id == 415 || id == 429 || id == 451 || id == 477 || id == 480 || id == 494 || id == 502 || id == 503 || id == 506 || id == 541 || id == 559 || id == 560 || id == 562 || id == 565  || id == 587 || id == 589 || id == 602 || id == 603 || id == 409 || id == 504 || id == 558) {
		return 1;
	}
	return 0;
}

forward IsAVan(carid);
public IsAVan(carid)
{
	new id = GetVehicleModel (carid);
	if (id == 413 || id == 418 || id == 422 || id == 440|| id == 459 || id == 478 || id == 482 || id == 483 || id == 525 || id == 535 || id == 543 || id == 554 || id == 605 || id == 574 || id == 583 || id == 588 || id == 552 || id == 530)
	{
		return 1;
	}
	return 0;
}

forward IsAPopularCar(carid);
public IsAPopularCar(carid)
{
	new id = GetVehicleModel (carid);
	if (id == 401 || id == 402 || id == 404 || id == 405 || id == 410 || id == 412 || id == 419 || id == 420 || id == 421 || id == 426 || id == 436 || id == 438 || id == 439 || id == 442 || id == 445 || id == 457 || id == 458 || id == 466 || id == 467 || id == 474 || id == 475 || id == 479 || id == 491
	|| id == 492 || id == 496 || id == 507 || id == 516 || id == 517 || id == 518 || id == 526 || id == 527 || id == 529 || id == 531 || id == 533 || id == 534 || id == 536 || id == 540 || id == 542 || id == 546 || id == 547 || id == 549 || id == 550
	|| id == 551 || id == 555 || id == 561 || id == 566 || id == 567 || id == 575 || id == 576 || id == 580 || id == 585 || id == 600 || id == 604)
	{
		return 1;
	}
	return 0;
}

forward IsAUnique(carid);
public IsAUnique(carid)
{
	new id = GetVehicleModel (carid);
	if (id == 485 || id == 486 || id == 532 || id == 539 || id == 545 || id == 568 || id == 572 || id == 556 || id == 557 || id == 434)
	{
		return 1;
	}
	return 0;
}


stock IsEngineVehicle(vehicleid)
{
	static const g_aEngineStatus[] = {
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
	};
    new modelid = GetVehicleModel(vehicleid);

    if (modelid < 400 || modelid > 611)
        return 0;

    return (g_aEngineStatus[modelid - 400]);
}

CMD:parardemanche(playerid, params[])
{
 	KillTimer(Desmanchando[playerid]);
	JaEstaDesmanchando[playerid] = 0;
 	//TogglePlayerControllable(playerid, 1);
 	SCM(playerid, COLOR_LIGHTRED, "ERRO:{FFFFFF} Você cancelou o desmanche do veículo.");
 	return 1;
}
