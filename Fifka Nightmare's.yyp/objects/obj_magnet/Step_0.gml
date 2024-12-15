direction = 0;
var player = instance_find(obj_player_chapter2, 0);
var is_in_range = false; // Добавили переменную для отслеживания нахождения в диапазоне

// Идентификатор звука
var magnet_sound = calculator;  // Замените на свой звук магнитного поля
var magnet_hit_sound = calculator; // Замените на звук притягивания

if (player != noone)
{
    var dist = point_distance(x, y, player.x, player.y);
    if (dist < magnet_range)
    {
		is_in_range = true;
        direction = point_direction(player.x, player.y, x, y);

        var x_vec = lengthdir_x(magnet_strength, direction);
        var y_vec = lengthdir_y(magnet_strength, direction);

		// Вычисляем будущую позицию игрока
		var target_x = player.x + x_vec;
		var target_y = player.y + y_vec;

		// Проверяем столкновение с стенами перед передвижением
		if (!place_meeting(target_x, target_y, obj_wall) &&
			!place_meeting(target_x, target_y, obj_wall_breakable) &&
			!place_meeting(target_x, target_y, obj_wall_1) &&
			!place_meeting(target_x, target_y, obj_wall_end) &&
            !place_meeting(target_x, target_y, obj_wall_start))
		{
			player.x += x_vec;
			player.y += y_vec;

            // Проигрываем звук при попадании в магнит
            if (!audio_is_playing(magnet_hit_sound)){ // Проверяем, что звук еще не играет
                audio_play_sound(magnet_hit_sound, 1, false);
            }
        }
        
        //Запускаем звук лупа, если его нет
        if (!audio_is_playing(magnet_sound)){
			audio_play_sound(magnet_sound, 1, true);
		}
    }
	else
	{
		is_in_range = false;
	}
}
// Если игрок не в диапазоне, то постепенно уменьшаем громкость звука
if (!is_in_range && audio_is_playing(magnet_sound))
{
	var current_volume = audio_sound_get_gain(magnet_sound);

	if(current_volume > 0)
	{
		audio_sound_gain(magnet_sound, current_volume - 0.01, 0);
	}
	else
	{
		audio_stop_sound(magnet_sound);
	}

}