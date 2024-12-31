if obj_pause_menu.showing_pause {
    global.pausereq = 0;
    obj_pause_menu.showing_pause = 0;
    obj_pause_menu.target_alpha = 0;
    target_alpha = 0;
    obj_slovo_pause.target_alpha = 0;
    obj_slovo_pause.visible = false;
    visible = false;
     MENUPOSHOL_1.target_alpha = 0;
    MENUPOSHOL_1.visible = false;
    audio_resume_sound(global.pausemusic);
}