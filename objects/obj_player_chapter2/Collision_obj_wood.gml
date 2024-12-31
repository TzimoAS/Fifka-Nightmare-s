if Axes > 0 {
    with (other) {
        instance_destroy();
		audio_play_sound(bluebreakseod, 1, false)
    }
    Axes -= 1; // More efficient way to subtract 1
} else {
    speed = 0;
    show_message("You need a axe!");
}