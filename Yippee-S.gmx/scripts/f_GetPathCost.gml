///f_GetPathCost(Start)

//var StartingTile = argument0;
//var EndingTile = argument1;



var V = global.CityManager.NumberOfColumns * global.CityManager.NumberOfRows; //ds_grid_width(global.CityManager.CityGrid) * ds_grid_height(global.CityManager.CityGrid); //  

costsGrid = 0;
next = 0;

//costsGrid = ds_grid_create(V, V);

/*for (var i = 0; i < V; i++)
{
    costsGrid[i, i] = 0;
}*/

//Initialization
for (var i = 0; i < V; i++)
{
    for (var j = 0; j < V; j++)
    {
        if i == j
            costsGrid[i, i] = 0;
        else        
            costsGrid[i, j] = 5000;            
            
        next[i, j] = -1;
    }
}

//Edges
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
        next[i, j] = j;
    }    
}

//Floyd-Warshall
for (var k = 0; k < V; k++)
{
    for (var i = 0; i < V; i++)
    {
        for (var j = 0; j < V; j++)
        {    
            //show_debug_message("i: " + string(i) + ", j: " + string(j) + ", k: " + string(k));

            if costsGrid[i, j] > costsGrid[i, k] + costsGrid[k, j]
            {            
                costsGrid[i, j] = costsGrid[i, k] + costsGrid[k, j];
                next[i, j] = next[i, k];
            }
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


//Get best minimum trip cost
global.minCost = 3000;
var Value;
var N = ds_list_size(ListOfGoals);
global.total = 0;
for (var j = 0; j < N; j++)
{
    Value[j] = 0;
}
f_TryPermutation(0, N, Value, -1);
var minCost = global.minCost;

//costsGrid = 0;

return minCost; //finalCost;
