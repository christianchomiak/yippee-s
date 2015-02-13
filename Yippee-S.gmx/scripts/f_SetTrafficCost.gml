///f_SetTrafficCost(tile)

var tile = argument0;

//Missing check to see if it has a Traffic Jam
var index = tile.TrafficJam.image_index;
var angle = tile.TrafficJam.image_angle;
var cost = tile.TrafficJam.TrafficLevel; // / 2;

tile.CostToNorth = 1;//0.5;
tile.CostToSouth = 1;//0.5;
tile.CostToEast = 1;//0.5;
tile.CostToWest = 1;//0.5;

if index == 0
{
    tile.CostToNorth = cost;
    tile.CostToSouth = cost;
    tile.CostToEast = cost;
    tile.CostToWest = cost;
}
else if index == 1
{
    if angle == 0 { tile.CostToEast = cost; } else 
    if angle == 90 { tile.CostToNorth = cost; } else 
    if angle == 180 { tile.CostToWest = cost; } else 
    if angle == 270 { tile.CostToSouth = cost; }    
}
else if index == 2
{
    if angle == 0 { tile.CostToEast = cost; tile.CostToSouth = cost; } else 
    if angle == 90 { tile.CostToNorth = cost; tile.CostToEast = cost; } else 
    if angle == 180 { tile.CostToWest = cost; tile.CostToNorth = cost; } else 
    if angle == 270 { tile.CostToWest = cost; tile.CostToSouth = cost;}    
}
else if index == 3
{
    if angle == 0 or angle == 180 { tile.CostToEast = cost; tile.CostToWest = cost; } else 
    if angle == 90 or angle == 270 { tile.CostToNorth = cost; tile.CostToSouth = cost; }
}
else if index == 4
{
    if angle == 0 
    { 
        tile.CostToNorth = cost;
        tile.CostToEast = cost; 
        tile.CostToSouth = cost; 
    }
    else if angle == 90
    { 
        tile.CostToNorth = cost;
        tile.CostToEast = cost; 
        tile.CostToWest = cost; 
    }
    else if angle == 180
    { 
        tile.CostToNorth = cost;
        tile.CostToSouth = cost; 
        tile.CostToWest = cost; 
    }
    else if angle == 270
    { 
        tile.CostToSouth = cost;
        tile.CostToEast = cost; 
        tile.CostToWest = cost; 
    }
}
else if index == 5
{
    if angle == 0 or angle == 180 { tile.CostToNorth = cost; tile.CostToSouth = cost; } else 
    if angle == 90 or angle == 270 { tile.CostToEast = cost; tile.CostToWest = cost; }
} 

