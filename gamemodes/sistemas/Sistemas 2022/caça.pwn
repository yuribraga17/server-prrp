#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <streamer>
 
//=============================define=================================================
#define ATENTIE 0xAFAFAFAA
//=============================mews=============================================
new PlayerText:DistanceTD[MAX_PLAYERS];
new
    JOB[MAX_PLAYERS], inJOB[MAX_PLAYERS], Car_Job[MAX_PLAYERS], timer_Car[MAX_PLAYERS],
    Seconds_timer[MAX_PLAYERS], Hunter_Deer[MAX_PLAYERS], Meeters_BTWDeer[MAX_PLAYERS],
    Meeters[MAX_PLAYERS], Deer[MAX_PLAYERS], Deep_Deer[MAX_PLAYERS], Meeter_Kill[MAX_PLAYERS],
    Shoot_Deer[MAX_PLAYERS];
//==============================================================================
public OnFilterScriptInit() {
 
 
    return 1;
}
//==============================================================================
public OnFilterScriptExit()
{
    print("\n--------------------------------------------------");
    print("    FILTERSCRIPT BY MENTOSAN ");
    print("  ~ Hunter ca pe NEFRIT ~                            ");
    print("----------------------------------------------------\n");
 
 
    return 1;
}
//==============================================================================
public OnGameModeInit() {
 
    CreateActor(139, 2354.5510, -658.7446, 128.0284, -90.5);
    Create3DTextLabel("{3CB371}Hunter JOB {FFFAFA}\n Tasteaza {3CB371}[/getjob]{FFFAFA} pentru a lua jobul", -1, 2355.0962, -658.8605, 128.0284, 10.5, 0, 0);
 
    return 1;
}
 
//======================STOCK'S=================================================
stock GetDistance( Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2 )
{
    return floatround( floatsqroot( ( (x1 - x2) * (x1 - x2) ) + ( (y1 - y2) * (y1 - y2) ) + ( (z1 - z2) * (z1 - z2) ) )  );
}
//======================FORWARD'S=================================================
forward Detectare_Intrare(playerid);
forward Next_Deer(playerid);
forward Detect_M(playerid);
forward Done_Deer(playerid);
//==============================================================================
 
public OnPlayerConnect(playerid) {
 
    JOB[playerid] = 0;
    inJOB[playerid] = 0;
 
    DistanceTD[playerid] = CreatePlayerTextDraw(playerid, 87.333358, 317.573242, "Distanta_xxxM");
    PlayerTextDrawLetterSize(playerid, DistanceTD[playerid], 0.363428, 1.297067);
    PlayerTextDrawTextSize(playerid, DistanceTD[playerid], 0.000000, 111.000000);
    PlayerTextDrawAlignment(playerid, DistanceTD[playerid], 2);
    PlayerTextDrawColor(playerid, DistanceTD[playerid], -1);
    PlayerTextDrawUseBox(playerid, DistanceTD[playerid], 1);
    PlayerTextDrawBoxColor(playerid, DistanceTD[playerid], 112);
    PlayerTextDrawSetShadow(playerid, DistanceTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, DistanceTD[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, DistanceTD[playerid], 189);
    PlayerTextDrawFont(playerid, DistanceTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, DistanceTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, DistanceTD[playerid], 0);
 
    return 1;
 
}
 
public OnPlayerDeath(playerid, killerid, reason) {
 
 
    return 1;
}
 
 
//================================[FUNCTII]====================================
public Detectare_Intrare(playerid) {
    if(Seconds_timer[playerid] == 120) {
        Seconds_timer[playerid] = 0;
        inJOB[playerid] = 0;
        ResetPlayerWeapons(playerid);
        DestroyVehicle(Car_Job[playerid]);
        KillTimer(Meeters_BTWDeer[playerid]);
        DestroyObject(Hunter_Deer[playerid]);
        PlayerTextDrawHide(playerid, DistanceTD[playerid]);
        DisablePlayerCheckpoint(playerid);
        Deep_Deer[playerid] = 0;
        Deer[playerid] = 0;
        Shoot_Deer[playerid] = 0;
        KillTimer(timer_Car[playerid]);
    }else {
        Seconds_timer[playerid]++;
    }
 
    return 1;
}
 
public Done_Deer(playerid) {
    new money = random(500) + 1000, mesaj[256], bonus;
    if(Meeter_Kill[playerid] >= 40) {
        bonus = 500 + random(100);
        money += bonus;
    }
    format(mesaj, sizeof(mesaj), "{1e90ff}(JOB):{FFFFFF} Pentru pielea acestei caprioare ai primit {7cfc00}${FFFFFF}%d.", money);
    SendClientMessage(playerid, -1, mesaj);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    ClearAnimations(playerid, 0);
    GivePlayerMoney(playerid, money);
    DestroyObject(Hunter_Deer[playerid]);
    TogglePlayerControllable(playerid, 1);
    SetTimerEx("Next_Deer", 1000, false, "i", playerid);
 
    return 1;
}
 
public Detect_M(playerid) {
    new Float:x, Float:y, Float:z, mesaj[256];
    GetPlayerPos(playerid, x, y, z);
    if(Deer[playerid] == 1) {
        Meeters[playerid] = GetDistance(x, y, z, 2046.7698, -799.4532, 127.0796);
    }else if(Deer[playerid] == 2) {
        Meeters[playerid] = GetDistance(x, y, z, 2021.18176, -494.02066, 76.19036);
    }else if(Deer[playerid] == 3) {
        Meeters[playerid] = GetDistance(x, y, z, 1632.5769, -599.7444, 62.0889);
    }else if(Deer[playerid] == 4) {
        Meeters[playerid] = GetDistance(x, y, z, 1741.4386, -979.5817, 36.9209);
    }else if(Deer[playerid] == 5) {
        Meeters[playerid] = GetDistance(x, y, z, 2553.6780, -963.4338, 82.0169);
    }else if(Deer[playerid] == 6) {
        Meeters[playerid] = GetDistance(x, y, z, 2637.4963, -380.2195, 58.2060);
    }else if(Deer[playerid] == 7) {
        Meeters[playerid] = GetDistance(x, y, z, 2406.9773, -403.4681, 72.4926);
    }
 
    format(mesaj, sizeof(mesaj), "Distanta_%dM", Meeters[playerid]);
    PlayerTextDrawSetString(playerid, DistanceTD[playerid], mesaj);
    PlayerTextDrawShow(playerid, DistanceTD[playerid]);
 
    return 1;
}
 
public Next_Deer(playerid) {
    new rand = random(8), mesaj[256];
    format(mesaj, sizeof(mesaj), "{1e90ff}(JOB):{FFFFFF} Du-te si omoara caprioara de la o distanta de minim 20M pentru a fi recompensat. ");
    SendClientMessage(playerid, -1, mesaj);
    switch(rand) {
        case 1: {
            Deer[playerid] = 1;
            Hunter_Deer[playerid] = CreateObject(19315, 2046.76978, -799.45319, 127.07957,   0.00000, 0.00000, 0.00000);
            SetPlayerCheckpoint(playerid, 2046.76978, -799.45319, 127.07957, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        case 2: {
            Deer[playerid] = 3;
            Hunter_Deer[playerid] = CreateObject(19315, 1632.57690, -599.74438, 62.08893,   0.00000, 0.00000, -52.38000);
            SetPlayerCheckpoint(playerid, 1632.5769, -599.7444, 62.0889, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        case 3: {
            Deer[playerid] = 4;
            Hunter_Deer[playerid] = CreateObject(19315, 1741.43860, -979.58167, 36.92095,   0.00000, 0.00000, -7.38000);
            SetPlayerCheckpoint(playerid, 1741.4386, -979.5817, 36.9209, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        case 4: {
            Deer[playerid] = 5;
            Hunter_Deer[playerid] = CreateObject(19315, 2553.67798, -963.43384, 82.01694,   0.00000, 0.00000, 0.00000);
            SetPlayerCheckpoint(playerid, 2553.6780, -963.4338, 82.0169, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        case 5: {
            Deer[playerid] = 6;
            Hunter_Deer[playerid] = CreateObject(19315, 2637.49634, -380.21954, 58.20603,   0.00000, 0.00000, -49.26000);
            SetPlayerCheckpoint(playerid, 2637.4963, -380.2195, 58.2060, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        case 6: {
            Deer[playerid] = 7;
            Hunter_Deer[playerid] = CreateObject(19315, 2406.97729, -403.46808, 72.49255,   0.00000, 0.00000, 0.00000);
            SetPlayerCheckpoint(playerid, 2406.9773, -403.4681, 72.4926, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
        default: {
            Deer[playerid] = 2;
            Hunter_Deer[playerid] = CreateObject(19315, 2021.18176, -494.02066, 76.19036,   0.00000, 0.00000, -71.64002);
            SetPlayerCheckpoint(playerid, 2021.18176, -494.02066, 76.19036, 1.0);
            Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
        }
    }
 
    return 1;
}
 
 
 
//==============================================================================
 
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ) {
    
    if(Deer[playerid] == 1) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2046.76978, -799.45319, 127.07957) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2046.7698, -799.4532, 126.7188, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasant CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 2) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2021.1818, -494.0207, 76.1904) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2021.18176, -494.02069, 76.19040, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasat CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 3) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1632.5769, -599.7444, 62.0889) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1632.57690, -599.74438, 61.82332, 3.5, 90.00000, 0.00000, -54.66002);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasand CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
 
                }
            }
        }
    }else if(Deer[playerid] == 4) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1741.4386, -979.5817, 36.9209) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1741.43860, -979.58173, 36.61147, 3.5, 90.00000, 0.00000, -7.38000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasand CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        } 
    }else if(Deer[playerid] == 5) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2553.6780, -963.4338, 82.0169) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2553.67798, -963.43378, 81.66848, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasand CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        } 
    }else if(Deer[playerid] == 6) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2637.4963, -380.2195, 58.2060) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2637.49634, -380.21951, 57.92605, 3.5, 90.00000, 0.00000, -49.26000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasand CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 7) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2406.9773, -403.4681, 72.4926) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);
 
                    if(Meeter_Kill[playerid] >= 20) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid],  2406.97729, -403.46811, 72.17617, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Ai omorat o caprioara de la distanta de {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasand CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Deoarace ai tras de la o distanta de {1e90ff}%d{FFFFFF}m, caprioara s-a speriat si a fugit. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }
 
    return 0;
}
 
public OnPlayerEnterCheckpoint(playerid) {
 
    DisablePlayerCheckpoint(playerid);
 
    return 1;
}
 
public OnPlayerPickUpPickup(playerid, pickupid) {
 
    return 1;
}
 
 
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    
    return 0;
}
 
 
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
 
    if(vehicleid == Car_Job[playerid]) {
        KillTimer(timer_Car[playerid]);
        Seconds_timer[playerid] = 0;
        //SendClientMessage(playerid, ATENTIE, "* backup");
    }
 
    return 1;
}
 
public OnPlayerExitVehicle(playerid, vehicleid) {
 
    if(vehicleid == Car_Job[playerid]) {
        timer_Car[playerid] = SetTimerEx("Detectare_Intrare", 1000, true, "i", playerid);
        Seconds_timer[playerid] = 0;
        SendClientMessage(playerid, ATENTIE, "* Ai la dispozitie 120secunde pentru a te intoarce in vehiculul de JOB.");
    }
 
    return 1;
}
 
 
//==============================================================================
 
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
   #define PRESSED(%0) \
     (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
 
     if(PRESSED(KEY_WALK)) {
        if(Deep_Deer[playerid] == 1) {
            if(IsPlayerInRangeOfPoint(playerid, 3.5, 2046.7698, -799.4532, 126.7188) && Deer[playerid] == 1) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false);
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2021.1818, -494.0207, 76.1904) && Deer[playerid] == 2) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false);
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1632.5769, -599.7444, 61.8233) && Deer[playerid] == 3) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1741.4386, -979.5817, 36.6115) && Deer[playerid] == 4) {
                TogglePlayerControllable(playerid, 0);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2553.6780, -963.4338, 81.6685) && Deer[playerid] == 5) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2637.4963, -380.2195, 57.9261) && Deer[playerid] == 6) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2406.9773, -403.4681, 72.1762) && Deer[playerid] == 7) {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 0);
                TogglePlayerControllable(playerid, 0);
                Deep_Deer[playerid] = 0;
                KillTimer(Meeters_BTWDeer[playerid]);
                Shoot_Deer[playerid] = 0;
                SetTimer("Done_Deer", 3500, false); 
            }
         }
     }
 
    
}
//================================[COMENZI CMD]=====================================
 
 
CMD:getjob(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 6.0, 2355.0962, -658.8605, 128.0284))  return 1;
    if(JOB[playerid] != 0)  return SendClientMessage(playerid, ATENTIE, "Eroare: Deja ai un job. Tasteaza [/quitjob]");
 
    JOB[playerid] = 1;
    inJOB[playerid] = 0;
    SendClientMessage(playerid, -1, "{1E90FF} Te-ai angajat la jobul Hunter. Pentru a incepe lucrul tasteaza [/work]. ");
 
    return 1;
}
 
CMD:work(playerid, params[]) {
    if(JOB[playerid] == 1) {
        if(!IsPlayerInRangeOfPoint(playerid, 1.0, 2351.7666, -658.1649, 128.0146)) {
            if(inJOB[playerid] == 1) return 1;
            else {
                SendClientMessage(playerid, ATENTIE, "* Trebuie sa fii la locul de WORK. Urmeaza CP-ul de pe harta! ");
                SetPlayerCheckpoint(playerid, 2351.7666, -658.1649, 128.0146, 3.5); 
            }
        }else {
            if(inJOB[playerid] == 1)
                 SendClientMessage(playerid, ATENTIE, "Eroare: Deja muncesti! ");
            else {
                inJOB[playerid] = 1;
                new rand = random(3);
                switch(rand) {
                    case 1: {
                        Car_Job[playerid] = CreateVehicle(505, 2343.4946, -655.7953, 128.8901, -180.5998, 225, 142, 100);
                    }
                    case 2: {
                        Car_Job[playerid] = CreateVehicle(505, 2343.9153, -647.9285, 128.8901, 1.5600, 120, 131, 100);
                    }
                    default: Car_Job[playerid] = CreateVehicle(505, 2360.3293, -648.1801, 128.8901, 1.5600, 162, 215, 100);
                }
                GivePlayerWeapon(playerid, 33, 99999);
                PutPlayerInVehicle(playerid, Car_Job[playerid], 0);
                Deep_Deer[playerid] = 0;
                Shoot_Deer[playerid] = 0;
 
                SetTimerEx("Next_Deer", 1000, false, "i", playerid);
            }
        }
    }
 
    return 1;
}
 
CMD:job(playerid, params[]) {
    SetPlayerPos(playerid, 2351.7666, -658.1649, 128.0146);
 
    return 1;
}