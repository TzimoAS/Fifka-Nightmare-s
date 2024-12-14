var xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize movement vector if both keys are pressed
var moveLength = sqrt(xMove*xMove + yMove*yMove);
if (moveLength > 0) {
    xMove /= moveLength;
    yMove /= moveLength;
}

spd += accel;

var collision = false;
if (place_meeting(x + xMove * spd, y, obj_wall_FRAGER)) {
    xMove = 0;
    collision = true;
}
if (place_meeting(x, y + yMove * spd, obj_wall_FRAGER)) {
    yMove = 0;
    collision = true;
}

x += xMove * spd;
y += yMove * spd;

if (collision) {
    spd *= decel;
    spd = max(spd, 0); 
}


// Sprite animation
var dir = point_direction(0, 0, xMove, yMove);
var isMoving = (xMove != 0 || yMove != 0);

if (isMoving) {
    face = floor(dir / 45);
    face = clamp(face, 0, 7);
    image_speed = 0.2;
} else {
    face = 8; 
    image_speed = 0;
}

image_index = face; 