//Original by: Xeon™
//Mod by: RazorG

#if !defined    DCC_COMMAND_PREFIX
    #define     DCC_COMMAND_PREFIX '!'
#endif

#define DDCMD:%1(%2) \
    forward ddcmd_%1(%2); \
    public ddcmd_%1(%2)

#define ddcmd(%1,%2,%3) \
    DDCMD:%1(%2, %3, %4)


public OnGameModeInit() {
    if (funcidx("DCC_OnGameModeInit") != -1)
    {
        return CallLocalFunction("DCC_OnGameModeInit", "");
    }
    return 1;
}

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit DCC_OnGameModeInit

forward DCC_OnGameModeInit();


#if defined _ALS_DCC_OnChannelMessage
    #undef DCC_OnChannelMessage
#else
    #define _ALS_DCC_OnChannelMessage
#endif
#define DCC_OnChannelMessage DCC_OCM

forward DCC_OCM(DCC_Channel:channel, DCC_User:author, const message[]);
