hp -= 5
if (hp <= 0) {
	audio_play_sound(death_sound, 1, false);
if (variable_global_exists("kills")) {
    global.kills++;
}
instance_destroy(); // Уничтожаем врага
}