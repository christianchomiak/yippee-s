///f_CheckIfPathIsCoherent(new_tile_id)

var _newTile = argument0;

var PathLength = ds_list_size(global.SelectedPath);

if PathLength == 0
    return true;


LastItem = ds_list_find_value(global.SelectedPath, PathLength - 1);

var deltaColumn = abs(_newTile.column - LastItem.column);
var deltaRow = (_newTile.row - LastItem.row);

if (deltaColumn != 0 && deltaRow != 0) or
    deltaColumn > 1 or deltaRow > 1
{
    return false;
}

return true;
