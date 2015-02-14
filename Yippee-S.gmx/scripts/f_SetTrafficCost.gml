///f_SetTrafficCost(tile)

var tile = argument0;

//Missing check to see if it has a Traffic Jam
var index = tile.TrafficJam.image_index;
var angle = tile.TrafficJam.image_angle;
var cost = tile.TrafficJam.TrafficLevel; // / 2;

var collateralCost = (cost * 0.171875) + 0.828125;

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
    if angle == 0 
    { 
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = cost;
        tile.CostToWest = collateralCost;
    } 
    else if angle == 90 
    {
        tile.CostToNorth = cost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = collateralCost;
    } 
    else if angle == 180 
    {
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = cost;
    } 
    else if angle == 270 
    { 
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = cost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = collateralCost;
    }    
}
else if index == 2
{
    if angle == 0 
    { 
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = cost;
        tile.CostToEast = cost;
        tile.CostToWest = collateralCost;
    } 
    else if angle == 90 
    {
        tile.CostToNorth = cost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = cost;
        tile.CostToWest = collateralCost;
    } 
    else if angle == 180 
    {
        tile.CostToNorth = cost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = cost;
    } 
    else if angle == 270 
    {
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = cost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = cost;
    }    
}
else if index == 3
{
    if angle == 0 or angle == 180 
    {
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = collateralCost;
        tile.CostToEast = cost;
        tile.CostToWest = cost;
    }
    else if angle == 90 or angle == 270 
    { 
        tile.CostToNorth = cost;
        tile.CostToSouth = cost;
        tile.CostToEast = collateralCost;
        tile.CostToWest = collateralCost;
    }
}
else if index == 4
{
    if angle == 0 
    { 
        tile.CostToNorth = cost;
        tile.CostToSouth = cost;
        tile.CostToEast = cost;
        tile.CostToWest = collateralCost;
    }
    else if angle == 90
    { 
        tile.CostToNorth = cost;
        tile.CostToEast = cost; 
        tile.CostToWest = cost; 
        tile.CostToSouth = collateralCost;
    }
    else if angle == 180
    { 
        tile.CostToNorth = cost;
        tile.CostToSouth = cost; 
        tile.CostToWest = cost; 
        tile.CostToEast = collateralCost; 
    }
    else if angle == 270
    { 
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = cost;
        tile.CostToEast = cost; 
        tile.CostToWest = cost; 
    }
}
else if index == 5
{
    if angle == 0 or angle == 180 
    {
        tile.CostToNorth = cost;
        tile.CostToSouth = cost; 
        tile.CostToEast = collateralCost; 
        tile.CostToWest = collateralCost; 
    }
    else if angle == 90 or angle == 270 
    { 
        tile.CostToNorth = collateralCost;
        tile.CostToSouth = collateralCost; 
        tile.CostToEast = cost; 
        tile.CostToWest = cost; 
    }
} 
