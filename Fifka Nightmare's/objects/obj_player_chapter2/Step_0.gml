var xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var spd_vector = new Vector2(xMove * spd, yMove * spd);
var collision_object = move_and_collide(spd_vector, false, true);

if (collision_object != noone) {
    // Handle collisions with various wall objects here
}

x += spd_vector.x;
y += spd_vector.y;




// Sprite animation (idle added)
var dir = point_direction(0, 0, xMove, yMove);
var isMoving = (xMove != 0 || yMove != 0); // Check if moving

if (isMoving) {
    face = floor(dir / 45);
    face = clamp(face, 0, 7); // Use array length -1 for more dynamic control
    image_speed = 0.2;
} else {
    face = 8; // Idle sprite index
    image_speed = 0;
}
// Shooting logic 
sprite_index = sprite[face];
if (cooldown <= 0 && mouse_check_button(mb_left)) {
    cooldown = cooldown_value;
    if (instance_exists(obj_gun)) { // Check if the gun object exists
        with (instance_create_layer(x, y, "Bullets", obj_projectile)) {
			audio_play_sound(Pew, 1, false);
            direction = obj_gun.image_angle;
            speed = 7;
        }
    } else {
        show_debug_message("obj_gun not found!");
    }
}


if (cooldown_2 <= 0 && mouse_check_button(mb_right)) {
    cooldown_2 = cooldown_value_2;
    if (instance_exists(obj_strong_gun)) { // Check if the gun object exists
        with (instance_create_layer(x, y, "Bullets_1", obj_strong_projectile)) {
			audio_play_sound(Pew, 1, false);
            direction = obj_strong_gun.image_angle;
            speed = 10;
        }
    } else {
        show_debug_message("obj_strong_gun not found!");
    }
}

// Dash Logic

if (dash_cooldown <= 0 && keyboard_check_pressed(vk_shift)) { 
    dashing = true;
    dash_cooldown = dash_cooldown_duration;
    dash_timer = 0;
    dash_xdir = xMove;
    dash_ydir = yMove;
}

if (dashing) {
    dash_timer += 1 / room_speed;
    var x_move = dash_xdir * dash_speed;
    var y_move = dash_ydir * dash_speed;
    x += x_move;
    y += y_move;
    if (dash_timer >= dash_duration) {
        dashing = false;
    }
} else {
    dash_cooldown -= 1 / room_speed;
}

// Cooldown decrement
cooldown -= 1/room_speed; // Decrement cooldown per step
cooldown_2 -= 1/room_speed; // Decrement cooldown per step

// Restart game
if (keyboard_check(ord("R"))) {
	audio_stop_all();
    room_restart();
}

if keyboard_check_pressed(vk_f4)
{
    if window_get_fullscreen()
    {
        window_set_fullscreen(false);
    }
    else
    {
        window_set_fullscreen(true);
    }
}

if (keyboard_check(vk_f2)) {
	audio_stop_all();
    game_restart();
}