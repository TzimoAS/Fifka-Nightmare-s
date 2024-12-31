if (instance_exists(obj_player_winter)) {
    var dist = point_distance(x,y,obj_player_winter.x, obj_player_winter.y);
    if (dist < 100500) {
        
        // Attack type switching logic
        attack_timer += 1 / room_speed;

        if (attack_timer >= attack_duration) {
            attack_type++;
            if(attack_type > 2) attack_type = 0;

            if(attack_type == 2) attack_duration = 7; // Snowball duration
            else attack_duration = 5; // Default duration

            attack_timer = 0;
        }

        // Normal attack
        if (attack_type == 0) {
                shoot_cooldown -= 1/room_speed;
                if (shoot_cooldown <= 0){
                    // Number of bullets to fire
                    var num_bullets = irandom_range(25, 30); 

                    // Angle spread (adjust this value to change the bullet spread)
                    var angle_spread = 360; // Degrees

                    // Calculate the base angle
                    var base_angle = point_direction(x, y, obj_player_winter.x, obj_player_winter.y);

                    // Create bullets with random spread
                    for (var i = 0; i < num_bullets; i++) {
                        var bullet = instance_create_layer(x, y, "Bullet_EXE", obj_snowball_1);
                        // Add random spread to the angle
                        var random_angle_offset = irandom_range(-angle_spread, angle_spread);
                        bullet.direction = base_angle + random_angle_offset;
                        bullet.speed = 4;
                    }

                    shoot_cooldown = shoot_rate;
                }
        }
        // Rapid fire attack
        else if (attack_type == 1) {
            advanced_shoot_cooldown -= 1/room_speed;
             if(advanced_shoot_cooldown <= 0)
                {
                var num_bullets = 1;

                // Calculate the base angle
                var base_angle = point_direction(x, y, obj_player_winter.x, obj_player_winter.y);
                 for (var i = 0; i < num_bullets; i++) {
                    var bullet = instance_create_layer(x, y, "Bullet_EXE", obj_snowball_1);
                     bullet.direction = base_angle;
                     bullet.speed = 6;
                }
             advanced_shoot_cooldown = advanced_shoot_rate;
            }
        }
        // Snowball summon attack
       else if (attack_type == 2) {
                snowball_summon_timer += 1/room_speed;
                if (snowball_summon_timer >= 0.5) {
                    var snowball = instance_create_layer(x,y,"Instances",obj_tracking_snowball);
                    snowball_summon_timer = 0;
                    
                    snowball.life_time = 7 * room_speed; // Set a lifespan for the snowball
                }
            }
        
           if (hp < 750) {
            //Rapid fire normal attack, while having lower health.
                shoot_cooldown -= 1/room_speed;
                if (shoot_cooldown <= 0){
                // Number of bullets to fire
                var num_bullets = irandom_range(35, 40); 

                    // Angle spread (adjust this value to change the bullet spread)
                    var angle_spread = 360; // Degrees

                    // Calculate the base angle
                    var base_angle = point_direction(x, y, obj_player_winter.x, obj_player_winter.y);

                    // Create bullets with random spread
                    for (var i = 0; i < num_bullets; i++) {
                        var bullet = instance_create_layer(x, y, "Bullet_EXE", obj_snowball_1);
                        // Add random spread to the angle
                        var random_angle_offset = irandom_range(-angle_spread, angle_spread);
                        bullet.direction = base_angle + random_angle_offset;
                        bullet.speed = 3;
                    }

                     shoot_cooldown = 0.2;
                }
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
