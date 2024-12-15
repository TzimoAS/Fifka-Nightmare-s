if (room_detector.current_room == "rm_rivals" && !running)
{
    start_time = current_time;
    running = true;
    timer_color = c_white;
	show_result = false; // Скрываем результат при начале нового таймера
    result_time_string = ""; // Очищаем время результата при начале нового таймера
}

if (room_detector.current_room == "rm_win4" && running)
{
	show_result = true; // Показываем результат
    running = false; // Останавливаем таймер!
	timer_color = c_green;
    
    // Сохраняем время результата
    var total_seconds = floor(elapsed_time);
    var milliseconds = round((elapsed_time - total_seconds) * 1000);
    var minutes = floor(total_seconds / 60);
    var seconds = total_seconds % 60;
    result_time_string = string_format(minutes, 1, 0) + ":" + string_format(seconds, 1, 0);
}

if(running) {
   elapsed_time = (current_time - start_time) / 1000;
}


var total_seconds = floor(elapsed_time);
var milliseconds = round((elapsed_time - total_seconds) * 1000);

var minutes = floor(total_seconds / 60);
var seconds = total_seconds % 60;

time_string = string_format(minutes, 1, 0) + ":" + string_format(seconds, 1, 0);