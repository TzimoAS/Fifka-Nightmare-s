var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (video_playing) { // Проверяем, играет ли видео
    if (_videoStatus == 0) {
        draw_surface(_videoData[1], 0, 0);
    } else if (_videoStatus == -1) { // Видео закончилось автоматически
        video_playing = false;
        game_end()
    }
}

