// Таймеры спавна
if (!variable_global_exists("timer_mover")) {
    global.timer_mover = random_range(20, 30) * room_speed;
}
if (!variable_global_exists("timer_shooter")) {
    global.timer_shooter = random_range(25, 40) * room_speed;
}
if (!variable_global_exists("timer_tank")) {
    global.timer_tank = random_range(80, 90) * room_speed;
}
if (!variable_global_exists("timer_fastik")) {
    global.timer_fastik = random_range(1, 100) * room_speed;
}

// Функция для спавна врага с предупреждением
function spawn_enemy_with_warn(enemy_object, min_distance, warn_duration) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var maxAttempts = 50;
    var attempts = 0;

    while (distance < min_distance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
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
global.timer_mover--;
if (global.timer_mover <= 0) {
    spawn_enemy_with_warn(obj_enemy_mover, 340, 60); // 60 кадров
    global.timer_mover = random_range(10, 20) * room_speed;
}

// Таймер для obj_enemy_shooter
global.timer_shooter--;
if (global.timer_shooter <= 0) {
    spawn_enemy_with_warn(obj_enemy_shooter, 300, 60); // 60 кадров
    global.timer_shooter = random_range(15, 30) * room_speed;
}

// Таймер для obj_enemy_tank
global.timer_tank--;
if (global.timer_tank <= 0) {
    spawn_enemy_with_warn(obj_enemy_tank, 300, 60);  // 60 кадров
    global.timer_tank = random_range(60, 70) * room_speed;
}

// Таймер для obj_enemy_fastik
global.timer_fastik--;
if (global.timer_fastik <= 0) {
    spawn_enemy_with_warn(obj_enemy_fastik, 300, 60); // 60 кадров
    global.timer_fastik = random_range(10, 100) * room_speed;
}