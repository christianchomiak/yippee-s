///f_GetTileCost(Tile, MovementDirection)

var Tile = argument0;
var MovementDirection = argument1;

var cost = 0;

switch (MovementDirection)
{
    case 0: //North
        cost = Tile.CostToNorth;
        break;
    case 1: //East
        cost = Tile.CostToEast;
        break;
    case 2: //West
        cost = Tile.CostToWest;
        break;
    case 3: //South
        cost = Tile.CostToSouth;
        break;
    default:
        cost = 1000;
        break;
}

return cost;
