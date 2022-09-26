
new Ball2;
new BallStatus2;
new Baller2;
new ShootingBall2;
new BallBounce2;

forward basket_OnGameModeInit2();

public basket_OnGameModeInit2()
{
	Baller2 = 999;
	DestroyDynamicObject(Ball2);
	Ball2 = CreateDynamicObject(2114, 1974.7418, -1696.5747, 12.5176, 0, 0, 96);
	return 1;
}

CMD:bola_idle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 0)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		DestroyDynamicObject(Ball2);
		Ball2 = CreateDynamicObject(2114, x+random(3), y+random(3), z, 0, 0, 96);
		return 1;
	}
	return 0;
}

forward Ball2Down(playerid, Float:oldz);
public Ball2Down(playerid, Float:oldz)
{
    new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(Ball2, x, y, z);
	new Float:a;
	new Float:x2, Float:y2;
	GetPlayerPos(playerid, x2, y2, a);
	GetPlayerFacingAngle(playerid, a);
	x2 += (16 * floatsin(-a, degrees));
	y2 += (16 * floatcos(-a, degrees));
	MoveDynamicObject(Ball2, x2, y2, oldz, 10.0+random(3));
	Baller2 = 999;
	ShootingBall2 = 0;
	BallBounce2 = 1;
	return 1;
}

forward Ball2Down2(playerid);
public Ball2Down2(playerid)
{
	MoveDynamicObject(Ball2, 1982.0116, -1696.3867, 12.5176, 10.0+random(3));
	Baller2 = 999;
	ShootingBall2 = 0;
	GameTextForPlayer(playerid, "Cesta!", 3000, 3);
	BallBounce2 = 1;
	return 1;
}

forward Ball2Down4(playerid);
public Ball2Down4(playerid)
{
	MoveDynamicObject(Ball2, 1982.0116+random(5),-1696.3867+random(5),12.5176, 10.0+random(3));
	Baller2 = 999;
	ShootingBall2 = 0;
	GameTextForPlayer(playerid, "Errou!", 3000, 3);
	BallBounce2 = 1;
	return 1;
}

forward Shoot2Miss(playerid);
public Shoot2Miss(playerid)
{
	MoveDynamicObject(Ball2, 1982.0116+random(2), -1696.3867+random(2), 12.5176+random(2), 10.0+random(4));
	ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0);
	ShootingBall2 = 4;
	HavingBall[playerid] = 0;
	return 1;
}
