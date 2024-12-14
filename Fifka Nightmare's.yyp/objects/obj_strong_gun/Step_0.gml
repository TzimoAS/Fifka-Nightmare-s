//x = obj_player.x;
//y = obj_player.y;
//x = obj_player_chapter2.x;
//y = obj_player_chapter2.y;


//image_angle = point_direction(obj_player.x,obj_player.y, mouse_x, mouse_y);
//image_angle = point_direction(obj_player_chapter2.x,obj_player_chapter2.y, mouse_x, mouse_y);

if (instance_exists(active_player)) {
    x = active_player.x;
    y = active_player.y;
    image_angle = point_direction(active_player.x, active_player.y, mouse_x, mouse_y);
} else {
    //Handle the case where the active player doesn't exist
    show_debug_message("Active player not found!");
    instance_destroy(); // Or some other error handling.
}



/// Somewhere in your game code (e.g., when switching chapters)
//Example:  Switch to obj_player_chapter2
active_player = obj_player_chapter2;

//Example: Switch back to obj_player
active_player = obj_player;