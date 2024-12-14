if (instance_exists(obj_player)) {
    var dist = point_distance(x,y,obj_player.x, obj_player.y);
    if (dist < 100500) {
        shoot_cooldown -= 1/room_speed;
        if (shoot_cooldown <= 0){
            // Number of bullets to fire
            var num_bullets = irandom_range(25, 30); 

            // Angle spread (adjust this value to change the bullet spread)
            var angle_spread = 360; // Degrees

            // Calculate the base angle
            var base_angle = point_direction(x, y, obj_player.x, obj_player.y);

            // Create bullets with random spread
            for (var i = 0; i < num_bullets; i++) {
                var bullet = instance_create_layer(x, y, "Bullet_EXE", obj_projectile_EXE);
                // Add random spread to the angle
                var random_angle_offset = irandom_range(-angle_spread, angle_spread);
                bullet.direction = base_angle + random_angle_offset;
                bullet.speed = 3;
            }

            shoot_cooldown = shoot_rate;
        }
    }
}


// --- Sound Effects ---
sound_timer += 1 / room_speed;
if (sound_timer >= next_sound_time) {
    var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
    audio_play_sound(random_sound, 1, false);
    sound_timer = 0;
    next_sound_time = random_range(5, 15);
}

// --- Projectile Collision ---
//This should be in your obj_projectile or obj_enemy_projectile object
if (place_meeting(x,y, obj_player)){
    with (obj_player){
        instance_destroy();
        game_restart();
    }
    instance_destroy();
}

