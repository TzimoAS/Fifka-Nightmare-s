if(global.song_id != noone) // makes sure that there is a song being played before checking.
{

    if (!audio_is_playing(global.song_id)) // Check if the song is not currently playing
        {
                
            // Stop the current music.
             audio_stop_all();


                // Go to the next room
                room_goto(rm_forest);

                // Reset the song_id so that music can be played again
               global.song_id = noone;
        }
}