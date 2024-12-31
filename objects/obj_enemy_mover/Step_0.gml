    if (instance_exists(obj_player)) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        var collision = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);
    
        if (dist < 400 && !collision) {
            direction = point_direction(x, y, obj_player.x, obj_player.y);
            speed = 3;
            player_detected = true;
            memory_timer = 0; // Обнуляем таймер, когда игрок виден
            last_player_x = obj_player.x;
            last_player_y = obj_player.y;
			memory_duration = random_range(1, 2) * room_speed; // Устанавливаем продолжительность
        } else {
            if (player_detected) { // Если только что потеряли игрока из виду
                
                memory_timer++; // Увеличиваем таймер
				
				if(memory_timer <= memory_duration)
				{
					direction = point_direction(x, y, last_player_x, last_player_y);
					speed = 3;
				}
				else
				{
					speed = 0;
					player_detected = false;
				}
			
            } else {
                speed = 0;
                player_detected = false;
            }
        }
    }
    else
    {
		if (player_detected) { // Если только что потеряли игрока из виду
                
                memory_timer++; // Увеличиваем таймер
				
				if(memory_timer <= memory_duration)
				{
					direction = point_direction(x, y, last_player_x, last_player_y);
					speed = 3;
				}
				else
				{
					speed = 0;
					player_detected = false;
				}
			
            } else {
                speed = 0;
                player_detected = false;
            }
	}


    if (player_detected) {
        sound_timer += 1 / room_speed;
        if (sound_timer >= next_sound_time) {
            var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
            audio_play_sound(random_sound, 1, false);
            sound_timer = 0;
            next_sound_time = random_range(5, 15);
        }
    }