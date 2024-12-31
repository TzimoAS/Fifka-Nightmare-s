hp -= 5;

if (hp <= 0) {
    audio_play_sound(calculator, 1, false); // Звук при уничтожении
    instance_destroy(); // Уничтожение объекта
}