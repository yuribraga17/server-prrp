#define NUM_SHIP_ROUTE_POINTS   20
#define SHIP_HULL_ID          	9585 // casco do navio de carga maci�a. Isso � usado como o objeto principal
#define SHIP_MOVE_SPEED         10.0
#define SHIP_DRAW_DISTANCE      3000.0

#define NUM_SHIP_ATTACHMENTS 10

new Float:gShipHullOrigin[3] =
{ -2409.8438, 1544.9453, 2.0000 }; // para que possamos converter espa�o mundial para modelar espa�o para posi��es de conex�o

new gShipAttachmentModelIds[NUM_SHIP_ATTACHMENTS] = {
9586, // Plataforma principal do navio
9761, // Trilhos para navios
9584, // exterior da ponte
9698, // Bridge interior
9821, // Portas interiores de pontes
9818, // Bridge radio desk
9819, // Secret�ria do capit�o
9822, // assento do capit�o
9820, // Pontes e luzes da ponte
9590 // �rea da ba�a de carga
};

new Float:gShipAttachmentPos[NUM_SHIP_ATTACHMENTS][3] = {
// estas s�o posi��es usadas no navio de carga original no jogo
// eles ser�o convertidos para o espa�o do modelo antes de anexar
{-2412.1250, 1544.9453, 12.0469},
{-2411.3906, 1544.9453, 22.0781},
{-2485.0781, 1544.9453, 21.1953},
{-2473.5859, 1543.7734, 24.0781},
{-2474.3594, 1547.2422, 19.7500},
{-2470.2656, 1544.9609, 28.8672},
{-2470.4531, 1551.1172, 28.1406},
{-2470.9375, 1550.7500, 27.9063},
{-2474.6250, 1545.0859, 27.0625},
{-2403.5078, 1544.9453, 3.7188}
};

// Pontos de rota do navio (posi��o/rota��o)
new Float:gShipRoutePoints[NUM_SHIP_ROUTE_POINTS][6] = {
{0244.4482, -2662.6050, 9.2969,   0.00, 0.00, 190.50},
{2844.4482, -2362.6050, 7.2969,   0.00, 0.00, 190.50},
{2869.6379, -2310.5771, 7.2969,   0.00, 0.00, 156.36},
{2917.0820, -2250.0437, 7.2969,   0.00, 0.00, 153.36},
{3161.5376, -2055.3135, 7.2969,   0.00, 0.00, 145.74},
{-1431.59937, 191.26247, 7.2969,   0.00, 0.00, 144.96},
{3277.0647,-1968.2816, 7.2969,   0.00, 0.00, 167.52},
{3532.0605,-1662.3719, 7.2969,   0.36, 0.06, 206.70},
{4229.4663,-1070.0613, 7.2969,   0.36, 0.54, 244.80},
{5216.6968,-602.6795, 7.2969,   1.92, -0.36, 283.26},
{5372.9312,-658.6240, 7.2969,   0.92, -0.36, 316.32},
{5542.2729,-884.8328, 7.2969,   0.92, -0.36, 342.54},
{5568.6753,-1186.7546, 7.2969,   0.02, -0.06, 359.64},
{5464.0508,-1684.8986, 7.2969,   0.02, -0.06, 359.64},
{5260.2930,-2490.8940, 7.2969,   0.02, -0.06, 384.48},
{4977.8237,-2990.7974, 7.2969,   0.02, -0.06, 378.54},
{4580.2227,-3002.791, 7.2969,   0.02, -0.06, 356.28},
{3643.6187, -3630.5256, 7.2969,   0.00, 0.00, 189.24},
{3299.7607, -3455.6931, 7.2969,   0.00, 0.00, 215.22},
{2870.5447, -2664.9153, 7.2969,   0.00, 0.00, 215.22}
};


new gShipCurrentPoint = 1; //ponto de rota atual em que o navio est�. N�s come�amos na rota 1

// SA-MP objects
new gMainShipObjectId;
new gShipsAttachments[NUM_SHIP_ROUTE_POINTS];
forward StartMovingTimer();

//-------------------------------------------------

public StartMovingTimer()
{
		MoveObject(gMainShipObjectId,gShipRoutePoints[gShipCurrentPoint][0],
		                           gShipRoutePoints[gShipCurrentPoint][1],
								   gShipRoutePoints[gShipCurrentPoint][2],
								   SHIP_MOVE_SPEED / 4.0, //mais lento para o primeiro percurso
								   gShipRoutePoints[gShipCurrentPoint][3],
								   gShipRoutePoints[gShipCurrentPoint][4],
								   gShipRoutePoints[gShipCurrentPoint][5]);
}

//-------------------------------------------------
forward PortoTrucker_ModeInit();
public PortoTrucker_ModeInit()
{
	gMainShipObjectId = CreateObject(SHIP_HULL_ID, gShipRoutePoints[0][0], gShipRoutePoints[0][1], gShipRoutePoints[0][2],
									gShipRoutePoints[0][3], gShipRoutePoints[0][4], gShipRoutePoints[0][5], SHIP_DRAW_DISTANCE);

	new x=0;
	while(x != NUM_SHIP_ATTACHMENTS) {
	    gShipsAttachments[x] = CreateObject(gShipAttachmentModelIds[x], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SHIP_DRAW_DISTANCE);
		AttachObjectToObject(gShipsAttachments[x], gMainShipObjectId,
					gShipAttachmentPos[x][0] - gShipHullOrigin[0],
					gShipAttachmentPos[x][1] - gShipHullOrigin[1],
					gShipAttachmentPos[x][2] - gShipHullOrigin[2],
					0.0, 0.0, 0.0);
		x++;
	}
	SetTimer("StartMovingTimer",60*1000,0); // pausa na rota 0 � de 600 segundos

	return 1;
}

//-------------------------------------------------
forward PortoTrucker_ModeExit();
public PortoTrucker_ModeExit()
{
    DestroyObject(gMainShipObjectId);
    new x=0;
	while(x != NUM_SHIP_ATTACHMENTS) {
	    DestroyObject(gShipsAttachments[x]);
		x++;
	}
	return 1;
}

//-------------------------------------------------
forward OnObjectMoved_Porto(objectid);
public OnObjectMoved_Porto(objectid)
{
    gShipCurrentPoint++;

	format(string, sizeof string, "Moveu navio: %d", gShipCurrentPoint);
    SendClientMessageToAll(-1, string);
	if(gShipCurrentPoint == 1)
	{
        SetTimer("StartMovingTimer",60*1000,0); // pausa a rota de 5 � 600 segunos
        
        //SendClientMessageToAll(-1, "O Navio est� no porto");
		return 1;
	}

    if(gShipCurrentPoint == NUM_SHIP_ROUTE_POINTS)
	{
		gShipCurrentPoint = 0;

   		MoveObject(gMainShipObjectId,gShipRoutePoints[gShipCurrentPoint][0],
	                           gShipRoutePoints[gShipCurrentPoint][1],
							   gShipRoutePoints[gShipCurrentPoint][2],
							   SHIP_MOVE_SPEED / 3.0, // mais lento para o �ltimo percurso
							   gShipRoutePoints[gShipCurrentPoint][3],
							   gShipRoutePoints[gShipCurrentPoint][4],
							   gShipRoutePoints[gShipCurrentPoint][5]);
        return 1;
	}

	if(gShipCurrentPoint == 1) {
	    SetTimer("StartMovingTimer",60*1000,0); // pausa na rota 0 por 60 segundos
		return 1;
	}

    MoveObject(gMainShipObjectId,gShipRoutePoints[gShipCurrentPoint][0],
	                           gShipRoutePoints[gShipCurrentPoint][1],
							   gShipRoutePoints[gShipCurrentPoint][2],
							   SHIP_MOVE_SPEED,
							   gShipRoutePoints[gShipCurrentPoint][3],
							   gShipRoutePoints[gShipCurrentPoint][4],
							   gShipRoutePoints[gShipCurrentPoint][5]);

 	return 1;
}
