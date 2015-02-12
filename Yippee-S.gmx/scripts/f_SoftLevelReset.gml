///f_SoftLevelReset(MinNumberOfTrafficJams, MaxNumberOfTrafficJams)

for (var iii = 0; iii < ds_list_size(ListOfTrafficJams); iii++)
{
    var tempJam = ds_list_find_value(ListOfTrafficJams, iii);
    with tempJam
    {
        instance_destroy();
    }
}

var minJams = (NumberOfRows * NumberOfColumns - 2) * argument0;
var maxJams = (NumberOfRows * NumberOfColumns - 2) * argument1;

/*Game status*/
IsSelectionPhase = true;
UsingGPSView = true;
AccumulatedTime = 0;

/*Car*/
CarStartingRow = irandom_range(0, NumberOfRows - 1);
CarStartingColumn = irandom_range(0, NumberOfColumns - 1);
CarPositionX = f_PositionInWorld(StartingX, CarStartingColumn, CellSize, true);
CarPositionY = f_PositionInWorld(StartingY, CarStartingRow, CellSize, true);
f_ResetCar(car, CarPositionX, CarPositionY, CellSize);

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
NumberOfTrafficJams = irandom_range(minJams, maxJams);

var AvailableTrafficJamSpots = ds_list_create();
ds_list_clear(ListOfTrafficJams);

//Find all available spots to put a traffic jam
for (var r = 0; r < NumberOfRows; r++)
{
    for (var c = 0; c < NumberOfColumns; c++)
    {
        if (c != CarStartingColumn || r != CarStartingRow) && 
           (c != DestinationColumn || r != DestinationRow)
        {
            ds_list_add(AvailableTrafficJamSpots, CityGrid[c, r]);
        }
    }
}

ds_list_shuffle(AvailableTrafficJamSpots);

//Create the necessary amount of traffic jams
for (var j = 0; j < NumberOfTrafficJams; j++)
{
    var CurrentJamSite = ds_list_find_value(AvailableTrafficJamSpots, j);
    var NewJam;
    
    var IsOnTopBottomBorder = CurrentJamSite.row == 0 or CurrentJamSite.row == NumberOfRows - 1;
    var IsOnLeftRightBorder = CurrentJamSite.column == 0 or CurrentJamSite.column == NumberOfColumns - 1
    var IsOnCorner = IsOnTopBottomBorder and IsOnLeftRightBorder;
    var IsOnBorder = IsOnTopBottomBorder or IsOnLeftRightBorder;
    
    NewJam = instance_create(CurrentJamSite.x, CurrentJamSite.y, o_TrafficJam);     
    ds_list_add(ListOfTrafficJams, NewJam);
    
    if IsOnBorder
    {   
        if IsOnCorner 
        {                        
            NewJam.image_index = choose(1, 2);
                
            if CurrentJamSite.row == 0 and CurrentJamSite.column == 0
            {
                NewJam.image_angle = 0;
            }
            else if CurrentJamSite.row == NumberOfRows - 1 and CurrentJamSite.column == 0
            {
                NewJam.image_angle = 90;
            }
            else if CurrentJamSite.row == 0 and NumberOfColumns - 1
            {
                NewJam.image_angle = 270;
            }
            else
            {
                NewJam.image_angle = 180;    
            }        
        }
        else
        {        
            NewJam.image_index = choose(1, 2, 4, 5);
            if CurrentJamSite.row == 0
            {            
                NewJam.image_angle = 270;
                if NewJam.image_index == 1
                {                
                    NewJam.image_angle = choose(0, 270, 180);
                }
            }
            else if CurrentJamSite.row == NumberOfRows - 1
            {                
                NewJam.image_angle = 90;
                if NewJam.image_index == 1
                {                
                    NewJam.image_angle = choose(0, 90, 180);
                }
            }
            else if CurrentJamSite.column == 0
            {
                NewJam.image_angle = 0;
                if NewJam.image_index == 1
                {                
                    NewJam.image_angle = choose(0, 90, 270);
                }
            }
            else if CurrentJamSite.column == NumberOfColumns - 1
            {
                NewJam.image_angle = 180;
                if NewJam.image_index == 1
                {                
                    NewJam.image_angle = choose(180, 90, 270);
                }
            }
        }
    }
    else
    {       
        NewJam.image_index = choose(0, 1, 2, 3, 4, 5);
        NewJam.image_angle = choose(0, 90, 180, 270);
    }
    
    NewJam.image_speed = 0;    
    NewJam.image_xscale = CellSize / sprite_get_width(CurrentJamSite.sprite_index); 
    NewJam.image_yscale = NewJam.image_xscale;            
}

ds_list_destroy(AvailableTrafficJamSpots); 


/*Selected Path*/
while f_RemoveLastTileFromPath() != -1 {}
 
/*for (var iii = 0; iii < ds_list_size(SelectedPath); iii++)
{
    f_RemoveLastTileFromPath();
}*/
ds_list_clear(SelectedPath);
f_AddTileToPath(CityGrid[CarStartingColumn, CarStartingRow]);