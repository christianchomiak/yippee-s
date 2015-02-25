///f_SetPathTileDirection(tile, directionOfMovement)
var tile = argument0;
var dir = argument1;

var prevHighlightDirection = tile.currentHighlightDirection;

var newHighlightDirection = 5;


show_debug_message("Prev: " + string(prevHighlightDirection) + ", Dir: " + string(dir));

if prevHighlightDirection == 2 and dir == 8 { newHighlightDirection = 28; }
else if prevHighlightDirection == 2 and dir == 6 { newHighlightDirection = 26; }
else if prevHighlightDirection == 2 and dir == 4 { newHighlightDirection = 24; }
else if prevHighlightDirection == 2 and dir == 2 { newHighlightDirection = 2; }

else if prevHighlightDirection == 8 and dir == 2 { newHighlightDirection = 82; }
else if prevHighlightDirection == 8 and dir == 6 { newHighlightDirection = 86; }
else if prevHighlightDirection == 8 and dir == 4 { newHighlightDirection = 84; }
else if prevHighlightDirection == 8 and dir == 8 { newHighlightDirection = 8; }

else if prevHighlightDirection == 4 and dir == 6 { newHighlightDirection = 46; }
else if prevHighlightDirection == 4 and dir == 2 { newHighlightDirection = 42; }
else if prevHighlightDirection == 4 and dir == 8 { newHighlightDirection = 48; }
else if prevHighlightDirection == 4 and dir == 4 { newHighlightDirection = 4; }

else if prevHighlightDirection == 6 and dir == 4 { newHighlightDirection = 64; }
else if prevHighlightDirection == 6 and dir == 8 { newHighlightDirection = 68; }
else if prevHighlightDirection == 6 and dir == 2 { newHighlightDirection = 62; }
else if prevHighlightDirection == 6 and dir == 6 { newHighlightDirection = 6; }

//We were moving vertical
else if prevHighlightDirection == 28 and dir == 8 { newHighlightDirection = 28; }
else if prevHighlightDirection == 28 and dir == 6 { newHighlightDirection = 26; }
else if prevHighlightDirection == 28 and dir == 4 { newHighlightDirection = 24; }
else if prevHighlightDirection == 28 and dir == 2 { newHighlightDirection = 2; }

else if prevHighlightDirection == 82 and dir == 8 { newHighlightDirection = 8; }
else if prevHighlightDirection == 82 and dir == 6 { newHighlightDirection = 86; }
else if prevHighlightDirection == 82 and dir == 4 { newHighlightDirection = 84; }
else if prevHighlightDirection == 82 and dir == 2 { newHighlightDirection = 82; }

//We were moving horizontal
else if prevHighlightDirection == 46 and dir == 2 { newHighlightDirection = 42; }
else if prevHighlightDirection == 46 and dir == 8 { newHighlightDirection = 48; }
else if prevHighlightDirection == 46 and dir == 6 { newHighlightDirection = 46; }
else if prevHighlightDirection == 46 and dir == 4 { newHighlightDirection = 4; }

else if prevHighlightDirection == 64 and dir == 2 { newHighlightDirection = 62; }
else if prevHighlightDirection == 64 and dir == 8 { newHighlightDirection = 68; }
else if prevHighlightDirection == 64 and dir == 6 { newHighlightDirection = 6; }
else if prevHighlightDirection == 64 and dir == 4 { newHighlightDirection = 64; }


else if (prevHighlightDirection == 24 or prevHighlightDirection == 26)  and dir == 2 { newHighlightDirection = 2; }
else if (prevHighlightDirection == 24 or prevHighlightDirection == 26) and dir == 8 { newHighlightDirection = 28; }
else if (prevHighlightDirection == 24 or prevHighlightDirection == 26) and dir == 6 { newHighlightDirection = 26; }
else if (prevHighlightDirection == 24 or prevHighlightDirection == 26) and dir == 4 { newHighlightDirection = 24; }

else if (prevHighlightDirection == 42 or prevHighlightDirection == 48)  and dir == 2 { newHighlightDirection = 42; }
else if (prevHighlightDirection == 42 or prevHighlightDirection == 48) and dir == 8 { newHighlightDirection = 48; }
else if (prevHighlightDirection == 42 or prevHighlightDirection == 48) and dir == 6 { newHighlightDirection = 46; }
else if (prevHighlightDirection == 42 or prevHighlightDirection == 48) and dir == 4 { newHighlightDirection = 4; }


else if (prevHighlightDirection == 68 or prevHighlightDirection == 62) and dir == 2 { newHighlightDirection = 62; }
else if (prevHighlightDirection == 68 or prevHighlightDirection == 62) and dir == 8 { newHighlightDirection = 68; }
else if (prevHighlightDirection == 68 or prevHighlightDirection == 62) and dir == 6 { newHighlightDirection = 6; }
else if (prevHighlightDirection == 68 or prevHighlightDirection == 62) and dir == 4 { newHighlightDirection = 64; }

else if (prevHighlightDirection == 86 or prevHighlightDirection == 84) and dir == 2 { newHighlightDirection = 82; }
else if (prevHighlightDirection == 86 or prevHighlightDirection == 84) and dir == 8 { newHighlightDirection = 8; }
else if (prevHighlightDirection == 86 or prevHighlightDirection == 84) and dir == 6 { newHighlightDirection = 86; }
else if (prevHighlightDirection == 86 or prevHighlightDirection == 84) and dir == 4 { newHighlightDirection = 84; }

else if prevHighlightDirection == 5 and dir == 2 { newHighlightDirection = 2; }
else if prevHighlightDirection == 5 and dir == 4 { newHighlightDirection = 4; }
else if prevHighlightDirection == 5 and dir == 6 { newHighlightDirection = 6; }
else if prevHighlightDirection == 5 and dir == 8 { newHighlightDirection = 8; }

else 
{
    newHighlightDirection = 5;
    show_debug_message("5: " + string(prevHighlightDirection));
}

    //show_message("Prev: " + string(prevHighlightDirection) + " | Mv: " + string(dir) + " | New: " + string(newHighlightDirection));
    
tile.currentHighlightDirection = newHighlightDirection;
