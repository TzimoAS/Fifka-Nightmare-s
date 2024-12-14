hp -= 1
if (hp <= 0) {
    instance_destroy();
	audio_play_sound(machine_ded, 11, false);
}