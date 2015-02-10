///f_SetPathTileDirection(tile, directionOfMovement)
var tile = argument0;
var dir = argument1;

var prevHighlightDirection = tile.currentHighlightDirection;

var newHighlightDirection = 5;

if prevHighlightDirection == 25 and dir == 8 { newHighlightDirection = 258; }
else if prevHighlightDirection == 25 and dir == 6 { newHighlightDirection = 256; }
else if prevHighlightDirection == 25 and dir == 4 { newHighlightDirection = 245; }

else if prevHighlightDirection == 58 and dir == 2 { newHighlightDirection = 258; }
else if prevHighlightDirection == 58 and dir == 6 { newHighlightDirection = 568; }
else if prevHighlightDirection == 58 and dir == 4 { newHighlightDirection = 458; }

else if prevHighlightDirection == 45 and dir == 6 { newHighlightDirection = 456; }
else if prevHighlightDirection == 45 and dir == 2 { newHighlightDirection = 245; }
else if prevHighlightDirection == 45 and dir == 8 { newHighlightDirection = 458; }

else if prevHighlightDirection == 56 and dir == 4 { newHighlightDirection = 456; }
else if prevHighlightDirection == 56 and dir == 8 { newHighlightDirection = 568; }
else if prevHighlightDirection == 56 and dir == 2 { newHighlightDirection = 256; }

//We were moving vertical
else if prevHighlightDirection == 258 and dir == 8 { newHighlightDirection = 258; }
else if prevHighlightDirection == 258 and dir == 6 { newHighlightDirection = 256; }
else if prevHighlightDirection == 258 and dir == 4 { newHighlightDirection = 245; }
else if prevHighlightDirection == 258 and dir == 2 { newHighlightDirection = 256; }
//We were moving horizontal
else if prevHighlightDirection == 456 and dir == 2 { newHighlightDirection = 245; }
else if prevHighlightDirection == 456 and dir == 8 { newHighlightDirection = 458; }
else if prevHighlightDirection == 456 and dir == 6 { newHighlightDirection = 456; }


else if (prevHighlightDirection == 256 or prevHighlightDirection == 568) and dir == 2 { newHighlightDirection = 256; }
else if (prevHighlightDirection == 256 or prevHighlightDirection == 568) and dir == 8 { newHighlightDirection = 568; }
else if (prevHighlightDirection == 256 or prevHighlightDirection == 568) and dir == 4 { newHighlightDirection = 456; }
else if (prevHighlightDirection == 256 or prevHighlightDirection == 568) and dir == 6 { newHighlightDirection = 456; }

else if (prevHighlightDirection == 458 or prevHighlightDirection == 245) and dir == 8 { newHighlightDirection = 458; }
else if (prevHighlightDirection == 458 or prevHighlightDirection == 245) and dir == 2 { newHighlightDirection = 245; }
else if (prevHighlightDirection == 458 or prevHighlightDirection == 245) and dir == 6 { newHighlightDirection = 456; }
else if (prevHighlightDirection == 458 or prevHighlightDirection == 245) and dir == 4 { newHighlightDirection = 456; }



//We were up-and-left
/*else if highlightDirection == 254 and dir == 8 { newHighlightDirection = 258; }
else if highlightDirection == 258 and dir == 6 { newHighlightDirection = 256; }
else if highlightDirection == 258 and dir == 4 { newHighlightDirection = 254; }*/

else if prevHighlightDirection == 5 and dir == 2 { newHighlightDirection = 25; }
else if prevHighlightDirection == 5 and dir == 4 { newHighlightDirection = 45; }
else if prevHighlightDirection == 5 and dir == 6 { newHighlightDirection = 56; }
else if prevHighlightDirection == 5 and dir == 8 { newHighlightDirection = 58; }

else 
    newHighlightDirection = 5;

    show_message("Prev: " + string(prevHighlightDirection) + " | Mv: " + string(dir) + " | New: " + string(newHighlightDirection));
    
tile.currentHighlightDirection = newHighlightDirection;
