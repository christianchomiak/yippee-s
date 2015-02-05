///f_CheckIfTileIsInPath(tile_ID)
var _tile = argument0;

var PathLength = ds_list_size(global.CityManager.SelectedPath);
var LastItem = -1;

for (var i = 0; i < PathLength; i++)
{
    LastItem = ds_list_find_value(global.CityManager.SelectedPath, i);
    if LastItem == _tile
    {        
        return true;
    }
}

return false;
