var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (video_playing) { // Проверяем, играет ли видео
    if (_videoStatus == 0) {
        draw_surface(_videoData[1], 0, 0);
    } else if (_videoStatus == -1) { // Видео закончилось
        video_playing = false;
        room_goto_next(); // Переходим в комнату "rm_next_room"
    }
}