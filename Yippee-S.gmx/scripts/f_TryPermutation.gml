///f_TryPermutation(k, N, Value, Level)

var k = argument0;
var N = argument1;
var Value = argument2;
var level = argument3;

level = level + 1; 
Value[@ k] = level;
if (level == N)
{
  //AddItem();
    /*var s = "";
    for (var j = 0; j < array_length_1d(Value); j++)
    {
        s += string(Value[@ j]);
    }
    show_debug_message(":: " + s);*/
    
    var localMinCost = 0;
    
    var PointA = StartingTile;
    //var PointAIndex = PointA.column + (StartingTile.row * global.CityManager.NumberOfColumns);
    //show_debug_message("Number of goals: " + string());
    
    /*var s = "";
    for (var j = 0; j < ds_list_size(ListOfGoals); j++)
    {
        s += string(ds_list_find_value(ListOfGoals, j)) + ", ";
    }
    show_debug_message("Total: " + string(array_length_1d(Value)));*/
    
    //var s = "";
    var PointAIndex = PointA.column + (PointA.row * global.CityManager.NumberOfColumns);
    
    var path;
    path[0] = -1
    
    for (var j = 0; j < array_length_1d(Value); j++)
    {                
        var PointB = ds_list_find_value(ListOfGoals, Value[@ j] - 1);        
        
        var PointBIndex = PointB.column + (PointB.row * global.CityManager.NumberOfColumns);
        
        //s += "(" + string(PointAIndex) + ", " + string(PointBIndex) + ")" + " -> ";
        
        localMinCost += costsGrid[PointAIndex, PointBIndex];
        
        f_ReconstructPath(path, PointAIndex, PointBIndex);
        
        PointAIndex = PointBIndex;
    }    
    //show_debug_message("Permutation:" + s + ". Local: " + string(localMinCost) + ". Global: " + string(global.minCost));
    global.minCost = min(global.minCost, localMinCost);    
    
    /*var s = "";
    for (var j = 1; j < array_length_1d(path); j++)
    {
        if j > 1
            s += " -> "; 
        
        s += "(" + string(path[j]) + ")";   
    }
    show_debug_message("::: Path ::: " + s);*/
    
    
    /*for (var i = 0; i < ds_list_size(ListOfGoals); i ++)
    {
        var EndingTile = ds_list_find_value(ListOfGoals, i);  
        var endingIndex = EndingTile.column + (EndingTile.row * global.CityManager.NumberOfColumns);
        
        minCost = min(minCost, costsGrid[startingIndex, endingIndex]);
    }*/
    
    global.total++;
}
else
{
  for (var i = 0; i < N; i++)
    if (Value[@ i] == 0)
      level = f_TryPermutation(i, N, Value, level);
}

//level = level - 1;
Value[@ k] = 0;
return level - 1;