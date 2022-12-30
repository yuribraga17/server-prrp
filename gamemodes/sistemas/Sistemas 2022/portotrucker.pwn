#define NUM_SHIP_ROUTE_POINTS   20
#define SHIP_HULL_ID          	9585 // casco do navio de carga maci�a. Isso � usado como o objeto principal
#define SHIP_MOVE_SPEED         8.0
#define SHIP_DRAW_DISTANCE      1.0

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
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211,10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
{3536.2651, -2574.9211, 10.6937, 269.5703, 0.00, 156.36},
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
