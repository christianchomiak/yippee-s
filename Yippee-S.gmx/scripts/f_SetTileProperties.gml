var _tile = argument0;
var _wasSelected = argument1;

LastItem.PreviouslySelected = _wasSelected;

if _wasSelected
    LastItem.image_alpha = 0.25;
else    
    LastItem.image_alpha = 1;
