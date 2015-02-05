///f_AddTileToPath(tileID)

var _tile = argument0;

if f_CheckIfPathIsCoherent(_tile.id)
{
    ds_list_add(global.CityManager.SelectedPath, _tile); 
    _tile.image_alpha = 0.25;
}
