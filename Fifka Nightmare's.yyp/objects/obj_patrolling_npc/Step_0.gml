timer++;

// Проверка на столкновение
if (place_meeting(x, y, obj_wall_FRAGER) || place_meeting(x, y, obj_player_Frager)) {
    // Если столкновение, изменить направление
    direction = random(1060); // Случайное направление
    path_distance = irandom_range(650, 1050); // Новое расстояние до поворота
} else {
    // Движение
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
    // Проверка дистанции
    if (path_distance <= 0 || timer >= timer_max) {
      // Изменить направление после прохождения определенного расстояния или истечения таймера
        direction = random(360); // Случайное направление
        path_distance = irandom_range(750, 1050); // Новое расстояние до поворота
        timer = 0; // Сброс таймера
        timer_max = irandom_range(10, 30); // Новый интервал
    }
    path_distance -= speed;
}