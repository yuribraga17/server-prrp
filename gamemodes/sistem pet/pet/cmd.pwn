COMMAND:darpet(playerid, params[])
{
    new targetid, petmodel;

    if(PlayerInfo[playerid][pAdmin] >= 5) return SendClientMessage(playerid, COLOR_LIGHTRED, "{FFFFFF}Você não é um administrador.");

    if(sscanf(params, "ud", targetid, petmodel))
        return SendClientMessage(playerid, COLOR_LIGHTRED, "/darpet [playerid] [petmodel]");

    if(!IsValidPetModel(petmodel))
        return SendClientMessage(playerid, COLOR_LIGHTRED, "Modelo de cachorro invalido!");   

    PetData[targetid][petModelID] = petmodel;
    format(PetData[targetid][petName], 128, "Jack");
    SendAdminMessage(color,strings[])(playerid, "You give %s a pet model id %d", ReturnName(targetid), petmodel);
    return 1;
}

COMMAND:petmenu(playerid, params[])
{
    if(!PetData[playerid][petModelID])
        return SendClientMessage(playerid, COLOR_LIGHTRED, "You dont have a pet!");

    ShowPetMenu(playerid);
    return 1;
}