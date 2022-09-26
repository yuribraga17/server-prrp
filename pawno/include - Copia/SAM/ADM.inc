/**********************************************************************************************************************************
 *                                                                                                                                *
 *                                                 )(   ADM Encryption File   )(                                                  *
 *                                                                                                                                *
 * Copyright © 2017 Abyss Morgan. All rights reserved.                                                                            *
 *                                                                                                                                *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/SAM                                                         *
 * Publication: http://forum.sa-mp.com/showthread.php?t=595203                                                                    *
 * Website: http://8.ct8.pl                                                                                                       *
 *                                                                                                                                *
 * Plugins: SScanf                                                                                                                *
 * Modules: MD5                                                                                                                   *
 *                                                                                                                                *
 * File Version: 2.3.0                                                                                                            *
 * SA:MP Version: 0.3.7                                                                                                           *
 * SScanf Version: 2.8.2                                                                                                          *
 *                                                                                                                                *
 * File Functions:                                                                                                                *
 * ADM:InvertFile(const input[], const output[]);                                                                                 *
 * ADM:HexNegativeFile(const input[], const output[], key[]);                                                                     *
 * ADM:RollXFile(const input[], const output[], key[]);                                                                           *
 * ADM:ADMx32(const input[], const output[], key[]);                                                                              *
 * ADM:ADMx64(const input[], const output[], key[]);                                                                              *
 * ADM:ADMx128(const input[], const output[], key[]);                                                                             *
 * ADM:ADMx256(const input[], const output[], key[]);                                                                             *
 * ADM:ADMx512(const input[], const output[], password[], bool:invertpassword = false);                                           *
 * ADM:MergeFile(const first_file[],const second_file[],bool:erase_second=false);                                                 *
 * ADM:MergeFileGroup(const group_name[],const output[],upperbound_index,bool:erase_input=false);                                 *
 * ADM:SplitFile(const input[],const output[],max_size,&upperbound_index=0);                                                      *
 *                                                                                                                                *
 * String Functions:                                                                                                              *
 * ADM:InvertString(input[], output[], maxdest = sizeof(output));                                                                 *
 * ADM:HexNegativeString(input[], output[], key[], maxdest = sizeof(output));                                                     *
 * ADM:RollXString(input[], output[], key[], maxdest = sizeof(output));                                                           *
 * ADM:ADMx32String(input[], output[], key[], maxdest = sizeof(output));                                                          *
 * ADM:ADMx64String(input[], output[], key[], maxdest = sizeof(output));                                                          *
 * ADM:ADMx128String(input[], output[], key[], maxdest = sizeof(output));                                                         *
 * ADM:ADMx256String(input[], output[], key[], maxdest = sizeof(output));                                                         *
 * ADM:ADMx512String(input[], output[], password[], bool:invertpassword = false, maxdest = sizeof(output));                       *
 * ADM:StringToHexString(input[], output[], maxdest = sizeof(output));                                                            *
 * ADM:HexStringToString(input[], output[], maxdest = sizeof(output));                                                            *
 *                                                                                                                                *
 * Dump Functions:                                                                                                                *
 * DMP:FindFreeDumpFileID();                                                                                                      *
 * GetDumpFileType(const name[]);                                                                                                 *
 * bool:IsDumpFileOpen(DMP:index);                                                                                                *
 * bool:IsValidDumpFile(const name[]);                                                                                            *
 * DMP:DumpFileCreate(const name[], key[], type = KEY_TYPE_ADMx32);                                                               *
 * bool:DumpFileDestroy(&DMP:index);                                                                                              *
 * DMP:DumpFileOpen(const name[], key[], type = KEY_TYPE_ADMx32);                                                                 *
 * bool:DumpFileClose(&DMP:index);                                                                                                *
 * ADM:DumpFileWrite(DMP:index, string[]);                                                                                        *
 * bool:IsDumpFileEmpty(const name[]);                                                                                            *
 * DMPToInt(DMP:dmpvar);                                                                                                          *
 *                                                                                                                                *
 * Extended Functions:                                                                                                            *
 * ADM_fcreate(const name[]);                                                                                                     *
 * ADMToInt(ADM:admvar);                                                                                                          *
 * bool:IsValidADMKey(key[], type);                                                                                               *
 * GetADMKeyType(key[], bool:distorted = false);                                                                                  *
 * GetADMErrorName(ADM:code);                                                                                                     *
 * ADM:DecodeADMKey(inputkey[], outputkey[], type, maxdest = sizeof(outputkey));                                                  *
 * ADM:CreateADMKey(key[], type, maxdest = sizeof(key));                                                                          *
 *                                                                                                                                *
 * Return value:                                                                                                                  *
 * ERROR_CODE_ADM_UNEXEC       //Function unexecutable                                                                            *
 * ERROR_CODE_ADM_OK           //Success                                                                                          *
 * ERROR_CODE_ADM_INPUT        //Input file not exist                                                                             *
 * ERROR_CODE_ADM_OUTPUT       //Output file exist                                                                                *
 * ERROR_CODE_ADM_KEY          //Invalid key                                                                                      *
 * ERROR_CODE_ADM_SIZE         //Invalid file size                                                                                *
 * ERROR_CODE_ADM_DEST         //Destination size                                                                                 *
 * ERROR_CODE_ADM_OPEN_INPUT   //Open input file                                                                                  *
 * ERROR_CODE_ADM_OPEN_OUTPUT  //Open output file                                                                                 *
 * ERROR_CODE_ADM_INVALID_TYPE //Invalid key type                                                                                 *
 * ERROR_CODE_ADM_PASSWORD     //Invalid password len                                                                             *
 * ERROR_CODE_ADM_MD5          //Invalid MD5 Load                                                                                 *
 * ERROR_CODE_ADM_DMP_NAME     //Invalid dump file name                                                                           *
 * ERROR_CODE_ADM_DMP_IDX      //Invalid dump file index                                                                          *
 *                                                                                                                                *
 * Key Generator:                                                                                                                 *
 * http://8.ct8.pl/admkg                                                                                                          *
 *                                                                                                                                *
 **********************************************************************************************************************************/
 
/*
//Check Version ADM.inc
#if !defined _adm_encryption
	#error [ADM] You need ADM.inc v2.3.0
#elseif !defined ADM_Encryption_Version
	#error [ADM] Update you ADM.inc to v2.3.0
#elseif (ADM_Encryption_Version < 20300)
	#error [ADM] Update you ADM.inc to v2.3.0
#endif
*/

#if defined _adm_encryption
	#endinput
#endif
#define _adm_encryption

#define ADM_Encryption_Version 		(20300) //a.b.c 10000*a+100*b+c

#if !defined sscanf
	#error [ADM] You need SScanf v2.8.2 (github.com/AbyssMorgan/SA-MP/tree/master/plugins)
#endif

#define ADM_Function::				stock
#define ADM::						ADM:
#define DMP::						DMP:
#define DUMP						DMP

#define MAX_FILE_SIZE				(68157440)	//64 MB

#define KEY_TYPE_UNKNOWN			(0)
#define KEY_TYPE_HEXNEGATIVE		(4)
#define KEY_TYPE_ROLLX				(8)
#define KEY_TYPE_ADMx32				(32)
#define KEY_TYPE_ADMx64				(64)
#define KEY_TYPE_ADMx128			(128)
#define KEY_TYPE_ADMx256			(256)

#define MAX_MODE_ADMx32				(4)
#define MAX_MODE_ADMx64				(8)
#define MAX_MODE_ADMx128			(16)
#define MAX_MODE_ADMx256			(32)
#define MAX_MODE_ADMx512			(64)

#define MAX_KEY_LEN_HEXNEGATIVE		(4)
#define MAX_KEY_LEN_ROLLX			(4)
#define MAX_KEY_LEN_ADMx32			(16)
#define MAX_KEY_LEN_ADMx64			(32)
#define MAX_KEY_LEN_ADMx128			(64)
#define MAX_KEY_LEN_ADMx256			(128)
#define MAX_KEY_LEN_ADMx512			(36)

#define MAX_LEN_BINARY_ADMx512		(20)

#define ERROR_CODE_ADM_UNEXEC		(ADM:0)		//function unexecutable
#define ERROR_CODE_ADM_OK			(ADM:1)		//success
#define ERROR_CODE_ADM_INPUT		(ADM:-1)	//input file not exist
#define ERROR_CODE_ADM_OUTPUT		(ADM:-2)	//output file exist
#define ERROR_CODE_ADM_KEY			(ADM:-3)	//invalid key
#define ERROR_CODE_ADM_SIZE			(ADM:-4)	//invalid file size
#define ERROR_CODE_ADM_DEST			(ADM:-5)	//error destination size
#define ERROR_CODE_ADM_OPEN_INPUT	(ADM:-6)	//error open input file
#define ERROR_CODE_ADM_OPEN_OUTPUT	(ADM:-7)	//error open output file
#define ERROR_CODE_ADM_INVALID_TYPE	(ADM:-8)	//invalid key type
#define ERROR_CODE_ADM_PASSWORD		(ADM:-9)	//invalid password length
#define ERROR_CODE_ADM_MD5			(ADM:-10)	//invalid MD5 Load
#define ERROR_CODE_ADM_DMP_NAME		(ADM:-11)	//invalid dump file name
#define ERROR_CODE_ADM_DMP_IDX		(ADM:-12)	//invalid dump file index

#if !defined MAX_DUMP_FILE
	#define MAX_DUMP_FILE			(DMP:100)
#endif
#define MAX_DUMP_FILE_NAME			(80)
#define MAX_DUMP_HEADER_SIZE		(14)

#define INVALID_DUMP_FILE			(DMP:-1)

#define DUMP_HEADER_x32				"SAMP_DUMPx32  "
#define DUMP_HEADER_x64				"SAMP_DUMPx64  "
#define DUMP_HEADER_x128			"SAMP_DUMPx128 "
#define DUMP_HEADER_x256			"SAMP_DUMPx256 "

new ADMErrorList[][] = {
	"Success",					//1
	"Function unexecutable",	//0
	"Input file not exist",		//-1
	"Output file exist",		//-2
	"Invalid key",				//-3
	"Invalid file size",		//-4
	"Destination size",			//-5
	"Open input file",			//-6
	"Open output file",			//-7
	"Invalid key type",			//-8
	"Invalid password len",		//-9
	"Invalid MD5 Load",			//-10
	"Invalid dump file name",	//-11
	"Invalid dump file index"	//-12
};

#define GetADMErrorName(%0) 		ADMErrorList[(((_:(%0))*-1)+1)]

#pragma unused ADMErrorList

#if !defined isnull
	#define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

new bool:DumpFileStatus[MAX_DUMP_FILE] = false,
	DumpFileType[MAX_DUMP_FILE],
	DumpFileName[MAX_DUMP_FILE][MAX_DUMP_FILE_NAME],
	DumpFileKey[MAX_DUMP_FILE][MAX_KEY_LEN_ADMx256];
	

/************************************************************************************************************************************
 *                                                                                                                                  *
 * Extended Functions                                                                                                               *
 *                                                                                                                                  *
 ************************************************************************************************************************************/

//Remove ADM: tag
#define ADMToInt(%0)				(_:%0)

//Remove DMP: tag
#define DMPToInt(%0)				(_:%0)

ADM_Function:: ADM_fcreate(const name[]){
	if(!fexist(name)){
		new File:cfile = fopen(name,io_readwrite);
		fwrite(cfile,"");
		fclose(cfile);
		return 1;
	}
	return 0;
}

ADM_Function:: bool:IsValidADMKey(key[], type){
	switch(type){
	
		case KEY_TYPE_HEXNEGATIVE: {
			new mode;
			sscanf(key,"D(0)",mode);
			if(mode < 1 || mode > 15){
				return false;
			}
		}
		
		case KEY_TYPE_ROLLX: {
			new mode;
			sscanf(key,"D(0)",mode);
			if(mode < 1 || mode > 255){
				return false;
			}
		}

		case KEY_TYPE_ADMx32: {
			new mode[MAX_MODE_ADMx32];
			sscanf(key,"D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3]
			);
			for(new i = 0; i < MAX_MODE_ADMx32; i++){
				if(mode[i] < 1 || mode[i] > 255){
					return false;
				}
			}
		}
		
		case KEY_TYPE_ADMx64: {
			new mode[MAX_MODE_ADMx64];
			sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7]
			);
			for(new i = 0; i < MAX_MODE_ADMx64; i++){
				if(mode[i] < 1 || mode[i] > 255){
					return false;
				}
			}
		}
		
		case KEY_TYPE_ADMx128: {
			new mode[MAX_MODE_ADMx128];
			sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
				mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15]
			);
			for(new i = 0; i < MAX_MODE_ADMx128; i++){
				if(mode[i] < 1 || mode[i] > 255){
					return false;
				}
			}
		}
		
		case KEY_TYPE_ADMx256: {
			new mode[MAX_MODE_ADMx256];
			sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
				mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
				mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
				mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
			);
			for(new i = 0; i < MAX_MODE_ADMx256; i++){
				if(mode[i] < 1 || mode[i] > 255){
					return false;
				}
			}
		}

		default: return false;
	}
	return true;
}

ADM_Function:: GetADMKeyType(key[], bool:distorted = false){
	new mode[MAX_MODE_ADMx256], cnt = 0;
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
		mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
		mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
		mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
	);
	for(new i = 0; i < MAX_MODE_ADMx256; i++){
		if(mode[i] >= 1 && mode[i] <= 255){
			cnt++;
		}
	}
	switch(cnt){
		case 1: {
			if(mode[0] >= 1 && mode[0] <= 15){
				return KEY_TYPE_HEXNEGATIVE;
			}
			if(mode[0] >= 1 && mode[0] <= 255){
				return KEY_TYPE_ROLLX;
			}
		}
		
		case MAX_MODE_ADMx32:  return KEY_TYPE_ADMx32;
		case MAX_MODE_ADMx64:  return KEY_TYPE_ADMx64;
		case MAX_MODE_ADMx128: return KEY_TYPE_ADMx128;
		case MAX_MODE_ADMx256: return KEY_TYPE_ADMx256;
	}
	if(distorted){
		return (cnt*8); //returns the number of key bits
	} else {
		return KEY_TYPE_UNKNOWN;
	}
}

ADM_Function:: ADM:DecodeADMKey(inputkey[], outputkey[], type, maxdest = sizeof(outputkey)){
	switch(type){
	
		case KEY_TYPE_HEXNEGATIVE: {
			if(maxdest < MAX_KEY_LEN_HEXNEGATIVE) return ERROR_CODE_ADM_DEST;
			new mode;
			sscanf(inputkey,"D(0)",mode);
			if(mode < 1 || mode > 15){
				outputkey[0] = EOS;
				return ERROR_CODE_ADM_KEY;
			} else {
				format(outputkey,maxdest,"%d",(0xF & (16-mode)));
			}
		}
		
		case KEY_TYPE_ROLLX: {
			if(maxdest < MAX_KEY_LEN_ROLLX) return ERROR_CODE_ADM_DEST;
			new mode;
			sscanf(inputkey,"D(0)",mode);
			if(mode < 1 || mode > 255){
				outputkey[0] = EOS;
				return ERROR_CODE_ADM_KEY;
			} else {
				format(outputkey,maxdest,"%d",(0xFF & (256-mode)));
			}
		}
		
		case KEY_TYPE_ADMx32: {
			if(maxdest < MAX_KEY_LEN_ADMx32) return ERROR_CODE_ADM_DEST;
			new mode[MAX_MODE_ADMx32];
			sscanf(inputkey,"D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3]
			);
			for(new i = 0; i < MAX_MODE_ADMx32; i++){
				if(mode[i] < 1 || mode[i] > 255){
					outputkey[0] = EOS;
					return ERROR_CODE_ADM_KEY;
				} else {
					if(i == 0){
						format(outputkey,maxdest,"%d",(0xFF & (256-mode[i])));
					} else {
						format(outputkey,maxdest,"%s %d",outputkey,(0xFF & (256-mode[i])));
					}
				}
			}
		}
		
		case KEY_TYPE_ADMx64: {
			if(maxdest < MAX_KEY_LEN_ADMx64) return ERROR_CODE_ADM_DEST;
			new mode[MAX_MODE_ADMx64];
			sscanf(inputkey,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7]
			);
			for(new i = 0; i < MAX_MODE_ADMx64; i++){
				if(mode[i] < 1 || mode[i] > 255){
					outputkey[0] = EOS;
					return ERROR_CODE_ADM_KEY;
				} else {
					if(i == 0){
						format(outputkey,maxdest,"%d",(0xFF & (256-mode[i])));
					} else {
						format(outputkey,maxdest,"%s %d",outputkey,(0xFF & (256-mode[i])));
					}
				}
			}
		}
		
		case KEY_TYPE_ADMx128: {
			if(maxdest < MAX_KEY_LEN_ADMx128) return ERROR_CODE_ADM_DEST;
			new mode[MAX_MODE_ADMx128];
			sscanf(inputkey,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
				mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15]
			);
			for(new i = 0; i < MAX_MODE_ADMx128; i++){
				if(mode[i] < 1 || mode[i] > 255){
					outputkey[0] = EOS;
					return ERROR_CODE_ADM_KEY;
				} else {
					if(i == 0){
						format(outputkey,maxdest,"%d",(0xFF & (256-mode[i])));
					} else {
						format(outputkey,maxdest,"%s %d",outputkey,(0xFF & (256-mode[i])));
					}
				}
			}
		}
		
		case KEY_TYPE_ADMx256: {
			if(maxdest < MAX_KEY_LEN_ADMx256) return ERROR_CODE_ADM_DEST;
			new mode[MAX_MODE_ADMx256];
			sscanf(inputkey,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
				mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
				mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
				mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
				mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
			);
			for(new i = 0; i < MAX_MODE_ADMx256; i++){
				if(mode[i] < 1 || mode[i] > 255){
					outputkey[0] = EOS;
					return ERROR_CODE_ADM_KEY;
				} else {
					if(i == 0){
						format(outputkey,maxdest,"%d",(0xFF & (256-mode[i])));
					} else {
						format(outputkey,maxdest,"%s %d",outputkey,(0xFF & (256-mode[i])));
					}
				}
			}
		}

		default: return ERROR_CODE_ADM_INVALID_TYPE;
	}
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:CreateADMKey(key[], type, maxdest = sizeof(key)){
	switch(type){
	
		case KEY_TYPE_HEXNEGATIVE: {
			if(maxdest < MAX_KEY_LEN_HEXNEGATIVE) return ERROR_CODE_ADM_DEST;
			format(key,maxdest,"%d",random(15)+1);
		}
		
		case KEY_TYPE_ROLLX: {
			if(maxdest < MAX_KEY_LEN_ROLLX) return ERROR_CODE_ADM_DEST;
			format(key,maxdest,"%d",random(255)+1);
		}
		
		case KEY_TYPE_ADMx32: {
			if(maxdest < MAX_KEY_LEN_ADMx32) return ERROR_CODE_ADM_DEST;
			for(new i = 0; i < MAX_MODE_ADMx32; i++){
				if(i == 0){
					format(key,maxdest,"%d",random(255)+1);
				} else {
					format(key,maxdest,"%s %d",key,random(255)+1);
				}
			}
		}
		
		case KEY_TYPE_ADMx64: {
			if(maxdest < MAX_KEY_LEN_ADMx64) return ERROR_CODE_ADM_DEST;
			for(new i = 0; i < MAX_MODE_ADMx64; i++){
				if(i == 0){
					format(key,maxdest,"%d",random(255)+1);
				} else {
					format(key,maxdest,"%s %d",key,random(255)+1);
				}
			}
		}
		
		case KEY_TYPE_ADMx128: {
			if(maxdest < MAX_KEY_LEN_ADMx128) return ERROR_CODE_ADM_DEST;
			for(new i = 0; i < MAX_MODE_ADMx128; i++){
				if(i == 0){
					format(key,maxdest,"%d",random(255)+1);
				} else {
					format(key,maxdest,"%s %d",key,random(255)+1);
				}
			}
		}
		
		case KEY_TYPE_ADMx256: {
			if(maxdest < MAX_KEY_LEN_ADMx256) return ERROR_CODE_ADM_DEST;
			for(new i = 0; i < MAX_MODE_ADMx256; i++){
				if(i == 0){
					format(key,maxdest,"%d",random(255)+1);
				} else {
					format(key,maxdest,"%s %d",key,random(255)+1);
				}
			}
		}

		default: return ERROR_CODE_ADM_INVALID_TYPE;
	}
	return ERROR_CODE_ADM_OK;
}

/************************************************************************************************************************************
 *                                                                                                                                  *
 * String Functions                                                                                                                 *
 *                                                                                                                                  *
 ************************************************************************************************************************************/

ADM_Function:: ADM:StringToHexString(input[], output[], maxdest = sizeof(output)){
	new asize = strlen(input), offset = 0;
	if((asize*2) > maxdest) return ERROR_CODE_ADM_DEST;
	for(new i = 0; i < asize; i++){
		output[offset] = (0xF & (input[i] >> 4));
		if(output[offset] < 10){
			output[offset] += 48;
		} else {
			output[offset] += 55;
		}
		output[offset+1] = (0xF & input[i]);
		if(output[offset+1] < 10){
			output[offset+1] += 48;
		} else {
			output[offset+1] += 55;
		}
		offset += 2;
	}
	output[asize*2] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:HexStringToString(input[], output[], maxdest = sizeof(output)){
	new asize = (strlen(input)/2), offset = 0, unit[2];
	if(asize > maxdest) return ERROR_CODE_ADM_DEST;
	for(new i = 0; i < asize; i++){
		if(input[offset] >= 97){
			unit[0] = (input[offset]-87);
		} else if(input[offset] < 58){
			unit[0] = (input[offset]-48);
		} else {
			unit[0] = (input[offset]-55);
		}
		if(input[offset+1] >= 97){
			unit[1] = (input[offset+1]-87);
		} else if(input[offset+1] < 58){
			unit[1] = (input[offset+1]-48);
		} else {
			unit[1] = (input[offset+1]-55);
		}
		output[i] = (unit[0]*16)+unit[1];
		offset += 2;
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:InvertString(input[], output[], maxdest = sizeof(output)){
	new asize = strlen(input);
	if(maxdest < asize) return ERROR_CODE_ADM_DEST;
	for(new i = 0; i < asize; i++){
		output[i] = (input[i] ^ 0xFF);
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:HexNegativeString(input[], output[], key[], maxdest = sizeof(output)){
	new mode;
	sscanf(key,"D(0)",mode);
	if(mode < 1 || mode > 15) return ERROR_CODE_ADM_KEY;
	new asize = strlen(input);
	if(asize > maxdest) return ERROR_CODE_ADM_DEST;
	for(new i = 0; i < asize; i++){
		output[i] = (((0xF & ((input[i] >> 4)+mode))*16) + (0xF & ((input[i] & 0xF)+mode)));
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:RollXString(input[], output[], key[], maxdest = sizeof(output)){
	new mode;
	sscanf(key,"D(0)",mode);
	if(mode < 1 || mode > 255) return ERROR_CODE_ADM_KEY;
	new asize = strlen(input);
	if(asize > maxdest) return ERROR_CODE_ADM_DEST;
	for(new i = 0; i < asize; i++){
		output[i] = (0xFF & (input[i]+mode));
	}
	output[strlen(input)] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx32String(input[], output[], key[], maxdest = sizeof(output)){
	new asize = strlen(input);
	if(maxdest < asize) return ERROR_CODE_ADM_DEST;
	new mode[MAX_MODE_ADMx32];
	sscanf(key,"D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3]
	);
	for(new i = 0; i < MAX_MODE_ADMx32; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new s = 0;
	for(new i = 0; i < asize; i++){
		output[i] = ((input[i]+mode[s]) & 0xFF);
		s++;
		if(s >= MAX_MODE_ADMx32) s = 0;
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx64String(input[], output[], key[], maxdest = sizeof(output)){
	new asize = strlen(input);
	if(maxdest < asize) return ERROR_CODE_ADM_DEST;
	new mode[MAX_MODE_ADMx64];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7]
	);
	for(new i = 0; i < MAX_MODE_ADMx64; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new s = 0;
	for(new i = 0; i < asize; i++){
		output[i] = ((input[i]+mode[s]) & 0xFF);
		s++;
		if(s >= MAX_MODE_ADMx64) s = 0;
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx128String(input[], output[], key[], maxdest = sizeof(output)){
	new asize = strlen(input);
	if(maxdest < asize) return ERROR_CODE_ADM_DEST;
	new mode[MAX_MODE_ADMx128];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
		mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15]
	);
	for(new i = 0; i < MAX_MODE_ADMx128; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new s = 0;
	for(new i = 0; i < asize; i++){
		output[i] = ((input[i]+mode[s]) & 0xFF);
		s++;
		if(s >= MAX_MODE_ADMx128) s = 0;
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx256String(input[], output[], key[], maxdest = sizeof(output)){
	new asize = strlen(input);
	if(maxdest < asize) return ERROR_CODE_ADM_DEST;
	new mode[MAX_MODE_ADMx256];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
		mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
		mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
		mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
	);
	for(new i = 0; i < MAX_MODE_ADMx256; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new s = 0;
	for(new i = 0; i < asize; i++){
		output[i] = ((input[i]+mode[s]) & 0xFF);
		s++;
		if(s >= MAX_MODE_ADMx256) s = 0;
	}
	output[asize] = EOS;
	return ERROR_CODE_ADM_OK;
}


#if defined MD5_Hash
	ADM_Function:: ADM:ADMx512String(input[], output[], password[], bool:invertpassword = false, maxdest = sizeof(output)){
		new asize = strlen(input);
		if(maxdest < asize) return ERROR_CODE_ADM_DEST;
		new psize = strlen(password);
		if(psize < 1 || psize > 255) return ERROR_CODE_ADM_PASSWORD;
		
		new	mode[MAX_MODE_ADMx512],
			hash[MAX_KEY_LEN_ADMx512],
			BinKeyAlfa[MAX_LEN_BINARY_ADMx512],
			BinKeyBeta[MAX_LEN_BINARY_ADMx512],
			BinKeyGamma[MAX_LEN_BINARY_ADMx512],
			BinKeyDelta[MAX_LEN_BINARY_ADMx512];
			
		//Create Bin Key Alfa
		format(hash,sizeof(hash),"%s",MD5_Hash(password));
		HexStringToString(hash,BinKeyAlfa);
		
		//Create Bin Key Beta	
		for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
			BinKeyBeta[i] = (BinKeyAlfa[i] ^ 0xFF);
		}
		
		//Create Bin Key Gamma
		for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
			BinKeyGamma[i] = (((0xF & ((BinKeyAlfa[i] >> 4)+8))*16) + (0xF & ((BinKeyAlfa[i] & 0xF)+8)));
		}
		
		//Create Bin Key Delta
		for(new i = 0, j = strlen(BinKeyBeta); i < j; i++){
			BinKeyDelta[i] = (((0xF & ((BinKeyBeta[i] >> 4)+8))*16) + (0xF & ((BinKeyBeta[i] & 0xF)+8)));
		}
		
		//Decode password
		if(invertpassword){
			for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
				BinKeyAlfa[i] = (0xFF & (256-BinKeyAlfa[i]));
				BinKeyBeta[i] = (0xFF & (256-BinKeyBeta[i]));
				BinKeyGamma[i] = (0xFF & (256-BinKeyGamma[i]));
				BinKeyDelta[i] = (0xFF & (256-BinKeyDelta[i]));
			}
		}
		
		//Allocate key address
		new tid = 0;
		for(new i = 0; i < MAX_MODE_ADMx512; i++){
			switch(i % 8){
				case 0: mode[i] = BinKeyAlfa[tid];
				case 1: mode[i] = BinKeyGamma[tid];
				case 2: mode[i] = BinKeyBeta[tid];
				case 3: mode[i] = BinKeyDelta[tid];
				case 4: mode[i] = BinKeyGamma[tid];
				case 5: mode[i] = BinKeyBeta[tid];
				case 6: mode[i] = BinKeyAlfa[tid];
				case 7: mode[i] = BinKeyDelta[tid];
			}
			if((i+1) % 8 == 0) tid++;
		}
		
		new s = 0;
		for(new i = 0; i < asize; i++){
			output[i] = ((input[i]+mode[s]) & 0xFF);
			s++;
			if(s >= MAX_MODE_ADMx512) s = 0;
		}
		output[asize] = EOS;
		return ERROR_CODE_ADM_OK;
	}
#else 
	ADM_Function:: ADM:ADMx512String(input[], output[], password[], bool:invertpassword = false, maxdest = sizeof(output)){
		#pragma unused input, output, password, invertpassword, maxdest
		return ERROR_CODE_ADM_MD5;
	}
#endif

/************************************************************************************************************************************
 *                                                                                                                                  *
 * File Functions                                                                                                                   *
 *                                                                                                                                  *
 ************************************************************************************************************************************/

ADM_Function:: ADM:InvertFile(const input[], const output[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,(fgetchar(inpf,0,false) ^ 0xFF),false);
		idx++;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:HexNegativeFile(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode;
	sscanf(key,"D(0)",mode);
	if(mode < 1 || mode > 15) return ERROR_CODE_ADM_KEY;
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,(((0xF & ((fgetchar(inpf,0,false) >> 4)+mode))*16) + (0xF & ((fgetchar(inpf,0,false) & 0xF)+mode))),false);
		idx++;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:RollXFile(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode;
	sscanf(key,"D(0)",mode);
	if(mode < 1 || mode > 255) return ERROR_CODE_ADM_KEY;
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,((fgetchar(inpf,0,false)+mode) & 0xFF),false);
		idx++;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx32(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode[MAX_MODE_ADMx32];
	sscanf(key,"D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3]
	);
	for(new i = 0; i < MAX_MODE_ADMx32; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0, s = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,((fgetchar(inpf,0,false)+mode[s]) & 0xFF),false);
		idx++;
		s++;
		if(s >= MAX_MODE_ADMx32) s = 0;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx64(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode[MAX_MODE_ADMx64];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7]
	);
	for(new i = 0; i < MAX_MODE_ADMx64; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0, s = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,((fgetchar(inpf,0,false)+mode[s]) & 0xFF),false);
		idx++;
		s++;
		if(s >= MAX_MODE_ADMx64) s = 0;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx128(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode[MAX_MODE_ADMx128];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
		mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15]
	);
	for(new i = 0; i < MAX_MODE_ADMx128; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0, s = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,((fgetchar(inpf,0,false)+mode[s]) & 0xFF),false);
		idx++;
		s++;
		if(s >= MAX_MODE_ADMx128) s = 0;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:ADMx256(const input[], const output[], key[]){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	new mode[MAX_MODE_ADMx256];
	sscanf(key,"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
		mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
		mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
		mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
		mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
	);
	for(new i = 0; i < MAX_MODE_ADMx256; i++){
		if(mode[i] < 1 || mode[i] > 255){
			return ERROR_CODE_ADM_KEY;
		}
	}
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0, s = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(output,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,((fgetchar(inpf,0,false)+mode[s]) & 0xFF),false);
		idx++;
		s++;
		if(s >= MAX_MODE_ADMx256) s = 0;
	}
	fclose(inpf);
	fclose(outf);
	return ERROR_CODE_ADM_OK;
}

#if defined MD5_Hash
	ADM_Function:: ADM:ADMx512(const input[], const output[], password[], bool:invertpassword = false){
		if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
		if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
		new psize = strlen(password);
		if(psize < 1 || psize > 255) return ERROR_CODE_ADM_PASSWORD;
		
		new	mode[MAX_MODE_ADMx512],
			hash[MAX_KEY_LEN_ADMx512],
			BinKeyAlfa[MAX_LEN_BINARY_ADMx512],
			BinKeyBeta[MAX_LEN_BINARY_ADMx512],
			BinKeyGamma[MAX_LEN_BINARY_ADMx512],
			BinKeyDelta[MAX_LEN_BINARY_ADMx512];
			
		//Create Bin Key Alfa
		format(hash,sizeof(hash),"%s",MD5_Hash(password));
		HexStringToString(hash,BinKeyAlfa);
		
		//Create Bin Key Beta	
		for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
			BinKeyBeta[i] = (BinKeyAlfa[i] ^ 0xFF);
		}
		
		//Create Bin Key Gamma
		for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
			BinKeyGamma[i] = (((0xF & ((BinKeyAlfa[i] >> 4)+8))*16) + (0xF & ((BinKeyAlfa[i] & 0xF)+8)));
		}
		
		//Create Bin Key Delta
		for(new i = 0, j = strlen(BinKeyBeta); i < j; i++){
			BinKeyDelta[i] = (((0xF & ((BinKeyBeta[i] >> 4)+8))*16) + (0xF & ((BinKeyBeta[i] & 0xF)+8)));
		}
		
		//Decode password
		if(invertpassword){
			for(new i = 0, j = strlen(BinKeyAlfa); i < j; i++){
				BinKeyAlfa[i] = (0xFF & (256-BinKeyAlfa[i]));
				BinKeyBeta[i] = (0xFF & (256-BinKeyBeta[i]));
				BinKeyGamma[i] = (0xFF & (256-BinKeyGamma[i]));
				BinKeyDelta[i] = (0xFF & (256-BinKeyDelta[i]));
			}
		}
		
		//Allocate key address
		new tid = 0;
		for(new i = 0; i < MAX_MODE_ADMx512; i++){
			switch(i % 8){
				case 0: mode[i] = BinKeyAlfa[tid];
				case 1: mode[i] = BinKeyGamma[tid];
				case 2: mode[i] = BinKeyBeta[tid];
				case 3: mode[i] = BinKeyDelta[tid];
				case 4: mode[i] = BinKeyGamma[tid];
				case 5: mode[i] = BinKeyBeta[tid];
				case 6: mode[i] = BinKeyAlfa[tid];
				case 7: mode[i] = BinKeyDelta[tid];
			}
			if((i+1) % 8 == 0) tid++;
		}
		
		new File:inpf = fopen(input,io_read);
		if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
		new asize = flength(inpf), idx = 0, s = 0;
		if(asize > MAX_FILE_SIZE || asize < 0){
			fclose(inpf);
			return ERROR_CODE_ADM_SIZE;
		}
		new File:outf = fopen(output,io_write);
		if(!outf){
			fclose(inpf);
			return ERROR_CODE_ADM_OPEN_OUTPUT;
		}
		while(idx < asize){
			fputchar(outf,((fgetchar(inpf,0,false)+mode[s]) & 0xFF),false);
			idx++;
			s++;
			if(s >= MAX_MODE_ADMx512) s = 0;
		}
		fclose(inpf);
		fclose(outf);
		return ERROR_CODE_ADM_OK;
	}
#else 
	ADM_Function:: ADM:ADMx512(const input[], const output[], password[], bool:invertpassword = false){
		#pragma unused input, output, password, invertpassword
		return ERROR_CODE_ADM_MD5;
	}
#endif

ADM_Function:: ADM:MergeFile(const first_file[],const second_file[],bool:erase_second=false){
	if(!fexist(first_file)) return ERROR_CODE_ADM_OUTPUT;
	if(!fexist(second_file)) return ERROR_CODE_ADM_INPUT;
	
	new File:inpf = fopen(second_file,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new File:outf = fopen(first_file,io_append);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	while(idx < asize){
		fputchar(outf,fgetchar(inpf,0,false),false);
		idx++;
	}
	fclose(inpf);
	fclose(outf);
	if(erase_second){
		fremove(second_file);
	}
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:MergeFileGroup(const group_name[],const output[],upperbound_index,bool:erase_input=false){
	if(fexist(output)) return ERROR_CODE_ADM_OUTPUT;
	ADM_fcreate(output);
	new part_file[256], File:inpf, idx, asize;
	for(new i = 0; i <= upperbound_index; i++){
		new File:outf = fopen(output,io_append);
		format(part_file,sizeof(part_file),"%s_%04d",group_name,i);
		if(!fexist(part_file)){
			fclose(inpf);
			return ERROR_CODE_ADM_INPUT;
		}
		inpf = fopen(part_file,io_read);
		idx = 0, asize = flength(inpf);
		
		while(idx < asize){
			fputchar(outf,fgetchar(inpf,0,false),false);
			idx++;
		}
		fclose(inpf);
		fclose(outf);
		if(erase_input){
			fremove(part_file);
		}
	}
	return ERROR_CODE_ADM_OK;
}

ADM_Function:: ADM:SplitFile(const input[],const output[],max_size,&upperbound_index=0){
	if(!fexist(input)) return ERROR_CODE_ADM_INPUT;
	new File:inpf = fopen(input,io_read);
	if(!inpf) return ERROR_CODE_ADM_OPEN_INPUT;
	new asize = flength(inpf), idx = 0;
	if(asize > MAX_FILE_SIZE || asize < 0){
		fclose(inpf);
		return ERROR_CODE_ADM_SIZE;
	}
	new used_mem = 0, part_file[256], current_status = false;
	
	upperbound_index = 0;
	
	format(part_file,sizeof(part_file),"%s_%04d",output,upperbound_index);
	ADM_fcreate(part_file);

	new File:outf = fopen(part_file,io_write);
	if(!outf){
		fclose(inpf);
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
	current_status = true;
	
	while(idx < asize){
		fputchar(outf,fgetchar(inpf,0,false),false);
		used_mem++;
		idx++;
		if(used_mem >= max_size){
			used_mem = 0;
			fclose(outf);
			current_status = false;
			if(idx < asize){
				upperbound_index++;
				format(part_file,sizeof(part_file),"%s_%04d",output,upperbound_index);
				ADM_fcreate(part_file);
				outf = fopen(part_file,io_write);
				current_status = true;
			}
		}
	}
	fclose(inpf);
	if(current_status) fclose(outf);
	return ERROR_CODE_ADM_OK;
}

/************************************************************************************************************************************
 *                                                                                                                                  *
 * Dump Functions                                                                                                                   *
 *                                                                                                                                  *
 ************************************************************************************************************************************/

ADM_Function:: DMP:FindFreeDumpFileID(){
	for(new DMP:i = DMP:0; i < MAX_DUMP_FILE; i = DMP:(DMPToInt(i)+1)){
		if(DumpFileStatus[i] == false) return i;
	}
	return INVALID_DUMP_FILE;
}

ADM_Function:: bool:IsDumpFileOpen(DMP:index){
	if(index < DMP:0 || index >= MAX_DUMP_FILE) return false;
	if(!fexist(DumpFileName[index])) return false;
	return DumpFileStatus[index];
}

ADM_Function:: DMP:DumpFileCreate(const name[], key[], type = KEY_TYPE_ADMx32){
	if(fexist(name)) return INVALID_DUMP_FILE;
	new File:dmpfile = fopen(name,io_write);
	if(dmpfile){
		new buffer[20];
		switch(type){
			case KEY_TYPE_ADMx32:	format(buffer,sizeof buffer,"%s",DUMP_HEADER_x32);
			case KEY_TYPE_ADMx64: 	format(buffer,sizeof buffer,"%s",DUMP_HEADER_x64);
			case KEY_TYPE_ADMx128:	format(buffer,sizeof buffer,"%s",DUMP_HEADER_x128);
			case KEY_TYPE_ADMx256:	format(buffer,sizeof buffer,"%s",DUMP_HEADER_x256);
		}
		for(new i = 0, j = strlen(buffer); i < j; i++){
			fputchar(dmpfile,buffer[i],false);
		}
		fclose(dmpfile);
		new DMP:idx = FindFreeDumpFileID();
		if(idx == INVALID_DUMP_FILE) return INVALID_DUMP_FILE;
		DumpFileStatus[idx] = true;
		DumpFileType[idx] = type;
		format(DumpFileName[idx],MAX_DUMP_FILE_NAME,"%s",name);
		format(DumpFileKey[idx],MAX_KEY_LEN_ADMx256,"%s",key);
		return idx;
	} else {
		return INVALID_DUMP_FILE;
	}
}

ADM_Function:: bool:DumpFileDestroy(&DMP:index){
	if(index < DMP:0 || index >= MAX_DUMP_FILE) return false;
	new tid = fremove(DumpFileName[index]);
	DumpFileName[index] = "";
	DumpFileKey[index] = "";
	DumpFileStatus[index] = false;
	DumpFileType[index] = KEY_TYPE_UNKNOWN;
	index = INVALID_DUMP_FILE;
	return bool:tid;
}

ADM_Function:: bool:IsValidDumpFile(const name[]){
	if(!fexist(name)) return false;
	new File:dmpfile = fopen(name,io_read), midi = 0, buffer[20];
	if(dmpfile){
		for(new i = 0; i < MAX_DUMP_HEADER_SIZE; i++){
			buffer[i] = fgetchar(dmpfile,0,false);
			midi = (i+1);
		}
		fclose(dmpfile);
		buffer[midi] = EOS;
		if(!strcmp(buffer,DUMP_HEADER_x32,true)){	
			return true;
		} else if(!strcmp(buffer,DUMP_HEADER_x64,true)){	
			return true;
		} else if(!strcmp(buffer,DUMP_HEADER_x128,true)){	
			return true;
		} else if(!strcmp(buffer,DUMP_HEADER_x256,true)){	
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

ADM_Function:: GetDumpFileType(const name[]){
	if(!fexist(name)) return KEY_TYPE_UNKNOWN;
	new File:dmpfile = fopen(name,io_read), midi = 0, buffer[20];
	if(dmpfile){
		for(new i = 0; i < MAX_DUMP_HEADER_SIZE; i++){
			buffer[i] = fgetchar(dmpfile,0,false);
			midi = (i+1);
		}
		fclose(dmpfile);
		buffer[midi] = EOS;
		if(!strcmp(buffer,DUMP_HEADER_x32,true)){	
			return KEY_TYPE_ADMx32;
		} else if(!strcmp(buffer,DUMP_HEADER_x64,true)){	
			return KEY_TYPE_ADMx64;
		} else if(!strcmp(buffer,DUMP_HEADER_x128,true)){	
			return KEY_TYPE_ADMx128;
		} else if(!strcmp(buffer,DUMP_HEADER_x256,true)){	
			return KEY_TYPE_ADMx256;
		} else {
			return KEY_TYPE_UNKNOWN;
		}
	} else {
		return KEY_TYPE_UNKNOWN;
	}
}

ADM_Function:: DMP:DumpFileOpen(const name[], key[], type = KEY_TYPE_ADMx32){
	if(!fexist(name)) return INVALID_DUMP_FILE;
	if(!IsValidDumpFile(name)) return INVALID_DUMP_FILE;
	new DMP:idx = FindFreeDumpFileID();
	if(idx == INVALID_DUMP_FILE) return INVALID_DUMP_FILE;
	DumpFileStatus[idx] = true;
	DumpFileType[idx] = type;
	format(DumpFileName[idx],MAX_DUMP_FILE_NAME,"%s",name);
	format(DumpFileKey[idx],MAX_KEY_LEN_ADMx256,"%s",key);
	return idx;
}

ADM_Function:: bool:DumpFileClose(&DMP:index){
	if(index < DMP:0 || index >= MAX_DUMP_FILE) return false;
	DumpFileName[index] = "";
	DumpFileKey[index] = "";
	DumpFileStatus[index] = false;
	DumpFileType[index] = KEY_TYPE_UNKNOWN;
	index = INVALID_DUMP_FILE;
	return true;
}

ADM_Function:: ADM:DumpFileWrite(DMP:index, string[]){
	if(index < DMP:0 || index >= MAX_DUMP_FILE) return ERROR_CODE_ADM_DMP_IDX;
	if(isnull(DumpFileName[index])) return ERROR_CODE_ADM_DMP_NAME;
	if(!IsValidADMKey(DumpFileKey[index],DumpFileType[index])) return ERROR_CODE_ADM_KEY;
	new File:dmpfile = fopen(DumpFileName[index],io_append);
	if(dmpfile){
		new mod = (DumpFileType[index]/8),
			idx = flength(dmpfile),
			s = (idx % mod),
			mode[MAX_MODE_ADMx256];
		
		switch(DumpFileType[index]){
			case KEY_TYPE_ADMx32: {
				sscanf(DumpFileKey[index],"D(0)D(0)D(0)D(0)",
					mode[0],mode[1],mode[2],mode[3]
				);
			}
			case KEY_TYPE_ADMx64: {
				sscanf(DumpFileKey[index],"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
					mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7]
				);
			}
			case KEY_TYPE_ADMx128: {
				sscanf(DumpFileKey[index],"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
					mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
					mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15]
				);
			}
			case KEY_TYPE_ADMx256: {
				sscanf(DumpFileKey[index],"D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)D(0)",
					mode[0],mode[1],mode[2],mode[3],mode[4],mode[5],mode[6],mode[7],
					mode[8],mode[9],mode[10],mode[11],mode[12],mode[13],mode[14],mode[15],
					mode[16],mode[17],mode[18],mode[19],mode[20],mode[21],mode[22],mode[23],
					mode[24],mode[25],mode[26],mode[27],mode[28],mode[29],mode[30],mode[31]
				);
			}
		}
		
		for(new i = 0, j = strlen(string); i < j; i++){
			fputchar(dmpfile,((string[i]+mode[s]) & 0xFF),false);
			idx++;
			s++;
			if(s >= mod) s = 0;
		}
		fclose(dmpfile);
		return ERROR_CODE_ADM_OK;
	} else {
		return ERROR_CODE_ADM_OPEN_OUTPUT;
	}
}

ADM_Function:: bool:IsDumpFileEmpty(const name[]){
	if(!IsValidDumpFile(name)) return false;
	new File:inpf = fopen(name,io_read), asize = flength(inpf);
	fclose(inpf);
	if(asize > MAX_DUMP_HEADER_SIZE) return false;
	return true;
}

//EOF