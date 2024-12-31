/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
hp -= 13
if (hp <= 0) {
	audio_play_sound(death_sound, 1, false);
instance_destroy(other); // Уничтожаем снаряд

if (variable_global_exists("kills")) {
    global.kills++;
}
instance_destroy(); // Уничтожаем врага
room_goto_next();
}