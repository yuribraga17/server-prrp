// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>
#include <a_http>
#if defined FILTERSCRIPT


public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("        Anti Proxy by Yur$		       ");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

forward MyHttpResponse(playerid, response_code, data[]);



public OnPlayerConnect(playerid)
{
	new ip[16], string[255];
	GetPlayerIp(playerid, ip, sizeof ip);
	format(string, sizeof string, "proxy.progressive-roleplay.com/index.php?ip=%s", ip);
	printf("%s", ip);
	HTTP(playerid, HTTP_GET, string, "", "MyHttpResponse");

    return 1;
}

 
public MyHttpResponse(playerid, response_code, data[])
{
	new name[MAX_PLAYERS],string[256];
	new ip[16];
	GetPlayerName(playerid, name, sizeof(name));
	GetPlayerIp(playerid, ip, sizeof ip);
	if(strcmp(ip, "127.0.0.1", true) == 0)
	{
		/*format(string, 256, "[ANTI-VPN] %s(%d) conectou-se ao servidor.", name, playerid);
	    SendClientMessage( 0x09F7DFC8, string);*/
        return 1;
	}
	
	if(response_code == 200)
	{	
		
        printf("IP %s conectando de %s", ip, data);
        if (strcmp(data, "Brazil", true)) 
		{
			format(string, 256, "AdmCmd: %s(%d) foi banido do servidor por usar VPN/PROXY.", name, playerid);
			SendClientMessageToAll( 0xFF6347AA, string);
			SetTimerEx("DelayedKick", 100, false, "i", playerid);
		}
		else
		{
			printf("A solicitação falhou! O código de resposta foi: %d", response_code);
		}
	}
	return 1;
}

forward DelayedKick(playerid);
public DelayedKick(playerid)
{
	new type[128], string [255];
	format(string, sizeof(string),"banip %s", type);
	SendRconCommand(string);
	SendRconCommand("reloadbans");
    Kick(playerid);
    return 1;
}


#endif