application_surface_draw_enable(false);

var camera = view_get_camera(0);
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);

light_surface = surface_create(window_get_width(), window_get_height());

global._part_system = part_system_create();