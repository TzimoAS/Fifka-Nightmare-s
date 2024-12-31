alarm[0] = -1;
spike_spawned = false;

// Событие Step
if place_meeting(x, y, obj_player_chapter2) {
   if alarm[0] == -1 {
        alarm[0] = room_speed * 0.8;
        instance_create_layer(x, y, "Instances", spawn_enemy_with_warn);
    }
}