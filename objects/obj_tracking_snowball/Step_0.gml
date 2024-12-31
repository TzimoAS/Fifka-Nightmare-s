if (instance_exists(target)) {
     var dir = point_direction(x,y,target.x, target.y);
     direction = dir;
     speed = 4;
}

 life_time--;
 if (life_time <= 0) {
      instance_destroy();
     }

  image_alpha = abs(sin(life_time / 5)*0.8); // Эффект мигания красным