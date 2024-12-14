 start_time = 0;
 running = false;
 elapsed_time = 0;
 timer_color = c_white;
 room_detector = instance_find(obj_room_detector, 0);
 
 if(room_detector == noone){
    show_debug_message("Ошибка: obj_room_detector не найден!");
    instance_destroy();
 }