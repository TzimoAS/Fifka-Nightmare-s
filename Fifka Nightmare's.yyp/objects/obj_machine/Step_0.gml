spawn_timer += 1 / room_speed;

if (spawn_timer >= spawn_interval) {
    // Случайный угол спавна
    var spawn_direction = random(360);

    // Вычисляем координаты спавна на заданном расстоянии
    var spawn_x = x + lengthdir_x(spawn_distance, spawn_direction);
    var spawn_y = y + lengthdir_y(spawn_distance, spawn_direction);

    // Создаем врага в вычисленных координатах
    instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);
    spawn_timer = 0;
}