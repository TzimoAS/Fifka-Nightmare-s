  if (room_detector.current_room == "rm_rivals" && !running)
 {
 	start_time = current_time;
 	running = true;
     timer_color = c_white;
 }

 if (room_detector.current_room == "rm_win4" && running)
 {
 	elapsed_time = (current_time - start_time) / 1000;
 	running = false;
     timer_color = c_green;
 }
 
 if(running) {
   elapsed_time = (current_time - start_time) / 1000;
 }

 var total_seconds = floor(elapsed_time);
 var milliseconds = round((elapsed_time - total_seconds) * 1000);

 var minutes = floor(total_seconds / 60);
 var seconds = total_seconds % 60;

 time_string = string_format(minutes, 1, 0) + ":" + string_format(seconds, 1, 0);