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

var len = sqrt(xMove * xMove + yMove * yMove);
if (len != 0) {
    xMove /= len;
    yMove /= len;
}

// Применение движения
x += xMove * spd;
y += yMove * spd;


// Sprite animation
var isMoving = (xMove != 0 || yMove != 0); // Проверка движения

if (isMoving) {
    if(yMove > 0){
      face = 3; // Down
    } else if(yMove < 0){
       face = 2; // Up
    } else {
      face = 1; // Right (or Left)
    }
    
    image_xscale = xMove >= 0 ? 1 : -1; // Отражаем по X
    image_speed = 1;
} else {
    face = 0; // Idle sprite index
    image_xscale = 1; // Обычное положение для idle
    image_speed = 1;
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
    room_restart();
}

if (keyboard_check(vk_f2)) {
	audio_stop_all();
    game_restart();
}

if (keyboard_check(vk_f5)) {
spd += 1.3;
}

