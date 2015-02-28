///f_AddTileToPath(tileID)

var _tile = argument0;

if f_CheckIfPathIsCoherent(_tile.id)
{
    var PathLength = ds_list_size(global.CityManager.SelectedPath);
    
    if PathLength == 0
    {    
        _tile.highlightIndex = -1;
        _tile.highlightAngle = -1;
    }
    else
    {
        LastItem = ds_list_find_value(global.CityManager.SelectedPath, PathLength - 1);
    
        var dirX = _tile.column - LastItem.column ;
        var dirY = _tile.row - LastItem.row;
    
        if dirX > 0
        {
            _tile.currentHighlightDirection = 4
            
            f_SetPathTileDirection(LastItem, 6);
        }
        else if dirX < 0
        {
            _tile.currentHighlightDirection = 6           
            
            f_SetPathTileDirection(LastItem, 4);
        }
        else if dirY > 0
        {
            _tile.currentHighlightDirection = 8
            
            f_SetPathTileDirection(LastItem, 2);
        }
        else if dirY < 0
        {            
            _tile.currentHighlightDirection = 2
            
            f_SetPathTileDirection(LastItem, 8);
        }
    }
    
    ds_list_add(global.CityManager.SelectedPath, _tile); 
    _tile.image_alpha = 1;//0.25;
    //_tile.image_blend = c_blue;    
    _tile.IsSelected = true;
    if _tile.HasMarker
    {
       audio_play_sound(x_Coin1, 1, false);
       audio_sound_gain(x_Coin1, 0.25, 0);
    }
}
