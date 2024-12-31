global.timer_machine--;

if (global.timer_machine <= 0) {
    var spawnX = x + random_range(-100, 100); // Спавн врагов в пределах 100 пикселей от машины
    var spawnY = y + random_range(-100, 100);
    var distance = distance_to_object(obj_player_chapter2);
    var minDistance = 200; // Минимальное расстояние до игрока
    var maxAttempts = 50; // Ограничение на количество попыток
    var attempts = 0;

    // Проверка расстояния до игрока
    while (distance < minDistance && attempts < maxAttempts) {
        spawnX = x + random_range(-100, 100);
        spawnY = y + random_range(-100, 100);
        distance = point_distance(spawnX, spawnY, obj_player_chapter2.x, obj_player_chapter2.y);
        attempts++;
    }

    if (attempts < maxAttempts) {
        // Спавн врага (например, obj_enemy_mover)
        instance_create_layer(spawnX, spawnY, "Instances", obj_enemy_mover_1);
    } else {
        // Можно добавить логику обработки неудачной генерации
        // show_debug_message("Не удалось сгенерировать позицию для врага");
    }

    global.timer_machine = random_range(30, 50) * room_speed; // Сброс таймера
}