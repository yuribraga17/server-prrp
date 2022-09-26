/* Multi text lines include

   Version: 1.0
   Date: 2010-03-18
   Credits: KuHS

   What it do?
   It transfers string's text into two lines.

   What it used for?
   It's used for RolePlay servers. Basically most RP servers have /me /do /b commands.
   This function can transfer typed command text into multiple lines.
*/

#include <a_samp>

forward SendClientMessageA(playerid,color,text[]);

public SendClientMessageA(playerid,color,text[])
{
	new safetxt[256];
	format(safetxt,sizeof(safetxt),"%s",text);
	if(strlen(safetxt) <= 100) { SendClientMessage(playerid,color,text); }
	else {
		new line1[128],
		    line2[160];
		    
      	strmid(line1,safetxt,0,100);
      	strmid(line2,safetxt,100,256);
      	
      	format(line1, sizeof(line1), "%s...", line1);
   		format(line2, sizeof(line2), "...%s", line2);
		SendClientMessage(playerid,color,line1);
		SendClientMessage(playerid,color,line2);
	}
}
