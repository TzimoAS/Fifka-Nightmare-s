sounds = [boss, boss2, boss3];
image_speed = 0.1;
death_sound = DEAD; // Assuming 'DEAD' is a sound variable
sound_timer = 0;
next_sound_time = 0;
shoot_cooldown = 0; // Cooldown timer for shooting
shoot_rate = 3; // Seconds between shots
hp = 125;
hp_max = 125;
attack_type = 0; // Start with basic attack
advanced_shoot_cooldown = 0; // Initialize cooldown for advanced attack
randomize();