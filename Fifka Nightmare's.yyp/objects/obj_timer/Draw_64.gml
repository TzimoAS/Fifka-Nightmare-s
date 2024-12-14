draw_set_font(font_default);
draw_set_color(timer_color);
var time_text = "Время: " + time_string;
draw_text_transformed(10, 40, time_text, 1, 1, 0);

if(!running && timer_color == c_green){
    draw_text_transformed(10, 70, "Результат", 1, 1, 0);
}