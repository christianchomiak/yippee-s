///f_GetTileNeighbor(Tile, MovementDirection)

var Tile = argument0;
var MovementDirection = argument1 % 4;

var NeighborTileRow = Tile.row;
var NeighborTileColumn = Tile.column;


switch (MovementDirection)
{
    case 0: //North
        NeighborTileRow--;
        break;
    case 1: //East
        NeighborTileColumn++;
        break;
    case 2: //West
        NeighborTileColumn--;
        break;
    case 3: //South
        NeighborTileRow++;
        break;
    default:
        return noone;
        //break;
}

if NeighborTileColumn < 0 or NeighborTileColumn >= global.CityManager.NumberOfColumns or
   NeighborTileRow < 0 or NeighborTileRow >= global.CityManager.NumberOfRows
{
    return noone;
}
else
{
    return global.CityManager.CityGrid[NeighborTileColumn, NeighborTileRow];
} 
