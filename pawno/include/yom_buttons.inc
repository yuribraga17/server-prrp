// yom_buttons

#define MAX_BUTTONS			50
#define MAX_DISTANCE		1.3
#define OBJECT				2961
#define SOUND				1083
#define INVALID_BUTTON_ID	-1

new Float:PlayerPos[4];


enum BUTTON_INFOS
{
	bool:Created,
	bool:Moving,
	bool:Usable[MAX_PLAYERS],
	Float:Pos[4],
	ObjectID
}

new ButtonInfo[MAX_BUTTONS+1][BUTTON_INFOS];

#if defined DEBUG

	enum PLAYER_INFOS
	{
		Float:MSpeed,
		SelectedButton,
		TimerID
	}
	
	new PlayerInfo[MAX_PLAYERS][PLAYER_INFOS];
	new String[128];

#endif

Float:Distance3D(Float:PointA[], Float:PointB[], bool:sqrt = true)
{
	new Float:Dist[4];
	
	for (new i = 0; i < 3; i++)
	{
	    Dist[i] = PointA[i] - PointB[i];
	    Dist[i] *= Dist[i];
	}
	
	Dist[3] = Dist[0] + Dist[1] + Dist[2];
	
	return sqrt ? floatsqroot(Dist[3]) : Dist[3];
}

Float:Angle2D(Float:PointA[], Float:PointB[])
{
	new bool:A_LS_B[2], Float:Dist[2], Float:Angle;

	for (new i = 0; i < 2; i++)
	{
	    A_LS_B[i] = PointA[i] < PointB[i];
	    Dist[i] = A_LS_B[i] ? PointB[i] - PointA[i] : PointA[i] - PointB[i];
	}

	Angle = atan2(Dist[1],Dist[0]);
	Angle = A_LS_B[0] ? 270.0 + Angle : 90.0 - Angle;
	Angle = A_LS_B[1] ? Angle : 180.0 - Angle;

	return Angle;
}

GetClosestButton(Float:Point[], &Float:Distance = 0.0)
{
	new Closest = INVALID_BUTTON_ID, Float:Distance2 = 100000.0;

	for (new buttonid = 1, highest = FS_GetHighestButtonID(); buttonid <= highest; buttonid ++)
	{
		if (ButtonInfo[buttonid][Created])
		{
			Distance = Distance3D(Point, ButtonInfo[buttonid][Pos]);

			if (Distance < Distance2)
			{
				Distance2 = Distance;
				Closest = buttonid;
			}
		}
	}

	Distance = Distance2;

	return Closest;
}

forward FS_CreateButton(Float:X, Float:Y, Float:Z, Float:Angle);
public FS_CreateButton(Float:X, Float:Y, Float:Z, Float:Angle)
{
	new buttonid;
	
	for(buttonid = 1; buttonid <= MAX_BUTTONS; buttonid ++)
	    if (!ButtonInfo[buttonid][Created])
			break;

	ButtonInfo[buttonid][ObjectID]	= CreateObject(OBJECT,X,Y,Z,0.0,0.0,Angle);
	ButtonInfo[buttonid][Pos][0]	= X;
	ButtonInfo[buttonid][Pos][1]	= Y;
	ButtonInfo[buttonid][Pos][2]	= Z;
	ButtonInfo[buttonid][Pos][3]	= Angle;
	ButtonInfo[buttonid][Moving]	= false;
	ButtonInfo[buttonid][Created]	= true;
	
	for (new playerid = 0; playerid < MAX_PLAYERS; playerid ++)
	    ButtonInfo[buttonid][Usable][playerid] = true;

	return buttonid;
}

stock CreateButton(Float:X, Float:Y, Float:Z, Float:Angle)
{
	FS_CreateButton(X, Y, Z, Angle);
}

forward FS_DestroyButton(buttonid);
public FS_DestroyButton(buttonid)
{
	if (FS_IsValidButton(buttonid))
	{
		CallRemoteFunction("OnButtonDestroyed", "i", buttonid);
		ButtonInfo[buttonid][Created] = false;
		DestroyObject(ButtonInfo[buttonid][ObjectID]);
	}
}

forward FS_SetButtonPos(buttonid, Float:X, Float:Y, Float:Z, Float:Angle);
public FS_SetButtonPos(buttonid, Float:X, Float:Y, Float:Z, Float:Angle)
{
    if (FS_IsValidButton(buttonid))
	{
	    new objectid = ButtonInfo[buttonid][ObjectID];
		SetObjectPos(objectid, X, Y, Z);
		SetObjectRot(objectid, 0.0, 0.0, Angle);
		ButtonInfo[buttonid][Pos][0] = X;
		ButtonInfo[buttonid][Pos][1] = Y;
		ButtonInfo[buttonid][Pos][2] = Z;
		ButtonInfo[buttonid][Pos][3] = Angle;
	}
}

forward FS_MoveButton(buttonid, Float:X, Float:Y, Float:Z, Float:Speed);
public FS_MoveButton(buttonid, Float:X, Float:Y, Float:Z, Float:Speed)
{
    if (FS_IsValidButton(buttonid))
    {
        MoveObject(ButtonInfo[buttonid][ObjectID], X, Y, Z, Speed);
        ButtonInfo[buttonid][Moving] = true;
		ButtonInfo[buttonid][Pos][0] = 99999.9;
		ButtonInfo[buttonid][Pos][1] = 99999.9;
		ButtonInfo[buttonid][Pos][2] = 99999.9;
	}
}

forward FS_StopButton(buttonid);
public FS_StopButton(buttonid)
{
	if (FS_IsValidButton(buttonid))
		StopObject(ButtonInfo[buttonid][ObjectID]);
}

forward bool:FS_IsValidButton(buttonid);
public bool:FS_IsValidButton(buttonid)
{
	return (buttonid <= MAX_BUTTONS && ButtonInfo[buttonid][Created]);
}

forward FS_GetHighestButtonID();
public FS_GetHighestButtonID()
{
    for (new buttonid = MAX_BUTTONS; buttonid > 0; buttonid --)
		if (ButtonInfo[buttonid][Created])
		    return buttonid;

	return INVALID_BUTTON_ID;
}

forward FS_GetButtonObjectID(buttonid);
public FS_GetButtonObjectID(buttonid)
{
	return FS_IsValidButton(buttonid) ? ButtonInfo[buttonid][ObjectID] : INVALID_OBJECT_ID;
}

forward FS_GetObjectButtonID(objectid);
public FS_GetObjectButtonID(objectid)
{
	for (new buttonid = 1, highest = FS_GetHighestButtonID(); buttonid <= highest; buttonid ++)
	    if (ButtonInfo[buttonid][Created] && ButtonInfo[buttonid][ObjectID] == objectid)
			return buttonid;

	return INVALID_BUTTON_ID;
}

forward FS_PrintButtonsInfos();
public FS_PrintButtonsInfos()
{
	print(	"\n \
		ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿\n \
		³                   Buttons Informations                  ³\n \
		ÃÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ´\n \
		³ButtonID³ObjectID³    X    ³    Y    ³    Z    ³    A    ³\n \
		ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´");

	for (new buttonid = 1; buttonid <= MAX_BUTTONS; buttonid ++)
	{
		if (ButtonInfo[buttonid][Created])
		{
			printf
			(
				" ³%8d³%8d³%6.2f³%6.2f³%6.2f³%6.2f³",
				buttonid,
				ButtonInfo[buttonid][ObjectID],
				ButtonInfo[buttonid][Pos][0],
				ButtonInfo[buttonid][Pos][1],
				ButtonInfo[buttonid][Pos][2],
				ButtonInfo[buttonid][Pos][3]
			);
		}
	}

	print(" ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ\n");
}

forward Float:FS_GetDistanceToButton(buttonid, Float:X, Float:Y, Float:Z);
public Float:FS_GetDistanceToButton(buttonid, Float:X, Float:Y, Float:Z)
{
	if (FS_IsValidButton(buttonid))
	{
		new Float:Point[3];

		Point[0] = X;
		Point[1] = Y;
		Point[2] = Z;

		return Distance3D(Point, ButtonInfo[buttonid][Pos]);
	}

	return -1.0;
}

forward FS_TeleportPlayerToButton(playerid, buttonid);
public FS_TeleportPlayerToButton(playerid, buttonid)
{
	if (FS_IsValidButton(buttonid) && !ButtonInfo[buttonid][Moving])
	{
		new Float:Angle = ButtonInfo[buttonid][Pos][3];
		SetPlayerPos
		(
			playerid,
			ButtonInfo[buttonid][Pos][0] - (0.65 * floatsin(-Angle,degrees)),
			ButtonInfo[buttonid][Pos][1] - (0.65 * floatcos(-Angle,degrees)),
			ButtonInfo[buttonid][Pos][2] - 0.63
		);
		SetPlayerFacingAngle(playerid, -Angle);
		SetCameraBehindPlayer(playerid);

	}
}

forward FS_ToggleButtonEnabledForPlayer(playerid, buttonid, bool:enabled);
public FS_ToggleButtonEnabledForPlayer(playerid, buttonid, bool:enabled)
{
	if (FS_IsValidButton(buttonid))
	{
		ButtonInfo[buttonid][Usable][playerid] = enabled;
	}
}

forward FS_ToggleButtonEnabled(buttonid, bool:enabled);
public FS_ToggleButtonEnabled(buttonid, bool:enabled)
{
	if (FS_IsValidButton(buttonid))
	{
	    for (new playerid = 0; playerid < MAX_PLAYERS; playerid ++)
	    {
			ButtonInfo[buttonid][Usable][playerid] = enabled;
		}
	}
}

forward OnPlayerPressButton_Delay(playerid, buttonid);
public OnPlayerPressButton_Delay(playerid, buttonid)
{
	#if defined SOUND
	    PlayerPlaySound(playerid, SOUND, 0.0, 0.0, 0.0);
	#endif
	CallRemoteFunction("OnPlayerPressButton", "ii", playerid, buttonid);
}

public OnObjectMoved(objectid)
{
	new buttonid = FS_GetObjectButtonID(objectid);
	
	if (buttonid != INVALID_BUTTON_ID)
	{
	    new Float:ObjectPos[3];
	    GetObjectPos(objectid, ObjectPos[0], ObjectPos[1], ObjectPos[2]);
	    ButtonInfo[buttonid][Pos][0] = ObjectPos[0];
	    ButtonInfo[buttonid][Pos][1] = ObjectPos[1];
	    ButtonInfo[buttonid][Pos][2] = ObjectPos[2];
	    ButtonInfo[buttonid][Moving] = false;
	    CallRemoteFunction("OnButtonMoved", "i", buttonid);
	}
}
