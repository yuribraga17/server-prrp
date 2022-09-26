#include <a_samp>

// if you have include foreach in your include folder, use define _foreach
#define _foreach
#include <foreach>
#define OXYGEN_DEBUG
#include <OxygenController>
#include <zcmd>

// Variables
new bool:oxstatus[MAX_PLAYERS];


// Callbacks

// Main
public OnFilterScriptInit()
{
    SetTimer("ostatus", 200, true);
    return (true);
}

// Oxygen
public OnPlayerEnterInWater(playerid)
{
    SendClientMessage(playerid, -1, "Aviso: Você mergulhou.");
    return (true);
}

public OnPlayerEnterUnderWater(playerid)
{
    SendClientMessage(playerid, -1, "WATER: Player enter under water");
    return (true);
}

public OnPlayerOutFromWater(playerid)
{
    SendClientMessage(playerid, -1, "WATER: Player out from water");
    return (true);
}


// Timer
forward ostatus();
public ostatus()
{
    new 
        tdstring[128];

    for(new i; i < MAX_PLAYERS; i++)
    {
        if(oxstatus[i])
        {
            switch (GetPlayerOxygenStatus(i))
            {
                case OXYGEN_NONE:
                {                   
                    format (tdstring, sizeof(tdstring), "~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~Oxigênio~n~~g~~h~~h~Quantidade~n~~w~status: %.2f/%.2f~n~depth: %.2f", GetPlayerOxygenValue(i), GetPlayerMaxOxygenValue(i), GetPlayerDepth(i));
                    GameTextForPlayer(i, tdstring, 1000, 3);
                }
                case OXYGEN_REFILL:
                {
                    format (tdstring, sizeof(tdstring), "~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~Oxigênio~n~~b~~h~~h~Reabastecer~n~~w~status: %.2f/%.2f~n~depth: %.2f", GetPlayerOxygenValue(i), GetPlayerMaxOxygenValue(i), GetPlayerDepth(i));
                    GameTextForPlayer(i, tdstring, 1000, 3);
                }
                case OXYGEN_SPENDING:
                {
                    format (tdstring, sizeof(tdstring), "~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~Oxigênio~n~~r~~h~~h~Velocidade~n~~w~status: %.2f/%.2f~n~depth: %.2f", GetPlayerOxygenValue(i), GetPlayerMaxOxygenValue(i), GetPlayerDepth(i));
                    GameTextForPlayer(i, tdstring, 1000, 3);
                }
            }
        }
    }
    return (true);
}