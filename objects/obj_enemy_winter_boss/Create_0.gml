sounds = [boss, boss2, boss3];
image_speed = 0.1;
death_sound = DEAD;
sound_timer = 0;
next_sound_time = 0;
shoot_cooldown = 0;
shoot_rate = 3;
hp = 22500;
hp_max = 22500;
attack_type = 0; // 0: Normal, 1: Rapid Fire, 2: Snowball Summon
attack_timer = 0;
attack_duration = 5; // Default duration, will be changed for summon
advanced_shoot_cooldown = 0;
advanced_shoot_rate = 0.1;
snowball_summon_timer = 0;
randomize();