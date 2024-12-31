lifetime -= 1/room_speed;
if (lifetime <= 0) {
    instance_destroy();
} else {
    image_alpha = lerp(0, 0.5, lifetime / 0.2);
}