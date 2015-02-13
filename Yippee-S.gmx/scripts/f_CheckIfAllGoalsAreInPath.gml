///f_CheckIfAllGoalsAreInPath()

var allGoalsAreInPath = false;
for (var iii = 0; iii < ds_list_size(global.CityManager.ListOfGoals); iii++)
{
    var g = ds_list_find_value(global.CityManager.ListOfGoals, iii);
    if !f_CheckIfTileIsInPath(global.CityManager.CityGrid[g.column, g.row])
        return false;
}
return true;
