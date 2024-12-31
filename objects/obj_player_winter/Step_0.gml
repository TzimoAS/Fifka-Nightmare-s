var xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// 1. Проверка столкновений и движения во время ОБЫЧНОЙ ходьбы (не рывок)
if (!dashing) {
    // Создаем переменные для будущих координат
    var next_x = x + xMove * spd;
    var next_y = y + yMove * spd;

    // Проверка на столкновение по X
    if (place_meeting(next_x, y, obj_wall) ||
        place_meeting(next_x, y, obj_wall_breakable) ||
        place_meeting(next_x, y, obj_wall_1) ||
        place_meeting(next_x, y, obj_wall_end_1) ||
        place_meeting(next_x, y, obj_wall_start_1) ||
        place_meeting(next_x, y, obj_wall_3) ||
        place_meeting(next_x, y, obj_wall_dash) || // Проверка на столкновение с obj_wall_dash
        place_meeting(next_x, y, obj_wall_dash_1) // Проверка на столкновение с obj_wall_dash_1
       )
	{
		xMove = 0;
	} else {
		x = next_x; // Если нет столкновения, перемещаем персонажа по X
    }

    // Проверка на столкновение по Y
     if (place_meeting(x, next_y, obj_wall) ||
        place_meeting(x, next_y, obj_wall_breakable) ||
        place_meeting(x, next_y, obj_wall_3) ||
        place_meeting(x, next_y, obj_wall_end_1) ||
        place_meeting(x, next_y, obj_wall_start_1) ||
        place_meeting(x, next_y, obj_wall_2) ||
        place_meeting(x, next_y, obj_wall_dash) || // Проверка на столкновение с obj_wall_dash
        place_meeting(x, next_y, obj_wall_dash_1) // Проверка на столкновение с obj_wall_dash_1
       )
	{
		yMove = 0;
	} else {
        y = next_y; // Если нет столкновения, перемещаем персонажа по Y
    }
}



// 2. Логика рывка (без изменений)
if (keyboard_check_pressed(vk_shift) && dash_cooldown <= 0 && !dashing) {
    dashing = true;
    dash_timer = dash_duration;
    dash_cooldown = dash_cooldown_value;
	dash_direction = point_direction(0, 0, xMove, yMove);
	if (xMove == 0 && yMove == 0) {
	dash_direction = image_angle;
	}
    audio_play_sound(dash, 1, false);
}

// 3. Передвижение и проверка уничтожения стен во время рывка
if (dashing) {
    var dash_x = x + lengthdir_x(dash_speed, dash_direction);
    var dash_y = y + lengthdir_y(dash_speed, dash_direction);

    // Создаем след
    instance_create_layer(x, y, "Instances", obj_dash_trail);

    // Проверяем столкновение со всеми типами стен во время рывка
    if (!place_meeting(dash_x, dash_y, obj_wall) && !place_meeting(dash_x, dash_y, obj_wall_breakable) && !place_meeting(dash_x, dash_y, obj_wall_3)) {
         // Если столкнулись с obj_wall_dash - уничтожаем его
        if (place_meeting(dash_x, dash_y, obj_wall_dash)) {
            with (instance_place(dash_x, dash_y, obj_wall_dash)) {
              instance_destroy();
              audio_play_sound(bluebreak, 4, false);
            }
        }
                if (place_meeting(dash_x, dash_y, obj_wall_dash_1)) {
            with (instance_place(dash_x, dash_y, obj_wall_dash_1)) {
            instance_destroy();
			audio_play_sound(bluebreakseod, 4, false);
            }
        }
          x = dash_x;
        y = dash_y;


    } else {
         dashing = false; // Если встретили стену (но не obj_wall_dash), заканчиваем рывок
     }

     dash_timer -= 1/room_speed;
        if (dash_timer <= 0) {
        dashing = false;
     }

 }
// 4. Обновляем кулдаун (без изменений)
dash_cooldown -= 1/room_speed;


// Sprite animation (idle added)
var dir = point_direction(0, 0, xMove, yMove);
var isMoving = (xMove != 0 || yMove != 0);

if (isMoving) {
    face = floor(dir / 45);
    face = clamp(face, 0, 7);
    image_speed = 0.2;
} else {
    face = 8;
    image_speed = 0;
}

sprite_index = sprite[face];
// Shooting logic (with improved error handling)
if (cooldown <= 0 && mouse_check_button(mb_left)) {
    cooldown = cooldown_value;
    if (instance_exists(obj_gun)) {
        with (instance_create_layer(x, y, "Bullets", obj_snowball)) {
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
    if (instance_exists(obj_strong_gun)) {
        with (instance_create_layer(x, y, "Bullets_1", obj_gift)) {
			audio_play_sound(Pew, 1, false);
            direction = obj_strong_gun.image_angle;
            speed = 10;
        }
    } else {
        show_debug_message("obj_strong_gun not found!");
    }
}
// Cooldown decrement
cooldown -= 1/room_speed;
cooldown_2 -= 1/room_speed;
// Restart game
if (keyboard_check(ord("R"))) {
    room_restart();
}

if (keyboard_check(vk_f2)) {
	audio_stop_all();
    game_restart();
}

//Health logic
if (invul_timer > 0) {
    invul_timer--;
    flash++; // Increment flash counter
    flash %= 10; // Reset every 10 frames, to make sure to flash at regular intervals.
}

// For debugging purposes, to make sure health is not below 0
if (global.player_health <= 0)
    {
        global.player_health = 0
    }


if (global.player_health <= 0){
    instance_destroy(self);
	room_restart();
}
