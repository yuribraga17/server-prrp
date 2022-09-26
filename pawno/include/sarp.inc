/*
 *       SSSSSSSSSSSSSSS              AAA               RRRRRRRRRRRRRRRRR   PPPPPPPPPPPPPPPPP
 *     SS:::::::::::::::S            A:::A              R::::::::::::::::R  P::::::::::::::::P
 *    S:::::SSSSSS::::::S           A:::::A             R::::::RRRRRR:::::R P::::::PPPPPP:::::P
 *    S:::::S     SSSSSSS          A:::::::A            RR:::::R     R:::::RPP:::::P     P:::::P
 *    S:::::S                     A:::::::::A             R::::R     R:::::R  P::::P     P:::::P
 *    S:::::S                    A:::::A:::::A            R::::R     R:::::R  P::::P     P:::::P
 *     S::::SSSS                A:::::A A:::::A           R::::RRRRRR:::::R   P::::PPPPPP:::::P
 *      SS::::::SSSSS          A:::::A   A:::::A          R:::::::::::::RR    P:::::::::::::PP
 *        SSS::::::::SS       A:::::A     A:::::A         R::::RRRRRR:::::R   P::::PPPPPPPPP
 *           SSSSSS::::S     A:::::AAAAAAAAA:::::A        R::::R     R:::::R  P::::P
 *                S:::::S   A:::::::::::::::::::::A       R::::R     R:::::R  P::::P
 *                S:::::S  A:::::AAAAAAAAAAAAA:::::A      R::::R     R:::::R  P::::P
 *    SSSSSSS     S:::::S A:::::A             A:::::A   RR:::::R     R:::::RPP::::::PP
 *    S::::::SSSSSS:::::SA:::::A               A:::::A  R::::::R     R:::::RP::::::::P
 *    S:::::::::::::::SSA:::::A                 A:::::A R::::::R     R:::::RP::::::::P
 *     SSSSSSSSSSSSSSS AAAAAAA                   AAAAAAARRRRRRRR     RRRRRRRPPPPPPPPPP
 */
#if !defined _samp_included
#error You must include a_samp BEFORE this include.
#endif

//==================================[Macros]====================================
// Don't change these please.
new _dummywhile1 = 0;
new _dummywhile2 = 1;

// Internal macros.
#define _SendFormattedMessage(%0,%1,%2,%3) do { new _msgstr[128]; format(_msgstr, sizeof(_msgstr), %2, %3); SendClientMessage(%0, %1, _msgstr); } while(_dummywhile1 == _dummywhile2)

// I had to do this for calls to these macros without format arguments.
// Don't call on the macros _above_ these, they're for internal use.
#define SendFormattedMessage(%0,%1,%2) _SendFormattedMessage(%0,%1,%2,0)

//==================================[Natives]===================================
// INI
/*
native INI_Open(filename[], bool:createifnotexist = false);
native bool:INI_Close(id);
native bool:INI_IsOpen(id);
native bool:INI_ClearData(id);
native bool:INI_KeyIsSet(id, key[]);
native bool:INI_SetKeyValueAsString(id, key[], value[]);
native bool:INI_SetKeyValueAsInt(id, key[], value);
native bool:INI_SetKeyValueAsFloat(id, key[], Float:value);
native bool:INI_SetKeyValueAsBool(id, key[], bool:value);
native bool:INI_GetKeyValueAsString(id, key[], dest[], len = sizeof(dest));
native INI_GetKeyValueAsInt(id, key[], defaultvalue = 0);
native Float:INI_GetKeyValueAsFloat(id, key[], Float:defaultvalue = 0.0);
native bool:INI_GetKeyValueAsBool(id, key[], bool:defaultvalue = false);


 /*Fix for Pawno */
native INI_Close(id);
native INI_IsOpen(id);
native INI_ClearData(id);
native INI_KeyIsSet(id, key[]);
native INI_SetKeyValueAsString(id, key[], value[]);
native INI_SetKeyValueAsInt(id, key[], value);
native INI_SetKeyValueAsFloat(id, key[], Float:value);
native INI_SetKeyValueAsBool(id, key[], bool:value);
native INI_GetKeyValueAsString(id, key[], dest[], len = sizeof(dest));
native INI_GetKeyValueAsFloat(id, key[], Float:defaultvalue = 0.0);
native INI_GetKeyValueAsBool(id, key[], bool:defaultvalue = false);

native SendFormattedMessage(playerid, color, const format[], {Float,_}:...);

