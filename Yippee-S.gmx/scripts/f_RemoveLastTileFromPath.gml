///f_RemoveLastTileFromPath()

var PathLength = ds_list_size(global.SelectedPath);

if PathLength == 0
{    
    return -1;
}

var LastIndex = PathLength - 1;

var LastItem = ds_list_find_value(global.SelectedPath, LastIndex);
LastItem.image_alpha = 1;

ds_list_delete(global.SelectedPath, LastIndex);

return LastItem.id;
