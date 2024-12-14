direction = 0; // Объявляем переменную direction
var player = instance_find(obj_player_chapter2, 0);

if (player != noone)
{
    var dist = point_distance(x, y, player.x, player.y);
    if (dist < magnet_range)
    {
        direction = point_direction(player.x, player.y, x, y);

        var x_vec = lengthdir_x(magnet_strength, direction);
        var y_vec = lengthdir_y(magnet_strength, direction);

        player.x += x_vec;
        player.y += y_vec;
    }
}