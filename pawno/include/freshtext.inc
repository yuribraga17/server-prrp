//============================================//
//===============[ Fresh Text ]===============//
//============================================//
#include <a_samp>
//============================================//
#define MAX_STREAMED_TEXTDRAWS 5000
//============================================//
enum textInfo
{
	tCreated,
	tOwner[MAX_PLAYER_NAME],
	Text:tID,
	tString[1024],
	Float:tPosX,
	Float:tPosY,
	Float:tLetterSizeX,
	Float:tLetterSizeY,
	Float:tTextSizeX,
	Float:tTextSizeY,
	tFont,
	tAlignment,
	tColor,
	tBox,
	tBoxColor,
	tShadow,
	tOutline,
	tProportional,
	tBackgroundColor
};
new TextInfo[MAX_STREAMED_TEXTDRAWS][textInfo];
//============================================//
forward Text:TextDrawCreateEx(Float:x, Float:y, text[]);
forward TextDrawDestroyEx(Text:text);
forward TextDrawLetterSizeEx(Text:text, Float:x, Float:y);
forward TextDrawTextSizeEx(Text:text, Float:x, Float:y);
forward TextDrawAlignmentEx(Text:text, alignment);
forward TextDrawColorEx(Text:text, color);
forward TextDrawUseBoxEx(Text:text, use);
forward TextDrawBoxColorEx(Text:text, color);
forward TextDrawSetShadowEx(Text:text, size);
forward TextDrawSetOutlineEx(Text:text, size);
forward TextDrawBackgroundColorEx(Text:text, color);
forward TextDrawFontEx(Text:text, font);
forward TextDrawSetProportionalEx(Text:text, set);
forward TextDrawShowForPlayerEx(playerid, Text:text);
forward TextDrawHideForPlayerEx(playerid, Text:text);
forward TextDrawSetStringEx(Text:text, string[]);
forward Text_OnPlayerDisconnect(playerid);
//============================================//
public Text:TextDrawCreateEx(Float:x, Float:y, text[])
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
	    if(TextInfo[i][tCreated] == 0)
		{
		    TextInfo[i][tPosX]=x;
		    TextInfo[i][tPosY]=y;
		    format(TextInfo[i][tString], 1024,"%s",text);
		    TextInfo[i][tCreated]=1;
		    SendDebugMessage(i, "TextDrawCreate");
		    return Text:i;
   		}
    }
    return Text:INVALID_TEXT_DRAW;
}
//============================================//
public TextDrawDestroyEx(Text:text)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tCreated]=0;
		    TextDrawDestroy(TextInfo[i][tID]);
		    SendDebugMessage(i, "TextDrawDestroy");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawLetterSizeEx(Text:text, Float:x, Float:y)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tLetterSizeX]=x;
		    TextInfo[i][tLetterSizeY]=y;
		    SendDebugMessage(i, "LetterSize");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawTextSizeEx(Text:text, Float:x, Float:y)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tTextSizeX]=x;
		    TextInfo[i][tTextSizeY]=y;
		    SendDebugMessage(i, "TextSize");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawAlignmentEx(Text:text, alignment)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tAlignment]=alignment;
		    SendDebugMessage(i, "SetAlignment");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawColorEx(Text:text, color)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tColor]=color;
		    SendDebugMessage(i, "TextColor");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawUseBoxEx(Text:text, use)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tBox]=use;
		    SendDebugMessage(i, "UseBox");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawBoxColorEx(Text:text, color)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tBoxColor]=color;
		    SendDebugMessage(i, "SetBoxColor");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawSetShadowEx(Text:text, size)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tShadow]=size;
		    SendDebugMessage(i, "SetShadow");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawSetOutlineEx(Text:text, size)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tOutline]=size;
		    SendDebugMessage(i, "SetOutline");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawBackgroundColorEx(Text:text, color)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tBackgroundColor]=color;
		    SendDebugMessage(i, "SetBGColor");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawFontEx(Text:text, font)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tFont]=font;
		    SendDebugMessage(i, "SetFont");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawSetProportionalEx(Text:text, set)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tProportional]=set;
		    SendDebugMessage(i, "SetProportional");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawShowForPlayerEx(playerid, Text:text)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextInfo[i][tID]=TextDrawCreate(TextInfo[i][tPosX], TextInfo[i][tPosY], TextInfo[i][tString]);
		    TextDrawLetterSize(TextInfo[i][tID], TextInfo[i][tLetterSizeX], TextInfo[i][tLetterSizeY]);
		    TextDrawTextSize(TextInfo[i][tID], TextInfo[i][tTextSizeX], TextInfo[i][tTextSizeY]);
		    TextDrawAlignment(TextInfo[i][tID], TextInfo[i][tAlignment]);
		    TextDrawColor(TextInfo[i][tID], TextInfo[i][tColor]);
		    TextDrawUseBox(TextInfo[i][tID], TextInfo[i][tBox]);
		    TextDrawBoxColor(TextInfo[i][tID], TextInfo[i][tBoxColor]);
		    TextDrawSetShadow(TextInfo[i][tID], TextInfo[i][tShadow]);
		    TextDrawSetOutline(TextInfo[i][tID], TextInfo[i][tOutline]);
		    TextDrawBackgroundColor(TextInfo[i][tID], TextInfo[i][tBackgroundColor]);
		    TextDrawFont(TextInfo[i][tID], TextInfo[i][tFont]);
		    TextDrawSetProportional(TextInfo[i][tID], TextInfo[i][tProportional]);
		    TextDrawShowForPlayer(playerid, TextInfo[i][tID]);
		    format(TextInfo[i][tOwner], 24,"%s",GetPlayerNameEx(playerid));
		    SendDebugMessage(i, "TextDrawShowForPlayer");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawHideForPlayerEx(playerid, Text:text)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextDrawHideForPlayer(playerid, TextInfo[i][tID]);
		    TextDrawDestroy(TextInfo[i][tID]);
		    SendDebugMessage(i, "TextDrawHideForPlayer");
		    return true;
		}
    }
    return true;
}
//============================================//
public TextDrawSetStringEx(Text:text, string[])
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && TextInfo[i][tID] == text)
		{
		    TextDrawSetString(TextInfo[i][tID], string);
		    SendDebugMessage(i, "SetString");
		    return true;
		}
    }
    return true;
}
//============================================//
public Text_OnPlayerDisconnect(playerid)
{
    for(new i=0; i < sizeof(TextInfo); i++)
    {
		if(TextInfo[i][tCreated] == 1 && strcmp(GetPlayerNameEx(playerid), TextInfo[i][tOwner], true) == 0)
		{
		    TextDrawHideForPlayerEx(playerid, TextInfo[i][tID]);
		    SendDebugMessage(i, "Disconnect");
		}
    }
    return true;
}
//============================================//
stock GetPlayerNameEx(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}
//============================================//
stock SendDebugMessage(id, func[])
{
	new string[128];
	format(string, sizeof(string),"(DEBUG): ID:%d - Function: %s", id, func);
	print(string);
}
//============================================//
#define TextDrawCreate          	TextDrawCreateEx
#define TextDrawDestroy         	TextDrawDestroyEx
#define TextDrawLetterSize          TextDrawLetterSizeEx
#define TextDrawTextSize            TextDrawTextSizeEx
#define TextDrawAlignment           TextDrawAlignmentEx
#define TextDrawColor               TextDrawColorEx
#define TextDrawUseBox              TextDrawUseBoxEx
#define TextDrawBoxColor            TextDrawBoxColorEx
#define TextDrawSetShadow           TextDrawSetShadowEx
#define TextDrawSetOutline          TextDrawSetOutlineEx
#define TextDrawBackgroundColor     TextDrawBackgroundColorEx
#define TextDrawFont                TextDrawFontEx
#define TextDrawSetProportional     TextDrawSetProportionalEx
#define TextDrawShowForPlayer       TextDrawShowForPlayerEx
#define TextDrawHideForPlayer       TextDrawHideForPlayerEx
#define TextDrawShowForAll          TextDrawShowForAllEx
#define TextDrawHideForAll          TextDrawHideForAllEx
#define TextDrawSetString           TextDrawSetStringEx
//============================================//