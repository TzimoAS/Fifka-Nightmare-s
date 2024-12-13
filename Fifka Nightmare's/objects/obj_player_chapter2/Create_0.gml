spd = 2;

cooldown = 0;
cooldown_value = 0.45;

cooldown_2 = 0;
cooldown_value_2 = 10;

dashing = false;
dash_speed = 20;
dash_duration = 0.2;
dash_cooldown = 0;
dash_cooldown_duration = 5; // Уменьшил кулдаун для тестирования
dash_xdir = 0;
dash_ydir = 0;
dash_timer = 0;

sprite = array_create(8);
sprite[0] = spr_move;
sprite[1] = spr_move;
sprite[2] = spr_move;
sprite[3] = spr_move;
sprite[4] = spr_move_alt;
sprite[5] = spr_move_alt;
sprite[6] = spr_move_alt;
sprite[7] = spr_move_alt;
sprite[8] = spr_idle;
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

function Vector2(_x, _y) constructor {
    x = _x;
    y = _y;
}

/// Vector2 Magnitude
function magnitude() {
    return sqrt(x*x + y*y);
}

/// Vector2 Normalize
function normalize() {
    var mag = magnitude();
    if (mag > 0) {
        x /= mag;
        y /= mag;
    }
    return self;
}