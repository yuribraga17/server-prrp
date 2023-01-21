CMD:alugarveiculo(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
    if(IsVehicleRental(vehicleid))
    {
        if(RentCarKey[playerid] != vehicleid && !IsVehicleRented(vehicleid))
        {
			new cost = GetVehicleRentalPrice(GetVehicleModel(vehicleid));
			if(PlayerInfo[playerid][pGrana] >= cost)
			{
		        /*if(RentCarKey[playerid] != 9999)
		        {
					SetVehicleToRespawn(RentCarKey[playerid]);
		            RentCarKey[playerid] = 9999;
		        }
				*/
			    RentCarKey[playerid] = GetPlayerVehicleID(playerid);
			    PlayerInfo[playerid][pGrana] -= cost;
				SendClientMessage(playerid,COLOR_GREEN,"Você alugou um veículo, para desalugar, digite: /desalugarveiculo");
                SendClientMessage(playerid,COLOR_WHITE,"DICA: Para trancar o veículo, digite: /trancar");
                SendClientMessage(playerid,COLOR_WHITE,"/motor para ligar o veículo.");
				return 1;
			}
			else return SendClientMessage(playerid, COLOR_GRAD1, "Você nÃ£o tem dinheiro suficiente!");
        }
        else return SendClientMessage(playerid, COLOR_LIGHTRED,"Este veículo já foi alugado!");
    }
    else return GameTextForPlayer(playerid, "~r~Você deve estar em um veículo.", 5000, 1);
}

CMD:desalugarveiculo(playerid)
{
	if(RentCarKey[playerid] != 9999)
 	{
 	    SetVehicleToRespawn(RentCarKey[playerid]);
        RentCarKey[playerid] = 9999;

        return SendClientMessage(playerid,COLOR_GREEN,"Você desalugou o veículo.");
 	}
 	else return GameTextForPlayer(playerid, "~r~Você deve estar em um veículo.", 5000, 1);
}

/trancar
		{

			if (IsPlayerInAnyVehicle(playerid) && !IsVehicleRental(vehicleid)) {

				GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

				if(doors != 1)
				{
					format(str, sizeof(str), "~r~%s Trancado(a)", ReturnVehicleModelName(GetVehicleModel(vehicleid)));
					GameTextForPlayer(playerid, str, 2000, 4);
					SetVehicleParamsEx(vehicleid, engine, lights, alarm, 1, bonnet, boot, objective);
				}
				else
				{
					format(str, sizeof(str), "~g~%s Destrancado(a)", ReturnVehicleModelName(GetVehicleModel(vehicleid)));
					GameTextForPlayer(playerid, str, 2000, 4);
					SetVehicleParamsEx(vehicleid, engine, lights, alarm, 0, bonnet, boot, objective);
				}
				canlock = 1;
			}
			else
			{
				if( (!IsVehicleRental(vehicleid) && gLastCar[playerid] == vehicleid)  || RentCarKey[playerid] == vehicleid)
				{
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

					if(doors != 1)
					{
						format(str, sizeof(str), "~r~%s Trancado(a)", ReturnVehicleModelName(GetVehicleModel(vehicleid)));
						GameTextForPlayer(playerid, str, 2000, 4);
						SetVehicleParamsEx(vehicleid, engine, lights, alarm, 1, bonnet, boot, objective);
					}
					else
					{
						format(str, sizeof(str), "~g~%s Destrancado(a)", ReturnVehicleModelName(GetVehicleModel(vehicleid)));
						GameTextForPlayer(playerid, str, 2000, 4);
						SetVehicleParamsEx(vehicleid, engine, lights, alarm, 0, bonnet, boot, objective);
					}
					canlock = 1;
				}
			}

		}

stock IsVehicleRental(vehicleid)
{
	for(new c=0;c<sizeof(CarRent);c++) if(vehicleid == CarRent[c]) return 1;
	return 0;
}

stock GetVehicleRentalPrice(model)
{
	switch(model)
	{
	    case 492: return 100;
	    case 422: return 300;
	}
	return 0;
}

stock IsVehicleRented(vehicleid)
{
	foreach (new i : Player)
	{
		if(RentCarKey[i] == vehicleid) return 1;
	}
	return 0;
}

// Vehicle Rental
new CarRent[10];
new RentCarKey[MAX_PLAYERS];

OnGameModeInit
	AddVehicleRental();

stock AddVehicleRental()
{
    CarRent[0] = AddStaticVehicleEx(492,1664.2168,-2248.0488,-2.9842,90.2306,223,0, -1); // Green 1
    CarRent[1] = AddStaticVehicleEx(492,1653.5485,-2313.4810,-2.9741,269.5144,223,0, -1); // Green 2
	CarRent[2] = AddStaticVehicleEx(492,1560.7415,-2308.8511,13.3286,269.5454,223,0, -1); // 1
	CarRent[3] = AddStaticVehicleEx(492,1560.7153,-2312.1589,13.3285,269.5454,223,0, -1); // 2
	CarRent[4] = AddStaticVehicleEx(492,1560.6952,-2315.5034,13.3498,269.5466,223,0, -1); // 3
	CarRent[5] = AddStaticVehicleEx(422,1560.6693,-2318.7683,13.3567,269.5466,223,0, -1); // 4
	CarRent[6] = AddStaticVehicleEx(422,1560.6440,-2321.9934,13.3636,269.5466,223,0, -1); // 5
	CarRent[7] = AddStaticVehicleEx(422,1560.6185,-2325.2891,13.3706,269.5466,223,0, -1); // 6
	CarRent[8] = AddStaticVehicleEx(492,1560.5928,-2328.5264,13.3775,269.5466,223,0, -1); // 7
	CarRent[9] = AddStaticVehicleEx(492,1560.5668,-2331.8062,13.3845,269.5466,223,0, -1); // 8
    for(new c=0;c<sizeof(CarRent);c++)
    {
		ResetVehicle(CarRent[c]);
		SetVehicleNumberPlate(CarRent[c], "ALUGADO");
		SetVehicleHealth(CarRent[c], GetVehicleDataHealth(GetVehicleModel(CarRent[c])));

        Iter_Add(sv_vehicles, CarRent[c]);
        systemVariables[vehicleCounts][0]++;
    }
}

reset
    RentCarKey[playerid]=9999;

expira:
	new bool:done;
	for(new c=0;c<sizeof(CarRent);c++) {
        done = false;
		foreach (new i : Player) if(gLastCar[i] == CarRent[c] || RentCarKey[i] == CarRent[c]) done = true;
		if(!done) SetVehicleToRespawn(CarRent[c]);
	}

/motor
	if(Vehicle_GetID(vehicleid) != -1 || RentCarKey[playerid] == vehicleid || canstart)
	{
		switch (GetEngineStatus(vehicleid))
		{
			case false:
			{
				GetVehicleHealth(vehicleid,vhealth);

				if(vhealth > 650)
				{
					SetEngineStatus(vehicleid, true);
					GameTextForPlayer(playerid, "~g~Motor ligado!", 2000, 4);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ligou o motor do %s.", ReturnName(playerid, 0), g_arrVehicleNames[GetVehicleModel(vehicleid) - 400]);
				}
				else if(vhealth < 390) {
					if(!CoreVehicles[vehicleid][vehicleBadlyDamage]) {

					 	GameTextForPlayer(playerid, "~r~O MOTOR NÃƒO PODE LIGAR DEVIDO A DANOS", 5000, 4);
						SendClientMessage(playerid, COLOR_LIGHTRED, "SERVE: O motor estÃ¡ muito danificado.");
						SendClientMessage(playerid, COLOR_YELLOW, "DICA: Pressione o botÃ£o W para ligar o motor.");
						SendClientMessage(playerid, COLOR_YELLOW, "DICA: Você tem 10 para ligar o motor.");
						CoreVehicles[vehicleid][vehicleBadlyDamage] = 10;
					}
					else {
					    GameTextForPlayer(playerid, "~r~O MOTOR NÃƒO PODE LIGAR DEVIDO A DANOS", 5000, 4);
					}
					return 1;
				}
				else
				{
				    new owner_delay;
				    if(id != -1) owner_delay = floatround((VehicleData[CarData[id][carModel] - 400][c_engine] - CarData[id][carEngineL]) / 25);
					new delay = floatround(1300/vhealth) + owner_delay;
					if(delay > 5) { delay = 5; }

					if(delay == 0)
					{
						SetEngineStatus(vehicleid, true);
					}
					else
					{
						CoreVehicles[vehicleid][startup_delay] = delay;
						CoreVehicles[vehicleid][startup_delay_sender] = playerid;
						CoreVehicles[vehicleid][startup_delay_random] = delay;
					}
					GameTextForPlayer(playerid, "~g~Motor ligado", 2000, 4);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ligou o motor do %s.", ReturnName(playerid, 0), g_arrVehicleNames[GetVehicleModel(vehicleid) - 400]);
				}
				SetCooldown(playerid,COOLDOWN_ENGINE,3);
			}
			case true:
			{
				SetEngineStatus(vehicleid, false);
				SetLightStatus(vehicleid, false);
				GameTextForPlayer(playerid, "~r~Motor desligado", 2000, 4);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s desligou o motor do %s.", ReturnName(playerid, 0), g_arrVehicleNames[GetVehicleModel(vehicleid) - 400]);
                StopCarBoomBox(vehicleid);
			}
		}
	}