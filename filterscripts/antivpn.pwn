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
	format(string, sizeof string, "proxy.progressive-roleplay.com/proxy.php?ip=%s", ip);
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
		if(data[0] == 'Y')
		{
			format(string, 256, "[PROXY DETECTADO] %s(%d) foi kickado do servidor por usar VPN.", name, playerid);
	    	SendClientMessageToAll( 0xFF0000FF, string);
	    	SetTimerEx("DelayedKick", 100, false, "i", playerid);
		}
		if(data[0] == 'N')
		{
			/*format(string, 256, "[PROXY NÃO DETECTADO] %s(%d) conectou sem proxy.", name, playerid);
	    	SendClientMessage( 0x09F7DFC8, string );*/
		}
		if(data[0] == 'X')
		{
			printf("WRONG IP FORMAT");
		}
		else
		{
			printf("The request failed! The response code was: %d", response_code);
		}
	}
	return 1;
}

forward DelayedKick(playerid);
public DelayedKick(playerid)
{
    Kick(playerid);
    return 1;
}


#endif