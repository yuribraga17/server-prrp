#include <a_samp>
#include <zcmd>
#include <sscanf2>

#define RED 0xF3400CFF
#define SCM SendClientMessage

#define MAX_FIREWORK 100
#define NON -1

#define function%0(%1) forward%0(%1); public%0(%1)

enum EnumFirework
{
	FW_Owner,
	Float:FW_Pos[4],
	Float:FW_Height,
	Float:FW_Radius,
	FW_Amount,
	FW_RocketsReleased,
	FW_RocketDirection,
	FW_Timer,
	FW_Box
};
new FireworkInfo[MAX_FIREWORK][EnumFirework];

public OnFilterScriptInit(){
    	for(new i; i < MAX_FIREWORK; i++) FireworkInfo[i][FW_Owner]=NON;
	printf("By Yur$");
	return 1;
}
public OnFilterScriptExit(){
	return 1;
}

function EmptyFireworkSlot()
{
	for(new i=1; i < MAX_FIREWORK; i++)if(FireworkInfo[i][FW_Owner]==NON) return i;
	return 0;
}

CMD:colocarfogos(playerid,params[])
{
	new Float:height,Float:radius,amount,string[60];
	if(sscanf(params,"ffd",height,radius,amount))return SCM(playerid,-1,"USE: /plantarfogos [altura] [raio] [quantidade]");
	new eid=EmptyFireworkSlot();
	if(!eid)return SCM(playerid,RED,"Não há mais slots de fogos de artificio livre!");
	GetPlayerPos(playerid,FireworkInfo[eid][FW_Pos][0],FireworkInfo[eid][FW_Pos][1],FireworkInfo[eid][FW_Pos][2]);
	GetPlayerFacingAngle(playerid,FireworkInfo[eid][FW_Pos][3]);
	//Enum info settimine
	FireworkInfo[eid][FW_RocketDirection]=1;
	FireworkInfo[eid][FW_RocketsReleased]=1;
	FireworkInfo[eid][FW_Radius]=radius;
	FireworkInfo[eid][FW_Height]=height;
	FireworkInfo[eid][FW_Owner]=playerid;
	FireworkInfo[eid][FW_Amount]=amount;
	FireworkInfo[eid][FW_Pos][0]+= (2.0 * floatsin(-FireworkInfo[eid][FW_Pos][3],degrees));
	FireworkInfo[eid][FW_Pos][1]+= (2.0 * floatcos(-FireworkInfo[eid][FW_Pos][3],degrees));
	FireworkInfo[eid][FW_Pos][2]-=0.9;
	FireworkInfo[eid][FW_Box]=CreateObject(3016,FireworkInfo[eid][FW_Pos][0],FireworkInfo[eid][FW_Pos][1],FireworkInfo[eid][FW_Pos][2], 0,0,0);
	format(string,sizeof(string),"Fogos de Artificio ID: %d",eid);
	SCM(playerid,-1,string);
	return 1;
}
CMD:acenderfogos(playerid,params[])
{
	new eid;
	if(sscanf(params,"d",eid))return SCM(playerid,-1,"USE: /acenderfogos [ID]]");
	if(FireworkInfo[eid][FW_Owner]!=playerid)return SCM(playerid,RED,"Você acendeu os fogos de artificios!");
	FireworkInfo[eid][FW_Timer]=SetTimerEx("StartFirework",600,true,"d",eid);
	return 1;
}

function StartFirework(eid)
{
    	FireworkInfo[eid][FW_Amount]--;
	new Float:distance,Float:Ax,Float:Ay,Float:Az,time,object;

    	if(!FireworkInfo[eid][FW_Amount]){
		if(IsPlayerConnected(FireworkInfo[eid][FW_Owner]))SCM(FireworkInfo[eid][FW_Owner],-1,"Os fogos de artificios acabaram.");
        	FireworkInfo[eid][FW_Owner]=NON;
		DestroyObject(FireworkInfo[eid][FW_Box]);
		KillTimer(FireworkInfo[eid][FW_Timer]);
		return 1;
	}
	switch(FireworkInfo[eid][FW_RocketsReleased]){
		case 1:distance=20.0;
		case 2:distance=10.0;
		case 3:distance=0.0;
		case 4:distance=(-10.0);
		case 5:distance=(-20.0);
	}
    	switch(FireworkInfo[eid][FW_RocketDirection]){
		case 1:{//Right
            		FireworkInfo[eid][FW_RocketsReleased]++;
            		if(FireworkInfo[eid][FW_RocketsReleased]==6){FireworkInfo[eid][FW_RocketDirection]=0;FireworkInfo[eid][FW_RocketsReleased]=4;}
		}
		case 0:{//Left
            		FireworkInfo[eid][FW_RocketsReleased]--;
            		if(FireworkInfo[eid][FW_RocketsReleased]==0){FireworkInfo[eid][FW_RocketDirection]=1;FireworkInfo[eid][FW_RocketsReleased]=2;}
		}
	}
	//Counting
	Ax=FireworkInfo[eid][FW_Pos][0]+(distance * floatsin(-FireworkInfo[eid][FW_Pos][3],degrees));
	Ay=FireworkInfo[eid][FW_Pos][1]+(distance * floatsin(-FireworkInfo[eid][FW_Pos][3],degrees));
	Az=FireworkInfo[eid][FW_Pos][2]+FireworkInfo[eid][FW_Height];
	//Rocket body moving
	object=CreateObject(3000,FireworkInfo[eid][FW_Pos][0],FireworkInfo[eid][FW_Pos][1],FireworkInfo[eid][FW_Pos][2],0,0,0);
	time=MoveObject(object, Ax,Ay,Az, 20.0);
    	SetTimerEx("MakeSphere",time,false,"dffff",object,Ax,Ay,Az,FireworkInfo[eid][FW_Radius]);
	return 1;
}
function MakeSphere(nobject,Float:x,Float:y,Float:z,Float:radius)
{
    	DestroyObject(nobject);
	new object,type[3]={19282,19283,19284};
	new Float:phi=0.0,Float:theta=0.0,time;
	new Float:Ax=0.0,Float:Ay=0.0,Float:Az=0.0;
    	CreateExplosion(x,y,z, 12,10.0);
	for(new i; i < 26; i++){ // 1 8 8 8 1
		Ax=x+(radius*floatsin(-phi,degrees)*floatcos(-theta,degrees));
		Ay=y+(radius*floatsin(-phi,degrees)*floatsin(-theta,degrees));
		Az=z+(radius*floatcos(-phi,degrees));
		//Object moveing
		object=CreateObject(type[random(3)],x,y,z,0.0,0.0,theta+45);//Start
		time=MoveObject(object, Ax,Ay,Az, 5.0);
        	SetTimerEx("FireworkRocketEnd",time,false,"d",object);//End
		//Reset
		theta+=45.0; if(theta==360.0){ Ax=0.0; Ax=0.0; Ay=0.0;}
        	if((1+i)%8==1)phi+=45;
    	}
	return 1;
}
function FireworkRocketEnd(object)return DestroyObject(object);

