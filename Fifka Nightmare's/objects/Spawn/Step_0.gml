global.timer_mover--;
if (global.timer_mover <= 0) {
    instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", obj_enemy_mover);
    global.timer_mover = random_range(10, 20) * room_speed;
}

// Таймер для obj_enemy_shooter
global.timer_shooter--;
if (global.timer_shooter <= 0) {
    instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", obj_enemy_shooter);
    global.timer_shooter = random_range(15, 30) * room_speed;
}

// Таймер для obj_enemy_tank
global.timer_tank--;
if (global.timer_tank <= 0) {
    instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", obj_enemy_tank);
    global.timer_tank = random_range(60, 70) * room_speed;
}

// Таймер для obj_enemy_fastol
global.timer_tank--;
if (global.timer_tank <= 0) {
    instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", obj_enemy_fastik);
    global.timer_tank = random_range(10, 100) * room_speed;
}