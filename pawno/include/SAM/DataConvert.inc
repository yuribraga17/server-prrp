/****************************************************************************************************
 *                                                                                                  *
 *                                      )(   Data Convert   )(                                      *
 *                                                                                                  *
 * Copyright © 2017 Abyss Morgan. All rights reserved.                                              *
 * Contributors: Crayder, Shiny                                                                     *
 *                                                                                                  *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/SAM                           *
 * Publication: http://forum.sa-mp.com/showthread.php?t=610012                                      *
 * Website: http://8.ct8.pl                                                                         *
 *                                                                                                  *
 * Plugins: SScanf                                                                                  *
 * Modules: None                                                                                    *
 *                                                                                                  *
 * File Version: 2.0.0                                                                              *
 * SA:MP Version: 0.3.7                                                                             *
 * SScanf Version: 2.8.2                                                                            *
 *                                                                                                  *
 * Definitions:                                                                                     *
 * FIRST_FILE_ADDRESS                                                                               *
 * INVALID_FILE_ID                                                                                  *
 * INVALID_FILE_HANDLE                                                                              *
 * INT_NUMBER_LEN                                                                                   *
 * HEX_NUMBER_LEN                                                                                   *
 * BIN_NUMBER_LEN                                                                                   *
 * OCT_NUMBER_LEN                                                                                   *
 *                                                                                                  *
 * Functions:                                                                                       *
 * GetFileHandleID(File:handle);                                                                    *
 * GetFileID(File:handle);                                                                          *
 * bool:IsIdentical({AllTag,_}:variable1,{AllTag,_}:variable2);                                     *
 * strcopy(input[],output[]);  //string copy for warning 224: indeterminate array size              *
 * fstrcopy(input[],output[],maxdest = sizeof(output));   //fast string copy                        *
 * ABCToCBA(input[],output[]);                                                                      *
 * AnyToInt(string[],type,&bool:flag);                                                              *
 * IntToAny(value,output[],type);                                                                   *
 * rot13(string[]);                                                                                 *
 * code128(input[],output[]);                                                                       *
 * swap_int({Float,_}:int1,{Float,_}:int2);                                                         *
 * swap_string(string1[], string2[], dest1 = sizeof(string1), dest2 = sizeof(string2));             *
 * bool:ContainInSeries(value,...);                                                                 *
 * bool:ContainInSeriesFloat(Float:value,Float:...);                                                *
 * StringEqual(string1[],string2[],ignorecase);                                                     *
 * StringNotEqual(string1[],string2[],ignorecase);                                                  *
 * base64_decode(input[],output[]); //d:base64                                                      *
 * base64_encode(input[],output[]); //e:base64                                                      *
 *                                                                                                  *
 * Validators:                                                                                      *
 * bool:IsDecimalNumber(string[]);                                                                  *
 * bool:IsHexNumber(string[]);                                                                      *
 * bool:IsBinaryNumber(string[]);                                                                   *
 * bool:IsOctalNumber(string[]);                                                                    *
 * bool:IsFloatNumber(string[]);                                                                    *
 *                                                                                                  *
 * Convert to Bool:                                                                                 *
 * bool:StringToBool(string[]);                                                                     *
 * bool:IntToBool(value);                                                                           *
 *                                                                                                  *
 * Convert to Int:                                                                                  *
 * StringToInt(string[]);                                                                           *
 * BoolToInt(bool:boolean);                                                                         *
 * HexToInt(string[]);                                                                              *
 * BinToInt(string[]);                                                                              *
 * OctToInt(string[]);                                                                              *
 *                                                                                                  *
 * Convert to Hex:                                                                                  *
 * IntToHex(value);                                                                                 *
 * IntToHexEx(value);                                                                               *
 * BinToHex(string[]);                                                                              *
 * BinToHexEx(string[]);                                                                            *
 * OctToHex(string[]);                                                                              *
 *                                                                                                  *
 * Convert to Bin:                                                                                  *
 * IntToBin(value);                                                                                 *
 * HexToBin(string[]);                                                                              *
 * OctToBin(string[]);                                                                              *
 *                                                                                                  *
 * Convert to Oct:                                                                                  *
 * IntToOct(value);                                                                                 *
 * HexToOct(string[]);                                                                              *
 * BinToOct(string[]);                                                                              *
 *                                                                                                  *
 * Binary Data Convert:                                                                             *
 * FloatToInt(Float:value); //Convert Float binary data to Integer binary data !                    *
 * Float:IntToFloat(value); //Convert Integer binary data to Float binary data !                    *
 *                                                                                                  *
 ****************************************************************************************************/

/*
//Check Version DataConvert.inc
#if !defined _Data_Convert
	#error [ADM] You need DataConvert.inc v2.0.0
#elseif !defined Data_Convert_Version
	#error [ADM] Update you DataConvert.inc to v2.0.0
#elseif (Data_Convert_Version < 20000)
	#error [ADM] Update you DataConvert.inc to v2.0.0
#endif
*/

#if defined _Data_Convert
	#endinput
#endif
#define _Data_Convert

#if defined _base64_included
	#error [ADM] Please remove deprecated file base64.inc
#endif

#if !defined sscanf
	#error [ADM] You need SScanf v2.8.2 (github.com/AbyssMorgan/SA-MP/tree/master/plugins)
#endif

#define Data_Convert_Version		(20000) //a.b.c 10000*a+100*b+c

new const LettersTable[] = {
	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
};
	
new const Decoder[] = {
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  62, 0,  0,  0,  63, 52, 53,
	54, 55, 56, 57, 58, 59, 60, 61, 0,  0,
	0,  0,  0,  0,  0,  0,  1,  2,  3,  4,
	5,  6,  7,  8,  9,  10, 11, 12, 13, 14,
	15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
	25, 0,  0,  0,  0,  0,  0,  26, 27, 28,
	29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
	39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
	49, 50, 51, 0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0
};

#if !defined isnull
	#define isnull(%1) 				((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#define INT_NUMBER_LEN				12
#define HEX_NUMBER_LEN				12
#define BIN_NUMBER_LEN				36
#define OCT_NUMBER_LEN				14

#define FIRST_FILE_ADDRESS			(0x004E5A18)
#define INVALID_FILE_ID				(0xFFB1A5E7)
#define INVALID_FILE_HANDLE			(File:0)
#define GetFileHandleID(%0)			(_:%0)
#define StringToInt(%0)				strval(%0)

#define IsIdentical(%0,%1)			((tagof(%0) == tagof(%1)) && (_:%0) == (_:%1))

//swapvars by Crayder
#define swap_int(%0,%1)				(((%0) ^= (%1)), ((%1) ^= (%0)), ((%0) ^= (%1)))

#define BoolToInt(%0)				((%0)?1:0)
#define IntToBool(%0)				(((%0) == 1)?true:false)

#define FloatToInt(%0)				(_:%0)
#define IntToFloat(%0)				(Float:%0)

#define StringEqual(%0,%1,%2) 		(!strcmp((%0),(%1),(%2)))
#define StringNotEqual(%0,%1,%2)	(strcmp((%0),(%1),(%2)) != 0)

stock ABCToCBA(input[],output[]){
	for(new i = 0, j = strlen(input); i < j; i++){
		output[j-(i+1)] = input[i];
	}
	output[strlen(input)] = EOS;
}

stock AnyToInt(string[],type,&bool:flag){
	new DC_Symbol, len = strlen(string), i = 1, value;
	if(string[0] >= 0x30 && string[0] <= 0x39){
		value = string[0] - 48;
	} else {
		value = string[0] - 55;
	}
	if(value >= type){
		flag = false;
		return 0;
	}

	while(i < len){
		if(string[i] >= 0x30 && string[i] <= 0x39){
	    	DC_Symbol = string[i] - 48;
		} else {
			DC_Symbol = string[i] - 55;
		}
		if(DC_Symbol >= type){
			flag = false;
			return 0;
		}
		value = value * type + DC_Symbol;
		i++;
	}
	flag = true;
	return value;
}

stock IntToAny(value,output[],type){
	new tmp = value, val[256], i = 0;
	while(tmp > 0){
		val[i] = (tmp % type);
		if(val[i] < 10){
			val[i] += 0x30;
		} else {
			val[i] += 0x37;
		}
		tmp /= type;
		i++;
	}
	val[i] = EOS;
	ABCToCBA(val,output);
}

stock strcopy(input[],output[]){
	for(new i = 0, j = strlen(input); i < j; i++){
		output[i] = input[i];
	}
	output[strlen(input)] = EOS;
}

stock fstrcopy(input[],output[],maxdest = sizeof(output)){
	output[0] = EOS;
	strcat(output,input,maxdest);
	output[strlen(input)] = EOS;
}

stock bool:IsDecimalNumber(string[]){
	new value = 0;
	return !(sscanf(string,"d",value));
}

stock bool:IsHexNumber(string[]){
	new value = 0;
	return !(sscanf(string,"x",value));
}

stock bool:IsBinaryNumber(string[]){
	new value = 0;
	return !(sscanf(string,"b",value));
}

stock bool:IsOctalNumber(string[]){
	new value = 0;
	return !(sscanf(string,"o",value));
}

stock bool:IsFloatNumber(string[]){
	new Float:value = 0;
	return !(sscanf(string,"f",value));
}

stock bool:swap_string(string1[],string2[],dest1 = sizeof(string1),dest2 = sizeof(string2)){
	if(dest1 < strlen(string2) || dest2 < strlen(string1)) return false;
	new swap_size = dest1;
	if(dest2 > swap_size) swap_size = dest2;
	for(new i = 0; i < swap_size; i++){
		swap_int(string1[i],string2[i]);
	}
	return true;
}

stock GetFileID(File:handle){
	return (handle == INVALID_FILE_HANDLE)?INVALID_FILE_ID:((GetFileHandleID(handle)-FIRST_FILE_ADDRESS)/32);
}

stock BinToInt(string[]){
	new value = 0;
	if(sscanf(string,"b",value)) return 0;
	return value;
}

stock HexToBin(string[]){
	new DC_Result[BIN_NUMBER_LEN], value = 0;
	sscanf(string,"x",value);
	format(DC_Result,sizeof(DC_Result),"%b",value);
	return DC_Result;
}

stock BinToHex(string[]){
	new DC_Result[HEX_NUMBER_LEN], value = 0;
	if(sscanf(string,"b",value)){
		format(DC_Result,sizeof(DC_Result),"0");
	} else {
		format(DC_Result,sizeof(DC_Result),"%06x",value);
	}
	return DC_Result;
}

stock BinToHexEx(string[]){
	new DC_Result[HEX_NUMBER_LEN], value = 0;
	if(sscanf(string,"b",value)){
		format(DC_Result,sizeof(DC_Result),"0");
	} else {
		format(DC_Result,sizeof(DC_Result),"%x",value);
	}
	return DC_Result;
}

stock IntToBin(value){
	new DC_Result[BIN_NUMBER_LEN];
	format(DC_Result,sizeof(DC_Result),"%b",value);
	return DC_Result;
}

stock bool:StringToBool(string[]){
	return (string[0] != '0');
}

stock HexToInt(string[]){
	new value = 0;
	if(sscanf(string,"x",value)) return 0;
	return value;
}

stock IntToHex(value){
	new DC_Result[HEX_NUMBER_LEN];
	format(DC_Result,sizeof(DC_Result),"%06x",value);
	return DC_Result;
}

stock IntToHexEx(value){
	new DC_Result[HEX_NUMBER_LEN];
	format(DC_Result,sizeof(DC_Result),"%x",value);
	return DC_Result;
}

stock OctToInt(string[]){
	new value = 0;
	if(sscanf(string,"o",value)) return 0;
	return value;
}

stock OctToHex(string[]){
	new DC_Result[HEX_NUMBER_LEN], value = 0;
	if(sscanf(string,"o",value)){
		format(DC_Result,sizeof(DC_Result),"0");
	} else {
		format(DC_Result,sizeof(DC_Result),"%x",value);
	}
	return DC_Result;
}

stock OctToBin(string[]){
	new DC_Result[BIN_NUMBER_LEN], value = 0;
	if(sscanf(string,"o",value)){
		format(DC_Result,sizeof(DC_Result),"0");
	} else {
		format(DC_Result,sizeof(DC_Result),"%b",value);
	}
	return DC_Result;
}

stock rot13(string[]){
	for(new i = 0, j = strlen(string); i < j; i++){
		if('a' <= string[i] <= 'z'){
			string[i] = (string[i] - 'a' + 13) % 26 + 'a';
		} else if('A' <= string[i] <= 'Z'){
			string[i] = (string[i] - 'A' + 13) % 26 + 'A';
		}
	}
}

stock code128(input[],output[]){
	for(new i = 0, j = strlen(input); i < j; i++){
		output[i] = (0xFF & input[i]+128);
	}
	output[strlen(input)] = EOS;
}

stock bool:ContainInSeries(value,...){
	for(new i = 1, j = numargs(); i < j; i++){
		if(getarg(i) == value) return true;
	}
	return false;
}

stock bool:ContainInSeriesFloat(Float:value,Float:...){
	for(new i = 1, j = numargs(); i < j; i++){
		if((Float:getarg(i)) == value) return true;
	}
	return false;
}

stock IntToOct(value){
	new DC_Result[OCT_NUMBER_LEN];
	IntToAny(value,DC_Result,8);
	return DC_Result;
}

stock HexToOct(string[]){
	new DC_Result[OCT_NUMBER_LEN];
	IntToAny(HexToInt(string),DC_Result,8);
	return DC_Result;
}

stock BinToOct(string[]){
	new DC_Result[OCT_NUMBER_LEN];
	IntToAny(BinToInt(string),DC_Result,8);
	return DC_Result;
}

//base64 by Shiny
stock base64_decode(input[],output[]){
	new SpaceReplacer = '=', len = strlen(input), Position;
	
	for(new i = 0; i < len; i++){
		new char_[2];
		char_[0] = Decoder[input[i++]];
		char_[1] = Decoder[input[i]];
		char_[0] = (char_[0] << 2) | ((char_[1] >> 4) & 3);
		Position += format(output[Position], len, "%c", char_[0]);
		
		if(++i < len){
			char_[0] = input[i];
			if(char_[0] == SpaceReplacer) break;
			char_[0] = Decoder[input[i]];
			char_[1] = ((char_[1] << 4) & 240) | ((char_[0] >> 2) & 15);
			Position += format(output[Position], len, "%c", char_[1]);
		}
		
		if(++i < len){
			char_[1] = input[i];
			if(char_[1] == SpaceReplacer) break;
			char_[1] = Decoder[input[i]];
			char_[0] = ((char_[0] << 6) & 192) | char_[1];
			Position += format(output[Position], len, "%c", char_[0]);
		}
	}
}

stock base64_encode(input[],output[]){
	new SpaceReplacer = '=', len = strlen(input), Position;
	
	for(new i = 0 ; i < len ; i++){
		new Character;
		Character = (input[i] >> 2) & 63;
		Position += format(output[Position], len, "%c", LettersTable[Character]);
		Character = (input[i] << 4) & 63;
		
		if(++i < len){
			Character |= (input[i] >> 4) & 15;
		}
		Position += format(output[Position], len, "%c", LettersTable[Character]);

		if(i < len){
			Character = (input[i] << 2) & 63;
			
			if(++i < len){
				Character |= (input[i] >> 6) & 3;
			}
			Position += format(output[Position], len, "%c", LettersTable[Character]);
		} else {
			i++;
			Position += format(output[Position], len, "%c", SpaceReplacer);
		}

		if(i < len){
			Character = input[i] & 63;
			Position += format(output[Position], len, "%c", LettersTable[Character]);
		} else {
			Position += format(output[Position], len, "%c", SpaceReplacer);
		}
	}
}

#define e:base64 					base64_encode
#define d:base64 					base64_decode

//EOF