snow_timer += 1;
if (snow_timer >= snow_rate * room_speed)
{
    var num_snowflakes = 5; // Количество снежинок за раз
    for (var i = 0; i < num_snowflakes; i++)
    {
        instance_create_layer(random(room_width), -30, "Instances", obj_snezinka);
    }
    snow_timer = 0;
}