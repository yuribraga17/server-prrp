#define MAX_VICIADOS 1

//SISTEMA DE VICIADO BY YURS

new ViciadoSpawned[MAX_VICIADOS];
enum vViciados{
	viID,
	viTempoSumir,
	Float:viPos[3]
};

new ViciadoInfo[MAX_VICIADOS][vViciados];


new const Float:vViciadoSpawn[5][4]= {
	{2119.2380,-1932.5464,13.5194,269.5780},
	{2124.7830,-1929.0297,13.5251,182.9522},
	{2106.9966,-1929.9760,13.5147,255.7912},
	{2108.3147,-1916.2120,13.5211,162.9159},
	{2131.4180,-1914.9006,13.5274,127.1144}

};

forward criandonoia();
public criandonoia()
{

	if(IsValidDynamic3DTextLabel(noiaLabel))
              DestroyDynamic3DTextLabel(noiaLabel);
              
	new Float:VCspawn[30],
		rand = random(sizeof(vViciadoSpawn)),
		vSkin = randomEx(1, 120);
		

	VCspawn[0] = vViciadoSpawn[rand][0];
	VCspawn[1] = vViciadoSpawn[rand][1];
	VCspawn[2] = vViciadoSpawn[rand][2];
	VCspawn[3] = vViciadoSpawn[rand][3];
	VCspawn[4] = vViciadoSpawn[rand][4];
	VCspawn[5] = vViciadoSpawn[rand][5];
	VCspawn[6] = vViciadoSpawn[rand][6];
	VCspawn[7] = vViciadoSpawn[rand][7];
	VCspawn[8] = vViciadoSpawn[rand][8];
	VCspawn[9] = vViciadoSpawn[rand][9];
	VCspawn[10] = vViciadoSpawn[rand][10];
	VCspawn[11] = vViciadoSpawn[rand][12];
	VCspawn[13] = vViciadoSpawn[rand][13];
	VCspawn[14] = vViciadoSpawn[rand][14];
	VCspawn[15] = vViciadoSpawn[rand][15];
	VCspawn[16] = vViciadoSpawn[rand][16];
	VCspawn[17] = vViciadoSpawn[rand][17];
	VCspawn[18] = vViciadoSpawn[rand][18];
	VCspawn[19] = vViciadoSpawn[rand][19];
	VCspawn[20] = vViciadoSpawn[rand][20];
	VCspawn[21] = vViciadoSpawn[rand][21];
	VCspawn[22] = vViciadoSpawn[rand][22];
	VCspawn[23] = vViciadoSpawn[rand][23];
	VCspawn[24] = vViciadoSpawn[rand][24];
	VCspawn[25] = vViciadoSpawn[rand][25];
	VCspawn[26] = vViciadoSpawn[rand][26];
	VCspawn[27] = vViciadoSpawn[rand][27];
	VCspawn[28] = vViciadoSpawn[rand][28];
	VCspawn[29] = vViciadoSpawn[rand][29];

	for(new i; i != MAX_VICIADOS; i++) if(!ViciadoSpawned[i])
	{
		DestroyActor(ViciadoSpawned[i]);
		ViciadoInfo[i][viID] = 0;
		
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[0], VCspawn[1], VCspawn[2], VCspawn[3], VCspawn[4]);
		ViciadoInfo[i][viPos][0] = VCspawn[0];
		ViciadoInfo[i][viPos][1] = VCspawn[1];
		ViciadoInfo[i][viPos][2] = VCspawn[2];
		ViciadoInfo[i][viPos][3] = VCspawn[3];
		ViciadoInfo[i][viPos][4] = VCspawn[4];
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[5], VCspawn[6], VCspawn[7], VCspawn[8], VCspawn[9]);
		ViciadoInfo[i][viPos][5] = VCspawn[5];
		ViciadoInfo[i][viPos][6] = VCspawn[6];
		ViciadoInfo[i][viPos][7] = VCspawn[7];
		ViciadoInfo[i][viPos][8] = VCspawn[8];
		ViciadoInfo[i][viPos][9] = VCspawn[9];
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[10], VCspawn[11], VCspawn[12], VCspawn[13], VCspawn[14]);
		ViciadoInfo[i][viPos][10] = VCspawn[10];
		ViciadoInfo[i][viPos][11] = VCspawn[11];
		ViciadoInfo[i][viPos][12] = VCspawn[12];
		ViciadoInfo[i][viPos][13] = VCspawn[13];
		ViciadoInfo[i][viPos][14] = VCspawn[14];
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[15], VCspawn[16], VCspawn[17], VCspawn[18], VCspawn[19]);
		ViciadoInfo[i][viPos][15] = VCspawn[15];
		ViciadoInfo[i][viPos][16] = VCspawn[16];
		ViciadoInfo[i][viPos][17] = VCspawn[17];
		ViciadoInfo[i][viPos][18] = VCspawn[18];
		ViciadoInfo[i][viPos][19] = VCspawn[19];
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[20], VCspawn[21], VCspawn[22], VCspawn[23], VCspawn[24]);
		ViciadoInfo[i][viPos][20] = VCspawn[20];
		ViciadoInfo[i][viPos][21] = VCspawn[21];
		ViciadoInfo[i][viPos][22] = VCspawn[22];
		ViciadoInfo[i][viPos][23] = VCspawn[23];
		ViciadoInfo[i][viPos][24] = VCspawn[24];
		ViciadoSpawned[i] = CreateActor(vSkin, VCspawn[25], VCspawn[26], VCspawn[27], VCspawn[28], VCspawn[29]);
		ViciadoInfo[i][viPos][25] = VCspawn[25];
		ViciadoInfo[i][viPos][26] = VCspawn[26];
		ViciadoInfo[i][viPos][27] = VCspawn[27];
		ViciadoInfo[i][viPos][28] = VCspawn[28];
		ViciadoInfo[i][viPos][29] = VCspawn[29];

		ViciadoInfo[i][viID] = randomEx(1, 20);
		
		new droga = randomEx(1, 3);
		/*if(droga == 1)
		{
			noiaLabel = CreateDynamic3DTextLabel("Maconha", COLOR_WHITE, VCspawn[0], VCspawn[1], VCspawn[2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
			Attach3DTextLabelToPlayer(noiaLabel, ViciadoSpawned[i], 0.0, 0.0, 0.7);
		}else if(droga == 2){
			noiaLabel = Create3DTextLabel("Cocaína", 0x008080FF, VCspawn[0], VCspawn[1], VCspawn[2], 15.0, 0);
			//Attach3DTextLabelToPlayer(noiaLabel, ViciadoSpawned[i], 0.0, 0.0, 0.7);
		}else if(droga == 3){
			noiaLabel = Create3DTextLabel("Crack", 0x008080FF, VCspawn[0], VCspawn[1], VCspawn[2], 15.0, 0);
			//Attach3DTextLabelToPlayer(noiaLabel, ViciadoSpawned[i], 0.0, 0.0, 0.7);
		}*/
	}
	return 1;
}
