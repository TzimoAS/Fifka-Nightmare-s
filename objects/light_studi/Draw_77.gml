draw_surface(application_surface, 0, 0);

draw_set_alpha(1);
draw_surface_stretched(self.light_surface,0,0, window_get_width(), window_get_height());