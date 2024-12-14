switch(fade_state)
{
    case 0: // Появление
        alpha += fade_speed;
        if (alpha >= 1)
        {
            alpha = 1;
            fade_state = 1;
audio_play_sound(poavle, 7, false);
        }
        break;

    case 1: // Ожидание
       fade_timer++;
       if (fade_timer >= delay_time)
       {
        fade_timer = 0;
        fade_state = 2;
       }
    break;
    
    case 2: // Исчезновение
        alpha -= fade_speed;
        if (alpha <= 0)
        {
            alpha = 0;
            instance_destroy(); // Удаление объекта после исчезновения
        }
        break;
}

image_alpha = alpha;