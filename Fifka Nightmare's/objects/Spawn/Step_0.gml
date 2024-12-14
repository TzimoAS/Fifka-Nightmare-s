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


// Таймер для obj_enemy_mover
global.timer_mover--;
if (global.timer_mover <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 340;
    var maxAttempts = 50; // Ограничение на количество попыток
    var attempts = 0;

    while (distance < minDistance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
        attempts++;
    }

    if (attempts < maxAttempts) { // Успешно нашли позицию
        instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_mover);
    } else {
        // Можно добавить логику обработки неудачной генерации, например, спавн в резервном месте
		// show_debug_message("Не удалось сгенерировать позицию для obj_enemy_mover");
    }
    global.timer_mover = random_range(10, 20) * room_speed;
}

// Таймер для obj_enemy_shooter
global.timer_shooter--;
if (global.timer_shooter <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300;
    var maxAttempts = 50;
    var attempts = 0;
    while (distance < minDistance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
         attempts++;
    }
    if (attempts < maxAttempts) {
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_shooter);
    } else {
		// show_debug_message("Не удалось сгенерировать позицию для obj_enemy_shooter");
	}
    global.timer_shooter = random_range(15, 30) * room_speed;
}

// Таймер для obj_enemy_tank
global.timer_tank--;
if (global.timer_tank <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300;
     var maxAttempts = 50;
    var attempts = 0;
    while (distance < minDistance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
        attempts++;
    }
     if (attempts < maxAttempts) {
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_tank);
     } else {
		// show_debug_message("Не удалось сгенерировать позицию для obj_enemy_tank");
	}
    global.timer_tank = random_range(60, 70) * room_speed;
}

// Таймер для obj_enemy_fastik
global.timer_fastik--;
if (global.timer_fastik <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300;
    var maxAttempts = 50;
    var attempts = 0;
    while (distance < minDistance && attempts < maxAttempts) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
        attempts++;
    }
    if(attempts < maxAttempts) {
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_fastik);
    } else {
		// show_debug_message("Не удалось сгенерировать позицию для obj_enemy_fastik");
	}
    global.timer_fastik = random_range(10, 100) * room_speed;
}