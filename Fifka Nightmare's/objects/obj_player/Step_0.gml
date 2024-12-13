var xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collision detection BEFORE movement
if (place_meeting(x + xMove * spd, y, obj_wall)) {
    xMove = 0;
}
if (place_meeting(x, y + yMove * spd, obj_wall)) {
    yMove = 0;
}
if (place_meeting(x + xMove * spd, y, obj_wall_breakable)) {
    xMove = 0;
}
if (place_meeting(x, y + yMove * spd, obj_wall_breakable)) {
    yMove = 0;
}
if (place_meeting(x + xMove * spd, y, obj_wall_dash)) {
    xMove = 0;
}
if (place_meeting(x, y + yMove * spd, obj_wall_dash)) {
    yMove = 0;
}

// Apply movement
x += xMove * spd;
y += yMove * spd;

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

sprite_index = sprite[face];
// Shooting logic (with improved error handling)
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

// Shooting logic (with improved error handling)
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