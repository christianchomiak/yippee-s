///f_RemoveLastTileFromPath()

var PathLength = ds_list_size(global.CityManager.SelectedPath);

if PathLength == 0
{    
    return -1;
}

var LastIndex = PathLength - 1;

var LastItem = ds_list_find_value(global.CityManager.SelectedPath, LastIndex);

if instance_exists(LastItem)
{
    LastItem.image_alpha = 1;
    LastItem.IsSelected = false;
    LastItem.currentHighlightDirection = 5;    
    
    ds_list_delete(global.CityManager.SelectedPath, LastIndex);
    
    if LastIndex - 1 == 0
    {
        //show_debug_message("LAST");
        var origin = ds_list_find_value(global.CityManager.SelectedPath, 0);
        origin.currentHighlightDirection = 5;
    }
    
    return LastItem.id;
}
else
{
    ds_list_delete(global.CityManager.SelectedPath, LastIndex);
    
    return -2;
}
