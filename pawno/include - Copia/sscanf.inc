#include <a_samp>

stock sscanf(stringgg2[], format[], {Float,_}:...)
{
	#if defined isnull
		if (isnull(stringgg2))
	#else
		if (stringgg2[0] == 0 || (stringgg2[0] == 1 && stringgg2[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringgg2Pos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (stringgg2[stringgg2Pos] && stringgg2[stringgg2Pos] <= ' ')
	{
		stringgg2Pos++;
	}
	while (paramPos < paramCount && stringgg2[stringgg2Pos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = stringgg2[stringgg2Pos];
				if (ch == '-')
				{
					neg = -1;
					ch = stringgg2[++stringgg2Pos];
				}
				do
				{
					stringgg2Pos++;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = stringgg2[stringgg2Pos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					num = 0,
					ch = stringgg2[stringgg2Pos];
				do
				{
					stringgg2Pos++;
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				while ((ch = stringgg2[stringgg2Pos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, stringgg2[stringgg2Pos++]);
			}
			case 'f':
			{

				new changestr[16], changepos = 0, strpos = stringgg2Pos;
				while(changepos < 16 && stringgg2[strpos] && stringgg2[strpos] != delim)
				{
					changestr[changepos++] = stringgg2[strpos++];
    				}
				changestr[changepos] = '\0';
				setarg(paramPos,0,_:floatstr(changestr));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(stringgg2, format[formatPos], false, stringgg2Pos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringgg2Pos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringgg2Pos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = stringgg2[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					stringgg2[end] = '\0';
					num = false;
					new
						name[MAX_PLAYER_NAME];
					id = end - stringgg2Pos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, stringgg2[stringgg2Pos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					stringgg2[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringgg2Pos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = stringgg2[stringgg2Pos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = stringgg2[stringgg2Pos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringgg2Pos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (stringgg2[stringgg2Pos] && stringgg2[stringgg2Pos] != delim && stringgg2[stringgg2Pos] > ' ')
		{
			stringgg2Pos++;
		}
		while (stringgg2[stringgg2Pos] && (stringgg2[stringgg2Pos] == delim || stringgg2[stringgg2Pos] <= ' '))
		{
			stringgg2Pos++;
		}
		paramPos++;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}