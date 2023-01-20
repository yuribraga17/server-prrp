new HavingBall[MAX_PLAYERS],
	Anim[MAX_PLAYERS];

//Seville
new	Ball_sv,
	BallStatus_sv,
	Baller_sv,
	ShootingBall_sv,
	BallBounce_sv;
	
//Idlewood Flats
new	Ball_idle,
	BallStatus_idle,
	Baller_idle,
	ShootingBall_idle,
	BallBounce_idle;

forward basket_OnPlayerConnect(playerid);
forward basket_OnGameModeInit();
forward basket_OnPlayerDeath(playerid);
forward basket_Disconnect(playerid);

public basket_OnGameModeInit()
{
	Baller_sv = 999;
	Ball_sv = CreateDynamicObject(2114, 362.0806,1958.4937,17.6500, 0, 0, 96);
	
	Baller_idle = 999;
	Ball_idle = CreateDynamicObject(2114, 174.3681,1885.0170,21.3575, 0, 0, 96);

	return 1;
}

public basket_OnPlayerConnect(playerid)
{
    HavingBall[playerid] = 0;
    Anim[playerid] = 0;
	return 1;
}

public basket_Disconnect(playerid)
{
    HavingBall[playerid] = 0;
    Anim[playerid] = 0;
	return 1;
}

public basket_OnPlayerDeath(playerid)
{
    HavingBall[playerid] = 0;
 	return 1;
}


CMD:abasquete(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return 1;
    if(!PlayerInfo[playerid][pAdmin]) return 1;
    new option[22];
    
    if(sscanf(params, "s[11]", option)) {
		SendClientMessage(playerid, COLOR_LIGHTRED, "USE: /abasquete [quadra nome]");
  		SendClientMessage(playerid, COLOR_LIGHTRED, "Quadras: idle, seville");
		return 1;
	}
	else {
		if(strcmp(option, "seville", true) == 0) {
			DestroyDynamicObject(Ball_sv);
			Ball_sv = CreateDynamicObject(2114, 362.0806,1958.4937,17.6500, 0, 0, 96);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você restaurou a bola de basquete do exército.");
		}
		else if(strcmp(option, "idle", true) == 0) {
			DestroyDynamicObject(Ball_idle);
			Ball_idle = CreateDynamicObject(2114, 174.3681, 1885.0170, 21.3575, 0, 0, 96);
            SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você restaurou a bola de basquete dos Flats Idlewood.");
		}
	}
	return 1;
}

forward BallDown(playerid, ballid, Float:oldz);
public BallDown(playerid, ballid, Float:oldz)
{
    new Float:x, Float:y, Float:z,
    	Float:a,
		Float:x2, Float:y2;
	
	if(ballid == 1) {
		GetDynamicObjectPos(Ball_sv, x, y, z);
		GetPlayerPos(playerid, x2, y2, a);
		GetPlayerFacingAngle(playerid, a);
		x2 += (16 * floatsin(-a, degrees));
		y2 += (16 * floatcos(-a, degrees));
		MoveDynamicObject(Ball_sv, x2, y2, oldz-0.8, 10.0+random(3));
		Baller_sv = 999;
		ShootingBall_sv = 0;
		BallBounce_sv = 1;
	}
	else if(ballid == 2) {
		GetDynamicObjectPos(Ball_idle, x, y, z);
  		GetPlayerPos(playerid, x2, y2, a);
		GetPlayerFacingAngle(playerid, a);
		x2 += (16 * floatsin(-a, degrees));
		y2 += (16 * floatcos(-a, degrees));
		MoveDynamicObject(Ball_idle, x2, y2, oldz-0.8, 10.0+random(3));
		Baller_idle = 999;
		ShootingBall_idle = 0;
		BallBounce_idle = 1;
	}
	return 1;
}

forward BallDown2(playerid, ballid);
public BallDown2(playerid, ballid)
{
	if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 351.3791,1957.8655,17.6500, 10.0+random(3));
		Baller_sv = 999;
		ShootingBall_sv = 0;
		GameTextForPlayer(playerid, "Cesta!", 3000, 3);
		BallBounce_sv = 1;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 174.7411, 1899.7939, 21.3574, 10.0+random(3));
		Baller_idle = 999;
		ShootingBall_idle = 0;
		GameTextForPlayer(playerid, "Cesta!", 3000, 3);
		BallBounce_idle = 1;
	}
	return 1;
}

forward BallDown3(playerid, ballid);
public BallDown3(playerid, ballid)
{
    if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 372.1654,1958.7483,17.6500, 10.0+random(3));
		Baller_sv = 999;
		ShootingBall_sv = 0;
		GameTextForPlayer(playerid, "Cesta!", 3000, 3);
		BallBounce_sv = 1;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 174.3839, 1879.3203, 21.3575, 10.0+random(3));
		Baller_idle = 999;
		ShootingBall_idle = 0;
		GameTextForPlayer(playerid, "Cesta!", 3000, 3);
		BallBounce_idle = 1;
	}
	return 1;
}

forward BallDown4(playerid, ballid);
public BallDown4(playerid, ballid) {
    if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 372.1575+random(5),1961.3132+random(5),17.6500, 10.0+random(3));
		Baller_sv = 999;
		ShootingBall_sv = 0;
		GameTextForPlayer(playerid, "Errou!", 3000, 3);
		BallBounce_sv = 1;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 174.1095+random(5),1878.6997+random(5),21.3575, 10.0+random(3));
		Baller_idle = 999;
		ShootingBall_idle = 0;
		GameTextForPlayer(playerid, "Errou!", 3000, 3);
		BallBounce_idle = 1;
	}
	return 1;
}

forward BallDown5(playerid, ballid);
public BallDown5(playerid, ballid)
{
	if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 351.9599+random(5),1955.6201+random(5),17.6500, 10.0+random(3));
		Baller_sv = 999;
		ShootingBall_sv = 0;
		GameTextForPlayer(playerid, "Errou!", 3000, 3);
		BallBounce_sv = 1;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 174.1095+random(5),1878.6997+random(5),21.3575, 10.0+random(3));
		Baller_idle = 999;
		ShootingBall_idle = 0;
		GameTextForPlayer(playerid, "Errou!", 3000, 3);
		BallBounce_idle = 1;
	}
	return 1;
}

forward ShootMiss(playerid, ballid);
public ShootMiss(playerid, ballid)
{
	if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 353.9287+random(2), 1957.6978+random(2), 17.6500+random(2), 12.5+random(4));
		ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
		ShootingBall_sv = 4;
		HavingBall[playerid] = 0;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 174.1095+random(2),1878.6997+random(2),21.3575+random(2), 12.5+random(4));
		ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
		ShootingBall_idle = 4;
		HavingBall[playerid] = 0;
	}
	return 1;
}

forward ShootMiss2(playerid, ballid);
public ShootMiss2(playerid, ballid)
{
    if(ballid == 1) {
		MoveDynamicObject(Ball_sv, 369.8143+random(2),1958.3297+random(2),17.6500+random(2), 12.5+random(4));
		ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
		ShootingBall_sv = 5;
		HavingBall[playerid] = 0;
	}
	else if(ballid == 2) {
		MoveDynamicObject(Ball_idle, 1954.5125+random(2),-1696.4565+random(2),12.5030+random(2), 12.5+random(4));
		ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
		ShootingBall_idle = 5;
		HavingBall[playerid] = 0;
	}
	return 1;
}

forward OnObjectMoved_Basket(objectid, ballid);
public OnObjectMoved_Basket(objectid, ballid) {

    new Keys, ud, lr,
		Float:x, Float:y, Float:z,
		Float:x2, Float:y2,
		i;
    
	if(ballid == 1) {
	    i = Baller_sv;

        if(i != 999) {
			if(ShootingBall_sv == 2) {
				BallDown2(i, 1);
				return 1;
		  	}
		   	else if(ShootingBall_sv == 3) {
				BallDown3(i, 1);
				return 1;
		  	}
		   	else if(ShootingBall_sv == 4) {
				BallDown4(i, 1);
				return 1;
			}
		 	else if(ShootingBall_sv == 5) {
				BallDown5(i, 1);
				return 1;
		  	}
		   	else if(ShootingBall_sv == 6) {
		    	ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
				if(i != 999){
					HavingBall[i] = 1;
					Anim[i] = 0;
				}
		  	}
		}
		
	  	GetDynamicObjectPos(Ball_sv, x, y, z);
	  	new endplay = 0;
	  	if(BallBounce_sv > 0)
	  	{
	  	    switch(BallBounce_sv) {
	  	        case 1: {
	  	            MoveDynamicObject(Ball_sv, x, y, z+1.2, 4);
	  	        }
	  	        case 2: {
	  	            MoveDynamicObject(Ball_sv, x, y, z-1.2, 4);
	  	        }
	  	        case 3: {
	  	            MoveDynamicObject(Ball_sv, x, y, z+0.8, 3);
	  	        }
	  	        case 4: {
	  	            MoveDynamicObject(Ball_sv, x, y, z-0.8, 3);
	  	        }
	  	        case 5: {
	  	            MoveDynamicObject(Ball_sv, x, y, z+0.5, 2);
	  	        }
	  	        case 6: {
	  	            MoveDynamicObject(Ball_sv, x, y, z-0.5, 2);
	  	        }
	  	        case 7: {
	  	            MoveDynamicObject(Ball_sv, x, y, z+0.2, 1);
	  	        }
	  	        case 8: {
	                MoveDynamicObject(Ball_sv, x, y, z-0.2, 1);
	                endplay = 1;
	                BallBounce_sv = 0;
	  	        }
	  	    }
	  	    if(endplay == 0) BallBounce_sv++;
		}

		if(i != 999) {
		    GetPlayerKeys(i, Keys, ud, lr);
			if(HavingBall[i]) {
				if(Anim[i]) {

	 				switch(BallStatus_sv) {
						case 0: {
							BallStatus_sv = 1;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_sv);
	 	    				GetXYInFrontOfPlayer(i, x2, y2, 0.4);
							MoveDynamicObject(Ball_sv, x2, y2, z+0.1, 5.5);
						}
						case 1:	{
				        	BallStatus_sv = 0;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_sv);
							GetXYInFrontOfPlayer(i, x2, y2, 0.4);
							MoveDynamicObject(Ball_sv, x2, y2, z-0.8, 5.5);
						}
					}
					return 1;
				}
	   			if(Keys & KEY_SPRINT) {
	      			ApplyAnimation(i,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1);
		        	switch(BallStatus_sv) {
						case 0: {
							BallStatus_sv = 1;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_sv);
	      					GetXYInFrontOfPlayer(i, x2, y2, 1.5);
							MoveDynamicObject(Ball_sv, x2, y2, z+0.1, 8);
						}
						case 1: {
	   						BallStatus_sv = 0;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_sv);
							GetXYInFrontOfPlayer(i, x2, y2, 1.5);
							MoveDynamicObject(Ball_sv, x2, y2, z-0.8, 8);
						}
					}
					return 1;
	    		}
			    else
			    {
	      			ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
			    }

		  		switch(BallStatus_sv) {
					case 0: {
						BallStatus_sv = 1;
						GetPlayerPos(i, x, y, z);
						StopDynamicObject(Ball_sv);
		    			GetXYInFrontOfPlayer(i, x2, y2, 1.2);
						MoveDynamicObject(Ball_sv, x2, y2, z+0.1, 5);
					}
					case 1: {
	   					BallStatus_sv = 0;
						GetPlayerPos(i, x, y, z);
						StopDynamicObject(Ball_sv);
						GetXYInFrontOfPlayer(i, x2, y2, 1.2);
						MoveDynamicObject(Ball_sv, x2, y2, z-0.8, 5);
					}
				}
			}
		}
	}
	else if(ballid == 2) {
	    i = Baller_idle;

        if(i != 999) {
			if(ShootingBall_idle == 2) {
				BallDown2(i, 2);
				return 1;
		  	}
		   	else if(ShootingBall_idle == 3) {
				BallDown3(i, 2);
				return 1;
		  	}
		   	else if(ShootingBall_idle == 4) {
				BallDown4(i, 2);
				return 1;
			}
		 	else if(ShootingBall_idle == 5) {
				BallDown5(i, 2);
				return 1;
		  	}
		   	else if(ShootingBall_idle == 6) {
		    	ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
				if(i != 999){
					HavingBall[i] = 2;
					Anim[i] = 0;
				}
		  	}
		}

	  	GetDynamicObjectPos(Ball_idle, x, y, z);
	  	new endplay = 0;
	  	if(BallBounce_idle > 0)
	  	{
	  	    switch(BallBounce_idle) {
	  	        case 1: {
	  	            MoveDynamicObject(Ball_idle, x, y, z+1.2, 4);
	  	        }
	  	        case 2: {
	  	            MoveDynamicObject(Ball_idle, x, y, z-1.2, 4);
	  	        }
	  	        case 3: {
	  	            MoveDynamicObject(Ball_idle, x, y, z+0.8, 3);
	  	        }
	  	        case 4: {
	  	            MoveDynamicObject(Ball_idle, x, y, z-0.8, 3);
	  	        }
	  	        case 5: {
	  	            MoveDynamicObject(Ball_idle, x, y, z+0.5, 2);
	  	        }
	  	        case 6: {
	  	            MoveDynamicObject(Ball_idle, x, y, z-0.5, 2);
	  	        }
	  	        case 7: {
	  	            MoveDynamicObject(Ball_idle, x, y, z+0.2, 1);
	  	        }
	  	        case 8: {
	                MoveDynamicObject(Ball_idle, x, y, z-0.2, 1);
	                endplay = 1;
	                BallBounce_idle = 0;
	  	        }
	  	    }
	  	    if(endplay == 0) BallBounce_idle++;
		}

		if(i != 999) {
		    GetPlayerKeys(i, Keys, ud, lr);
			if(HavingBall[i]) {
				if(Anim[i]) {

	 				switch(BallStatus_idle) {
						case 0: {
							BallStatus_idle = 1;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_idle);
	 	    				GetXYInFrontOfPlayer(i, x2, y2, 0.4);
							MoveDynamicObject(Ball_idle, x2, y2, z+0.1, 5.5);
						}
						case 1:	{
				        	BallStatus_idle = 0;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_idle);
							GetXYInFrontOfPlayer(i, x2, y2, 0.4);
							MoveDynamicObject(Ball_idle, x2, y2, z-0.8, 5.5);
						}
					}
					return 1;
				}
	   			if(Keys & KEY_SPRINT) {
	      			ApplyAnimation(i,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1);
		        	switch(BallStatus_idle) {
						case 0: {
							BallStatus_idle = 1;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_idle);
	      					GetXYInFrontOfPlayer(i, x2, y2, 1.5);
							MoveDynamicObject(Ball_idle, x2, y2, z+0.1, 8);
						}
						case 1: {
	   						BallStatus_idle = 0;
							GetPlayerPos(i, x, y, z);
							StopDynamicObject(Ball_idle);
							GetXYInFrontOfPlayer(i, x2, y2, 1.5);
							MoveDynamicObject(Ball_idle, x2, y2, z-0.8, 8);
						}
					}
					return 1;
	    		}
			    else
			    {
	      			ApplyAnimation(i,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
			    }

		  		switch(BallStatus_idle) {
					case 0: {
						BallStatus_idle = 1;
						GetPlayerPos(i, x, y, z);
						StopDynamicObject(Ball_idle);
		    			GetXYInFrontOfPlayer(i, x2, y2, 1.2);
						MoveDynamicObject(Ball_idle, x2, y2, z+0.1, 5);
					}
					case 1: {
	   					BallStatus_idle = 0;
						GetPlayerPos(i, x, y, z);
						StopDynamicObject(Ball_idle);
						GetXYInFrontOfPlayer(i, x2, y2, 1.2);
						MoveDynamicObject(Ball_idle, x2, y2, z-0.8, 5);
					}
				}
			}
		}
	}
	
	
	return 1;
}

forward KeyStateChangeBasket(playerid, newkeys, oldkeys);
public KeyStateChangeBasket(playerid, newkeys, oldkeys) {

    new keys, updown, leftright;
	GetPlayerKeys(playerid, keys, updown, leftright);

    new Float:x, Float:y, Float:z, Float:x2, Float:y2;
    
    if(!HavingBall[playerid]) {
		GetDynamicObjectPos(Ball_sv, x, y, z);
  		if(IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z)) {
			HavingBall[playerid] = 1;
			ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
			if(Baller_sv != 999) {
				HavingBall[Baller_sv] = 0;
				ClearAnimations(Baller_sv);
				ApplyAnimation(Baller_sv, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
			}
			Baller_sv = playerid;
			BallStatus_sv = 1;
			GetXYInFrontOfPlayer(playerid, x2, y2, 0.8);
			GetPlayerPos(playerid, x, y, z);
			StopDynamicObject(Ball_sv);
			MoveDynamicObject(Ball_sv, x2, y2, z, 2.5);
			Anim[playerid] = 0;
			BallBounce_sv = 0;
		}
		// Idlewood
        GetDynamicObjectPos(Ball_idle, x, y, z);
  		if(IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z)) {
			HavingBall[playerid] = 2;
			ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0);
			if(Baller_idle != 999) {
				HavingBall[Baller_idle] = 0;
				ClearAnimations(Baller_idle);
				ApplyAnimation(Baller_idle, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1);
			}
			Baller_idle = playerid;
			BallStatus_idle = 1;
			GetXYInFrontOfPlayer(playerid, x2, y2, 0.8);
			GetPlayerPos(playerid, x, y, z);
			StopDynamicObject(Ball_idle);
			MoveDynamicObject(Ball_idle, x2, y2, z, 2.5);
			Anim[playerid] = 0;
			BallBounce_idle = 0;
		}
	}
	else {
		if(HavingBall[playerid] == 1) {
   			if(IsPlayerInRangeOfPoint(playerid, 2, 2795.5237,-2019.6152,13.5547)) {
				MoveDynamicObject(Ball_sv, 174.5011,1886.0352,21.3574, 7.5);
				SetPlayerPos(playerid, 2795.5237,-2019.6152,13.5547);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 1100, 0, "d", playerid);
				SetTimerEx("BallDown2", 1100, 0, "dd", playerid, 1);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 4, 2795.5237,-2019.6152,13.5547) && IsPlayerFacingPoint(playerid, 20, 2795.5237,-2019.6152,13.5547)) {
				new rand = random(1);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 174.5011,1886.0352,21.3574, 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 1);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 7, 2795.5237,-2019.6152,13.5547) && IsPlayerFacingPoint(playerid, 20, 2795.5237,-2019.6152,13.5547)) {
				new rand = random(2);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 174.5011,1886.0352,21.3574, 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 1);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, 2795.5237,-2019.6152,13.5547) && IsPlayerFacingPoint(playerid, 20, 2795.5237,-2019.6152,13.5547)) {
				new rand = random(3);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 174.5011,1886.0352,21.3574, 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 1);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2, 2768.3669,-2019.6644,13.5547)) {
				MoveDynamicObject(Ball_sv, 2768.6289,-2019.7227,15.6287, 7.5);
				SetPlayerPos(playerid, 2768.3669,-2019.6644,13.5547);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 800, 0, "d", playerid);
				SetTimerEx("BallDown3", 1100, 0, "dd", playerid, 1);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 4, 2768.3669,-2019.6644,13.5547) && IsPlayerFacingPoint(playerid, 20, 2768.3669,-2019.6644,13.5547)) {
				new rand = random(1);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 2768.6289,-2019.7227,15.6287, 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid, 1);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 7, 2768.3669,-2019.6644,13.5547) && IsPlayerFacingPoint(playerid, 20, 2768.3669,-2019.6644,13.5547)) {
				new rand = random(2);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 2768.6289,-2019.7227,15.6287, 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid, 1);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, 2768.3669,-2019.6644,13.5547) && IsPlayerFacingPoint(playerid, 20, 2768.3669,-2019.6644,13.5547)) {
				new rand = random(3);
				if(rand == 0) {
					MoveDynamicObject(Ball_sv, 2768.6289,-2019.7227,15.6287, 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_sv = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
    			ShootMiss2(playerid, 1);
				return 1;
			}

			//==================================================================
			for(new i; i < MAX_PLAYERS; i++) {
				if(IsPlayerConnected(i) && PlayerInfo[i][pLogado]) {
					if(IsPlayerFacingPlayer(playerid, i, 15)) {
						GetPlayerPos(i, x, y, z);
						if(IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z)) {
							Baller_sv = i;
							HavingBall[playerid] = 0;
							ClearAnimations(playerid);
							ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							SetTimerEx("ClearAnim", 700, 0, "d", playerid);
							MoveDynamicObject(Ball_sv, x, y, z, 13+random(4));
							Anim[i] = 0;
							ShootingBall_sv = 6;
							ApplyAnimation(i,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							return 1;
						}
					}
				}
			}


			GetPlayerPos(playerid, x, y, z);
			HavingBall[playerid] = 0;
			GetXYInFrontOfPlayer(playerid, x2, y2, 6.0);
			SetTimerEx("BallDown", 600, 0, "ddf", playerid, 1, z);
			MoveDynamicObject(Ball_sv, x2, y2, z+random(8)+3, 10.0+random(4));
			ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
			ShootingBall_sv = 0;
		}
		else if(HavingBall[playerid] == 2) {
		    //==================================================================
		    //              		QUADRA DE IDLEWOOD
			//==================================================================
   			if(IsPlayerInRangeOfPoint(playerid, 2, 1982.0275, -1696.4082, 12.5030)) {
				MoveDynamicObject(Ball_idle, 1981.4975, -1696.3552, 15.4180, 7.5);
				SetPlayerPos(playerid, 1982.0275, -1696.4082, 13.3510);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 1100, 0, "d", playerid);
				SetTimerEx("BallDown2", 1100, 0, "dd", playerid, 2);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 4, 1982.0275, -1696.4082, 12.5030) && IsPlayerFacingPoint(playerid, 20, 1981.4975, -1696.3552, 15.4180)) {
				new rand = random(1);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 1981.4975, -1696.3552, 15.4180, 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 2);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 7, 1982.0275, -1696.4082, 12.5030) && IsPlayerFacingPoint(playerid, 20, 1981.4975, -1696.3552, 15.4180)) {
				new rand = random(2);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 1981.4975, -1696.3552, 15.4180, 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 2);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, 1982.0275, -1696.4082, 12.5030) && IsPlayerFacingPoint(playerid, 20, 1981.4975, -1696.3552, 15.4180)) {
				new rand = random(3);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 174.5011,1886.0352,21.3574, 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 2;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid, 2);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2, 1954.5082, -1696.4286, 13.1920)) {
				MoveDynamicObject(Ball_idle, 174.5011,1886.0352,21.3574, 7.5);
				SetPlayerPos(playerid, 1954.5082, -1696.4286, 13.1920);
				ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.0,1,0,0,0,0);
				HavingBall[playerid] = 0;
				SetTimerEx("ClearAnim", 800, 0, "d", playerid);
				SetTimerEx("BallDown3", 1100, 0, "dd", playerid, 2);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 4, 1954.5082, -1696.4286, 13.1920) && IsPlayerFacingPoint(playerid, 20, 1955.0382, -1696.4286, 15.3650)) {
				new rand = random(1);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 174.5011,1886.0352,21.3574, 10.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid, 2);
				return 1;
			}
   			else if(IsPlayerInRangeOfPoint(playerid, 7, 1954.5082, -1696.4286, 13.1920) && IsPlayerFacingPoint(playerid, 20, 1955.0382, -1696.4286, 15.3650)) {
				new rand = random(2);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 174.5011,1886.0352,21.3574, 11.0+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid, 2);
				return 1;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 10, 1954.5082, -1696.4286, 13.1920) && IsPlayerFacingPoint(playerid, 20, 1955.0382, -1696.4286, 15.3650)) {
				new rand = random(3);
				if(rand == 0) {
					MoveDynamicObject(Ball_idle, 174.5011,1886.0352,21.3574, 11.5+random(4));
					ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
					ShootingBall_idle = 3;
					HavingBall[playerid] = 0;
					return 1;
				}
    			ShootMiss2(playerid, 2);
				return 1;
			}

			//==================================================================
			for(new i; i < MAX_PLAYERS; i++) {
				if(IsPlayerConnected(i) && PlayerInfo[i][pLogado]) {
					if(IsPlayerFacingPlayer(playerid, i, 15)) {
						GetPlayerPos(i, x, y, z);
						if(IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z)) {
							Baller_idle = i;
							ClearAnimations(playerid);
							ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							SetTimerEx("ClearAnim", 700, 0, "d", playerid);
							MoveDynamicObject(Ball_idle, x, y, z, 13+random(4));
							Anim[i] = 0;
							ShootingBall_idle = 6;
							
							HavingBall[playerid] = 0;
							ApplyAnimation(i,"BSKTBALL","BBALL_def_loop",4.0,1,0,0,0,0);
							return 1;
						}
					}
				}
			}
			
			GetPlayerPos(playerid, x, y, z);
			HavingBall[playerid] = 0;
			GetXYInFrontOfPlayer(playerid, x2, y2, 6.0);
			SetTimerEx("BallDown", 600, 0, "ddf", playerid, 1, z);
			MoveDynamicObject(Ball_idle, x2, y2, z+random(8)+3, 10.0+random(4));
			ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
			ShootingBall_idle = 0;
		}
	}
	return 1;
}


//==============================================================================
stock IsPlayerFacingPoint(playerid, Float:dOffset, Float:pX, Float:pY, Float:pZ)
{
	#pragma unused pZ
	new
		Float:X,
		Float:Y,
		Float:Z,
		Float:pA,
		Float:ang;

	if(!IsPlayerConnected(playerid)) return 0;

	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, pA);

	if( Y > pY ) ang = (-acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
	else if( Y < pY && X < pX ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 450.0);
	else if( Y < pY ) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);

	if(AngleInRangeOfAngle(-ang, pA, dOffset)) return true;

	return false;

}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid))
	{
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}
