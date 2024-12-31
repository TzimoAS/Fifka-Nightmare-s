if (instance_exists(obj_player)) { //Check if player exists
    var dist = point_distance(x,y,obj_player.x, obj_player.y);
    if (dist < 500) { //Only shoot if player is within range
        player_detected = true; // Set flag when player is detected
        shoot_cooldown -= 1/room_speed;
        if (shoot_cooldown <=0){
            var bullet = instance_create_layer(x, y, "Bullet_EXE", obj_projectile_EXE); //Create enemy projectile
            bullet.direction = point_direction(x,y,obj_player.x, obj_player.y);
            bullet.speed = 5; // Adjust speed as needed
            shoot_cooldown = shoot_rate;
        }
    } else {
        player_detected = false; // Reset flag when player is out of range
    }
}


// Sound effects - only play if player is detected
if (player_detected) {
    sound_timer += 1 / room_speed;
    if (sound_timer >= next_sound_time) {
        var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
        audio_play_sound(random_sound, 1, false);
        sound_timer = 0;
        next_sound_time = random_range(5, 15);
    }
}