// --- Player variables ---
hsp = 0;            // horizontal speed
vsp = 0;            // vertical speed
moveSpeed = 4;      // horizontal speed
jumpSpeed = 10;     // vertical jump speed
grav = 0.5;         // gravity
maxFallSpeed = 12;  // max falling speed
playerHealth = 100;

// --- Solid object ---
solidObj = BGO_cracked_brick_ground;

// --- Edge detection for room transitions ---
edgeMargin = 4; // pixels from room edge to trigger transition

// --- Input variables ---
leftPressed = false;
rightPressed = false;
jumpPressed = false;

// --- Track last room entered ---
if (!variable_global_exists("lastRoom")) {
    global.lastRoom = room; // initialize
}

// --- Track which side player enters each room ---
if (!variable_global_exists("roomEntrySide")) {
    global.roomEntrySide = ds_map_create(); // key = room constant, value = "left"/"right"/"center"
}

// --- Room neighbors mapping ---
// Format: global.roomMap[room] = [leftRoom, rightRoom];
if (!variable_global_exists("roomMap")) {
    global.roomMap = ds_map_create();
    
    // Example layout: starting room in the middle
    global.roomMap[? MA_GAME_START]       = [MA_MRLEN_CLASSROOM, MA_HLWY_1]; // [left, right]
    global.roomMap[? MA_MRLEN_CLASSROOM] = [noone, MA_GAME_START];
    global.roomMap[? MA_HLWY_1]          = [MA_GAME_START, noone];
    
    // Add other rooms as needed
}


// --- Track last room entered ---
if (!variable_global_exists("lastRoom")) {
    global.lastRoom = room; // initialize with current room
}
// --- Room neighbors mapping ---
// Format: global.roomMap[room] = [leftRoom, rightRoom];
if (!variable_global_exists("roomMap")) {
    global.roomMap = ds_map_create();
    
    // Example:
    // startingRoom has a left room and a right room
    global.roomMap[? MA_GAME_START] = [MA_MRLEN_CLASSROOM, MA_HLWY_1];
    global.roomMap[? MA_MRLEN_CLASSROOM]  = [noone, MA_GAME_START];
    global.roomMap[? MA_HLWY_1] = [MA_GAME_START, noone];
    
    // Repeat for all rooms as needed
}
