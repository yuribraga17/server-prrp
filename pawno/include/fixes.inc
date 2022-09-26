/* Fixes from Y_Less, reduced down to the fixes for crashes on the SA-MP server.
	Kudos to whomever found these problems and the solutions for them.
	 Thanks for listening, and now, without further ado, the fixes! */

// File Timeout
#define FILE_TIMEOUT 10000

enum fileNTimer
{
	bool:open,
	timerID,
	File: fHandle
};
new timeouts[500][fileNTimer];

forward closeFileEx(index);
public closeFileEx(index)
{
	if(timeouts[index][open])
	{
		printf("Timeout Close at index: %d", index);
		if(timeouts[index][fHandle]) fclose(timeouts[index][fHandle]);
		if(timeouts[index][timerID] >= 0) KillTimer(timeouts[index][timerID]);
		timeouts[index][timerID] = -1;
		timeouts[index][open] = false;
	}
	return 1;
}

File:fopenHook(name[], filemode:mode = io_readwrite)
{
	new File: filehandle = fopen(name, mode);
	new index;
	for(new i = 0; i < sizeof(timeouts); i++)
	{
		if(!timeouts[i][open])
		{
			index = i;
			break;
		}
	}
	new timer = SetTimerEx("closeFileEx",  FILE_TIMEOUT, false, "i", index);
	timeouts[index][timerID] = timer;
	timeouts[index][fHandle] = filehandle;
	timeouts[index][open] = true;
	return filehandle;
}

#if defined _ALS_fopen
	#undef fopen
#else
	#define _ALS_fopen
#endif
#define fopen fopenHook

bool:fcloseHook(File: handle)
{
	new index = -1;
	for(new i = 0; i < sizeof(timeouts); i++)
	{
		if(timeouts[i][fHandle] == handle && timeouts[i][open])
		{
			index = i;
			break;
		}
	}
	new bool:retval = false;
	if(handle) retval = fclose(handle);
	if(index != -1)
	{
		if(timeouts[index][timerID] >= 0) KillTimer(timeouts[index][timerID]);
		timeouts[index][timerID] = -1;
		timeouts[index][open] = false;
	}
	return retval;
}

#if defined _ALS_fclose
	#undef fclose
#else
	#define _ALS_fclose
#endif
#define fclose fcloseHook

// Y_Less
/*
 * FIXES_valstr(dest[], value, bool:pack = false)
 *
 * FIXES:
 *     valstr
 */
stock FIXES_valstr(dest[], value, bool:pack = false)
{
	// "format" can't handle cellmin properly.
	static const
		sc_szCellmin[] = !"-2147483648";
	if (value == cellmin)
	{
		pack && strpack(dest, sc_szCellmin, 12) || strunpack(dest, sc_szCellmin, 12);
	}
	else
	{
		format(dest, 12, "%d", value);
		pack && strpack(dest, dest, 12);
	}
	return 0;
}

#if defined _ALS_valstr
	#undef valstr
#else

	native BAD_valstr(dest[], value, bool:pack = false) = valstr;

	#define _ALS_valstr
#endif
#define valstr FIXES_valstr
/*
 * FIXES_fclose(File:handle)
 *
 * FIXES:
 *     fclose
 */
/*stock bool:FIXES_fclose(File:handle)
{
	if (handle)
	{
		return fclose(handle);
	}
	return false;
}

#if defined _ALS_fclose
	#undef fclose
#else

	native BAD_fclose(File:handle) = fclose;

	#define _ALS_fclose
#endif
#define fclose FIXES_fclose*/
/*
 * FIXES_fwrite(File:handle, const string[])
 *
 * FIXES:
 *     fwrite
 */
stock FIXES_fwrite(File:handle, const string2[])
{
	if (handle)
	{
		return fwrite(handle, string2);
	}
	return 0;
}

#if defined _ALS_fwrite
	#undef fwrite
#else

	native BAD_fwrite(File:handle, const string[]) = fwrite;

	#define _ALS_fwrite
#endif
#define fwrite FIXES_fwrite
/*
 * FIXES_fread(File:handle, string[], size = sizeof (string), bool:pack = false)
 *
 * FIXES:
 *     fread
 */
stock FIXES_fread(File:handle, string2[], size = sizeof (string2), bool:pack = false)
{
	if (handle)
	{
		return fread(handle, string2, size, pack);
	}
	return 0;
}

#if defined _ALS_fread
	#undef fread
#else

	native BAD_fread(File:handle, string[], size = sizeof (string), bool:pack = false) = fread;

	#define _ALS_fread
#endif
#define fread FIXES_fread
/*
 * FIXES_fputchar(File:handle, value, bool:utf8 = true)
 *
 * FIXES:
 *     fputchar
 */
stock bool:FIXES_fputchar(File:handle, value, bool:utf8 = true)
{
	if (handle)
	{
		return fputchar(handle, value, utf8);
	}
   return false;
}

#if defined _ALS_fputchar
	#undef fputchar
#else

	native BAD_fputchar(File:handle, value, bool:utf8 = true) = fputchar;

	#define _ALS_fputchar
#endif
#define fputchar FIXES_fputchar
/*
 * FIXES_fgetchar(File:handle, value, bool:utf8 = true)
 *
 * FIXES:
 *     fgetchar
 */
stock FIXES_fgetchar(File:handle, value, bool:utf8 = true)
{
	if (handle)
	{
		return fgetchar(handle, value, utf8);
	}
	return 0;
}

#if defined _ALS_fgetchar
	#undef fgetchar
#else

	native BAD_fgetchar(File:handle, value, bool:utf8 = true) = fgetchar;

	#define _ALS_fgetchar
#endif
#define fgetchar FIXES_fgetchar
/*
 * FIXES_fblockwrite(File:handle, const buffer[], size = sizeof (buffer))
 *
 * FIXES:
 *     fblockwrite
 */
stock FIXES_fblockwrite(File:handle, const buffer[], size = sizeof (buffer))
{
	if (handle)
	{
		return fblockwrite(handle, buffer, size);
	}
	return 0;
}

#if defined _ALS_fblockwrite
	#undef fblockwrite
#else

	native BAD_fblockwrite(File:handle, const buffer[], size = sizeof (buffer)) = fblockwrite;

	#define _ALS_fblockwrite
#endif
#define fblockwrite FIXES_fblockwrite
/*
 * FIXES_fblockread(File:handle, buffer[], size = sizeof (buffer))
 *
 * FIXES:
 *     fblockread
 */
stock FIXES_fblockread(File:handle, buffer[], size = sizeof (buffer))
{
	if (handle)
	{
		return fblockread(handle, buffer, size);
	}
	return 0;
}

#if defined _ALS_fblockread
	#undef fblockread
#else

	native BAD_fblockread(File:handle, buffer[], size = sizeof (buffer)) = fblockread;

	#define _ALS_fblockread
#endif
#define fblockread FIXES_fblockread
/*
 * FIXES_fseek(File:handle, position = 0, seek_whence:whence = seek_start)
 *
 * FIXES:
 *     fseek
 */
stock FIXES_fseek(File:handle, position = 0, seek_whence:whence = seek_start)
{
	if (handle)
	{
		return fseek(handle, position, whence);
	}
	return 0;
}

#if defined _ALS_fseek
	#undef fseek
#else

	native BAD_fseek(File:handle, position = 0, seek_whence:whence = seek_start) = fseek;

	#define _ALS_fseek
#endif
#define fseek FIXES_fseek

/*
 * FIXES_flength(File:handle)
 *
 * FIXES:
 *     flength
 */
stock FIXES_flength(File:handle)
{
	if (handle)
	{
		return flength(handle);
	}
	return 0;
}

#if defined _ALS_flength
	#undef flength
#else

	native BAD_flength(File:handle) = flength;

	#define _ALS_flength
#endif
#define flength FIXES_flength
/*
 * Text:FIXES_TextDrawCreate(Float:x, Float:y, text[])
 *
 * FIXES:
 *     TextDrawCreate
 */
stock Text:FIXES_TextDrawCreate(Float:x, Float:y, text[])
{
	if (text[0] == '\0' || text[0] == '\1' && text[1] == '\0')
	{
		return TextDrawCreate(x, y, " ");
	}
	else
	{
		return TextDrawCreate(x, y, text);
	}
}

#if defined _ALS_TextDrawCreate
	#undef TextDrawCreate
#else

	native Text:BUG_TextDrawCreate(Float:x, Float:y, text[]) = TextDrawCreate;

	#define _ALS_TextDrawCreate
#endif
#define TextDrawCreate FIXES_TextDrawCreate
/*
 * FIXES_TextDrawSetString(Text:text, string[])
 *
 * FIXES:
 *     TextDrawSetString
 */
stock FIXES_TextDrawSetString(Text:text, string2[])
{
	if (string2[0] == '\0' || string2[0] == '\1' && string2[1] == '\0')
	{
		return TextDrawSetString(text, " ");
	}
	else
	{
		return TextDrawSetString(text, string2);
	}
}

#if defined _ALS_TextDrawSetString
	#undef TextDrawSetString
#else

	native BAD_TextDrawSetString(Text:text, string[]) = TextDrawSetString;

	#define _ALS_TextDrawSetString
#endif
#define TextDrawSetString FIXES_TextDrawSetString
/*
 * FIXES_HideMenuForPlayer(Menu:menuid, playerid
 *
 * FIXES:
 *     HideMenuForPlayer
 */
stock FIXES_HideMenuForPlayer(Menu:menuid, playerid)
{
	if (IsValidMenu(menuid))
	{
		return HideMenuForPlayer(menuid, playerid);
	}
	return 0;
}

#if defined _ALS_HideMenuForPlayer
	#undef HideMenuForPlayer
#else

	native BAD_HideMenuForPlayer(Menu:menuid, playerid) = HideMenuForPlayer;
	
	#define _ALS_HideMenuForPlayer
#endif
#define HideMenuForPlayer FIXES_HideMenuForPlayer

stock FIXES_ChangeVehicleColor(vehicleid, color1, color2)
{
	ChangeVehicleColor(vehicleid, color1, color2);
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
	    if(GetPVarInt(playerid, "CarTID1") == vehicleid)
		{
		    SetPVarInt(playerid, "CarC11", color1);
		    SetPVarInt(playerid, "CarC21", color2);
		}
		else if(GetPVarInt(playerid, "CarTID2") == vehicleid)
		{
		    SetPVarInt(playerid, "CarC12", color1);
		    SetPVarInt(playerid, "CarC22", color2);
		}
	}
}

#if defined _ALS_ChangeVehicleColor
	#undef ChangeVehicleColor
#else
    native bad_ChangeVehicleColor(vehicleid, color1, color2) = ChangeVehicleColor;
#define _ALS_ChangeVehicleColor
#endif
#define ChangeVehicleColor FIXES_ChangeVehicleColor

stock FIXES_ChangeVehiclePaintjob(vehicleid, paintjobid)
{
	ChangeVehiclePaintjob(vehicleid, paintjobid);
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
	    if(GetPVarInt(playerid, "CarTID1") == vehicleid)
		{
		    SetPVarInt(playerid, "CarPJ1", paintjobid);
		}
		else if(GetPVarInt(playerid, "CarTID2") == vehicleid)
		{
		    SetPVarInt(playerid, "CarPJ2", paintjobid);
		}
	}
}

#if defined _ALS_ChangeVehiclePaintjob
	#undef ChangeVehiclePaintjob
#else
    native bad_ChangeVehiclePaintjob(vehicleid, paintjobid) = ChangeVehiclePaintjob;
#define _ALS_ChangeVehiclePaintjob
#endif
#define ChangeVehiclePaintjob FIXES_ChangeVehiclePaintjob

stock FIXES_SetVehicleNumberPlate(vehicleid, numberplate[])
{
	if(!IsAPlane(vehicleid) && !IsAHelicopter(vehicleid) && !IsATrain(vehicleid) && !IsABoat(vehicleid))
	{
	    if(strlen(numberplate) <= 32)
	    {
	    	SetVehicleNumberPlate(vehicleid, numberplate);
		}
	}
}

#if defined _ALS_SetVehicleNumberPlate
	#undef SetVehicleNumberPlate
#else
    native bad_SetVehicleNumberPlate(vehicleid, numberplate[]) = SetVehicleNumberPlate;
#define _ALS_SetVehicleNumberPlate
#endif
#define SetVehicleNumberPlate FIXES_SetVehicleNumberPlate
