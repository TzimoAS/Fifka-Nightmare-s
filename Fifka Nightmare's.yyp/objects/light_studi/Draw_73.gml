        var camera = view_get_camera(0);

        if (!surface_exists(self.light_surface)) {
            var cam_width = camera_get_view_width(camera);
            var cam_height = camera_get_view_height(camera);
            
            self.light_surface = surface_create(window_get_width(), window_get_height());
        }
        
        surface_set_target(self.light_surface);
        draw_clear(c_black);
        camera_apply(camera);
        
        gpu_set_blendmode(bm_subtract);

        var scale = 5;
        var sprite = spr_light_smooth;
        
        
        with (obj_torch) {
          draw_sprite_ext(spr_light,0,self.x,self.y, scale, scale, 0, c_white, 1);
        }

        with (obj_player_chapter2) {
            draw_sprite_ext(spr_light,0,self.x,self.y, scale, scale, 0, c_white, 1);
        }
        

        gpu_set_blendmode(bm_normal);
        
        if(is_undefined(global._part_system) == false){
           part_system_drawit(global._part_system);
        }


        surface_reset_target();