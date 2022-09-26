//==============================================================================
//                         Youtube Streamer Include by Usrb1n !
//                     http://forum.sa-mp.com/member.php?u=122322
//==============================================================================
#include <a_http>
forward U2BStream(playerid, response_code, data[]);
forward U2BStream2(playerid, response_code, data[]);
new YoutubeID[32];

stock YoutubeStream(playerid, vlink[])
{
	printf("youtube.inc: YoutubeStream(%d, %s) called.", playerid, vlink);
	new tempURL[128];
	
	new index = strfind(vlink, "watch?v=", true, -1);
	printf("youtube.inc: index of \"watch?v=\" is %d.", index);
	if(index != -1) { //if found the string "watch?v=" in the url (may return 0 on linux)
	
		strmid(tempURL, vlink, index, strlen(vlink), 255); // http://www.youtube.com/watch?v=tGc531yhEJU - extract chars from watch?v= to end of URL
		format(tempURL, sizeof(tempURL), "http://www.youtube.com/%s", tempURL);
		printf("youtube.inc: tempURL is now \"%s\"", tempURL);
	}
	
	new videoid[128], YoutubeString[128];
	strmid(videoid,tempURL,31,44,strlen(tempURL));
	printf("youtube.inc: videoid is %s", videoid);
	format(YoutubeString,sizeof(YoutubeString),"www.youtube-mp3.org/api/itemInfo/?video_id=%s",videoid);
	printf("youtube.inc: going to do an HTTP request to URL \"%s\", waiting for response", YoutubeString);
	strmid(YoutubeID, videoid, 0, 12);
    HTTP(playerid,HTTP_GET,YoutubeString,videoid,"U2BStream");
    HTTP(playerid,HTTP_GET,"ifconfig.me","","U2BStream2");
}

public U2BStream(playerid, response_code, data[])
{
	if(response_code == 200)
	{
        printf("youtube.inc: HTTP responded with code 200, proceeding...");
		printf("youtube.inc: data: %s", data);
	    new result[33], u2bstr[33]; new streamedurl[128];
		new crypted = strfind(data, "\"h\"", true);
		printf("youtube.inc: crypted is now %d", crypted);
		strmid(result,data,crypted+7,crypted+39,strlen(data));
		printf("youtube.inc: result is now \"%s\"", result);
		format(u2bstr,sizeof(u2bstr), "%s", result);
		format(streamedurl, sizeof(streamedurl), "http://www.youtube-mp3.org/get?video_id=%s&h=%s",YoutubeID, u2bstr);
		printf("youtube.inc: attempting to play streamedurl which is \"%s\"", streamedurl);
		PlayAudioStreamForPlayer(playerid, streamedurl);
  	}
  	else
    {
		SendClientMessage(playerid, 0xAFAFAFAA, "   Error attempting to convert video to mp3, to fix enter your link into youtube-mp3.org and try again !");
		printf("youtube.inc: failed and returned code %d", response_code);
    }
  	return 1;
}

public U2BStream2(playerid, response_code, data[])
{
	if(response_code == 200)
	{
        new File:file;
        file = fopen("output.log", io_write);
        if(file)
        {
            fwrite(file, data);
            fclose(file);
		}
  	}
  	else
    {
		SendClientMessage(playerid, 0xAFAFAFAA, "   Error attempting to convert video to mp3, to fix enter your link into youtube-mp3.org and try again !");
		printf("youtube.inc: failed and returned code %d", response_code);
    }
  	return 1;
}

stock YoutubeStopStream(playerid)
{
	PlayAudioStreamForPlayer(playerid, "Youtube streaming was stopped.");
}
