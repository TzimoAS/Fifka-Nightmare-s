// Draw the player, flash when invulnerable
if (invul_timer > 0 && (flash < 5)) {
    // Don't draw
}
else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}