draw_set_font(font_default);
draw_set_color(timer_color);
var time_text = "Время: " + time_string;
draw_text_transformed(10, 40, time_text, 1, 1, 0); // Таймер в левом верхнем углу

// Отображение результата в правом нижнем углу
if(show_result){
    draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	var result_text = "Результат: " + result_time_string;
    draw_text_transformed(room_width - 10, room_height - 10, result_text, 1, 1, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}