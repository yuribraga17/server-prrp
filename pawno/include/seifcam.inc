/*
									SeifCam - Camera include by Seif
									
		*-----------------------------------------------*
		| This include allows you to move the camera to |
		| a certain place smoothly and easily. It even  |
		| calls a callback when the camera finishes     |
		| to move at the destination. The callback is   |
		| 'OnPlayerCameraMoved'.                        |
		*-----------------------------------------------*
*/
/*x---------------------------------Important-------------------------------------x*/
//**INCLUDES**//
#include <a_samp>
//**PRAGMAS**//

//**MISC**//
#if !defined function
	#define function%0(%1) forward%0(%1); public%0(%1)
#endif
/*x---------------------------------Defining-------------------------------------x*/
//**VARIABLES**//
enum sciInfo
{
	Float:sciPOSX,
	Float:sciPOSY,
	Float:sciPOSZ,
	Float:sciLOOKX,
	Float:sciLOOKY,
	Float:sciLOOKZ,
	Float:sciDestX,
	Float:sciDestY,
	Float:sciDestZ,
	Float:sciMaxDest,
	Float:sciMove,
	bool:sciMoving,
	Float:sciFinalDestX,
	Float:sciFinalDestY,
	Float:sciFinalDestZ,
	
	Float:sciLookDestX,
	Float:sciLookDestY,
	Float:sciLookDestZ,
	Float:sciLookMaxDest,
	Float:sciLookMove,
	bool:sciLookMoving,
	Float:sciLookFinalDestX,
	Float:sciLookFinalDestY,
	Float:sciLookFinalDestZ,
	Float:sciAngle,
	Float:sciFirstAngle,
	Float:sciFinalAngle,
}
new SeifCamInfo[MAX_PLAYERS][sciInfo];
// **NATIVES** //
/*
native SetPlayerCameraPos(playerid, Float:x, Float:y, Float:z);
native SetPlayerCameraLookAt(playerid, Float:x, Float:y, Float:z);
native MovePlayerCamera(playerid, Float:x, Float:y, Float:z);
native ResetPlayerCamera(playerid);
*/
/*x---------------------------------CallBacks-------------------------------------x*/
function SetPlayerCameraPosEx(playerid, Float:x, Float:y, Float:z)
{
	if (!IsPlayerConnected(playerid)) return 0;
	
	SeifCamInfo[playerid][sciPOSX] = x;
	SeifCamInfo[playerid][sciPOSY] = y;
	SeifCamInfo[playerid][sciPOSZ] = z;
	SetPlayerCameraPos(playerid, x, y, z);
	return 1;
}

function SetPlayerCameraLookAtEx(playerid, Float:x, Float:y, Float:z)
{
	if (!IsPlayerConnected(playerid)) return 0;

	SeifCamInfo[playerid][sciLOOKX] = x;
	SeifCamInfo[playerid][sciLOOKY] = y;
	SeifCamInfo[playerid][sciLOOKZ] = z;
	SetPlayerCameraLookAt(playerid, x, y, z);
	new Float:a;
	GetPlayerFacingAngle(playerid, a);
	SeifCamInfo[playerid][sciAngle] = a;
	return 1;
}

Float:GetPlayerCameraFacingPos(playerid)
{
	new Float:x, Float:y, Float:a;
	GetPlayerCameraLookAt(playerid, x, y, a);
	x += 800.0;
	y += 300.0;
	new Float:px, Float:py, Float:pz;
	GetPlayerCameraLookAt(playerid, px, py, pz);
	a = floatabs(atan((py-y)/(px-x)));
	//printf("%f", a);

	if (px <= x && py >= y) 		a = floatsub(180, a);
	else if (px < x && py < y) 		a = floatadd(a, 180);
	else if (px >= x && py <= y) 	a = floatsub(360.0, a);
	//printf("%f", a);

	a = floatsub(a, 90.0);
	//printf("%f", a);

	if (a >= 360.0) a = floatsub(a, 360.0);
	if (a < 0.0) a = 360.0;
	//printf("%f", a);
	return a;
}

Float:GetPlayerCameraFacingPosEx(playerid, Float:px, Float:py, Float:pz)
{
	#pragma unused pz
	
	new Float:x, Float:y, Float:a;
	GetPlayerCameraLookAt(playerid, x, y, a);
	a = floatabs(atan((py-y)/(px-x)));
	//printf("%f", a);

	if (px <= x && py >= y) 		a = floatsub(180, a);
	else if (px < x && py < y) 		a = floatadd(a, 180);
	else if (px >= x && py <= y) 	a = floatsub(360.0, a);
	//printf("%f", a);

	a = floatsub(a, 90.0);
	//printf("%f", a);

	if (a >= 360.0) a = floatsub(a, 360.0);
	if (a < 0.0) a = 360.0;
	//printf("%f", a);
	return a;
}

function MovePlayerCamera(playerid, Float:posx, Float:posy, Float:posz/*, Float:lookatx, Float:lookaty, Float:lookatz*/, Float:speed)
{
	if (!IsPlayerConnected(playerid)) return 0;
	//printf("player %d: %f, %f, %f", playerid, posx, posy, posz);
	//if (posx != SeifCamInfo[playerid][sciLOOKX] || posy != SeifCamInfo[playerid][sciLOOKY] || posz != SeifCamInfo[playerid][sciLOOKZ]) return RotatePlayerCamera(playerid, posx, posy, posz, speed);
	
	SetPlayerCameraLookAtEx(playerid, posx, posy, posz);
	new Float:oldx = SeifCamInfo[playerid][sciPOSX],
	    Float:oldy = SeifCamInfo[playerid][sciPOSY],
	    Float:oldz = SeifCamInfo[playerid][sciPOSZ];
	new Float:destX, Float:destY, Float:destZ;
	
	/*new Float:oldlookx = SeifCamInfo[playerid][sciLOOKX],
	    Float:oldlooky = SeifCamInfo[playerid][sciLOOKY],
	    Float:oldlookz = SeifCamInfo[playerid][sciLOOKZ];
	new Float:destlookX, Float:destlookY, Float:destlookZ;*/
	
	if (posx > oldx) destX = posx-oldx;
	else destX = oldx-posx;
	if (posy > oldy) destY = posy-oldy;
	else destY = oldy-posy;
	if (posz > oldz) destZ = posz-oldz;
	else destZ = oldz-posz;

	/*if (lookatx > oldlookx) destlookX = lookatx-oldlookx;
	else destlookX = oldlookx-lookatx;
	if (lookaty > oldlooky) destlookY = lookaty-oldlooky;
	else destlookY = oldlooky-lookaty;
	if (lookatz > oldlookz) destlookZ = lookatz-oldlookz;
	else destlookZ = oldlookz-lookatz;*/
	
	new Float:desttime;
	if (destX >= destY && destX >= destZ) desttime = destX;
	else if (destY >= destX && destY >= destZ) desttime = destY;
	else if (destZ >= destX && destZ >= destY) desttime = destZ;
	desttime /= speed;
	
	/*new Float:lookdesttime;
	if (destlookX >= destlookY && destlookX >= destlookZ) lookdesttime = destlookX;
	else if (destlookY >= destlookX && destlookY >= destlookZ) lookdesttime = destlookY;
	else if (destlookZ >= destlookX && destlookZ >= destlookY) lookdesttime = destlookZ;*/
	
	//SeifCamInfo[playerid][sciDestX] = x;
	//SeifCamInfo[playerid][sciDestY] = y;
	//SeifCamInfo[playerid][sciDestZ] = z;
	SeifCamInfo[playerid][sciMaxDest] = desttime; // number to divide each destX/Y/Z so you can move the camera to the destination with every coordinate arriving at the same time.
	SeifCamInfo[playerid][sciDestX] = destX/desttime;
	SeifCamInfo[playerid][sciDestY] = destY/desttime;
	SeifCamInfo[playerid][sciDestZ] = destZ/desttime;
	SeifCamInfo[playerid][sciMove] = desttime; // amount of times left before arriving to the destination. since desttime is the max number to divide, it's set to it.
	SeifCamInfo[playerid][sciMoving] = true;
	SeifCamInfo[playerid][sciFinalDestX] = posx;
	SeifCamInfo[playerid][sciFinalDestY] = posy;
	SeifCamInfo[playerid][sciFinalDestZ] = posz;
	//new Float:x, Float:y, Float:z;
	//GetPlayerPos(playerid, x, y, z);
	SetTimerEx("MoveCamTimer", 50, 0, "d", playerid);
	return 1;
}

function RotatePlayerCamera(playerid, Float:posx, Float:posy, Float:posz, Float:speed)
{
	SeifCamInfo[playerid][sciLookMaxDest] = speed; // number to divide each destX/Y/Z so you can move the camera to the destination with every coordinate arriving at the same time.
	/*SeifCamInfo[playerid][sciLookDestX] = destlookX/lookdesttime;
	SeifCamInfo[playerid][sciLookDestY] = destlookY/lookdesttime;
	SeifCamInfo[playerid][sciLookDestZ] = destlookZ/lookdesttime;*/
	SeifCamInfo[playerid][sciAngle] = GetPlayerCameraFacingPos(playerid); // this will change
	SeifCamInfo[playerid][sciFirstAngle] = GetPlayerCameraFacingPos(playerid); // this will stay the same
	SeifCamInfo[playerid][sciFinalAngle] = GetPlayerCameraFacingPosEx(playerid, posx, posy, posz); // this will stay the same
	//SetPlayerFacingAngle(playerid, GetPlayerCameraFacingPos(playerid));
	//SeifCamInfo[playerid][sciLookMove] = ((SeifCamInfo[playerid][sciFirstAngle]>SeifCamInfo[playerid][sciFinalAngle]) ? ((SeifCamInfo[playerid][sciFirstAngle]-SeifCamInfo[playerid][sciFinalAngle])/speed) : ((SeifCamInfo[playerid][sciFinalAngle]-SeifCamInfo[playerid][sciFirstAngle])/speed)); // amount of times left before arriving to the destination angle.
	SeifCamInfo[playerid][sciLookMoving] = true;
	SeifCamInfo[playerid][sciLookFinalDestX] = posx;
	SeifCamInfo[playerid][sciLookFinalDestY] = posy;
	SeifCamInfo[playerid][sciLookFinalDestZ] = posz;
	printf("move: %f", SeifCamInfo[playerid][sciAngle]);
	SetTimerEx("RotCamTimer", 50, 0, "d", playerid);
	return 1;
}

function ResetPlayerCamera(playerid)
{
	if (!IsPlayerConnected(playerid)) return 0;

    SeifCamInfo[playerid][sciMoving] = false;
	SetCameraBehindPlayer(playerid);
    SeifCamInfo[playerid][sciPOSX] = 0.0;
    SeifCamInfo[playerid][sciPOSY] = 0.0;
    SeifCamInfo[playerid][sciPOSZ] = 0.0;
    SeifCamInfo[playerid][sciLOOKX] = 0.0;
    SeifCamInfo[playerid][sciLOOKY] = 0.0;
    SeifCamInfo[playerid][sciLOOKZ] = 0.0;
    SeifCamInfo[playerid][sciMove] = 0.0;
    SeifCamInfo[playerid][sciDestX] = 0.0;
	SeifCamInfo[playerid][sciDestY] = 0.0;
	SeifCamInfo[playerid][sciDestZ] = 0.0;
    SeifCamInfo[playerid][sciFinalDestX] = 0.0;
	SeifCamInfo[playerid][sciFinalDestY] = 0.0;
	SeifCamInfo[playerid][sciFinalDestZ] = 0.0;

	SeifCamInfo[playerid][sciLookMoving] = false;
    SeifCamInfo[playerid][sciLookMove] = 0.0;
    SeifCamInfo[playerid][sciLookDestX] = 0.0;
	SeifCamInfo[playerid][sciLookDestY] = 0.0;
	SeifCamInfo[playerid][sciLookDestZ] = 0.0;
    SeifCamInfo[playerid][sciLookFinalDestX] = 0.0;
	SeifCamInfo[playerid][sciLookFinalDestY] = 0.0;
	SeifCamInfo[playerid][sciLookFinalDestZ] = 0.0;
	SetCameraBehindPlayer(playerid);
    return 1;
}

function GetPlayerCamPos(playerid, &Float:x, &Float:y, &Float:z)
{
	x = SeifCamInfo[playerid][sciPOSX];
	y = SeifCamInfo[playerid][sciPOSY];
	z = SeifCamInfo[playerid][sciPOSZ];
}

function GetPlayerCameraLookAt(playerid, &Float:x, &Float:y, &Float:z)
{
	x = SeifCamInfo[playerid][sciLOOKX];
	y = SeifCamInfo[playerid][sciLOOKY];
	z = SeifCamInfo[playerid][sciLOOKZ];
}

/*Float:GetPlayerCameraFacingPos(playerid)
{
	new Float:x = SeifCamInfo[playerid][sciLOOKX],Float:y = SeifCamInfo[playerid][sciLOOKY],Float:a = SeifCamInfo[playerid][sciLOOKZ];
	new Float:px = SeifCamInfo[playerid][sciLookFinalDestX], Float:py = SeifCamInfo[playerid][sciLookFinalDestY];
	a = floatabs(atan((py-y)/(px-x)));

	if (px <= x && py >= y) 		a = floatsub(180, a);
	else if (px < x && py < y) 		a = floatadd(a, 180);
	else if (px >= x && py <= y) 	a = floatsub(360.0, a);

	a = floatsub(a, 90.0);

	if (a >= 360.0) a = floatsub(a, 360.0);

	return a;
}*/

function MoveCamTimer(playerid)
{
	if (!IsPlayerConnected(playerid)) return 0;
	if (SeifCamInfo[playerid][sciMoving] == false)
	{
	    OnPlayerCameraMoved(playerid, SeifCamInfo[playerid][sciPOSX], SeifCamInfo[playerid][sciPOSY], SeifCamInfo[playerid][sciPOSZ]);
	    //SetPlayerCameraLookAt(playerid, sciX, sciY, sciZ);
		//printf("player %d DONE: %f, %f, %f", playerid, SeifCamInfo[playerid][sciPOSX], SeifCamInfo[playerid][sciPOSY], SeifCamInfo[playerid][sciPOSZ]);
	    return 1;
	}
	
	if (SeifCamInfo[playerid][sciFinalDestX] > SeifCamInfo[playerid][sciPOSX]) SeifCamInfo[playerid][sciPOSX] += SeifCamInfo[playerid][sciDestX];
	else SeifCamInfo[playerid][sciPOSX] -= SeifCamInfo[playerid][sciDestX];
	if (SeifCamInfo[playerid][sciFinalDestY] > SeifCamInfo[playerid][sciPOSY]) SeifCamInfo[playerid][sciPOSY] += SeifCamInfo[playerid][sciDestY];
	else SeifCamInfo[playerid][sciPOSY] -= SeifCamInfo[playerid][sciDestY];
	if (SeifCamInfo[playerid][sciFinalDestZ] > SeifCamInfo[playerid][sciPOSZ]) SeifCamInfo[playerid][sciPOSZ] += SeifCamInfo[playerid][sciDestZ];
	else SeifCamInfo[playerid][sciPOSZ] -= SeifCamInfo[playerid][sciDestZ];
	SeifCamInfo[playerid][sciMove] -= float(1);
	//printf("move: %f", SeifCamInfo[playerid][sciMove]);
	if (SeifCamInfo[playerid][sciMove] <= float(1)) SeifCamInfo[playerid][sciMoving] = false;
	SetPlayerCameraPos(playerid, SeifCamInfo[playerid][sciPOSX], SeifCamInfo[playerid][sciPOSY], SeifCamInfo[playerid][sciPOSZ]);
	SetPlayerCameraLookAt(playerid, SeifCamInfo[playerid][sciLOOKX], SeifCamInfo[playerid][sciLOOKY], SeifCamInfo[playerid][sciLOOKZ]);
	SetTimerEx("MoveCamTimer", 50, 0, "d", playerid);
	return 1;
}

function RotCamTimer(playerid)
{
	if (!IsPlayerConnected(playerid)) return 0;
	if (SeifCamInfo[playerid][sciLookMoving] == false)
	{
	    OnPlayerCameraRotated(playerid, SeifCamInfo[playerid][sciLOOKX], SeifCamInfo[playerid][sciLOOKY], SeifCamInfo[playerid][sciLOOKZ]);
	    return 1;
	}

	if ((SeifCamInfo[playerid][sciFirstAngle]-SeifCamInfo[playerid][sciFinalAngle]) > 180) SeifCamInfo[playerid][sciAngle] -= SeifCamInfo[playerid][sciLookMaxDest];
	else SeifCamInfo[playerid][sciAngle] += SeifCamInfo[playerid][sciLookMaxDest];
	
	SeifCamInfo[playerid][sciLOOKX] -= floatsin(SeifCamInfo[playerid][sciAngle], degrees);
  	SeifCamInfo[playerid][sciLOOKY] -= floatcos(SeifCamInfo[playerid][sciAngle], degrees);
  	
	if (SeifCamInfo[playerid][sciAngle] <= 0.0 && SeifCamInfo[playerid][sciFinalAngle] > 0.0) SeifCamInfo[playerid][sciAngle] = 360.0;
	else if (SeifCamInfo[playerid][sciAngle] >= 360.0 && SeifCamInfo[playerid][sciFinalAngle] < 360.0) SeifCamInfo[playerid][sciAngle] = 0.0;
	
	if ((SeifCamInfo[playerid][sciAngle] >= (SeifCamInfo[playerid][sciFinalAngle]-SeifCamInfo[playerid][sciLookMaxDest]) && SeifCamInfo[playerid][sciAngle] <= (SeifCamInfo[playerid][sciFinalAngle]+SeifCamInfo[playerid][sciLookMaxDest])) || SeifCamInfo[playerid][sciAngle] == SeifCamInfo[playerid][sciFinalAngle]) printf("done: %f/%f", SeifCamInfo[playerid][sciAngle], SeifCamInfo[playerid][sciFinalAngle]), SeifCamInfo[playerid][sciLookMoving] = false;
	printf("%f/%f", SeifCamInfo[playerid][sciAngle], SeifCamInfo[playerid][sciFinalAngle]);
	SetPlayerCameraPos(playerid, SeifCamInfo[playerid][sciPOSX], SeifCamInfo[playerid][sciPOSY], SeifCamInfo[playerid][sciPOSZ]);
	SetPlayerCameraLookAt(playerid, SeifCamInfo[playerid][sciLOOKX], SeifCamInfo[playerid][sciLOOKY], SeifCamInfo[playerid][sciLOOKZ]);
	SetTimerEx("RotCamTimer", 50, 0, "d", playerid);
	return 1;
}

//**FUNCTION RENAMES**//
#define SetPlayerCameraPos SetPlayerCameraPosEx
#define SetPlayerCameraLookAt SetPlayerCameraLookAtEx
//**FUNCTION FORWARDS**//
forward OnPlayerCameraMoved(playerid, Float:destinationX, Float:destinationY, Float:destinationZ);
forward OnPlayerCameraRotated(playerid, Float:destinationX, Float:destinationY, Float:destinationZ);
			// you MUST put the following callback in your script that uses this include! Exclude the /* and */ !
/*

public OnPlayerCameraMoved(playerid, Float:destinationX, Float:destinationY, Float:destinationZ)
{
	return 1;
}
public OnPlayerCameraRotated(playerid, Float:destinationX, Float:destinationY, Float:destinationZ)
{
	return 1;
}

*/
