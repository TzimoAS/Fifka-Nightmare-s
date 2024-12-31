if (instance_exists(obj_player_chapter2)) {
    active_player = obj_player_chapter2;
} else if (instance_exists(obj_player)){
    active_player = obj_player;
	} else if (instance_exists(obj_player_winter)){
    active_player = obj_player_winter;
} else {
    show_debug_message("No active player found!");
    instance_destroy(); // Или другое действие
}


if (instance_exists(active_player)) {
    x = active_player.x;
    y = active_player.y;
    image_angle = point_direction(active_player.x, active_player.y, mouse_x, mouse_y);
} 