//
// A Driver NPC that goes around a path continuously
// Kye 2009
//

#include <a_npc>

#define NUM_PLAYBACK_FILES 6
new gPlaybackFileCycle=0;

//------------------------------------------

main(){}

//------------------------------------------

NextPlayback()
{
	// Reset the cycle count if we reach the max
	if(gPlaybackFileCycle==NUM_PLAYBACK_FILES) gPlaybackFileCycle = 0;

	if(gPlaybackFileCycle==0) {
	    StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"SFparaLV");
	}
	else if(gPlaybackFileCycle==1) {
	    StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"LVparaLV2");
	}
	else if(gPlaybackFileCycle==2) {
		StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"LV2paraPC");
	}
	else if(gPlaybackFileCycle==3) {
		StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"PCparaLS1");
	}
	else if(gPlaybackFileCycle==4) {
		StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"LS1paraLS2");
	}
	else if(gPlaybackFileCycle==5) {
		StartRecordingPlayback(PLAYER_RECORDING_TYPE_DRIVER,"LS2paraSF");
	}

	gPlaybackFileCycle++;
}
	

//------------------------------------------

public OnRecordingPlaybackEnd()
{
    NextPlayback();
}

//------------------------------------------

public OnNPCEnterVehicle(vehicleid, seatid)
{
    NextPlayback();
}

//------------------------------------------

public OnNPCExitVehicle()
{
    StopRecordingPlayback();
    gPlaybackFileCycle = 0;
}

//------------------------------------------
