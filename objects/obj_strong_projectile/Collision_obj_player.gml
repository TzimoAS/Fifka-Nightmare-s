if (other == obj_player){
    with (other){
        hp -= 20; // Adjust damage
    }
    instance_destroy();
}