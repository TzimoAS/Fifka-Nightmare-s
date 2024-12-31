if (instance_exists(obj_player_chapter2)) {
    var dist = point_distance(x, y, obj_player_chapter2.x, obj_player_chapter2.y);
    if (dist < 500) {
        player_detected = true;
        shoot_cooldown -= 1 / room_speed;
        if (shoot_cooldown <= 0) {
            if (!instance_exists(boomerang_obj)) {
                boomerang_start_x = x; // Сохраняем начальную позицию
                boomerang_start_y = y;
                boomerang_obj = instance_create_layer(x, y, "Bullet_EXE", obj_projectile_EXE_boomerang);
                boomerang_obj.direction = point_direction(x, y, obj_player_chapter2.x, obj_player_chapter2.y);
                boomerang_obj.speed = boomerang_speed;
                boomerang_obj.image_angle = 0; // Начальный угол вращения
                boomerang_returning = false; // Сбрасываем флаг возврата
                boomerang_wave_offset = 0; // Сбрасываем смещение колебаний
            }
            shoot_cooldown = shoot_rate;
        }
    } else {
        player_detected = false;
    }
}

// --- Логика бумеранга ---
if (instance_exists(boomerang_obj)) {
    if (!boomerang_returning) {
        // Если не возвращается, проверяем дальность
        var dist_to_start = point_distance(boomerang_start_x, boomerang_start_y, boomerang_obj.x, boomerang_obj.y);
        if (dist_to_start >= boomerang_range) {
            boomerang_returning = true; // Начинаем возвращение
            boomerang_obj.direction = point_direction(boomerang_obj.x, boomerang_obj.y, x, y);
        } else {
            // Добавляем колебания
            boomerang_wave_offset += boomerang_wave_frequency; // Увеличиваем смещение
            var wave_offset = sin(boomerang_wave_offset) * boomerang_wave_amplitude; // Вычисляем смещение по синусоиде
            boomerang_obj.x += wave_offset; // Применяем смещение к позиции бумеранга
        }
    } else {
        // Возвращение бумеранга
        boomerang_obj.direction = point_direction(boomerang_obj.x, boomerang_obj.y, x, y);
        // Если бумеранг достаточно близко к врагу, уничтожаем его
        if (point_distance(x, y, boomerang_obj.x, boomerang_obj.y) < 10) {
            instance_destroy(boomerang_obj);
            boomerang_obj = noone;
        }
    }
}

// --- Звуки ---
if (player_detected) {
    sound_timer += 1 / room_speed;
    if (sound_timer >= next_sound_time) {
        var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
        audio_play_sound(random_sound, 1, false);
        sound_timer = 0;
        next_sound_time = random_range(5, 15);
    }
}