//spd = 4;
spd=4;

cooldown = 0;
cooldown_value = 0.45;

cooldown_2 = 0;
cooldown_value_2 = 10;

sprite = array_create(4);
sprite[0] = IDLE_FIFKA; // Idle
sprite[1] = MOVE_FIFKA_1; // Move (right/up/down)
sprite[2] = UP_FIFKA; // Up
sprite[3] = DOWN_FIFKA; // Down
goldKeys=0;
max_cooldown_width = 200; // Максимальная ширина полоски кулдауна

function draw_cooldown(x, y, current_cooldown, max_cooldown, color, text){
    var width = clamp((max_cooldown - current_cooldown) / max_cooldown * max_cooldown_width, 0, max_cooldown_width);
    draw_set_color(color);
    draw_rectangle(x, y, x + width, y + 20, false);
    draw_set_color(c_white);
    draw_text(x + width + 10, y, text);
}

function draw_cooldown(x, y, current_cooldown, max_cooldown, color, text){
    var width = clamp((max_cooldown - current_cooldown) / max_cooldown * max_cooldown_width, 0, max_cooldown_width);
    var fill_color = current_cooldown <= 0 ? c_lime : color;
    draw_set_color(fill_color);
    draw_rectangle(x, y, x + width, y + 20, false);
    draw_set_color(c_white);
    draw_text(x + width + 10, y, text);
}