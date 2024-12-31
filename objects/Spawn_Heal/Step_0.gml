// Таймеры спавна
if (!variable_global_exists("timer_medkit")) {
    global.timer_medkit = random_range(10, 30) * room_speed;
}

// Функция для спавна врага с предупреждением
function spawn_enemy_with_warn(enemy_object, min_distance, warn_duration) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player_winter);
    var maxAttempts = 50;
    var attempts = 0;

    while (distance < min_distance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player_winter);
        attempts++;
    }

    if (attempts < maxAttempts) {
        // Создаем объект предупреждения obj_warn
        var warn_instance = instance_create_layer(spawnX, spawnY, "Instances", spawn_enemy_with_warn);

        // Устанавливаем таймер для предупреждения, чтобы оно исчезло
		if (warn_instance != noone) { // Проверяем что объект предупреждения был создан
        warn_instance.alarm[0] = warn_duration; 
		warn_instance.enemy_type = enemy_object;
		warn_instance.x_spawn = spawnX;
		warn_instance.y_spawn = spawnY;
		}
        // После завершения таймера в obj_warn будет создан враг
    } else {
        // Можно добавить логику обработки неудачной генерации, например, спавн в резервном месте
        // show_debug_message("Не удалось сгенерировать позицию для " + object_get_name(enemy_object));
    }
}


// Таймер для obj_enemy_mover
global.timer_medkit--;
if (global.timer_medkit <= 0) {
    spawn_enemy_with_warn(Obj_MedKIT, 340, 60); // 60 кадров
    global.timer_medkit = random_range(10, 20) * room_speed;
}