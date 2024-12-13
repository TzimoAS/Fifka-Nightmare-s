if goldKeys > 0 {
    with (other) { // 'other' refers to the colliding key object
        instance_destroy();
		audio_play_sound(Klych, 1, false)
    }
    goldKeys -= 1; // More efficient way to subtract 1
} else {
    speed = 0;
    show_message("You need a key!");
}