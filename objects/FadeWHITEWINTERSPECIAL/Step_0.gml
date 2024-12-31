switch(fade_state)
{
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