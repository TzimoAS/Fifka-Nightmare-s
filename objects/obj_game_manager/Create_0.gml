 // Событие Create (obj_game_manager)
 global.kills = 0; // Инициализация глобального счетчика убийств

 function save_game() {
    ini_open("YourProgress.save");
    ini_write_real("SaveData", "kills", global.kills);
    ini_close();
  }

  function load_game() {
     ini_open("YourProgress.save");
     global.kills = ini_read_real("SaveData", "kills", 0);
     ini_close();
  }