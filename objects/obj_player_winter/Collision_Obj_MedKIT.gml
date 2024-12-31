if (global.player_health < 60) {
	global.player_health += 20;
	audio_play_sound(heal, 100, false);
instance_destroy(other);
}