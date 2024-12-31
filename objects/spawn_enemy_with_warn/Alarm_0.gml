// Создаем врага по окончании времени предупреждения
if (enemy_type != noone) { // Проверяем, установлен ли тип врага
instance_create_layer(x_spawn, y_spawn, "Instances", enemy_type);
}
instance_destroy();  // Уничтожаем объект предупреждения