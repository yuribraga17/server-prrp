/**********************************************************************************************************************************
 *                                                                                                                                *
 *                                           )(   Unsigned Long 61 Bit [Long Yoyo]   )(                                           *
 *                                                                                                                                *
 * Copyright © 2017 Abyss Morgan. All rights reserved.                                                                            *
 *                                                                                                                                *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/SAM                                                         *
 * Publication: http://forum.sa-mp.com/showthread.php?t=598933                                                                    *
 * Website: http://8.ct8.pl                                                                                                       *
 *                                                                                                                                *
 * Plugins: None                                                                                                                  *
 * Modules: None                                                                                                                  *
 *                                                                                                                                *
 * File Version: 1.6.1                                                                                                            *
 * SA:MP Version: 0.3.7                                                                                                           *
 *                                                                                                                                *
 * Pawn Unsigned Long for 32 Bit language (precision 61-bit)                                                                      *
 * Available limit:                                                                                                               *
 * 0 - 2 147 483 647 000 000 000                                                                                                  *
 * 0 - 2 000 000 000 000 000 000                                                                                                  *
 *                                                                                                                                *
 * Functions:                                                                                                                     *
 * bool:IsValueContainLY(prefix,suffix,value);                                                                                    *
 * GetLYString(prefix,suffix,string[],maxdest = sizeof(string));                                                                  *
 * LYStringToLY(&prefix,&suffix,string[]); //Reverse to GetLYString                                                               *
 * UpdateLY(&prefix,&suffix,value,limitprefix = DEFAULT_MAX_LY_PREFIX);                                                           *
 * AddSeparatorLY(string[],separator[]);                                                                                          *
 * DeleteSeparatorLY(string[],separator[]);                                                                                       *
 * CalculatePercentLY(&prefix,&suffix,Float:percent = 0.0,increase = true,limitprefix = DEFAULT_MAX_LY_PREFIX);                   *
 * GetPercentLY(prefix,suffix,&o_prefix,&o_suffix,Float:percent = 0.0,limitprefix = DEFAULT_MAX_LY_PREFIX);                       *
 *                                                                                                                                *
 * Operators:                                                                                                                     *
 * bool:IsLYEqual(prefix,suffix,from_prefix,from_suffix);                                                                         *
 * bool:IsLYSmallerThan(prefix,suffix,from_prefix,from_suffix);                                                                   *
 * bool:IsLYSmallerThanOrEqual(prefix,suffix,from_prefix,from_suffix);                                                            *
 * bool:IsLYBiggerThan(prefix,suffix,from_prefix,from_suffix);                                                                    *
 * bool:IsLYBiggerThanOrEqual(prefix,suffix,from_prefix,from_suffix);                                                             *
 *                                                                                                                                *
 **********************************************************************************************************************************/
 
/*
//Check Version LY.inc
#if !defined _Long_Yoyo
	#error [ADM] You need LY.inc v1.6.1
#elseif !defined Long_Yoyo_Version
	#error [ADM] Update you LY.inc to v1.6.1
#elseif (Long_Yoyo_Version < 10601)
	#error [ADM] Update you LY.inc to v1.6.1
#endif
*/

#if defined _Long_Yoyo
	#endinput
#endif
#define _Long_Yoyo

#define Long_Yoyo_Version				(10601) //a.b.c 10000*a+100*b+c

#define LY_STRING_LEN					(20)
#define SEP_LY_STRING_LEN				(LY_STRING_LEN+10)
#define MAX_LY_STRING					(LY_STRING_LEN)
#define MAX_SEP_LY_STRING				(SEP_LY_STRING_LEN)

#define MAX_LY_PREFIX	 				(2147483647)
#define DEFAULT_MAX_LY_PREFIX			(2000000000)

stock bool:IsValueContainLY(prefix,suffix,value){
	if((prefix == 0) && (suffix == 0)) return false;
	if((suffix < value) && (prefix == 0)) return false;
	return true;
}

stock GetLYString(prefix,suffix,string[],maxdest = sizeof(string)){
	if(prefix == 0){
		format(string,maxdest,"%d",suffix);
	} else {
		format(string,maxdest,"%d%09d",prefix,suffix);
	}
}

//Pawn Unsigned Long for 32 Bit language (precision 61-bit)
stock UpdateLY(&prefix,&suffix,value,limitprefix = DEFAULT_MAX_LY_PREFIX){
	if(value == 0) return 1; //skip
	
	new tmp = value;
	
	if((tmp > 0) && (prefix >= limitprefix) && (suffix >= 0)){
		prefix = limitprefix;
		suffix = 0;
	} else if((tmp > 0) && (prefix >= limitprefix-1) && (suffix >= 999999999)){
		prefix = limitprefix;
		suffix = 0;
	} else if((tmp > 0) && (prefix >= limitprefix) && (suffix >= 999999999)){
		prefix = limitprefix;
		suffix = 0;
	} else {
		if(value >= 0){
			while(tmp >= 1000000000){
				tmp -= 1000000000;
				prefix += 1;
			}
			suffix += tmp;
			while(suffix > 999999999){
				suffix -= 1000000000;
				prefix += 1;
			}
		} else if(value < 0){
			while(tmp <= -1000000000){
				prefix -= 1;
				tmp += 1000000000;
			}
			suffix += (tmp);
			while(suffix < 0){
				suffix += 1000000000;
				prefix -= 1;
			}
			if(prefix < 0){
				prefix = 0;
				suffix = 0;
			}
		}
	}
	if((prefix >= limitprefix) && (suffix >= 0)){
		prefix = limitprefix;
		suffix = 0;
	}
	return 1;
}

stock AddSeparatorLY(string[],separator[]){ 
	new tStr[MAX_SEP_LY_STRING];
	format(tStr,sizeof(tStr),"%s",string); 

	if(strlen(tStr) < 4) return tStr; 
	new iPos = strlen(tStr), iCount = 1; 

	while(iPos > 0){ 
		if(iCount == 4){ 
			iCount = 0; 
			strins(tStr,separator[0],iPos,1); 
			iPos++; 
		}
		iCount++; 
		iPos--; 
	} 
	return tStr; 
}

stock DeleteSeparatorLY(string[],separator[]){ 
	new tStr[MAX_LY_STRING], idx = 0;
	for(new i = 0, j = strlen(string); i < j ; i++){
		if(string[i] != separator[0]){
			tStr[idx] = string[i];
			idx++;
		}
	}
	return tStr; 
}

stock CalculatePercentLY(&prefix,&suffix,Float:percent = 0.0,bool:increase = true,limitprefix = DEFAULT_MAX_LY_PREFIX){
	new Float:lycut = (prefix*(percent/100.0)),
		modify_p = floatround(lycut),
		modify_s = floatround((lycut-modify_p)*100000) * 10000;
	
	if(increase){
		prefix += modify_p;
		UpdateLY(prefix,suffix,modify_s,limitprefix);
		modify_s = floatround(suffix*(percent/100.0));
		UpdateLY(prefix,suffix,modify_s,limitprefix);
	} else {
		prefix -= modify_p;
		UpdateLY(prefix,suffix,-modify_s,limitprefix);
		modify_s = floatround(suffix*(percent/100.0));
		UpdateLY(prefix,suffix,-modify_s,limitprefix);
	}
}

stock GetPercentLY(prefix,suffix,&o_prefix,&o_suffix,Float:percent = 0.0,limitprefix = DEFAULT_MAX_LY_PREFIX){
	o_suffix = 0, o_prefix = 0;
	
	new Float:lycut = (prefix*(percent/100.0)),
		modify_p = floatround(lycut),
		modify_s = floatround((lycut-modify_p)*100000) * 10000;
		
	o_prefix += modify_p;
	UpdateLY(o_prefix,o_suffix,modify_s,limitprefix);
	modify_s = floatround(suffix*(percent/100.0));
	UpdateLY(o_prefix,o_suffix,modify_s,limitprefix);

}

//Operator  a == b
stock bool:IsLYEqual(prefix,suffix,from_prefix,from_suffix){
	if(prefix == from_prefix && suffix == from_suffix) return true;
	return false;
}

//Operator  a < b
stock bool:IsLYSmallerThan(prefix,suffix,from_prefix,from_suffix){
	if(prefix < from_prefix) return true;
	if(prefix == from_prefix && suffix < from_suffix) return true;
	return false;
}

//Operator  a <= b
stock bool:IsLYSmallerThanOrEqual(prefix,suffix,from_prefix,from_suffix){
	if(prefix <= from_prefix) return true;
	if(prefix == from_prefix && suffix <= from_suffix) return true;
	return false;
}

//Operator  a > b
stock bool:IsLYBiggerThan(prefix,suffix,from_prefix,from_suffix){
	if(prefix > from_prefix) return true;
	if(prefix == from_prefix && suffix > from_suffix) return true;
	return false;
}

//Operator a >= b
stock bool:IsLYBiggerThanOrEqual(prefix,suffix,from_prefix,from_suffix){
	if(prefix >= from_prefix) return true;
	if(prefix == from_prefix && suffix >= from_suffix) return true;
	return false;
}

//Reverse to GetLYString
stock LYStringToLY(&prefix,&suffix,string[]){
	new len = strlen(string);
	prefix = 0, suffix = 0;
	for(new i = strlen(string)-1; i >= 0; i--){
		if(len-i <= 9){
			suffix += (string[i]-48)*floatround(floatpower(10,len-i-1));
		} else {
			prefix += (string[i]-48)*floatround(floatpower(10,len-i-10));
		}
	}
}

//EOF