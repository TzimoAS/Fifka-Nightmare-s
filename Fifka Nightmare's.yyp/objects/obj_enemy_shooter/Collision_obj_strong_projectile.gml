hp -= 5
if (hp <= 0) {
	audio_play_sound(death_sound, 1, false);
    instance_destroy();
}