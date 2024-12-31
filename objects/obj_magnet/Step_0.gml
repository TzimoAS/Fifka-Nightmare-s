direction = 0;
var player = instance_find(obj_player_chapter2, 0);
var is_in_range = false; // Variable to track if the player is in range
var is_pulling = false; // Variable to track if the magnet is actively pulling
var cooldown_timer = 0; // Timer for the cooldown
var magnet_sound = calculator;  // Replace with your magnet loop sound
var magnet_hit_sound = calculator; // Replace with your magnet hit sound
var magnet_push_sound = calculator; // Add a sound for the push

// Added configuration variables to control distances and cooldown
var min_dist = 75; // minimum distance to stop pulling
var push_distance = 150; // The fixed distance the player will be pushed
var cooldown_duration = 600; // Cooldown in frames (5 seconds at 60 fps)

if (player != noone)
{
    var dist = point_distance(x, y, player.x, player.y);

    if (dist < magnet_range && cooldown_timer <= 0) // Check cooldown
    {
        is_in_range = true;
        if(dist > min_dist) // Start pulling if far enough
        {
		    is_pulling = true;
            direction = point_direction(player.x, player.y, x, y);

            var x_vec = lengthdir_x(magnet_strength, direction);
            var y_vec = lengthdir_y(magnet_strength, direction);

            // Calculate the player's potential position
            var target_x = player.x + x_vec;
            var target_y = player.y + y_vec;

            // Check for wall collisions before moving
            if (!place_meeting(target_x, target_y, obj_wall) &&
                !place_meeting(target_x, target_y, obj_wall_breakable) &&
                !place_meeting(target_x, target_y, obj_wall_1) &&
                !place_meeting(target_x, target_y, obj_wall_end) &&
                !place_meeting(target_x, target_y, obj_wall_start))
            {
                player.x += x_vec;
                player.y += y_vec;

                // Play the hit sound
                if (!audio_is_playing(magnet_hit_sound)){
                    audio_play_sound(magnet_hit_sound, 1, false);
                }
            }
		}else{
			// Push player if it is too close
		    is_pulling = false;

			var push_dir = point_direction(x, y, player.x, player.y);
            var push_x_vec = lengthdir_x(push_distance, push_dir);
			var push_y_vec = lengthdir_y(push_distance, push_dir);


            // Check if the push would cause a collision
           var target_x = player.x + push_x_vec;
            var target_y = player.y + push_y_vec;
        
            if (!place_meeting(target_x, target_y, obj_wall) &&
                !place_meeting(target_x, target_y, obj_wall_breakable) &&
                !place_meeting(target_x, target_y, obj_wall_1) &&
                !place_meeting(target_x, target_y, obj_wall_end) &&
                !place_meeting(target_x, target_y, obj_wall_start)){
                    player.x += push_x_vec;
                    player.y += push_y_vec;
            }
			// start the cooldown
			cooldown_timer = cooldown_duration;

            // Play a push sound
             if (!audio_is_playing(magnet_push_sound)){
                audio_play_sound(magnet_push_sound, 1, false);
            }

		}


        // start loop sound, if it isn't playing and if we are actively pulling the player.
        if (is_pulling && !audio_is_playing(magnet_sound)){
            audio_play_sound(magnet_sound, 1, true);
        }

    } else
	{
		is_in_range = false;
		is_pulling = false;

	}
}

// Decrement cooldown
if (cooldown_timer > 0)
{
    cooldown_timer--;
}


// Reduce sound volume if player isn't in range and stop the sound if it's too quiet
if (!is_in_range && audio_is_playing(magnet_sound))
{
	var current_volume = audio_sound_get_gain(magnet_sound);
    if(current_volume > 0)
	{
		audio_sound_gain(magnet_sound, current_volume - 0.01, 0);
	}
	else
	{
		audio_stop_sound(magnet_sound);
	}
}

// Stop the sound when the cooldown is running
if(cooldown_timer > 0 && audio_is_playing(magnet_sound))
{
    audio_stop_sound(magnet_sound);
}