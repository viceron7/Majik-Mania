// --- Get input ---
leftPressed  = keyboard_check(vk_left);
rightPressed = keyboard_check(vk_right);
jumpPressed  = keyboard_check_pressed(vk_up);

// --- Horizontal movement ---
hsp = 0;
if (leftPressed) hsp = -moveSpeed;
if (rightPressed) hsp = moveSpeed;

// --- Apply gravity ---
vsp += grav;
if (vsp > maxFallSpeed) vsp = maxFallSpeed;

// --- Horizontal collision ---
if (place_meeting(x + hsp, y, solidObj)) {
    while (!place_meeting(x + sign(hsp), y, solidObj)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// --- Vertical collision ---
if (place_meeting(x, y + vsp, solidObj)) {
    while (!place_meeting(x, y + sign(vsp), solidObj)) {
        y += sign(vsp);
    }
    vsp = 0;
} 
y += vsp;

// --- Jumping ---
if (jumpPressed && place_meeting(x, y + 1, solidObj)) {
    vsp = -jumpSpeed;
}

// --- Room transitions ---
var entrySide = "center"; // default

var neighbors = global.roomMap[? room];

// --- Right edge ---
if (x >= room_width - edgeMargin) && (neighbors != undefined) {
    var nextRoom = neighbors[1]; // right room
    if (nextRoom != noone) {
        global.lastRoom = room;
        global.roomEntrySide[? nextRoom] = "left"; // entering from left
        room_goto(nextRoom);
    }
}

// --- Left edge ---
if (x <= edgeMargin) && (neighbors != undefined) {
    var prevRoom = neighbors[0]; // left room
    if (prevRoom != noone) {
        global.lastRoom = room;
        global.roomEntrySide[? prevRoom] = "right"; // entering from right
        room_goto(prevRoom);
    }
}
