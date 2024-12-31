randomize();

 // Разнообразие по скорости
 vspeed = random_range(3, 7); // Скорость падения от 3 до 7
 hspeed = random_range(-1.5, 1.5); // Горизонтальная скорость - немного "ветра"

 // Разнообразие по размеру
 image_xscale = random_range(0.5, 1.0); // Масштаб по X
 image_yscale = image_xscale; // Масштаб по Y

 // Разнообразие по прозрачности
 image_alpha = random_range(0.5, 1.0); // Прозрачность от 0.5 до 1.0
