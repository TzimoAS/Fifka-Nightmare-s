// Сбросить горизонтальную скорость
hsp = 0;

// Обработка нажатия клавиш
if (keyboard_check(vk_left)) {
    hsp = -walk_spd;
    facing = -1;
    run = false;
}
if (keyboard_check(vk_right)) {
    hsp = walk_spd;
    facing = 1;
    run = false;
}
if(keyboard_check(vk_left) && keyboard_check(vk_shift))
{
	hsp = -run_spd;
  	facing = -1;
	run = true;
}
if(keyboard_check(vk_right) && keyboard_check(vk_shift))
{
	hsp = run_spd;
  	facing = 1;
	run = true;
}
// Проверка, движется ли персонаж
if (hsp != 0) {
    anim_state = "run";
} else {
    anim_state = "idle";
}
//Движение персонажа
x += hsp;

// Применение гравитации
vsp += grav;

// Ограничение скорости падения
if (vsp > max_fall_spd) {
    vsp = max_fall_spd;
}
// Прыжок
if (keyboard_check_pressed(vk_space) && on_ground == true && can_jump == true)
 {
    vsp = jump_spd;
	 on_ground = false;
    anim_state = "jump";
}
//Движение персонажа
y += vsp;

// Обнаружение столкновения с полом
if (place_meeting(x, y+1, obj_ground))
{
    if (!on_ground)
        {
            on_ground = true;
			vsp = 0;
            if (anim_state == "jump")
                {
                    anim_state = "idle";
                }
        }
    //Остановка проваливания
   	while(place_meeting(x,y+1,obj_ground))
	{
	y--;
	}
	
	}else{
	on_ground = false;
}
// Установка спрайтов
switch (anim_state) {
    case "idle":
		sprite_index = spr_mario_idle;
        break;
    case "run":
		sprite_index = spr_mario_run;
        break;
    case "jump":
		sprite_index = spr_mario_jump;
        break;
}

// Установка зеркального отображения спрайта (для поворота персонажа)
image_xscale = facing;