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
#include <a_samp>

/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++ Definitions ++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/
#define MAX_CHANNELS				100
#define MAX_LISTENERS				500 // To match the current slots on SARP.

#define AUDIO_ERROR_GENERIC 		-1
#define AUDIO_SUCCESS				0
#define AUDIO_ERROR_SOCKET	 		1
#define AUDIO_ERROR_BUSY			2
#define AUDIO_ERROR_OVERUNDERFLOW	3
#define AUDIO_ERROR_NOTFOUND        4
#define AUDIO_ERROR_NOSTREAM		5
///*****************************************************************************
///     Meaning of the above.
///         AUDIO_ERROR_GENERIC - An unidentified error occurred.
///                              a_ChannelStreamPosition = AUDIO_ERROR_NOSTREAM.
///
///         AUDIO_SUCCESS - The function succeeded.
///
///         AUDIO_ERROR_SOCKET - A socket failed to create.
///
///         AUDIO_ERROR_BUSY - 1) The server is already running.
///                            2) The channel ID specified is busy/exists.
///                            3) Couldn't bind a socket.
///
///         AUDIO_ERROR_OVERUNDERFLOW - The channel ID specified is either...
///                                     1) Below 0.
///                                     2) Above MAX_CHANNELS.
///
///         AUDIO_ERROR_NOTFOUND - 1) The server is not running.
///                                2) The channel ID specified does not exist.
///
///         AUDIO_ERROR_NOSTREAM - The channel ID doesn't have a valid stream.
///*****************************************************************************

/*
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++ Main Natives +++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/

///*****************************************************************************
///     a_StartServer(ip[], port);
///     Starts the main server.
///*****************************************************************************
native a_StartServer(ip[], port);

///*****************************************************************************
///     a_StopServer(bool:retainchannels);
///     Stops the main server, retainchannels specifys to keep channels or not.
///*****************************************************************************
native a_StopServer(bool:retainchannels);

///*****************************************************************************
///     a_CreateChannel(id);
///     Creates an audio channel.
///*****************************************************************************
native a_CreateChannel(id);

///*****************************************************************************
///     a_DestroyChannel(id);
///     Destroys an audio channel.
///*****************************************************************************
native a_DestroyChannel(id);

///*****************************************************************************
///     a_ChannelStreamURL(id, url[]);
///     Streams the specified URL to the specified channel.
///*****************************************************************************
native a_ChannelStreamURL(id, url[]);

///*****************************************************************************
///     a_ChannelStopStream(id);
///     Stops the specified channel's stream.
///*****************************************************************************
native a_ChannelStopStream(id);

///*****************************************************************************
///     a_ChannelStreamSeek(id, second);
///     Seeks the specified channel's stream to the specified second in time.
///*****************************************************************************
native a_ChannelStreamSeek(id, second);

///*****************************************************************************
///     a_ChannelStreamPosition(id);
///     Returns the position of the specified channel's stream in seconds.
///*****************************************************************************
native a_ChannelStreamPosition(id);
