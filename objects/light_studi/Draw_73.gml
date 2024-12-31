var camera = view_get_camera(0);
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);

if (!surface_exists(self.light_surface)) {
    // Create the surface with the CAMERA's dimensions, not the window
    self.light_surface = surface_create(cam_width, cam_height);
}

surface_set_target(self.light_surface);
draw_clear(c_black);

// No need to apply the camera here. Draw directly onto the surface

gpu_set_blendmode(bm_subtract);

var scale = 5;
var sprite = spr_light_smooth;

with (obj_torch) {
    // Draw the lights relative to the camera, not screen.
  var light_x = self.x - camera_get_view_x(camera);
  var light_y = self.y - camera_get_view_y(camera);
  draw_sprite_ext(spr_light,0,light_x,light_y, scale + 1.13, scale + 1.13, 0, c_white, 1);
}

with (obj_player_chapter2) {
   var light_x = self.x - camera_get_view_x(camera);
  var light_y = self.y - camera_get_view_y(camera);
  draw_sprite_ext(spr_light,0,light_x,light_y, scale, scale, 0, c_white, 1);
}


gpu_set_blendmode(bm_normal);

if(is_undefined(global._part_system) == false){
    part_system_drawit(global._part_system);
}

surface_reset_target();

// Draw the light surface on the display, taking into account screen and camera offset.
var view_x = camera_get_view_x(camera);
var view_y = camera_get_view_y(camera);
draw_surface(self.light_surface, view_x, view_y);