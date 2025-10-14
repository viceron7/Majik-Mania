// --- Place player at correct entry side ---
if (global.roomEntrySide[? room] == "left") {
    x = edgeMargin + 1; // appear on left
} else if (global.roomEntrySide[? room] == "right") {
    x = room_width - edgeMargin - sprite_width - 1; // appear on right
} else {
    x = room_width / 2 - sprite_width / 2; // default center
}

// --- Reset vertical speed ---
vsp = 0;
