/*Car position*/
CarStartingRow = irandom_range(0, NumberOfRows - 1);
CarStartingColumn = irandom_range(0, NumberOfColumns - 1);
CarPositionX = f_PositionInWorld(StartingX, CarStartingColumn, CellSize, true);
CarPositionY = f_PositionInWorld(StartingY, CarStartingRow, CellSize, true);

/*Destination position*/
var doneWithDestination = false;
while !doneWithDestination
{
    DestinationRow = irandom_range(0, NumberOfRows - 1);
    DestinationColumn = irandom_range(0, NumberOfColumns - 1);
    
    if DestinationRow != CarStartingRow or DestinationColumn != CarStartingColumn
        doneWithDestination = true;
}
DestinationPositionX = f_PositionInWorld(StartingX, DestinationColumn, CellSize, true);
DestinationPositionY = f_PositionInWorld(StartingY, DestinationRow, CellSize, true);

/*Traffic Jams*/
for (var r = 0; r < NumberOfRows; r++)
{
    for (var c = 0; c < NumberOfColumns; c++)
    {        
        CityGrid[c, r].IsSelected = false;
    }
}
