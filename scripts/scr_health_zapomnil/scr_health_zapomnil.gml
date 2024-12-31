global.max_health = 100; // Максимальное здоровье
global.player_health = 100; // Текущее здоровье игрока

// --- Функции ---

/// @function scr_health_manager_init(initial_health);
/// @param {real} initial_health - начальное значение здоровья
function scr_health_manager_init(initial_health) {
	global.player_health = initial_health;
	global.max_health = 100; // Можно изменить, если нужно динамически
}

/// @function scr_health_manager_change_health(amount)
/// @param {real} amount - Величина изменения здоровья (+ лечение, - урон)
function scr_health_manager_change_health(amount) {
    global.player_health = max(0, min(global.max_health, global.player_health + amount));
    show_debug_message("Здоровье игрока: " + string(global.player_health));
}

/// @function scr_health_manager_get_health()
/// @return {real} Текущее здоровье
function scr_health_manager_get_health() {
    return global.player_health;
}

/// @function scr_health_manager_on_room_transition()
function scr_health_manager_on_room_transition() {
    if (global.player_health < global.max_health) {
        global.player_health = min(global.max_health, global.player_health + 20);
		show_debug_message("В новой комнате восстановлено здоровье. Здоровье игрока: " + string(global.player_health));
    } else {
		show_debug_message("Здоровье игрока полное, восстановление не требуется.");
    }
}