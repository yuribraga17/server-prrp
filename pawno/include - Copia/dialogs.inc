// dialogs.inc - Adding new styles to SAMP GUI - v2.4.2
// By Gammix

#if defined _dialogs_included
	#endinput
#endif
#define _dialogs_included

enum
{
    DIALOG_STYLE_PREVMODEL = 6,
    DIALOG_STYLE_PREVMODEL_LIST
};

#define DIALOG_NORMAL_COLOR (169093220)
#define DIALOG_SELECTION_COLOR (1677721750)

#define DIALOG_MAX_TEXT_DRAWS (100)
static PlayerText:ptxtDialog[MAX_PLAYERS][DIALOG_MAX_TEXT_DRAWS];
static pPool[MAX_PLAYERS];

static pDialogId[MAX_PLAYERS];
static pDialogStyle[MAX_PLAYERS];
static bool:pDialogDualButtons[MAX_PLAYERS];
static pDialogTotalListitems[MAX_PLAYERS];
static pDialogPage[MAX_PLAYERS];
static pDialogListitem[MAX_PLAYERS];
static pDialogLastClick[MAX_PLAYERS];

#define DIALOG_MAX_PAGE_LISTITEMS (6 * 4)

enum E_DIALOG_COMPONENT
{
	E_DIALOG_COMPONENT_SCROLL_UP,
	E_DIALOG_COMPONENT_SCROLL_DOWN,
	E_DIALOG_COMPONENT_BUTTON1,
	E_DIALOG_COMPONENT_BUTTON2,
	E_DIALOG_COMPONENT_BUTTONC,
	E_DIALOG_COMPONENT_MODEL[DIALOG_MAX_PAGE_LISTITEMS],
	E_DIALOG_COMPONENT_LABEL[DIALOG_MAX_PAGE_LISTITEMS],
	E_DIALOG_COMPONENT_BAR[DIALOG_MAX_PAGE_LISTITEMS],
	E_DIALOG_COMPONENT_SCROLL
};
static pDialogComponents[MAX_PLAYERS][E_DIALOG_COMPONENT];

#define Dialog_CountPages(%0,%1) (((%0)-1)/(%1)+1)

static Dialog_Create(playerid, Float:posX, Float:posY, strings[], bgcolor, font, Float:lettersizeX, Float:lettersizeY, textcolor, allign = 0, outline = 1, proportional = 1, shadow = 1, usebox = 0, boxcolor = 0, Float:textsizeX = -1.0, Float:textsizeY = -1.0, model = 0, Float:rotX = 0.0, Float:rotY = 0.0, Float:rotZ = 0.0, Float:zoom = 1.0, selectable = 0, show = 0)
{
	ptxtDialog[playerid][pPool[playerid]] = CreatePlayerTextDraw(playerid, posX, posY, strings);

	PlayerTextDrawBackgroundColor(playerid, ptxtDialog[playerid][pPool[playerid]], bgcolor);
	PlayerTextDrawFont(playerid, ptxtDialog[playerid][pPool[playerid]], font);
	PlayerTextDrawLetterSize(playerid, ptxtDialog[playerid][pPool[playerid]], lettersizeX, lettersizeY);
	PlayerTextDrawColor(playerid, ptxtDialog[playerid][pPool[playerid]], textcolor);
	PlayerTextDrawAlignment(playerid, ptxtDialog[playerid][pPool[playerid]], allign);
	PlayerTextDrawSetOutline(playerid, ptxtDialog[playerid][pPool[playerid]], outline);
	PlayerTextDrawSetProportional(playerid, ptxtDialog[playerid][pPool[playerid]], proportional);
	PlayerTextDrawSetShadow(playerid, ptxtDialog[playerid][pPool[playerid]], shadow);
	PlayerTextDrawUseBox(playerid, ptxtDialog[playerid][pPool[playerid]], usebox);
	PlayerTextDrawSetSelectable(playerid, ptxtDialog[playerid][pPool[playerid]], selectable);

	if (usebox)
	{
		PlayerTextDrawBoxColor(playerid, ptxtDialog[playerid][pPool[playerid]], boxcolor);
	}

	if (textsizeX != -1.0 || textsizeY != -1.0)
	{
		PlayerTextDrawTextSize(playerid, ptxtDialog[playerid][pPool[playerid]], textsizeX, textsizeY);
	}

	if(font == 5)
	{
		PlayerTextDrawSetPreviewModel(playerid, ptxtDialog[playerid][pPool[playerid]], model);
		PlayerTextDrawSetPreviewRot(playerid, ptxtDialog[playerid][pPool[playerid]], rotX, rotY, rotZ, zoom);
	}

	if (show)
	{
	    PlayerTextDrawShow(playerid, ptxtDialog[playerid][pPool[playerid]]);
	}

	pPool[playerid]++;

	return (pPool[playerid] - 1);
}

static Dialog_Init(playerid, style, caption[], button1[], button2[])
{
	for (new i; i < DIALOG_MAX_TEXT_DRAWS; i++)
	{
		ptxtDialog[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
  	}

	Dialog_Create(playerid, 173.000000, 122.000000, "_", 50, 1, 0.000000, 0.599999, -1, 0, 0, 1, 1, 1, 200, 462.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 173.000000, 121.000000, caption, 50, 1, 0.129998, 0.799998, -36, 0, 0, 1, 1, 0, .show = 1);

	Dialog_Create(playerid, 173.000000, 131.000000, "_", 50, 1, 0.000000, 21.599998, -1, 0, 0, 1, 1, 1, 150, 462.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 177.000000, 135.000000, "_", 50, 1, 0.000000, 18.299997, -1, 0, 0, 1, 1, 1, 100, 458.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 177.000000, 134.000000, "_", 50, 1, 0.000000, 18.499998, -1, 0, 0, 1, 1, 1, -106, 173.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 454.000000, 135.000000, "_", 50, 1, 0.000000, 18.299997, -1, 0, 0, 1, 1, 1, -106, 452.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 461.000000, 135.000000, "_", 50, 1, 0.000000, 18.299997, -1, 0, 0, 1, 1, 1, -106, 459.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 462.000000, 134.000000, "_", 50, 1, 0.000000, -0.300001, -1, 0, 0, 1, 1, 1, -106, 174.000000, 19.000000, .show = 1);
	Dialog_Create(playerid, 462.000000, 304.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 173.000000, 19.000000, .show = 1);

	pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL_UP] = Dialog_Create(playerid, 453.000000, 133.000000, "LD_POOL:ball", 50, 4, 0.500000, 1.000000, -106, 0, 0, 1, 1, 1, 255, 7.000000, 9.00000, .selectable = 1, .show = 1);
	Dialog_Create(playerid, 454.000000, 134.000000, "LD_BEAT:up", 255, 4, 0.500000, 1.000000, 255, 0, 0, 1, 1, 1, 255, 5.000000, 6.000000, .show = 1);

	pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL_DOWN] = Dialog_Create(playerid, 453.000000, 293.000000, "LD_POOL:ball", 50, 4, 0.500000, 1.000000, -106, 0, 0, 1, 1, 1, 255, 7.000000, 9.00000, .selectable = 1, .show = 1);
	Dialog_Create(playerid, 454.000000, 295.000000, "LD_BEAT:down", 255, 4, 0.500000, 1.000000, 255, 0, 0, 1, 1, 1, 255, 5.000000, 6.000000, .show = 1);

	if (button2[0])
	{
		Dialog_Create(playerid, 302.000000, 310.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 253.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 302.000000, 324.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 253.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 253.000000, 304.000000, "(", 0, 1, 0.200000, 2.000000, -106, 0, 0, 1, 1, .show = 1);
		Dialog_Create(playerid, 299.000000, 304.000000, ")", 0, 1, 0.200000, 2.000000, -106, 0, 0, 1, 1, .show = 1);
		pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTON1] = Dialog_Create(playerid, 254.000000, 309.000000, "ld_plan:tvbase", 50, 4, 0.000000, 0.899998, 255, 0, 0, 1, 1, 1, 255, 46.000000, 13.000000, .selectable = 1, .show = 1);
		Dialog_Create(playerid, 278.000000, 311.000000, button1, 50, 1, 0.129998, 0.799998, -36, 2, 0, 1, 1, 0, .show = 1);

		Dialog_Create(playerid, 372.000000, 310.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 323.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 372.000000, 324.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 323.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 323.000000, 304.000000, "(", 0, 1, 0.210000, 2.000000, -106, 0, 0, 1, 1, .show = 1);
		Dialog_Create(playerid, 369.000000, 304.000000, ")", 0, 1, 0.230000, 1.999999, -106, 0, 0, 1, 1, .show = 1);
		pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTON2] = Dialog_Create(playerid, 324.000000, 309.000000, "ld_plan:tvbase", 50, 4, 0.000000, 0.899998, 255, 0, 0, 1, 1, 1, 255, 46.000000, 13.000000, .selectable = 1, .show = 1);
		Dialog_Create(playerid, 348.000000, 311.000000, button2, 50, 1, 0.140000, 0.899999, -36, 2, 0, 1, 1, 0, .show = 1);
	}
	else
	{
		Dialog_Create(playerid, 342.000000, 310.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 293.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 342.000000, 324.000000, "_", 50, 1, 0.000000, -0.400001, -1, 0, 0, 1, 1, 1, -106, 293.000000, 19.000000, .show = 1);
		Dialog_Create(playerid, 293.000000, 304.000000, "(", 0, 1, 0.200000, 2.000000, -106, 0, 0, 1, 1, .show = 1);
		Dialog_Create(playerid, 339.000000, 304.000000, ")", 0, 1, 0.219999, 2.000000, -106, 0, 0, 1, 1, .show = 1);
		pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTONC] = Dialog_Create(playerid, 294.000000, 309.000000, "ld_plan:tvbase", 50, 4, 0.000000, 0.899998, 255, 0, 0, 1, 1, 1, 255, 46.000000, 13.000000, .selectable = 1, .show = 1);
		Dialog_Create(playerid, 317.000000, 311.000000, button1, 50, 1, 0.140000, 0.899999, -36, 2, 0, 1, 1, 0, .show = 1);
	}

	if (style == DIALOG_STYLE_PREVMODEL)
	{
		new count;
		new Float:base[2] = {179.000000, 134.000000};

		for (new i; i < (6 * 4); i++)
		{
			pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i] = Dialog_Create(playerid, base[0], base[1], "_", 169090660, 5, 0.129998, 0.799998, -1, 0, 0, 1, 1, 1, 0, 44.000000, 41.000000, .selectable = 1);
	        pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][i] = Dialog_Create(playerid, base[0] + 2.000000, base[1] + 1.000000, "", 50, 1, 0.140000, 0.899999, -36, 0, 1, 1, 2, 0);

	        base[0] += 45.000000;

	        count++;
	        if (count == 6)
			{
				base[0] = 179.000000;
		        base[1] += 42.000000;

	            count = 0;
			}
		}
	}
	else
	{
		for (new i; i < (5); i++)
		{
			pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][i] = Dialog_Create(playerid, 177.000000, (134.000000 + (33.0 * i)), "ld_plan:tvbase", 50, 4, 0.129997, 0.799997, DIALOG_NORMAL_COLOR, 0, 0, 1, 1, 1, 0, 274.000000, 32.000000, .selectable = 1);
			pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i] = Dialog_Create(playerid, 178.000000, (134.000000 + (33.0 * i)), "_", 169090660, 5, 0.129997, 0.799997, -1, 0, 0, 1, 1, 1, 0, 34.000000, 30.000000);
			pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][i] = Dialog_Create(playerid, 215.000000, (135.000000 + (33.0 * i)), "", 50, 1, 0.099999, 0.599997, -36, 0, 1, 1, 2, 0);
		}
	}

	pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL] = Dialog_Create(playerid, 0.000000, 0.000000, "_", 0, 1, 0.0, 0.0, 0);
}

static Dialog_Exit(playerid)
{
	for (new i; i < pPool[playerid]; i++)
	{
		PlayerTextDrawHide(playerid, ptxtDialog[playerid][i]);
		PlayerTextDrawDestroy(playerid, ptxtDialog[playerid][i]);

		ptxtDialog[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
  	}

  	pPool[playerid] = 0;

	new varname[45];
  	for (new i; i < pDialogTotalListitems[playerid]; i++)
  	{
		format(varname, sizeof (varname), "DialogModel_%i", i);
  	    DeletePVar(playerid, varname);

		format(varname, sizeof (varname), "DialogLabel_%i", i);
	  	DeletePVar(playerid, varname);
  	}
}

static Dialog_SetModel(playerid, id, set)
{
	new varname[45];
	format(varname, sizeof (varname), "DialogModel_%i", id);
	return SetPVarInt(playerid, varname, set);
}

static Dialog_GetModel(playerid, id)
{
	new varname[45];
	format(varname, sizeof (varname), "DialogModel_%i", id);
	return GetPVarInt(playerid, varname);
}

static Dialog_SetLabel(playerid, id, set[])
{
	new varname[45];
	format(varname, sizeof (varname), "DialogLabel_%i", id);
	return SetPVarString(playerid, varname, set);
}

static Dialog_GetLabel(playerid, id)
{
	new varname[45];
	format(varname, sizeof (varname), "DialogLabel_%i", id);

	new get[35];
	GetPVarString(playerid, varname, get, sizeof (get));
	return get;
}

static Dialog_SetPage(playerid, page, selected)
{
  	new index;

    if (pDialogStyle[playerid] == DIALOG_STYLE_PREVMODEL)
	{
		PlayerTextDrawDestroy(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL]]);
		pPool[playerid]--;

		if (Dialog_CountPages(pDialogTotalListitems[playerid], (6 * 4)) > 1)
		{
			new Float:whiles = (145.500000 / Dialog_CountPages(pDialogTotalListitems[playerid], (6 * 4)));
			pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL] = Dialog_Create(playerid, 455.000000, (144.000000 + (whiles * page)), "_", 0, 1, 0.000000, (whiles / 8.83), 0, .usebox = 1, .boxcolor = DIALOG_SELECTION_COLOR, .textsizeX = 458.000000, .textsizeY = 0.000000, .show = 1);
  		}

		for (new i = ((page) * (6 * 4)); i < pDialogTotalListitems[playerid]; i++)
		{
		    if (index < (6 * 4))
			{
			    if (Dialog_GetModel(playerid, i) >= 0)
				{
			  		if (selected == index)
		  			{
						PlayerTextDrawBackgroundColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], DIALOG_SELECTION_COLOR);

		            	pDialogListitem[playerid] = i;
			   		}
			    	else
					{
			     		PlayerTextDrawBackgroundColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], 169090660);
				    }
					PlayerTextDrawSetPreviewModel(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], Dialog_GetModel(playerid, i));
			  		PlayerTextDrawSetPreviewRot(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], 0.0, 0.0, 0.0, 1.0);

					if (strlen(Dialog_GetLabel(playerid, i)))
					{
						PlayerTextDrawSetString(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]], Dialog_GetLabel(playerid, i));
			  		}

			    	PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]]);
			    	PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]]);

					index++;
				}
			}
		}

		index = (6 * 4);
		for (new i = ((page + 1) * (6 * 4)); i > pDialogTotalListitems[playerid]; i--)
		{
		    index--;
			PlayerTextDrawHide(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]]);
			PlayerTextDrawHide(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]]);
		}
	}
	else
	{
		PlayerTextDrawDestroy(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL]]);
		pPool[playerid]--;

		if (Dialog_CountPages(pDialogTotalListitems[playerid], (5)) > 1)
		{
			new Float:whiles = (145.500000 / Dialog_CountPages(pDialogTotalListitems[playerid], (5)));
			pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL] = Dialog_Create(playerid, 455.000000, (144.000000 + (whiles * page)), "_", 0, 1, 0.000000, (whiles / 8.83), 0, .usebox = 1, .boxcolor = DIALOG_SELECTION_COLOR, .textsizeX = 458.000000, .textsizeY = 0.000000, .show = 1);
		}

		for (new i = (page * 5); i < pDialogTotalListitems[playerid]; i++)
		{
		    if (index < 5)
			{
			    if (Dialog_GetModel(playerid, i) >= 0)
				{
			  		if (selected == index)
		  			{
						PlayerTextDrawColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][index]], ((DIALOG_SELECTION_COLOR & ~0xFF) | 0xFF));

		            	pDialogListitem[playerid] = i;
			   		}
			    	else
					{
			     		PlayerTextDrawColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][index]], ((DIALOG_NORMAL_COLOR & ~0xFF) | 0xFF));
				    }
					PlayerTextDrawSetPreviewModel(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], Dialog_GetModel(playerid, i));
			  		PlayerTextDrawSetPreviewRot(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], 0.0, 0.0, 0.0, 1.0);

					if (strlen(Dialog_GetLabel(playerid, i)))
					{
						PlayerTextDrawSetString(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]], Dialog_GetLabel(playerid, i));
			  		}

			    	PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][index]]);
			    	PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]]);
			    	PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]]);

					index++;
				}
			}
		}

		index = 5;
		for (new i = ((page + 1) * (5)); i > pDialogTotalListitems[playerid]; i--)
		{
		    index--;
			PlayerTextDrawHide(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][index]]);
			PlayerTextDrawHide(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]]);
			PlayerTextDrawHide(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]]);
		}
	}
}

forward Dialog_HideForPlayer(playerid);
public  Dialog_HideForPlayer(playerid)
{
	switch (pDialogStyle[playerid])
	{
		case DIALOG_STYLE_PREVMODEL,
			 DIALOG_STYLE_PREVMODEL_LIST:
		{
			Dialog_Exit(playerid);

			pDialogStyle[playerid] = -1;

			CancelSelectTextDraw(playerid);
		}

		default:
		{
		    ShowPlayerDialog(playerid, -1, 0, "", "", "", "");

			pDialogStyle[playerid] = -1;
		}
	}

	pDialogId[playerid] = -1;
	pDialogDualButtons[playerid] = false;
	pDialogTotalListitems[playerid] = 0;
	pDialogPage[playerid] = 0;
	pDialogListitem[playerid] = 0;
	pDialogLastClick[playerid] = 0;
}

stock Dialog_ShowToPlayer(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
	if (playerid < 0 || playerid >= MAX_PLAYERS)
	{
	    return false;
	}

	switch (pDialogStyle[playerid])
	{
		case DIALOG_STYLE_PREVMODEL,
			 DIALOG_STYLE_PREVMODEL_LIST:
		{
			Dialog_Exit(playerid);

			pDialogStyle[playerid] = -1;
		}
	}

	CallRemoteFunction("Dialog_HideForPlayer", "i", playerid);

	if (dialogid >= 0)
	{
		pDialogId[playerid] = dialogid;
		pDialogStyle[playerid] = style;

		switch (style)
		{
			case DIALOG_STYLE_PREVMODEL,
				 DIALOG_STYLE_PREVMODEL_LIST:
			{
				Dialog_Init(playerid, style, caption, button1, button2);

				new bool:insert_label;
				new dest[35];
				new pos;
				for (new i, j = strlen(info); i <= j; i++)
				{
				    if (info[i] == '\n' || i == j)
					{
						strmid((dest[0] = EOS, dest), info, pos, i);

			   			pos = i + 1;

						if (insert_label)
						{
	     					Dialog_SetLabel(playerid, pDialogTotalListitems[playerid], dest);
	     					
	     					pDialogTotalListitems[playerid]++;
						}
						else
						{
			    			if (i == j)
			    			{
			    			    if (dest[0])
			    			    {
									Dialog_SetModel(playerid, pDialogTotalListitems[playerid], strval(dest));

				    			    pDialogTotalListitems[playerid]++;
								}
			    			}
			    			else
			    			{
			    				Dialog_SetModel(playerid, pDialogTotalListitems[playerid], strval(dest));
							}
						}

						insert_label = (! insert_label);
					}
				}

	            Dialog_SetPage(playerid, 0, 0);

				SelectTextDraw(playerid, DIALOG_SELECTION_COLOR);
			}

			default:
			{
	            ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
			}
		}
	}

	return true;
}
#if defined _ALS_ShowPlayerDialog
	#undef ShowPlayerDialog
#else
	#define _ALS_ShowPlayerDialog
#endif
#define ShowPlayerDialog Dialog_ShowToPlayer

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	switch (pDialogStyle[playerid])
	{
	    case DIALOG_STYLE_PREVMODEL,
			 DIALOG_STYLE_PREVMODEL_LIST:
		{
			if (clickedid == Text:INVALID_TEXT_DRAW)
			{
				Dialog_Exit(playerid);

				pDialogStyle[playerid] = -1;

				CancelSelectTextDraw(playerid);

    			if (funcidx("OnDialogResponse") != -1)
					CallRemoteFunction("OnDialogResponse", "iiiis", playerid, pDialogId[playerid], 0, pDialogListitem[playerid], "\1");

				pDialogId[playerid] = -1;
				pDialogDualButtons[playerid] = false;
				pDialogTotalListitems[playerid] = 0;
				pDialogPage[playerid] = 0;
				pDialogListitem[playerid] = 0;
				pDialogLastClick[playerid] = 0;
			}

			return 1;
		}
	}

	#if defined Dialog_OnPlayerClickTextDraw
       	return Dialog_OnPlayerClickTextDraw(playerid, clickedid);
	#else
	   	return 0;
	#endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw Dialog_OnPlayerClickTextDraw
#if defined Dialog_OnPlayerClickTextDraw
    forward Dialog_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	switch (pDialogStyle[playerid])
	{
	    case DIALOG_STYLE_PREVMODEL,
			 DIALOG_STYLE_PREVMODEL_LIST:
		{
			if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTON2]])
			{
				Dialog_Exit(playerid);

				pDialogStyle[playerid] = -1;

				CancelSelectTextDraw(playerid);

				if (funcidx("OnDialogResponse") != -1)
					CallRemoteFunction("OnDialogResponse", "iiiis", playerid, pDialogId[playerid], 0, pDialogListitem[playerid], "\1");

				pDialogId[playerid] = -1;
				pDialogDualButtons[playerid] = false;
				pDialogTotalListitems[playerid] = 0;
				pDialogPage[playerid] = 0;
				pDialogListitem[playerid] = 0;
				pDialogLastClick[playerid] = 0;
			}
			else if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTON1]] || playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BUTTONC]])
			{
				Dialog_Exit(playerid);

				pDialogStyle[playerid] = -1;

				CancelSelectTextDraw(playerid);

				if (funcidx("OnDialogResponse") != -1)
					CallRemoteFunction("OnDialogResponse", "iiiis", playerid, pDialogId[playerid], 1, pDialogListitem[playerid], "\1");

				pDialogId[playerid] = -1;
				pDialogDualButtons[playerid] = false;
				pDialogTotalListitems[playerid] = 0;
				pDialogPage[playerid] = 0;
				pDialogListitem[playerid] = 0;
				pDialogLastClick[playerid] = 0;
			}
			else if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL_UP]])
			{
				if ((pDialogPage[playerid] - 1) < 0)
				{
    				PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
				}
				else
				{
				    pDialogPage[playerid]--;
			    	Dialog_SetPage(playerid, pDialogPage[playerid], 0);
				}
			}
			else if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_SCROLL_DOWN]])
			{
				if ((pDialogPage[playerid] + 1) >= Dialog_CountPages(pDialogTotalListitems[playerid], ((pDialogStyle[playerid] == DIALOG_STYLE_PREVMODEL) ? (6 * 4) : (5))))
				{
    				PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
				}
				else
				{
				    pDialogPage[playerid]++;
			    	Dialog_SetPage(playerid, pDialogPage[playerid], 0);
				}
			}
	        else
	        {
			    if (pDialogStyle[playerid] == DIALOG_STYLE_PREVMODEL)
				{
					new id = -1;
					for (new i; i < (6 * 4); i++)
					{
						if (((pDialogPage[playerid] * (6 * 4)) + i) < pDialogTotalListitems[playerid])
						{
						    if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i]])
						    {
						        pDialogListitem[playerid] = (pDialogPage[playerid] * (6 * 4)) + i;
						        id = i;

						        break;
						    }
						}
						else
						{
						    break;
						}
					}

					if (id != -1)
					{
					    if (GetTickCount() - pDialogLastClick[playerid] <= 200)
					    {
							Dialog_Exit(playerid);

							pDialogStyle[playerid] = -1;

							CancelSelectTextDraw(playerid);

							if (funcidx("OnDialogResponse") != -1)
								CallRemoteFunction("OnDialogResponse", "iiiis", playerid, pDialogId[playerid], 1, pDialogListitem[playerid], "\1");

							pDialogId[playerid] = -1;
							pDialogDualButtons[playerid] = false;
							pDialogTotalListitems[playerid] = 0;
							pDialogPage[playerid] = 0;
							pDialogListitem[playerid] = 0;
							pDialogLastClick[playerid] = 0;
					    }
					    else
					    {
							for (new i; i < (6 * 4); i++)
							{
								if (((pDialogPage[playerid] * (6 * 4)) + i) < pDialogTotalListitems[playerid])
								{
								    if (id == i)
								    {
						    			PlayerTextDrawBackgroundColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i]], DIALOG_SELECTION_COLOR);
								    }
									else
									{
										PlayerTextDrawBackgroundColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i]], DIALOG_NORMAL_COLOR);
									}
									PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][i]]);
								}
								else
								{
								    break;
								}
							}
						}

						pDialogLastClick[playerid] = GetTickCount();
					}
				}
				else
				{
				    new id = -1;
					for (new i; i < 5; i++)
					{
						if (((pDialogPage[playerid] * (5)) + i) < pDialogTotalListitems[playerid])
						{
					    	if (playertextid == ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][i]])
					    	{
							    pDialogListitem[playerid] = (pDialogPage[playerid] * (5)) + i;
						        id = i;

						        break;
						    }
						}
						else
						{
						    break;
						}
					}

					if (id != -1)
					{
					    if (GetTickCount() - pDialogLastClick[playerid] <= 200)
					    {
							Dialog_Exit(playerid);

							pDialogStyle[playerid] = -1;

							CancelSelectTextDraw(playerid);

							if (funcidx("OnDialogResponse") != -1)
								CallRemoteFunction("OnDialogResponse", "iiiis", playerid, pDialogId[playerid], 1, pDialogListitem[playerid], "\1");

							pDialogId[playerid] = -1;
							pDialogDualButtons[playerid] = false;
							pDialogTotalListitems[playerid] = 0;
							pDialogPage[playerid] = 0;
							pDialogListitem[playerid] = 0;
							pDialogLastClick[playerid] = 0;
					    }
					    else
					    {
							for (new i; i < 5; i++)
							{
								if (((pDialogPage[playerid] * (5)) + i) < pDialogTotalListitems[playerid])
								{
								    if (id == i)
								    {
						    			PlayerTextDrawColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][i]], ((DIALOG_SELECTION_COLOR & ~0xFF) | 0xFF));
								    }
									else
									{
										PlayerTextDrawColor(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][i]], ((DIALOG_NORMAL_COLOR & ~0xFF) | 0xFF));
									}
									PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_BAR][i]]);
								}
								else
								{
								    break;
								}
							}
						}

						pDialogLastClick[playerid] = GetTickCount();
					}
	            }
			}

			return 1;
		}
	}

    #if defined Dialog_OnPlayerClickPlayerTD
       	return Dialog_OnPlayerClickPlayerTD(playerid, playertextid);
	#else
	   	return 0;
	#endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw Dialog_OnPlayerClickPlayerTD
#if defined Dialog_OnPlayerClickPlayerTD
    forward Dialog_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif

stock Dialog_SetListitem(playerid, listitem, str[], model = -1, Float:model_x = 0.0, Float:model_y = 0.0, Float:model_z = 0.0, Float:model_zoom = 1.0, model_color1 = -1, model_color2 = -1)
{
	if (playerid < 0 || playerid >= MAX_PLAYERS)
	{
	    return false;
	}

	if (pDialogStyle[playerid] == -1)
	{
	    return false;
	}

  	new index;

    switch (pDialogStyle[playerid])
	{
		case DIALOG_STYLE_PREVMODEL,
	      	 DIALOG_STYLE_PREVMODEL_LIST:
		{
		    if (listitem >= pDialogTotalListitems[playerid])
		    {
		        return false;
			}

			index = listitem - (floatround(Float:(listitem - (6 * 4)), floatround_floor) * (6 * 4));
			if (index >= (6 * 4))
			{
			    return false;
			}

			if (model >= 0)
			{
				Dialog_SetModel(playerid, listitem, model);

				PlayerTextDrawSetPreviewModel(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], model);
				PlayerTextDrawSetPreviewRot(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], model_x, model_y, model_z, model_zoom);
				PlayerTextDrawSetPreviewVehCol(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]], model_color1, model_color2);

				PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_MODEL][index]]);
			}

			if (str[0])
			{
				Dialog_SetLabel(playerid, listitem, str);
				PlayerTextDrawSetString(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]], str);
				PlayerTextDrawShow(playerid, ptxtDialog[playerid][pDialogComponents[playerid][E_DIALOG_COMPONENT_LABEL][index]]);
			}
		}
	}

	return true;
}
