/*
 *  sscanf 2.8.2
 *  Created by Y_Less, updated by Emmet_.
 *
 *  Version: MPL 1.1
 *
 *  The contents of this file are subject to the Mozilla Public License Version
 *  1.1 (the "License"); you may not use this file except in compliance with
 *  the License. You may obtain a copy of the License at
 *  [url]http://www.mozilla.org/MPL/[/url]
 *
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *
 *  The Original Code is the sscanf 2.0 SA:MP plugin.
 *
 *  The Initial Developer of the Original Code is Alex "Y_Less" Cole.
 *  Portions created by the Initial Developer are Copyright (C) 2010
 *  the Initial Developer. All Rights Reserved.
 *
 *  Contributor(s):
 *
 *  Special Thanks to:
 *
 *      SA:MP Team past, present and future
 */

#if defined _inc_a_npc
	#pragma library sscanf
#elseif !defined _inc_a_samp
	#error Please include <a_npc> or <a_samp> first.
#endif

#define SSCANF:%0(%1) sscanf_%0(%1);public sscanf_%0(%1)

#if defined sscanf
	#error sscanf (possibly the PAWN version) already defined.
#endif

native sscanf(const data[], const format[], {Float,_}:...);
native unformat(const data[], const format[], {Float,_}:...) = sscanf;
native SSCANF_Init(players, invalid, len);
native SSCANF_Join(playerid, const name[], npc);
native SSCANF_Leave(playerid);
native SSCANF_IsConnected(playerid);

native SSCANF_Option(const name[], value);

stock const
	SSCANF_QUIET[] = "SSCANF_QUIET",
	OLD_DEFAULT_NAME[] = "OLD_DEFAULT_NAME",
	MATCH_NAME_PARTIAL[] = "MATCH_NAME_PARTIAL",
	CELLMIN_ON_MATCHES[] = "CELLMIN_ON_MATCHES",
	OLD_DEFAULT_KUSTOM[] = "OLD_DEFAULT_KUSTOM",
	OLD_DEFAULT_CUSTOM[] = "OLD_DEFAULT_CUSTOM";

static stock
	bool:SSCANF_gInit = false,
	SSCANF_g_sPlayers[MAX_PLAYERS char];

#if defined _inc_a_npc
	forward SSCANF_PlayerCheck();

	/*
	  OnNPCModeInit

	  Called when the script starts if it is a NPC mode, sets up the system,
	  then calls the "real" OnNPCModeInit (using the new ALS 2 hook method).
	*/

	public OnNPCModeInit()
	{
		SSCANF_Init(MAX_PLAYERS, INVALID_PLAYER_ID, MAX_PLAYER_NAME);
		#if !defined SSCANF_NO_PLAYERS
			// Initialise the system.
			SSCANF_PlayerCheck();
			SetTimer("SSCANF_PlayerCheck", 1, 1);
		#endif
		#if defined SSCANF_OnNPCModeInit
			SSCANF_OnNPCModeInit();
		#endif
		return 1;
	}

	#if defined _ALS_OnNPCModeInit
		#undef OnNPCModeInit
	#else
		#define _ALS_OnNPCModeInit
	#endif
	#define OnNPCModeInit SSCANF_OnNPCModeInit
	#if defined SSCANF_OnNPCModeInit
		forward SSCANF_OnNPCModeInit();
	#endif

	/*
	  SSCANF_PlayerCheck

	  NPC modes have no "OnPlayerConnect callback, so we need to simulate one.
	*/

	#if !defined SSCANF_NO_PLAYERS
		public SSCANF_PlayerCheck()
		{
			for (new i = 0; i != MAX_PLAYERS; ++i)
			{
				if (IsPlayerConnected(i))
				{
					if (!SSCANF_g_sPlayers{i})
					{
						new
							name[MAX_PLAYER_NAME];
						GetPlayerName(i, name, sizeof (name));
						// We have no way to know if they are an NPC or not!
						SSCANF_Join(i, name, 0);
						SSCANF_g_sPlayers{i} = 1;
					}
				}
				else
				{
					if (SSCANF_g_sPlayers{i})
					{
						SSCANF_Leave(i);
						SSCANF_g_sPlayers{i} = 0;
					}
				}
			}
		}
	#endif
#else
	/*
	  OnFilterScriptInit

	  Called when the script starts if it is a filterscript, sets up the system,
	  then calls the "real" OnFilterScriptInit (using the new ALS 2 hook
	  method).
	*/

	public OnFilterScriptInit()
	{
	    new
     		name[MAX_PLAYER_NAME];
	
		SSCANF_Init(GetMaxPlayers(), INVALID_PLAYER_ID, MAX_PLAYER_NAME);
		SSCANF_gInit = true;
		
		// Check if there are any players that aren't initialized.
		for (new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if (IsPlayerConnected(i) && !SSCANF_IsConnected(i))
		    {
		        GetPlayerName(i, name, MAX_PLAYER_NAME);
		        SSCANF_Join(i, name, IsPlayerNPC(i));
		    }
		}
		
		#if defined SSCANF_OnFilterScriptInit
			SSCANF_OnFilterScriptInit();
		#endif
		return 1;
	}

	#if defined _ALS_OnFilterScriptInit
		#undef OnFilterScriptInit
	#else
		#define _ALS_OnFilterScriptInit
	#endif
	#define OnFilterScriptInit SSCANF_OnFilterScriptInit
	#if defined SSCANF_OnFilterScriptInit
		forward SSCANF_OnFilterScriptInit();
	#endif

	/*
	  OnGameModeInit

	  Called when the script starts if it is a gamemode.  This callback is also
	  called in filterscripts so we don't want to reinitialise the system in
	  that case.
	*/

	public OnGameModeInit()
	{
		if (!SSCANF_gInit)
		{
		    new
		        name[MAX_PLAYER_NAME];
		
			SSCANF_Init(GetMaxPlayers(), INVALID_PLAYER_ID, MAX_PLAYER_NAME);
			SSCANF_gInit = true;
			
			// Check if there are any players that aren't initialized.
			for (new i = 0; i < MAX_PLAYERS; i ++)
			{
			    if (IsPlayerConnected(i) && !SSCANF_IsConnected(i))
			    {
			        GetPlayerName(i, name, MAX_PLAYER_NAME);
			        SSCANF_Join(i, name, IsPlayerNPC(i));
			    }
			}
		}
		#if defined SSCANF_OnGameModeInit
			SSCANF_OnGameModeInit();
		#endif
		return 1;
	}

	#if defined _ALS_OnGameModeInit
		#undef OnGameModeInit
	#else
		#define _ALS_OnGameModeInit
	#endif
	#define OnGameModeInit SSCANF_OnGameModeInit
	#if defined SSCANF_OnGameModeInit
		forward SSCANF_OnGameModeInit();
	#endif

	/*
	  OnPlayerConnect

	  Called when a player connects.  Actually increments an internal count so
	  that if a script ends and "OnPlayerDisconnect" is called then "sscanf"
	  still knows that the player is really connected.  Also stores their name
	  internally.
	*/

	public OnPlayerConnect(playerid)
	{
		new
			name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof (name));
		SSCANF_Join(playerid, name, IsPlayerNPC(playerid));
		#if defined SSCANF_OnPlayerConnect
			SSCANF_OnPlayerConnect(playerid);
		#endif
		return 1;
	}

	#if defined _ALS_OnPlayerConnect
		#undef OnPlayerConnect
	#else
		#define _ALS_OnPlayerConnect
	#endif
	#define OnPlayerConnect SSCANF_OnPlayerConnect
	#if defined SSCANF_OnPlayerConnect
		forward SSCANF_OnPlayerConnect(playerid);
	#endif

	/*
	  OnPlayerDisconnect

	  Called when a player disconnects, or when a script is ended.
	*/

	public OnPlayerDisconnect(playerid, reason)
	{
		#if defined SSCANF_OnPlayerDisconnect
			SSCANF_OnPlayerDisconnect(playerid, reason);
		#endif
		SSCANF_Leave(playerid);
		return 1;
	}

	#if defined _ALS_OnPlayerDisconnect
		#undef OnPlayerDisconnect
	#else
		#define _ALS_OnPlayerDisconnect
	#endif
	#define OnPlayerDisconnect SSCANF_OnPlayerDisconnect
	#if defined SSCANF_OnPlayerDisconnect
		forward SSCANF_OnPlayerDisconnect(playerid, reason);
	#endif
#endif

#define SSCANF_Init
#define SSCANF_Join
#define SSCANF_Leave

#define extract%0->%1; EXTRN%1;unformat(_:EXTRZ:EXTRV:EXTRX:%0,##,%1,,);
#define unformat(_:EXTRZ:EXTRV:EXTRX:%0,##,%1);%2else if (unformat(_:EXTRV:EXTRX:%0,##,%1))

#define EXTRV:EXTRX:%0<%3>##,%9new%1,%2) EXTRY:%0##P<%3>,|||%1|||%2)
#define EXTRX:%0##,%9new%1,%2) EXTRY:%0##,|||%1|||%2)
#define EXTRY: EXTR8:EXTR9:EXTR0:EXTR1:EXTR2:EXTR3:EXTR4:

#define EXTR8:EXTR9:EXTR0:EXTR1:EXTR2:EXTR3:EXTR4:%0##%1,%2|||%6:%3=%9|||%4) %6_EXTRO:%0##%1,%2|||%3=%9|||%4)
#define EXTR9:EXTR0:EXTR1:EXTR2:EXTR3:EXTR4:%0##%1,%2|||%3=%9|||%4) __EXTRO:%0##%1,%2|||%3=%9|||%4)
#define EXTR0:EXTR1:EXTR2:EXTR3:EXTR4:%0##%1,%2|||%6:%3[%7]|||%4) %6_EXTRW:%0##%1,%2|||%3[%7]|||%4)
#define EXTR1:EXTR2:EXTR3:EXTR4:%0##%1,%2|||%3[%7]|||%4) __EXTRW:%0##%1,%2|||%3|||%4)
#define EXTR2:EXTR3:EXTR4:%0##%1,%2|||%6:%3|||%4) %6_EXTRN:%0##%1,%2|||%3|||%4)
#define EXTR3:EXTR4:%0##%1,,%2||||||%4) %0##%1,%2)
#define EXTR4:%0##%1,%2|||%3|||%4) __EXTRN:%0##%1,%2|||%3|||%4)

// Optional specifiers.
#define __EXTRO:%0##%1,%2|||%3=%9|||%4,%5) EXTRY:%0##%1I"("#%9")"#,%2,%3|||%4|||%5)
#define Float_EXTRO:%0##%1,%2|||%3=%9|||%4,%5) EXTRY:%0##%1F"("#%9")"#,%2,%3|||%4|||%5)
#define player_EXTRO:%0##%1,%2|||%3=%9|||%4,%5) EXTRY:%0##%1U"("#%9")"#,%2,%3|||%4|||%5)
#define string_EXTRO:%0##%1,%2|||%3[%7]=%9|||%4,%5) EXTRY:%0##%1S"("#%9")"#[%7],%2,%3|||%4|||%5)

// Normal specifiers (the double underscore is to work for "_:".
#define __EXTRN:%0##%1,%2|||%3|||%4,%5) EXTRY:%0##%1i,%2,%3|||%4|||%5)
#define Float_EXTRN:%0##%1,%2|||%3|||%4,%5) EXTRY:%0##%1f,%2,%3|||%4|||%5)
#define player_EXTRN:%0##%1,%2|||%3|||%4,%5) EXTRY:%0##%1u,%2,%3|||%4|||%5)
//#define string_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1s[%7],%2,%3|||%4|||%5)

// Array versions of normal specifiers.
#define __EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<i>[%7],%2,%3|||%4|||%5)
#define Float_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<f>[%7],%2,%3|||%4|||%5)
#define player_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<u>[%7],%2,%3|||%4|||%5)
#define string_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1s[%7],%2,%3|||%4|||%5)

// Get rid of excess leading space which causes warnings.
#define EXTRN%0new%1; new%1;

#if !defined string
    #define string:
#endif

#define player:

#define hex:
#define hex_EXTRO:%0##%1,%2|||%3=%9|||%4,%5) EXTRY:%0##%1H"("#%9")"#,%2,%3|||%4|||%5)
#define hex_EXTRN:%0##%1,%2|||%3|||%4,%5) EXTRY:%0##%1h,%2,%3|||%4|||%5)
#define hex_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<h>[%7],%2,%3|||%4|||%5)

#define bin:
#define bin_EXTRO:%0##%1,%2|||%3=%9|||%4,%5) EXTRY:%0##%1B"("#%9")"#,%2,%3|||%4|||%5)
#define bin_EXTRN:%0##%1,%2|||%3|||%4,%5) EXTRY:%0##%1b,%2,%3|||%4|||%5)
#define bin_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<b>[%7],%2,%3|||%4|||%5)

#define kustom:%0<%1> %0
#define kustom_EXTRO:%0##%1,%2|||%3<%8>=%9|||%4,%5) EXTRY:%0##%1K<%8>"("#%9")"#,%2,%3|||%4|||%5)
#define kustom_EXTRN:%0##%1,%2|||%3<%8>|||%4,%5) EXTRY:%0##%1k<%8>,%2,%3|||%4|||%5)
//#define bin_EXTRW:%0##%1,%2|||%3[%7]|||%4,%5) EXTRY:%0##%1a<b>[%7],%2,%3|||%4|||%5)

SSCANF:weapon(strings[])
{
	// This function is VERY basic, needs VASTLY improving to detect variations.
	if ('0' <= strings[0] <= '9')
	{
		new
			ret = strval(strings);
		if (0 <= ret <= 18 || 22 <= ret <= 46)
		{
			return ret;
		}
	}
	else if (!strcmp(strings, "Unarmed")) return 0;
	else if (!strcmp(strings, "Brass Knuckles")) return 1;
	else if (!strcmp(strings, "Golf Club")) return 2;
	else if (!strcmp(strings, "Night Stick")) return 3;
	else if (!strcmp(strings, "Knife")) return 4;
	else if (!strcmp(strings, "Baseball Bat")) return 5;
	else if (!strcmp(strings, "Shovel")) return 6;
	else if (!strcmp(strings, "Pool cue")) return 7;
	else if (!strcmp(strings, "Katana")) return 8;
	else if (!strcmp(strings, "Chainsaw")) return 9;
	else if (!strcmp(strings, "Purple Dildo")) return 10;
	else if (!strcmp(strings, "White Dildo")) return 11;
	else if (!strcmp(strings, "Long White Dildo")) return 12;
	else if (!strcmp(strings, "White Dildo 2")) return 13;
	else if (!strcmp(strings, "Flowers")) return 14;
	else if (!strcmp(strings, "Cane")) return 15;
	else if (!strcmp(strings, "Grenades")) return 16;
	else if (!strcmp(strings, "Tear Gas")) return 17;
	else if (!strcmp(strings, "Molotovs")) return 18;
	else if (!strcmp(strings, "Pistol")) return 22;
	else if (!strcmp(strings, "Silenced Pistol")) return 23;
	else if (!strcmp(strings, "Desert Eagle")) return 24;
	else if (!strcmp(strings, "Shotgun")) return 25;
	else if (!strcmp(strings, "Sawn Off Shotgun")) return 26;
	else if (!strcmp(strings, "Combat Shotgun")) return 27;
	else if (!strcmp(strings, "Micro Uzi")) return 28;
	else if (!strcmp(strings, "Mac 10")) return 28;
	else if (!strcmp(strings, "MP5")) return 29;
	else if (!strcmp(strings, "AK47")) return 30;
	else if (!strcmp(strings, "M4")) return 31;
	else if (!strcmp(strings, "Tec9")) return 32;
	else if (!strcmp(strings, "Rifle")) return 33;
	else if (!strcmp(strings, "Sniper Rifle")) return 34;
	else if (!strcmp(strings, "RPG")) return 35;
	else if (!strcmp(strings, "Missile Launcher")) return 36;
	else if (!strcmp(strings, "Flame Thrower")) return 37;
	else if (!strcmp(strings, "Minigun")) return 38;
	else if (!strcmp(strings, "Sachel Charges")) return 39;
	else if (!strcmp(strings, "Detonator")) return 40;
	else if (!strcmp(strings, "Spray Paint")) return 41;
	else if (!strcmp(strings, "Fire Extinguisher")) return 42;
	else if (!strcmp(strings, "Camera")) return 43;
	else if (!strcmp(strings, "Nightvision Goggles")) return 44;
	else if (!strcmp(strings, "Thermal Goggles")) return 45;
	else if (!strcmp(strings, "Parachute")) return 46;
	return -1;
}

SSCANF:vehicle(strings[])
{
	// This function is VERY basic, needs VASTLY improving to detect variations.
	if ('0' <= strings[0] <= '9')
	{
		new
			ret = strval(strings);
		if (400 <= ret <= 611)
		{
			return ret;
		}
	}
	else if (!strcmp(strings, "Landstalker")) return 400;
	else if (!strcmp(strings, "Bravura")) return 401;
	else if (!strcmp(strings, "Buffalo")) return 402;
	else if (!strcmp(strings, "Linerunner")) return 403;
	else if (!strcmp(strings, "Perenniel")) return 404;
	else if (!strcmp(strings, "Sentinel")) return 405;
	else if (!strcmp(strings, "Dumper")) return 406;
	else if (!strcmp(strings, "Firetruck")) return 407;
	else if (!strcmp(strings, "Trashmaster")) return 408;
	else if (!strcmp(strings, "Stretch")) return 409;
	else if (!strcmp(strings, "Manana")) return 410;
	else if (!strcmp(strings, "Infernus")) return 411;
	else if (!strcmp(strings, "Voodoo")) return 412;
	else if (!strcmp(strings, "Pony")) return 413;
	else if (!strcmp(strings, "Mule")) return 414;
	else if (!strcmp(strings, "Cheetah")) return 415;
	else if (!strcmp(strings, "Ambulance")) return 416;
	else if (!strcmp(strings, "Leviathan")) return 417;
	else if (!strcmp(strings, "Moonbeam")) return 418;
	else if (!strcmp(strings, "Esperanto")) return 419;
	else if (!strcmp(strings, "Taxi")) return 420;
	else if (!strcmp(strings, "Washington")) return 421;
	else if (!strcmp(strings, "Bobcat")) return 422;
	else if (!strcmp(strings, "Mr Whoopee")) return 423;
	else if (!strcmp(strings, "BF Injection")) return 424;
	else if (!strcmp(strings, "Hunter")) return 425;
	else if (!strcmp(strings, "Premier")) return 426;
	else if (!strcmp(strings, "Enforcer")) return 427;
	else if (!strcmp(strings, "Securicar")) return 428;
	else if (!strcmp(strings, "Banshee")) return 429;
	else if (!strcmp(strings, "Predator")) return 430;
	else if (!strcmp(strings, "Bus")) return 431;
	else if (!strcmp(strings, "Rhino")) return 432;
	else if (!strcmp(strings, "Barracks")) return 433;
	else if (!strcmp(strings, "Hotknife")) return 434;
	else if (!strcmp(strings, "Article Trailer")) return 435;
	else if (!strcmp(strings, "Previon")) return 436;
	else if (!strcmp(strings, "Coach")) return 437;
	else if (!strcmp(strings, "Cabbie")) return 438;
	else if (!strcmp(strings, "Stallion")) return 439;
	else if (!strcmp(strings, "Rumpo")) return 440;
	else if (!strcmp(strings, "RC Bandit")) return 441;
	else if (!strcmp(strings, "Romero")) return 442;
	else if (!strcmp(strings, "Packer")) return 443;
	else if (!strcmp(strings, "Monster")) return 444;
	else if (!strcmp(strings, "Admiral")) return 445;
	else if (!strcmp(strings, "Squallo")) return 446;
	else if (!strcmp(strings, "Seasparrow")) return 447;
	else if (!strcmp(strings, "Pizzaboy")) return 448;
	else if (!strcmp(strings, "Tram")) return 449;
	else if (!strcmp(strings, "Article Trailer 2")) return 450;
	else if (!strcmp(strings, "Turismo")) return 451;
	else if (!strcmp(strings, "Speeder")) return 452;
	else if (!strcmp(strings, "Reefer")) return 453;
	else if (!strcmp(strings, "Tropic")) return 454;
	else if (!strcmp(strings, "Flatbed")) return 455;
	else if (!strcmp(strings, "Yankee")) return 456;
	else if (!strcmp(strings, "Caddy")) return 457;
	else if (!strcmp(strings, "Solair")) return 458;
	else if (!strcmp(strings, "Berkley's RC Van")) return 459;
	else if (!strcmp(strings, "Skimmer")) return 460;
	else if (!strcmp(strings, "PCJ-600")) return 461;
	else if (!strcmp(strings, "Faggio")) return 462;
	else if (!strcmp(strings, "Freeway")) return 463;
	else if (!strcmp(strings, "RC Baron")) return 464;
	else if (!strcmp(strings, "RC Raider")) return 465;
	else if (!strcmp(strings, "Glendale")) return 466;
	else if (!strcmp(strings, "Oceanic")) return 467;
	else if (!strcmp(strings, "Sanchez")) return 468;
	else if (!strcmp(strings, "Sparrow")) return 469;
	else if (!strcmp(strings, "Patriot")) return 470;
	else if (!strcmp(strings, "Quad")) return 471;
	else if (!strcmp(strings, "Coastguard")) return 472;
	else if (!strcmp(strings, "Dinghy")) return 473;
	else if (!strcmp(strings, "Hermes")) return 474;
	else if (!strcmp(strings, "Sabre")) return 475;
	else if (!strcmp(strings, "Rustler")) return 476;
	else if (!strcmp(strings, "ZR-350")) return 477;
	else if (!strcmp(strings, "Walton")) return 478;
	else if (!strcmp(strings, "Regina")) return 479;
	else if (!strcmp(strings, "Comet")) return 480;
	else if (!strcmp(strings, "BMX")) return 481;
	else if (!strcmp(strings, "Burrito")) return 482;
	else if (!strcmp(strings, "Camper")) return 483;
	else if (!strcmp(strings, "Marquis")) return 484;
	else if (!strcmp(strings, "Baggage")) return 485;
	else if (!strcmp(strings, "Dozer")) return 486;
	else if (!strcmp(strings, "Maverick")) return 487;
	else if (!strcmp(strings, "SAN News Maverick")) return 488;
	else if (!strcmp(strings, "Rancher")) return 489;
	else if (!strcmp(strings, "FBI Rancher")) return 490;
	else if (!strcmp(strings, "Virgo")) return 491;
	else if (!strcmp(strings, "Greenwood")) return 492;
	else if (!strcmp(strings, "Jetmax")) return 493;
	else if (!strcmp(strings, "Hotring Racer")) return 494;
	else if (!strcmp(strings, "Sandking")) return 495;
	else if (!strcmp(strings, "Blista Compact")) return 496;
	else if (!strcmp(strings, "Police Maverick")) return 497;
	else if (!strcmp(strings, "Boxville")) return 498;
	else if (!strcmp(strings, "Benson")) return 499;
	else if (!strcmp(strings, "Mesa")) return 500;
	else if (!strcmp(strings, "RC Goblin")) return 501;
	else if (!strcmp(strings, "Hotring Racer")) return 502;
	else if (!strcmp(strings, "Hotring Racer")) return 503;
	else if (!strcmp(strings, "Bloodring Banger")) return 504;
	else if (!strcmp(strings, "Rancher")) return 505;
	else if (!strcmp(strings, "Super GT")) return 506;
	else if (!strcmp(strings, "Elegant")) return 507;
	else if (!strcmp(strings, "Journey")) return 508;
	else if (!strcmp(strings, "Bike")) return 509;
	else if (!strcmp(strings, "Mountain Bike")) return 510;
	else if (!strcmp(strings, "Beagle")) return 511;
	else if (!strcmp(strings, "Cropduster")) return 512;
	else if (!strcmp(strings, "Stuntplane")) return 513;
	else if (!strcmp(strings, "Tanker")) return 514;
	else if (!strcmp(strings, "Roadtrain")) return 515;
	else if (!strcmp(strings, "Nebula")) return 516;
	else if (!strcmp(strings, "Majestic")) return 517;
	else if (!strcmp(strings, "Buccaneer")) return 518;
	else if (!strcmp(strings, "Shamal")) return 519;
	else if (!strcmp(strings, "Hydra")) return 520;
	else if (!strcmp(strings, "FCR-900")) return 521;
	else if (!strcmp(strings, "NRG-500")) return 522;
	else if (!strcmp(strings, "HPV1000")) return 523;
	else if (!strcmp(strings, "Cement Truck")) return 524;
	else if (!strcmp(strings, "Towtruck")) return 525;
	else if (!strcmp(strings, "Fortune")) return 526;
	else if (!strcmp(strings, "Cadrona")) return 527;
	else if (!strcmp(strings, "FBI Truck")) return 528;
	else if (!strcmp(strings, "Willard")) return 529;
	else if (!strcmp(strings, "Forklift")) return 530;
	else if (!strcmp(strings, "Tractor")) return 531;
	else if (!strcmp(strings, "Combine Harvester")) return 532;
	else if (!strcmp(strings, "Feltzer")) return 533;
	else if (!strcmp(strings, "Remington")) return 534;
	else if (!strcmp(strings, "Slamvan")) return 535;
	else if (!strcmp(strings, "Blade")) return 536;
	else if (!strcmp(strings, "Freight (Train)")) return 537;
	else if (!strcmp(strings, "Brownstreak (Train)")) return 538;
	else if (!strcmp(strings, "Vortex")) return 539;
	else if (!strcmp(strings, "Vincent")) return 540;
	else if (!strcmp(strings, "Bullet")) return 541;
	else if (!strcmp(strings, "Clover")) return 542;
	else if (!strcmp(strings, "Sadler")) return 543;
	else if (!strcmp(strings, "Firetruck LA")) return 544;
	else if (!strcmp(strings, "Hustler")) return 545;
	else if (!strcmp(strings, "Intruder")) return 546;
	else if (!strcmp(strings, "Primo")) return 547;
	else if (!strcmp(strings, "Cargobob")) return 548;
	else if (!strcmp(strings, "Tampa")) return 549;
	else if (!strcmp(strings, "Sunrise")) return 550;
	else if (!strcmp(strings, "Merit")) return 551;
	else if (!strcmp(strings, "Utility Van")) return 552;
	else if (!strcmp(strings, "Nevada")) return 553;
	else if (!strcmp(strings, "Yosemite")) return 554;
	else if (!strcmp(strings, "Windsor")) return 555;
	else if (!strcmp(strings, "Monster \"A\"")) return 556;
	else if (!strcmp(strings, "Monster \"B\"")) return 557;
	else if (!strcmp(strings, "Uranus")) return 558;
	else if (!strcmp(strings, "Jester")) return 559;
	else if (!strcmp(strings, "Sultan")) return 560;
	else if (!strcmp(strings, "Stratum")) return 561;
	else if (!strcmp(strings, "Elegy")) return 562;
	else if (!strcmp(strings, "Raindance")) return 563;
	else if (!strcmp(strings, "RC Tiger")) return 564;
	else if (!strcmp(strings, "Flash")) return 565;
	else if (!strcmp(strings, "Tahoma")) return 566;
	else if (!strcmp(strings, "Savanna")) return 567;
	else if (!strcmp(strings, "Bandito")) return 568;
	else if (!strcmp(strings, "Freight Flat Trailer (Train)")) return 569;
	else if (!strcmp(strings, "Streak Trailer (Train)")) return 570;
	else if (!strcmp(strings, "Kart")) return 571;
	else if (!strcmp(strings, "Mower")) return 572;
	else if (!strcmp(strings, "Dune")) return 573;
	else if (!strcmp(strings, "Sweeper")) return 574;
	else if (!strcmp(strings, "Broadway")) return 575;
	else if (!strcmp(strings, "Tornado")) return 576;
	else if (!strcmp(strings, "AT400")) return 577;
	else if (!strcmp(strings, "DFT-30")) return 578;
	else if (!strcmp(strings, "Huntley")) return 579;
	else if (!strcmp(strings, "Stafford")) return 580;
	else if (!strcmp(strings, "BF-400")) return 581;
	else if (!strcmp(strings, "Newsvan")) return 582;
	else if (!strcmp(strings, "Tug")) return 583;
	else if (!strcmp(strings, "Petrol Trailer")) return 584;
	else if (!strcmp(strings, "Emperor")) return 585;
	else if (!strcmp(strings, "Wayfarer")) return 586;
	else if (!strcmp(strings, "Euros")) return 587;
	else if (!strcmp(strings, "Hotdog")) return 588;
	else if (!strcmp(strings, "Club")) return 589;
	else if (!strcmp(strings, "Freight Box Trailer (Train)")) return 590;
	else if (!strcmp(strings, "Article Trailer 3")) return 591;
	else if (!strcmp(strings, "Andromada")) return 592;
	else if (!strcmp(strings, "Dodo")) return 593;
	else if (!strcmp(strings, "RC Cam")) return 594;
	else if (!strcmp(strings, "Launch")) return 595;
	else if (!strcmp(strings, "Police Car (LSPD)")) return 596;
	else if (!strcmp(strings, "Police Car (SFPD)")) return 597;
	else if (!strcmp(strings, "Police Car (LVPD)")) return 598;
	else if (!strcmp(strings, "Police Ranger")) return 599;
	else if (!strcmp(strings, "Picador")) return 600;
	else if (!strcmp(strings, "S.W.A.T.")) return 601;
	else if (!strcmp(strings, "Alpha")) return 602;
	else if (!strcmp(strings, "Phoenix")) return 603;
	else if (!strcmp(strings, "Glendale Shit")) return 604;
	else if (!strcmp(strings, "Sadler Shit")) return 605;
	else if (!strcmp(strings, "Baggage Trailer \"A\"")) return 606;
	else if (!strcmp(strings, "Baggage Trailer \"B\"")) return 607;
	else if (!strcmp(strings, "Tug Stairs Trailer")) return 608;
	else if (!strcmp(strings, "Boxville")) return 609;
	else if (!strcmp(strings, "Farm Trailer")) return 610;
	else if (!strcmp(strings, "Utility Trailer")) return 611;
	return -1;
}

// Fix the compiler crash when both the PAWN and Plugin versions of sscanf are
// found by renaming the old version at declaration.  (fixes.inc compatible
// naming scheme: "BAD_Function()").
#define sscanf(%0:...) BAD_sscanf(%0:...)
