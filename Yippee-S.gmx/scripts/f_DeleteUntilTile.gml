///f_DeleteUntilTile(tile_ID)
var _tile = argument0;

var PathLength = ds_list_size(global.SelectedPath);

var finished = false
while PathLength > 0
{
    LastItem = ds_list_find_value(global.SelectedPath, PathLength - 1);
    if LastItem == _tile
    {
        break;
    }
    PathLength--;
    f_RemoveLastTileFromPath();
}
