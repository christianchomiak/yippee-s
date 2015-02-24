///f_SoftLevelReset(PercentageOfTrafficJams, NumberOfGoals)

PercentageOfTrafficJams = argument0;
NumberOfGoals = argument1;

NumberOfGoals = min(NumberOfGoals, 8); //min(ds_list_size(FreeSpots) * 0.1));

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
for (var iii = 0; iii < ds_list_size(ListOfGoals); iii++)
{
    var tempGoal = ds_list_find_value(ListOfGoals, iii);
    with tempGoal
    {
        instance_destroy();
    }
}
ds_list_clear(ListOfGoals);



//List of places where goals and traffic jams could be
var FreeSpots = ds_list_create();


//Find all available spots to put a goal
for (var r = 0; r < NumberOfRows; r++)
{
    for (var c = 0; c < NumberOfColumns; c++)
    {
        CityGrid[c, r].CostToNorth = 1; //0.5;
        CityGrid[c, r].CostToSouth = 1; //0.5;
        CityGrid[c, r].CostToEast = 1; //0.5;
        CityGrid[c, r].CostToWest = 1; //0.5;
    
        if (c != CarStartingColumn || r != CarStartingRow)
        {
            ds_list_add(FreeSpots, CityGrid[c, r]);
        }
    }
}
ds_list_shuffle(FreeSpots);

//Create goals
var TotalGoalsCreated = 0;
while TotalGoalsCreated < NumberOfGoals
{
    var CurrentGoalPosition = ds_list_find_value(FreeSpots, 0);

    var DestinationPositionX = f_PositionInWorld(StartingX, CurrentGoalPosition.column, CellSize, true);
    var DestinationPositionY = f_PositionInWorld(StartingY, CurrentGoalPosition.row, CellSize, true);
    
    var marker = instance_create(DestinationPositionX, DestinationPositionY, o_Marker);
    marker.image_xscale = 0.125 * (CellSize / sprite_get_width(marker.sprite_index)); 
    marker.image_yscale = marker.image_xscale;       
    marker.Velocity = -CellSize * 0.125;
    marker.MaxJumpDistance = marker.y - (CellSize * 0.125);
    marker.BaseJumpDistance = marker.y;
    marker.column = CurrentGoalPosition.column;
    marker.row = CurrentGoalPosition.row;
    
    ds_list_add(ListOfGoals, marker);
    ds_list_delete(FreeSpots, 0);
    TotalGoalsCreated++;
}
ds_list_shuffle(FreeSpots); //AvailableTrafficJamSpots);


/*Traffic Jams*/

//Delete any previous objects
for (var iii = 0; iii < ds_list_size(ListOfTrafficJams); iii++)
{
    var tempJam = ds_list_find_value(ListOfTrafficJams, iii);
    with tempJam
    {
        instance_destroy();
    }
}
ds_list_clear(ListOfTrafficJams);

NumberOfTrafficJams = floor(PercentageOfTrafficJams * ds_list_size(FreeSpots)); //irandom_range(minJams, maxJams);

/*var s = "Free Spots = " + string(ds_list_size(FreeSpots));
s += " :: Jams = " + string(NumberOfTrafficJams);
show_message(s);*/

//Create the necessary amount of traffic jams
for (var j = 0; j < NumberOfTrafficJams; j++)
{
    var CurrentJamSite = ds_list_find_value(FreeSpots, j);
    var NewJam;
    
    var IsOnTopBottomBorder = CurrentJamSite.row == 0 or CurrentJamSite.row == NumberOfRows - 1;
    var IsOnLeftRightBorder = CurrentJamSite.column == 0 or CurrentJamSite.column == NumberOfColumns - 1
    var IsOnCorner = IsOnTopBottomBorder and IsOnLeftRightBorder;
    var IsOnBorder = IsOnTopBottomBorder or IsOnLeftRightBorder;
    
    NewJam = instance_create(CurrentJamSite.x, CurrentJamSite.y, o_TrafficJam);   
    CurrentJamSite.TrafficJam = NewJam.id;
    ds_list_add(ListOfTrafficJams, NewJam);
           
    if IsOnBorder
    {   
        if IsOnCorner 
        {                        
            NewJam.image_index = choose(1, 2);
                
            if CurrentJamSite.row == 0 and CurrentJamSite.column == 0 //Top-Left
            {
                NewJam.image_angle = 0;
                
            }
            else if CurrentJamSite.row == NumberOfRows - 1 and CurrentJamSite.column == 0 //Bottom-Left
            {
                NewJam.image_angle = 90;
            }
            else if CurrentJamSite.row == 0 and NumberOfColumns - 1 //Top-Right
            {
                NewJam.image_angle = 270;
            }
            else //Bottom-Right
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
    
    f_SetTrafficCost(CurrentJamSite);
    
    NewJam.image_speed = 0;    
    NewJam.image_xscale = CellSize / sprite_get_width(CurrentJamSite.sprite_index); 
    NewJam.image_yscale = NewJam.image_xscale;            
}

ds_list_destroy(FreeSpots);
//ds_list_destroy(AvailableTrafficJamSpots); 


/*Selected Path*/
while f_RemoveLastTileFromPath() != -1 {}
 

ds_list_clear(SelectedPath);
f_AddTileToPath(CityGrid[CarStartingColumn, CarStartingRow]);
SelectedPathCost = 0;

StartingTile = ds_list_find_value(SelectedPath, 0);
BestTime = f_GetPathCost(); //, ds_list_find_value(ListOfGoals, 0));
show_debug_message("Total: " + string(global.total));