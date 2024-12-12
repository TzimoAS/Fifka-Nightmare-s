global.timer_mover--;
if (global.timer_mover <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    
    // Расстояние от игрока
    var distance = distance_to_object(obj_player);
    
    // Минимальное расстояние, на котором должен спавниться враг.
    var minDistance = 340; // Измените это значение по необходимости.
	
	// Пока расстояние меньше минимального, генерируем новые координаты
    while (distance < minDistance) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
    }
    
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_mover);
    global.timer_mover = random_range(10, 20) * room_speed;
}

// Таймер для obj_enemy_shooter
global.timer_shooter--;
if (global.timer_shooter <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300; // Измените по необходимости
    while (distance < minDistance) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
    }
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_shooter);
    global.timer_shooter = random_range(15, 30) * room_speed;
}

// Таймер для obj_enemy_tank
global.timer_tank--;
if (global.timer_tank <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300;
    while (distance < minDistance) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
    }
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_tank);
    global.timer_tank = random_range(60, 70) * room_speed;
}

// Таймер для obj_enemy_fastol
global.timer_fastik--; // Исправление: Изменённое имя таймера
if (global.timer_fastik <= 0) {
    var spawnX = random_range(0, room_width);
    var spawnY = random_range(0, room_height);
    var distance = distance_to_object(obj_player);
    var minDistance = 300;
    while (distance < minDistance) {
        spawnX = random_range(0, room_width);
        spawnY = random_range(0, room_height);
        distance = distance_to_object(obj_player);
    }
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_fastik); // Исправление: Изменённое имя объекта
    global.timer_fastik = random_range(10, 100) * room_speed;
}