sprites = [Egich_DRYG, Airon_DRYG, Egor_DRYG, FELLFELLOVICH_DEYG, FELLKID_DRYG, MATEMATIK_DRYG, OTBIBTIITI_DRYG, TOLL_DRYG, VCELEIT_DRYG, DISK_DRYG, efkliTakYzIBit_dryg, Grisha_moi, IISUS_Bro, Pykovich_nedryg, Raindow_dryg, Remy_dryg, rich_bro, rich_bro_2, Spirl_dryg, subterfuge_deyg, Vasya_dryg, Vreklis_dryg, tulpkun_Bro, BananaShit_dryg, BRAJNIK_REAL, EXE_TINOPLAY, FELL_EXEEEEEEEE, Kotopipec]; // Замените на названия своих спрайтов
sprite_index = sprites[irandom(array_length(sprites) - 1)]; // Выбор случайного спрайта

image_speed = 1;
sounds = [snd_enemy_sound1, snd_enemy_sound2, snd_enemy_sound3, snd_enemy_sound4, snd_enemy_sound5, snd_enemy_sound6, snd_enemy_sound7];
death_sound = yay_roblox;
sound_timer = 0;
next_sound_time = 0;
hp = 5;

player_detected = false;

last_player_x = 0;    // Последняя известная позиция игрока по X
last_player_y = 0;    // Последняя известная позиция игрока по Y
memory_timer = 0;      // Таймер "памяти"
memory_duration = 0;  // Продолжительность "памяти"