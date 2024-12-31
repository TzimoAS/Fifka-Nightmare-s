if (instance_exists(player)) {
    var dist = point_distance(x, y, player.x, player.y);
    if (dist < 600) {
        player_detected = true;
        
        // Направление пушки к игроку
        image_angle = point_direction(x, y, player.x, player.y);

        // Логика стрельбы очередями
        if (burst_delay <= 0) {
            burst_cooldown -= 1 / room_speed;
            if (burst_cooldown <= 0 && burst_shots < max_burst_shots) {
              
                var bullet = instance_create_layer(x, y, "Bullets", obj_snowball_1);
                
                // Добавление небольшого разброса
                var target_x = player.x;
                var target_y = player.y;
                var offset_x = irandom_range(-10, 10);
                var offset_y = irandom_range(-10, 10);
                bullet.direction = point_direction(x, y, target_x+offset_x, target_y+offset_y);

                bullet.speed = 5;
                burst_cooldown = burst_rate;
                burst_shots++;

              
            } else if (burst_shots >= max_burst_shots) {
                // Задержка между очередями
                burst_delay = random_range(min_burst_delay,max_burst_delay);
                burst_shots = 0; // Сброс счетчика
            }
           
        } else {
            burst_delay -= 1 / room_speed;
        }
    } else {
        player_detected = false;
    }
}
   