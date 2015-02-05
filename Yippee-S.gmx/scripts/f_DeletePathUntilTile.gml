///f_DeletePathUntilTile(tile_ID)
var _tile = argument0;

var PathLength = ds_list_size(global.CityManager.SelectedPath);

var finished = false
while PathLength > 0
{
    LastItem = ds_list_find_value(global.CityManager.SelectedPath, PathLength - 1);
    if LastItem == _tile
    {
        break;
    }
    PathLength--;
    f_RemoveLastTileFromPath();
}
