draw_set_color(c_white);
draw_set_font(font_default);


draw_cooldown(10, 690, cooldown_2, cooldown_value_2, c_gray, "Gift");
draw_cooldown(10, 650, dash_cooldown, dash_cooldown_value, c_gray, "Dash");

var player_health_amount = global.player_health;

// Определяем количество сердец для отображения
var num_hearts = floor(player_health_amount / 20);

// Ограничиваем количество сердец (если нужно)
// Например, чтобы не показывалось больше 10 сердец:
num_hearts = min(num_hearts, 10);

// Координаты для отрисовки первого сердца (можно настроить)
var start_x = 30;
var start_y = 610;
var heart_spacing = 48; // Расстояние между сердцами
var heart_size = 0.5;

// Определяем спрайт сердца (замените на ваш)
var heart_spr = spr_heart; // Замените spr_heart на имя вашего спрайта сердца

// Рисуем сердца
for (var i = 0; i < num_hearts; i++)
{
    var heart_x = start_x + i * heart_spacing;
    var heart_y = start_y;
	
	draw_sprite(heart_spr, 0, heart_x, heart_y); //  0 - subimage если у вас спрайт с несколькими кадрами
	
}