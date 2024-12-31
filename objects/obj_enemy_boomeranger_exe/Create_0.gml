sounds = [snd_enemy_shooter_sound1, snd_enemy_shooter_sound2,snd_enemy_shooter_sound3,snd_enemy_shooter_sound4,snd_enemy_shooter_sound5,snd_enemy_shooter_sound6];
image_speed = 1;
death_sound = DEAD;
sound_timer = 0;
next_sound_time = 0;
shoot_cooldown = 0;       // Таймер перезарядки стрельбы
shoot_rate = 2;          // Секунд между выстрелами
player = obj_player_chapter2; // Ссылка на объект игрока
hp = 10;
sound_timer = 0;
next_sound_time = random_range(5, 15);
player_detected = false; // Флаг обнаружения игрока

// --- Параметры бумеранга ---
boomerang_speed = 5.4;    // Начальная скорость бумеранга
boomerang_range = 525;  // Дальность полета бумеранга
boomerang_returning = false; // Флаг, указывающий на то, что бумеранг возвращается
boomerang_start_x = 0;    // Начальная X позиция бумеранга (обновится при выстреле)
boomerang_start_y = 0;    // Начальная Y позиция бумеранга (обновится при выстреле)
boomerang_obj = noone; // Идентификатор объекта бумеранга (пули)
boomerang_tracking_speed = 1; // Скорость преследования игрока

// Параметры колебаний
boomerang_wave_amplitude = 5; // Амплитуда колебаний
boomerang_wave_frequency = 0; // Частота колебаний
boomerang_wave_offset = 0; // Смещение для колебаний
