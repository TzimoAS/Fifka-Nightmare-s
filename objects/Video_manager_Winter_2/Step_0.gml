// Проверяем нажатие клавиши Enter
if (keyboard_check_pressed(vk_enter) && video_playing) {
    video_playing = false;
    game_end();

}