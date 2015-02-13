///f_GetEdgeCost(Tile, MovementDirection)


var Tile = argument0;
var MovementDirection = argument1 % 4;

var NeighborTileRow = tile.row;
var NeighborTileColumn = tile.column;

var NeighborDirection = 0;

switch (MovementDirection)
{
    case 0: //North
        NeighborTileRow--;
        NeighborDirection = 3;
        break;
    case 1: //East
        NeighborTileColumn++;
        NeighborDirection = 2;
        break;
    case 2: //West
        NeighborTileColumn--;
        NeighborDirection = 1;
        break;
    case 3: //South
        NeighborTileRow++;
        NeighborDirection = 0;
        break;
    default:
        return 1000;
        //break;
}

if NeighborTileColumn < 0 or NeighborTileColumn > global.CityManager.NumberOfColumns or
   NeighborTileRow < 0 or NeighborTileRow > global.CityManager.NumberOfRows
{
    return 1000;
}
 
var cost = f_GetTileCost(Tile, MovementDirection);
cost += f_GetTileCost(global.CityManager.CityGrid[NeighborTileColumn, NeighborTileRow], NeighborDirection);

return cost;