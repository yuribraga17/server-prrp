/****************************************************************************************************
 *                                                                                                  *
 *                                        )(   Log File   )(                                        *
 *                                                                                                  *
 * Copyright © 2017 Witkacy. All rights reserved.                                                   *
 *                                                                                                  *
 * Download: https://github.com/AbyssMorgan/SA-MP/tree/master/include/SAM                           *
 * Publication: None                                                                                *
 * Website: http://8.ct8.pl                                                                         *
 *                                                                                                  *
 * Plugins: None                                                                                    *
 * Modules: None                                                                                    *
 *                                                                                                  *
 * File Version: 1.0.1                                                                              *
 * SA:MP Version: 0.3.7                                                                             *
 *                                                                                                  *
 * Functions:                                                                                       *
 * WriteLog(string[],file[]);                                                                       *
 *                                                                                                  *
 ****************************************************************************************************/

#if defined _Log_File
	#endinput
#endif
#define _Log_File

#if !defined EMPTY_LOG_BUFFER
	#define EMPTY_LOG_BUFFER	""
#endif

forward WriteLog(string[],file[]);

public WriteLog(string[],file[]){
	static wl_date[3],wl_time[3],wl_str[512];
	getdate(wl_date[0],wl_date[1],wl_date[2]);
   	gettime(wl_time[0],wl_time[1],wl_time[2]);
   	format(wl_str,sizeof wl_str,"[%02d.%02d.%02d %02d:%02d:%02d] %s\r\n",wl_date[0],wl_date[1],wl_date[2],wl_time[0],wl_time[1],wl_time[2],string);
	if(!fexist(file)){
		new File:cfile = fopen(file,io_readwrite);
		fwrite(cfile,EMPTY_LOG_BUFFER);
		fclose(cfile);
	}
	new File:flog = fopen(file,io_append);
	fwrite(flog,wl_str);
	fclose(flog);
	return 1;
}

//EOF