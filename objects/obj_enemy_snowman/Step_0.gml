if (instance_exists(obj_player_winter)) {
    var dist = point_distance(x, y, obj_player_winter.x, obj_player_winter.y);
    if (dist < 500) {
        player_detected = true;
        shoot_cooldown -= 1 / room_speed;
        if (shoot_cooldown <= 0) {
            var bullet = instance_create_layer(x, y, "Bullets", obj_snowball_1);
            bullet.direction = point_direction(x, y, obj_player_winter.x, obj_player_winter.y);
            
            //Crucial addition:  Calculate a slightly offset direction
            var target_x = obj_player_winter.x;
            var target_y = obj_player_winter.y;
            var offset_x = irandom_range(-10, 10); // Adjust offset range as needed
            var offset_y = irandom_range(-10, 10);
            bullet.direction = point_direction(x, y, target_x+offset_x, target_y+offset_y);
            

            bullet.speed = 5;
            shoot_cooldown = shoot_rate;
        }
    } else {
        player_detected = false;
    }
}


// Sound effects (no change needed here)
if (player_detected) {
    sound_timer += 1 / room_speed;
    if (sound_timer >= next_sound_time) {
        var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
        audio_play_sound(random_sound, 1, false);
        sound_timer = 0;
        next_sound_time = random_range(5, 15);
    }
}