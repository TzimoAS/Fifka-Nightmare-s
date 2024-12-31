magnet_range = 450; // Your default range for the magnet

// Configuration variables
min_dist = 75;  // Minimum distance before the magnetic force becomes a push force.
push_strength = 15; // How far the player will be pushed.
cooldown_duration = 600; // How long the cooldown will last (frames)
magnet_strength = 3; // Strength of the magnetic pull,

direction = 0; // initialize direction.
is_in_range = false; // Track is player is in range.
is_pulling = false; // Track if magnetic force is pulling the player
cooldown_timer = 0; // initialize the cooldown timer.

// Get the sound IDs or make sure they're assigned correctly
magnet_sound = calculator; // Replace with your actual magnetic loop sound index
magnet_hit_sound = calculator; // Replace with your actual magnetic hit sound index
magnet_push_sound = calculator; // Replace with your actual push sound.