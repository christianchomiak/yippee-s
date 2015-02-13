///f_GetPathCost(Start, End)

var StartingTile = argument0;
var EndingTile = argument1;

var V = global.CityManager.NumberOfColumns * global.CityManager.NumberOfRows; //ds_grid_width(global.CityManager.CityGrid) * ds_grid_height(global.CityManager.CityGrid); //  

var costsGrid;

//costsGrid = ds_grid_create(V, V);

/*for (var i = 0; i < V; i++)
{
    costsGrid[i, i] = 0;
}*/

for (var i = 0; i < V; i++)
{
    for (var j = 0; j < V; j++)
    {
        if i == j
            costsGrid[i, i] = 0;
        else        
            costsGrid[i, j] = 5000;
    }
}

for (var i = 0; i < V; i++)
{
    var CurrentTile = global.CityManager.CityGrid[i mod global.CityManager.NumberOfColumns, i div global.CityManager.NumberOfColumns];
           
    if CurrentTile == noone or !instance_exists(CurrentTile)
            continue;
    
    for (var m = 0; m < 4; m++)
    {
        var cost = f_GetTileCost(CurrentTile, m);
        var NeighborTile = f_GetTileNeighbor(CurrentTile, m);
        var NeighborMvmnt = 3 - m;
        
        if NeighborTile == noone or !instance_exists(NeighborTile)
            continue;
            
        cost += f_GetTileCost(NeighborTile, NeighborMvmnt);
        
        //show_debug_message("C: " + string(NeighborTile.column) + ", R: " + string(NeighborTile.row));
        
        var j = NeighborTile.column + (NeighborTile.row * global.CityManager.NumberOfColumns);
        
        costsGrid[i, j] = cost;
    }    
}

//show_debug_message("W: " + string(ds_grid_width(costsGrid)) + ", H: " + string(ds_grid_height(costsGrid)) + ". V: " + string(V));

for (var k = 0; k < V; k++)
{
    for (var i = 0; i < V; i++)
    {
        for (var j = 0; j < V; j++)
        {    
            //show_debug_message("i: " + string(i) + ", j: " + string(j) + ", k: " + string(k));

            if costsGrid[i, j] > costsGrid[i, k] + costsGrid[k, j]
                costsGrid[i, j] = costsGrid[i, k] + costsGrid[k, j]
        }
    }
}

for (var i = 0; i < V; i++)
{
    for (var j = 0; j < V; j++)
    {
        var row1 = i div global.CityManager.NumberOfColumns;
        var col1 = i mod global.CityManager.NumberOfColumns; 
        var row2 = j div global.CityManager.NumberOfColumns;
        var col2 = j mod global.CityManager.NumberOfColumns;   
        
        show_debug_message("(" + string(col1) + ", " + string(row1) + ") -> " + "(" + string(col2) + ", " + string(row2) + ") == "  + string(costsGrid[i, j]));
        
        //show_debug_message("i: " + string(i) + ", j: " + string(j) + ", C: " + string(costsGrid[i, j]));
    }
}

var startingIndex = StartingTile.column + (StartingTile.row * global.CityManager.NumberOfColumns);
var endingIndex = EndingTile.column + (EndingTile.row * global.CityManager.NumberOfColumns);

var finalCost = costsGrid[startingIndex, endingIndex];

costsGrid = 0;
//ds_grid_destroy(costsGrid);

return finalCost;
