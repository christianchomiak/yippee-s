///f_GetSelectedPathCost()

var selectedPathCost = 0;

for (var i = 0; i < ds_list_size(SelectedPath) - 1; i++)
{                
    var PointA = ds_list_find_value(SelectedPath, i);
    var PointAIndex = PointA.column + (PointA.row * global.CityManager.NumberOfColumns);
    
    var PointB = ds_list_find_value(SelectedPath, i + 1);
    var PointBIndex = PointB.column + (PointB.row * global.CityManager.NumberOfColumns);       
    
    selectedPathCost += costsGrid[PointAIndex, PointBIndex];
}

return selectedPathCost;

