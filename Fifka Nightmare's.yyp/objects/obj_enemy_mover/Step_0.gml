if (instance_exists(obj_player)) { 
    var dist = point_distance(x,y,obj_player.x, obj_player.y);
    if (dist < 400) {
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        speed = 3;
        player_detected = true; // Set flag when player is detected
    } else {
        player_detected = false; // Reset flag when player is out of range
    }
}


if (player_detected) {
    sound_timer += 1 / room_speed;
    if (sound_timer >= next_sound_time) {
        var random_sound = sounds[irandom(array_length_1d(sounds) - 1)];
        audio_play_sound(random_sound, 1, false);
        sound_timer = 0;
        next_sound_time = random_range(5, 15);
    }
}