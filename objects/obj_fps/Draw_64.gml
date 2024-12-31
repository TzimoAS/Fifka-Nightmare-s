   {
draw_set_color(c_white);
draw_set_font(font_default);
   draw_text(10, 10, "FPS = " + string(fps));
   
    if (variable_global_exists("kills")) {
       draw_text(10, 70, "Kills: " + string(global.kills));
    }

   }
  