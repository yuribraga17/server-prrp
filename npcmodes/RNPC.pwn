#include <a_npc>
/*
	RNPC NPC script
	Version 0.3 	@ 13.07.2012
	Version 0.3.3 	@ 24.05.2014
	Version 0.4		@ 26.06.2014
	Version 0.4.1	@ 03.12.2014
	Mauzen
	
	Communication codes:
		Server -> NPC:
			101:<slot> 		Start playing back ID recording
			102				Stop current playback
			103				Pause playback
			104				Resume playback
			109				Start playing back the following recording file
			
			110				Disable autorepeat
			111				Enable autorepeat
			112				NPC is dead (ignore all playback commands)
			113				NPC is not dead (reset automatically on spawn)
			114				Start checking for possible run-overs
			115				Stop checking for possible run-overs
			
			
		NPC -> Server:
			001:<version>	Notification about join
			002				Notification about finished playback
			003				Notification about stopped playback
		
			201:<slot>		Started vehicle playback
			202:<slot>		Started on-foot playback
			208				Started custom file playback on-foot
			209				Started custom file playback in vehicle
			
			301:<id>		Report: occupied vehicle <id> is within RUNOVER_DISTANCE

*/

//#define FILESAFE_MODE	// Adds a filecheck before starting playback. This is slow on slow HDDs, so only use it if youre experiencing NPC crashes

// Buildnumber of this NPC script, should match the number of the RNPC include
#define RNPC_SCRIPT_VERSION			"14"

// Identify messages as RNPC commands
// (alternative communication protocol for future versions)
#define RNPC_COMM_ID				520

#define RUNOVER_DISTANCE			6.0
#define RUNOVER_INTERVAL			100

new npcid;
new vehicle;
new repeat;
new curplayback[32];
new runoverTimer = -1;
new dead;

// 

main(){}

public OnNPCEnterVehicle(vehicleid, seatid)
{
	vehicle = true;
}

public OnNPCExitVehicle()
{
	vehicle = false;
}

public OnNPCSpawn() {
	// Reset death state
	dead = false;	
}


// Checks if there are any occupied vehicles close to the NPC
// and reports them to the server for a full vehicle run-over check.
forward CheckCloseVehicles();
public CheckCloseVehicles() {
	if (vehicle || dead) return;
	
	new Float:tx, Float:ty, Float:tz;
	new msg[14];
	
	for (new i = 0; i < MAX_PLAYERS; i++) {
		if (GetPlayerVehicleID(i) == INVALID_VEHICLE_ID || i == npcid) continue;
		
		GetMyPos(tx, ty, tz);
		if (IsPlayerInRangeOfPoint(i, RUNOVER_DISTANCE, tx, ty, tz)) {
			format(msg, sizeof(msg), "RNPC:301:%d", i);
			SendCommand(msg);
		}
		
	}
}

public OnNPCConnect(myplayerid)
{	
    npcid = myplayerid;
	// Register at server
	SendCommand("RNPC:001:"RNPC_SCRIPT_VERSION);
}
public OnRecordingPlaybackEnd() 
{	
	SendCommand("RNPC:002");
	if (repeat) {
		new rec[9];
		if (vehicle) {
			StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER, curplayback);
			format(rec, sizeof(rec), "RNPC:201");
		} else {
			StartRecordingPlayback(PLAYER_RECORDING_TYPE_ONFOOT, curplayback);
			format(rec, sizeof(rec), "RNPC:202");
		}
		SendCommand(rec);
	}
}

public OnClientMessage(color, text[])
{
	// Fix zero-length fake commands
	if (strlen(text) == 0) return;

	// Only accept these if the NPC is not marked dead
	if (!dead) {	
	
		if (!strcmp(text,"RNPC:101", false, 8))
		{
			new slot = strval(text[9]);
			new rec[12];
			format(curplayback, 32, "rnpc%03d-%02d", npcid, slot);
			
			#if defined FILESAFE_MODE
				if (!fexist(curplayback)) {				
					new txt[64];
					format(txt, sizeof(txt), "RNPC %d: target file %s does not exist. CMD:%s", npcid, curplayback, text);
					SendChat(txt);
					return;
				}
			#endif
			
			StopRecordingPlayback();
			if (vehicle) {
				StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER, curplayback);
				format(rec, 12, "RNPC:201:%d", slot);
			} else {
				StartRecordingPlayback(PLAYER_RECORDING_TYPE_ONFOOT, curplayback);
				format(rec, 12, "RNPC:202:%d", slot);
			}
			
			SendCommand(rec);
			return;
		}
		
		if (!strcmp(text,"RNPC:109:",false, 9))
		{
			new rec[9];
			format(curplayback, 32, text[9]);
			// Remove trailing .rec to prevent crash
			if (strfind(curplayback, ".rec", true) > -1) {
				strmid(curplayback, curplayback, 0, strlen(curplayback) - 4);
			}
			
			#if defined FILESAFE_MODE
				if (!fexist(curplayback)) {				
					new txt[64];
					format(txt, sizeof(txt), "RNPC %d: target file %s does not exist. CMD:%s", npcid, curplayback, text);
					SendChat(txt);
					return;
				}
			#endif
			
			StopRecordingPlayback();
			if (vehicle) {
				StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER, curplayback);
				format(rec, 8, "RNPC:208");
			} else {
				StartRecordingPlayback(PLAYER_RECORDING_TYPE_ONFOOT, curplayback);
				format(rec, 8, "RNPC:209");
			}
			
			SendCommand(rec);
			return;
		}
		
		if (!strcmp(text,"RNPC:103", false, 8)) {
			PauseRecordingPlayback();
			return;
		}
		if (!strcmp(text,"RNPC:104", false, 8)) {
			ResumeRecordingPlayback();
			return;
		}
	}
	
	if (!strcmp(text,"RNPC:102",false))
	{
		StopRecordingPlayback();
		SendCommand("RNPC:003");
		return;
	}	
	
	
	if (!strcmp(text,"RNPC:110",false))
    {
		repeat = 0;
		return;
    }
	
	if (!strcmp(text,"RNPC:111",false))
    {
		repeat = 1;
		return;
    }
	
	if (!strcmp(text,"RNPC:112", false, 8))
	{
		dead = true;
		return;
	}
	
	if (!strcmp(text,"RNPC:113", false, 8))
	{
		dead = false;
		return;
	}
	
	if (!strcmp(text,"RNPC:114", false, 8))
	{
		if (runoverTimer == -1) runoverTimer = SetTimer("CheckCloseVehicles", RUNOVER_INTERVAL, 1);
		return;
	}
	
	if (!strcmp(text,"RNPC:115", false, 8))
	{
		if (runoverTimer == -1) KillTimer(runoverTimer);
		return;
	}
	
}