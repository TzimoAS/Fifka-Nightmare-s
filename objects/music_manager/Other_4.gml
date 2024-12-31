var room_music = ""; // Переменная для музыки комнаты

switch(room)
{
//menu
//    case rm_main_menu: 
//	case rm_main_menu2:
//	case rm_main_creditF: 
//        room_music = EbatVazni;
//        break;

    case rm_main_menu: 
	case rm_main_menu2:
	case rm_main_creditF: 
        room_music = sadWinter01;
        break;

//chapter1
	case rm_rivals: 
        room_music = EKSSS;
        break;
		
    case rm_rivals_2:
    case rm_rivals_3: 
    case rm_test_pre_win:
    case rm_test_pre_win_1: 
        room_music = Dark_Tower;
        break;
		
    case rm_test_1:
    case rm_test_1_1: 
        room_music = DOOM_3;
        break;
		
    case rm_test_2: 
	case rm_test_2_2: 
        room_music = DOOM_5;
        break;
		
    case rm_test_3: 
        room_music = DOOM_2;
        break;
		
	case rm_test_4: 
        room_music = DOOM;
        break;
		
	case rm_test_5: 
        room_music = DOOM_10;
        break;
		
	case rm_test_6: 
        room_music = DOOM_7;
        break;
//chapter2
	case rm_forest: 
	case rm_forest_1: 
        room_music = FOREST_DOOM_START;
        break;
	case rm_forest_2: 
	case rm_forest_3: 
        room_music = reference_selced_2;
        break;
		
//win
    case rm_win1:
    case rm_win2: 
	case rm_win3:
    case rm_win4: 
	
        room_music = amenbreaktypebeat;
        break;
		
//winter
	case rm_winter_cutscene: 
        room_music = start_winter_special;
        break;
		
	case rm_winter: 
	case rm_winter2: 
        room_music = _1act_winter_special;
        break;
		
	case rm_winter3: 
	case rm_winter4: 
        room_music = WINTERMUSIC2;
        break;
		
	case rm_winter5: 
        room_music = WINTERSONG3;
        break;
		
	case rm_winter_boss: 
        room_music = BOSSWINTER;
        break;
		
		
    default:
        room_music = ""; // Нет музыки для других комнат
}

 if(room_music != "" && room_music != global.current_music)
 {
    if(global.music_playing) {
        audio_stop_sound(global.current_music);
    }
    audio_play_sound(room_music, 0, true);
    global.current_music = room_music;
    global.music_playing = true;
 }
 else if (room_music == "" && global.music_playing)
{
    audio_stop_sound(global.current_music);
    global.current_music = "";
    global.music_playing = false;
}