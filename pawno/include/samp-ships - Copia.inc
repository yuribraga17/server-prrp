/**--------------------------------------------------------------------------**\
					  ====================================
 				      samp-ships - background moving ships
					  ====================================
Author:
	Simon
	https://github.com/SimonItaly
	http://forum.sa-mp.com/member.php?u=84139

Description:
	This include aims to create cargo ships passing in background
    for aestetic purpose by assigning them to custom routes.

Legal:
	Version: MPL 1.1
	
	The contents of this file are subject to the Mozilla Public License Version 
	1.1 (the "License"); you may not use this file except in compliance with 
	the License. You may obtain a copy of the License at 
    http://www.mozilla.org/MPL

Version:
	1.0

Thanks:
	adri1, Pottus: (see AttachObjectToObjectEx)

Requirements:
    https://github.com/samp-incognito/samp-streamer-plugin
    https://github.com/karimcambridge/SAMP-foreach
    (or https://github.com/Misiur/YSI-Includes)
    https://github.com/Zeex/pawn

Changelog:
	2017/10/XX:
		First version.

Functions:
	Stock:
		CreateShip
		SetShipBodyMaterial
		SetShipContainerMaterial
		DestroyShip
		CreateRoute
		DestroyRoute
		StartRouteForShip
		StopRouteForShip
	Static:
		absoluteangle
		GetAngleToPoint
		GetDistanceBetweenPoints_Ships
		GetXYInDirection
        AttachObjectToObjectEx
        EDIT_FloatEulerFix
        EDIT_FloatGetRemainder
        EDIT_FloatRemainder
    Public:
        ship_route_execute
        ship_rot

Callbacks:
	OnShipRouteCompleted

Iterators:
    Ship
    Route

Compile options:
	DEBUG_SHIP_INC
    SHIP_STREAMER_SD
    SHIP_STREAMER_DD
    MAX_SHIPS
    MAX_ROUTES
    MAX_ROUTE_POINTS
    SHIP_ROT_STEP
    SHIP_MOV_SPEED
    SHIP_TIMER_STEP

\**--------------------------------------------------------------------------**/

#include <streamer>

#tryinclude <YSI\y_iterate>

#if !defined _Y_ITERATE_LOCAL_VERSION
	#include <foreach>
#endif

#if !defined SHIP_STREAMER_SD
    #define SHIP_STREAMER_SD            1000.0
#endif

#if !defined SHIP_STREAMER_DD
    #define SHIP_STREAMER_DD            1000.0
#endif

#if !defined MAX_SHIPS
    #define MAX_SHIPS                   10
#endif

#if !defined MAX_ROUTES
    #define MAX_ROUTES                  5
#endif

#if !defined MAX_ROUTE_POINTS
    #define MAX_ROUTE_POINTS            10
#endif

#define SHIP_ROT_STEP                   0.1
#define SHIP_MOV_SPEED                  5.0
#define SHIP_TIMER_STEP                 15

//==============================================================================

static Float:absoluteangle(Float:a)
{
	while(a < 0.0) a += 360.0;
	while(a > 360.0) a -= 360.0;

	return a;
}

static Float:GetAngleToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY)
{
	return absoluteangle(-(90-(atan2((fDestY - fPointY), (fDestX - fPointX)))));
}

static Float:GetDistanceBetweenPoints_Ships(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1-x2, y1-y2, z1-z2);
}

//==============================================================================

enum E_SHIP_OFFSET
{
    shipModelid,
    Float:shipX,
    Float:shipY,
    Float:shipZ,
    Float:shipSD,
    Float:shipDD
}
static const ship_offset[][E_SHIP_OFFSET] =
{
    { 10231,     -0.918,    -1.5101,     1.47747,   SHIP_STREAMER_SD,     SHIP_STREAMER_DD    },  //Ship cargo
    { 10229,    -0.2481,     -1.402,    -1.15429,   STREAMER_OBJECT_SD,   STREAMER_OBJECT_DD  },  //Ship bits
    { 2944,     47.2517,     1.2108,       4.439,   STREAMER_OBJECT_SD,   STREAMER_OBJECT_DD  }   //Ship door
};

enum E_SHIP_INFO
{
    ship_part[sizeof(ship_offset)+1],
    ship_route,
    Float:ship_rot_step,
    Float:ship_mov_speed,
    ship_timer_step
}

// ship_info[MAX_SHIPS][E_SHIP_INFO]
static
    ship_info[10][E_SHIP_INFO] =
    {
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    },
        {   {0,0,0,0}, -1, 0.0, 0.0    }
    };

static
    Float:route_info[MAX_ROUTES][MAX_ROUTE_POINTS][2],
          route_lenght[MAX_ROUTES];

//==============================================================================

forward OnShipRouteCompleted(ship_id, route_id, steps);

new
    Iterator:Ship<MAX_SHIPS>;

new
    Iterator:Route<MAX_ROUTES>;

/**--------------------------------------------------------------------------**\
<summary>CreateShip</summary>
<param name="x">-</param>
<param name="y">-</param>
<param name="z">-</param>
<param name="rot">-</param>
<param name="rot_step">-</param>
<param name="mov_speed">-</param>
<returns>
	-1 on fail, the id of the ship otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock CreateShip(Float:x, Float:y, Float:z, Float:rot,
                 Float:rot_step = SHIP_ROT_STEP,
                 Float:mov_speed = SHIP_MOV_SPEED,
                 timer_step = SHIP_TIMER_STEP)
{
    new ship_id = Iter_Free(Ship);

    if(ship_id == -1)
        return -1;

    Iter_Add(Ship, ship_id);

    //Main ship (freighter_sfe)
    ship_info[ship_id][ship_part][0] = CreateDynamicObject(10230,
                                        x, y, z,
                                        0.0000000, 0.0000000, rot,
                                        .streamdistance = SHIP_STREAMER_SD,
                                        .drawdistance = SHIP_STREAMER_DD);

    ship_info[ship_id][ship_rot_step] = rot_step;
    ship_info[ship_id][ship_mov_speed] = mov_speed;
    ship_info[ship_id][ship_timer_step] = timer_step;

    new
        Float:newx, Float:newy, Float:newz,
        Float:newrx, Float:newry, Float:newrz
    ;

    for(new i = 0; i < sizeof(ship_offset); i++)
    {
        AttachObjectToObjectEx(ship_info[ship_id][ship_part][0],
                               ship_offset[i][shipX],
                               ship_offset[i][shipY],
                               ship_offset[i][shipZ],
                               0.0, 0.0, 0.0,
                               newx, newy, newz,
                               newrx, newry, newrz,
                               0.0);

        ship_info[ship_id][ship_part][i+1] = CreateDynamicObject(ship_offset[i][shipModelid],
                                                        newx, newy, newz, newrx, newry, newrz,
                                                        .worldid = 0,
                                                        .interiorid = 0,
                                                        .streamdistance = ship_offset[i][shipSD],
                                                        .drawdistance = ship_offset[i][shipDD]);
    }

    #if defined DEBUG_SHIP_INC
        printf("CreateShip: created ship %d", ship_id);
    #endif

    return ship_id;
}

/**--------------------------------------------------------------------------**\
<summary>DestroyShip</summary>
<param name="ship_id">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock DestroyShip(ship_id)
{
    if(!Iter_Contains(Ship, ship_id))
        return 0;

    for(new i = 0; i < sizeof(ship_offset)+1; i++)
    {
        DestroyDynamicObject(ship_info[ship_id][ship_part][i]);
    }

    Iter_Remove(Ship, ship_id);

    #if defined DEBUG_SHIP_INC
        printf("DestroyShip: destroyed ship %d", ship_id);
    #endif

    return 1;
}

/**--------------------------------------------------------------------------**\
<summary>SetShipBodyMaterial</summary>
<param name="ship_id">-</param>
<param name="objectid">-</param>
<param name="txd">-</param>
<param name="material">-</param>
<param name="color">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock SetShipBodyMaterial(ship_id, objectid, txd[], material[], color = 0xFFFFFFFF)
{
    if(!Iter_Contains(Ship, ship_id))
        return 0;

	//Main parts
    SetDynamicObjectMaterial(ship_info[ship_id][ship_part][0], 7,   objectid, txd, material, color);
    SetDynamicObjectMaterial(ship_info[ship_id][ship_part][0], 9,   objectid, txd, material, color);

	//Part underwater
    SetDynamicObjectMaterial(ship_info[ship_id][ship_part][0], 8,   objectid, txd, material, color);
    return 1;
}

/**--------------------------------------------------------------------------**\
<summary>SetShipContainerMaterial</summary>
<param name="ship_id">-</param>
<param name="container_type">-</param>
<param name="objectid_body">-</param>
<param name="txd_body">-</param>
<param name="material_body">-</param>
<param name="objectid_doors">-</param>
<param name="txd_doors">-</param>
<param name="material_doors">-</param>
<param name="color">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
enum
{
    CONTAINER_RED = 0,
    CONTAINER_BLUE,
    CONTAINER_YELLOW
}
stock SetShipContainerMaterial(ship_id, container_type, objectid_body, txd_body[], material_body[],
                                                        objectid_doors, txd_doors[], material_doors[], color = 0xFFFFFFFF)
{
    if(!Iter_Contains(Ship, ship_id))
        return 0;

    switch(container_type)
    {
        case CONTAINER_RED:
        {
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 1, objectid_body, txd_body, material_body, color);  //Red
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 0, objectid_doors, txd_doors, material_doors, color);
        }
        case CONTAINER_BLUE:
        {
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 2, objectid_body, txd_body, material_body, color);  //Blue
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 3, objectid_doors, txd_doors, material_doors, color);
        }
        case CONTAINER_YELLOW:
        {
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 4, objectid_body, txd_body, material_body, color);  //Yellow
            SetDynamicObjectMaterial(ship_info[ship_id][ship_part][1], 5, objectid_doors, txd_doors, material_doors, color);
        }
        default:
            return 0;
    }

    return 1;
}

/**--------------------------------------------------------------------------**\
<summary>CreateRoute</summary>
<param name="new_route">-</param>
<param name="size">-</param>
<returns>
	-1 on fail, the id of the route otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock CreateRoute(const Float:new_route[][2], size = sizeof(new_route))
{
    new route_id = Iter_Free(Route);

    if(route_id == -1)
        return -1;

    Iter_Add(Route, route_id);

    size = clamp(size, 0, MAX_ROUTE_POINTS);

    for(new i; i < size && i < MAX_ROUTE_POINTS; i++)
    {
        route_info[route_id][i][0] = new_route[i][0];
        route_info[route_id][i][1] = new_route[i][1];
    }

    route_lenght[route_id] = size;

    #if defined DEBUG_SHIP_INC
        printf("CreateRoute: created route %d with %d points", route_id, route_lenght[route_id]);
    #endif

    return route_id;
}

/**--------------------------------------------------------------------------**\
<summary>DestroyRoute</summary>
<param name="route_id">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock DestroyRoute(route_id)
{
    if(!Iter_Contains(Route, route_id))
        return 0;

    Iter_Remove(Route, route_id);

    #if defined DEBUG_SHIP_INC
        printf("DestroyRoute: destroyed route %d", route_id);
    #endif

    return 1;
}

/**--------------------------------------------------------------------------**\
<summary>StartRouteForShip</summary>
<param name="route_id">-</param>
<param name="ship_id">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock StartRouteForShip(route_id, ship_id)
{
    if(!Iter_Contains(Route, route_id) || !Iter_Contains(Ship, ship_id))
        return 0;

    if(ship_info[ship_id][ship_route] != -1)
        return 0;

    ship_info[ship_id][ship_route] = route_id;

    ship_route_execute(ship_id, 0);

    #if defined DEBUG_SHIP_INC
        printf("StartRouteForShip: started route %d for ship %d", route_id, ship_id);
    #endif

    return 1;
}

/**--------------------------------------------------------------------------**\
<summary>StopRouteForShip</summary>
<param name="ship_id">-</param>
<returns>
	0 on fail, 1 otherwise.
</returns>
<remarks>
	-
</remarks>
\**--------------------------------------------------------------------------**/
stock StopRouteForShip(ship_id)
{
    if(!Iter_Contains(Ship, ship_id))
        return 0;

    if(ship_info[ship_id][ship_route] == -1)
        return 0;

    ship_info[ship_id][ship_route] = -1;

    for(new i; i < sizeof(ship_offset)+1; i++)
    {
        StopDynamicObject(ship_info[ship_id][ship_part][i]);
    }

    #if defined DEBUG_SHIP_INC
        printf("StopRouteForShip: stopped route for ship %d", ship_id);
    #endif

    return 1;
}

//==============================================================================

/*
 *  Internal functions start here
 */

forward ship_route_execute(ship_id, step);
public ship_route_execute(ship_id, step)
{
    if(!Iter_Contains(Ship, ship_id))
        return;

    new route_id = ship_info[ship_id][ship_route];

    if(!Iter_Contains(Route, route_id))
        return;

    //The route has already been completed
    if(step >= route_lenght[route_id] || step >= MAX_ROUTE_POINTS)
    {
        ship_info[ship_id][ship_route] = -1;

        CallLocalFunction("OnShipRouteCompleted", "iii", ship_id, route_id, route_lenght[route_id]);
        return;
    }

    new Float:angle, Float:current;

    GetDynamicObjectRot(ship_info[ship_id][ship_part][0], angle, angle, current);

    //Get the angle between current and next route points
    angle = GetAngleToPoint(route_info[route_id][step][0], route_info[route_id][step][1],
                            route_info[route_id][step+1][0], route_info[route_id][step+1][1]);

    angle -= 90.0;
    angle = absoluteangle(angle);

    #if defined DEBUG_SHIP_INC
        printf("ship_route_execute: rot from %.2f to %.2f", current, angle);

        current = absoluteangle(current);
        
        new Float:dest_cur = absoluteangle(angle - current);
        new Float:cur_dest = absoluteangle(current - angle);

        new Float:rot_step = ship_info[ship_id][ship_rot_step];
        if(cur_dest > dest_cur)
        {
            printf("\tdest_cur %d iters", floatround(dest_cur / rot_step));
            printf("\testimated time %d ms", floatround(dest_cur / rot_step * ship_info[ship_id][ship_timer_step]));
        }
        else
        {
            printf("\tcur_dest %d iters", floatround(cur_dest / rot_step));
            printf("\testimated time %d ms", floatround(cur_dest / rot_step * ship_info[ship_id][ship_timer_step]));
        }
    #endif

    ship_rot(ship_id, current, angle, step, 0);
}

forward ship_rot(ship_id, Float:a, Float:dest, step, status);
public ship_rot(ship_id, Float:a, Float:dest, step, status)
{
    if(!Iter_Contains(Ship, ship_id))
        return;

    static
        Float:newx,
        Float:newy,
        Float:newz,

        Float:newrx,
        Float:newry,
        Float:newrz,

        Float:dest_cur,
        Float:cur_dest,

        route_id
    ;

    route_id = ship_info[ship_id][ship_route];

    if(!Iter_Contains(Route, route_id))
        return;

    //The route has already been completed
    if(step >= route_lenght[route_id]-1)
    {
        ship_route_execute(ship_id, step+1);
        return;
    }

    a = absoluteangle(a);
    dest = absoluteangle(dest);

    SetDynamicObjectRot(ship_info[ship_id][ship_part][0], 0.0, 0.0, a);

    for(new i = 0; i < sizeof(ship_offset); i++)
    {
        //Calculate the offsets based on the new rotation
        AttachObjectToObjectEx(ship_info[ship_id][ship_part][0],
                               ship_offset[i][shipX],
                               ship_offset[i][shipY],
                               ship_offset[i][shipZ],
                               0.0, 0.0, 0.0,
                               newx, newy, newz,
                               newrx, newry, newrz,
                               0.0);

        SetDynamicObjectPos(ship_info[ship_id][ship_part][i+1], newx, newy, newz);
        SetDynamicObjectRot(ship_info[ship_id][ship_part][i+1], newrx, newry, newrz);
    }

	a = absoluteangle(a);
	dest = absoluteangle(dest);

    if (!status)
    {
        dest_cur = absoluteangle(dest - a),
		cur_dest = absoluteangle(a - dest);

        if(cur_dest > dest_cur)
		{
			a += ship_info[ship_id][ship_rot_step];
		}
		else
		{
			a -= ship_info[ship_id][ship_rot_step];
		}

        #if defined DEBUG_SHIP_INC
            
            //SetPlayerMapIcon(0, 0, newx, newy, newz, 9, -1, MAPICON_GLOBAL);
            //SetPlayerRaceCheckpoint(0, 0, newx, newy, newz, 0.0, 0.0, 0.0, 5.0);

            /*
            printf("\t\t%.4f <= %.4f && %.4f >= %.4f = %d",
                    a, dest+0.5, a, dest-0.5,
                    _:(a <= dest+0.5 && a >= dest-0.5));
            */
        #endif

        if(a <= dest+0.5 && a >= dest-0.5)
        {
            a = dest;
            status = 1;
        }

        SetTimerEx("ship_rot", ship_info[ship_id][ship_timer_step], false,
                   "iffii", ship_id, a, dest, step, status);
    }
    else
    {
        //The rotation has been completed, now move the ship to the next point
        new completion;
        new Float:x, Float:y, Float:z;

        new Float:dist = GetDistanceBetweenPoints_Ships(route_info[route_id][step][0], route_info[route_id][step][1], 0.0,
                                                    route_info[route_id][step+1][0], route_info[route_id][step+1][1], 0.0);

        dest += 90.0;

        for(new i; i < sizeof(ship_offset)+1; i++)
        {
            GetDynamicObjectPos(ship_info[ship_id][ship_part][i], x, y, z);

            GetXYInDirection(x, y, dest, dist);

            completion = MoveDynamicObject(ship_info[ship_id][ship_part][i],
                                        x, y, z,
                                        ship_info[ship_id][ship_mov_speed]);
        }

        #if defined DEBUG_SHIP_INC
            printf("\tMoving from %.4f, %.4f to %.4f, %.4f (%.2f meters) in %d ms (step = %d)",
                    route_info[route_id][step][0], route_info[route_id][step][1],
                    route_info[route_id][step+1][0], route_info[route_id][step+1][1],
                    dist, completion,
                    step);
        #endif

        //Once the movement has been completed, get to the next step
        SetTimerEx("ship_route_execute", completion, 0, "ii", ship_id, step+1);
    }
}

//==============================================================================

static GetXYInDirection(& Float: X, & Float: Y, Float: Angle, Float: distance = 1.0)
{
    X -= (floatsin(Angle, degrees) * distance);
    Y += (floatcos(Angle, degrees) * distance);
}

/*
    Thanks to adri1 & Pottus for the following function(s):
    http://forum.sa-mp.com/showpost.php?p=3144750&postcount=4
*/

static AttachObjectToObjectEx(attachoid, Float:off_x, Float:off_y, Float:off_z, Float:rot_x, Float:rot_y, Float:rot_z, &Float:X, &Float:Y, &Float:Z, &Float:RX, &Float:RY, &Float:RZ, Float:erroroff = 0.0) // By Stylock - [url]http://forum.sa-mp.com/member.php?u=114165[/url]
{
    static
            Float:sin[3],
            Float:cos[3],
            Float:pos[3],
            Float:rot[3];

    GetDynamicObjectPos(attachoid, pos[0], pos[1], pos[2]);
    GetDynamicObjectRot(attachoid, rot[0], rot[1], rot[2]);
	rot[2] += erroroff;

    EDIT_FloatEulerFix(rot[0], rot[1], rot[2]);
    cos[0] = floatcos(rot[0], degrees); cos[1] = floatcos(rot[1], degrees); cos[2] = floatcos(rot[2], degrees); sin[0] = floatsin(rot[0], degrees); sin[1] = floatsin(rot[1], degrees); sin[2] = floatsin(rot[2], degrees);
    pos[0] = pos[0] + off_x * cos[1] * cos[2] - off_x * sin[0] * sin[1] * sin[2] - off_y * cos[0] * sin[2] + off_z * sin[1] * cos[2] + off_z * sin[0] * cos[1] * sin[2];
    pos[1] = pos[1] + off_x * cos[1] * sin[2] + off_x * sin[0] * sin[1] * cos[2] + off_y * cos[0] * cos[2] + off_z * sin[1] * sin[2] - off_z * sin[0] * cos[1] * cos[2];
    pos[2] = pos[2] - off_x * cos[0] * sin[1] + off_y * sin[0] + off_z * cos[0] * cos[1];
    rot[0] = asin(cos[0] * cos[1]); rot[1] = atan2(sin[0], cos[0] * sin[1]) + rot_z; rot[2] = atan2(cos[1] * cos[2] * sin[0] - sin[1] * sin[2], cos[2] * sin[1] - cos[1] * sin[0] * -sin[2]);
    cos[0] = floatcos(rot[0], degrees); cos[1] = floatcos(rot[1], degrees); cos[2] = floatcos(rot[2], degrees); sin[0] = floatsin(rot[0], degrees); sin[1] = floatsin(rot[1], degrees); sin[2] = floatsin(rot[2], degrees);
    rot[0] = asin(cos[0] * sin[1]); rot[1] = atan2(cos[0] * cos[1], sin[0]); rot[2] = atan2(cos[2] * sin[0] * sin[1] - cos[1] * sin[2], cos[1] * cos[2] + sin[0] * sin[1] * sin[2]);
    cos[0] = floatcos(rot[0], degrees); cos[1] = floatcos(rot[1], degrees); cos[2] = floatcos(rot[2], degrees); sin[0] = floatsin(rot[0], degrees); sin[1] = floatsin(rot[1], degrees); sin[2] = floatsin(rot[2], degrees);
    rot[0] = atan2(sin[0], cos[0] * cos[1]) + rot_x; rot[1] = asin(cos[0] * sin[1]); rot[2] = atan2(cos[2] * sin[0] * sin[1] + cos[1] * sin[2], cos[1] * cos[2] - sin[0] * sin[1] * sin[2]);
    cos[0] = floatcos(rot[0], degrees); cos[1] = floatcos(rot[1], degrees); cos[2] = floatcos(rot[2], degrees); sin[0] = floatsin(rot[0], degrees); sin[1] = floatsin(rot[1], degrees); sin[2] = floatsin(rot[2], degrees);
    rot[0] = asin(cos[1] * sin[0]); rot[1] = atan2(sin[1], cos[0] * cos[1]) + rot_y; rot[2] = atan2(cos[0] * sin[2] - cos[2] * sin[0] * sin[1], cos[0] * cos[2] + sin[0] * sin[1] * sin[2]);
    X = pos[0];
    Y = pos[1];
    Z = pos[2];
    RX = rot[0];
    RY = rot[1];
    RZ = rot[2];
}

static EDIT_FloatEulerFix(&Float:rot_x, &Float:rot_y, &Float:rot_z)
{
    EDIT_FloatGetRemainder(rot_x, rot_y, rot_z);
    if((!floatcmp(rot_x, 0.0) || !floatcmp(rot_x, 360.0))
    && (!floatcmp(rot_y, 0.0) || !floatcmp(rot_y, 360.0)))
    {
        rot_y = 0.0000002;
    }
    return 1;
}

static EDIT_FloatGetRemainder(&Float:rot_x, &Float:rot_y, &Float:rot_z)
{
    EDIT_FloatRemainder(rot_x, 360.0);
    EDIT_FloatRemainder(rot_y, 360.0);
    EDIT_FloatRemainder(rot_z, 360.0);
    return 1;
}

static EDIT_FloatRemainder(&Float:remainder, Float:value)
{
    if(remainder >= value)
    {
        while(remainder >= value)
        {
            remainder = remainder - value;
        }
    }
    else if(remainder < 0.0)
    {
        while(remainder < 0.0)
        {
            remainder = remainder + value;
        }
    }
    return 1;
}
