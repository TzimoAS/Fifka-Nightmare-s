    with (other) { // 'other' refers to the colliding key object
        instance_destroy();
				audio_play_sound(GotKey, 1, false);
    }
    Axes += 1; // More efficient way to subtract 1