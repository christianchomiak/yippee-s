///f_HardLevelReset(CityWidth, CityHeight, NumberOfRows, NumberOfColumns, PercentageOfTrafficJams, NumberOfGoals)

CityWidth = argument0 * room_width;
CityHeight = argument1 * room_height;
NumberOfRows = argument2;
NumberOfColumns = argument3;
PercentageOfTrafficJams = argument4;
NumberOfGoals = argument5;

CellSize = min(CityWidth / NumberOfColumns, CityHeight / NumberOfRows);

SideBorderSize = (room_width - NumberOfColumns * CellSize) / 2;
TopBorderSize = (room_height - NumberOfRows * CellSize) / 2;

StartingX = SideBorderSize;
StartingY = TopBorderSize;

/*City creation*/

if ds_exists(CityGrid, ds_type_grid)
{
    for (var r = 0; r < ds_grid_height(CityGrid); r++) 
    {
        for (var c = 0; c < ds_grid_width(CityGrid); c++)
        {
            if instance_exists(CityGrid[c, r])
            {        
                with CityGrid[c, r]
                { instance_destroy(); }
            }
        }
    }    
    ds_grid_destroy(CityGrid);
}

/**/

CityGrid = ds_grid_create(NumberOfColumns, NumberOfRows);

for (var r = 0; r < NumberOfRows; r++)
{
    for (var c = 0; c < NumberOfColumns; c++)
    {
        var xx = f_PositionInWorld(StartingX, c, CellSize, true);
        var yy = f_PositionInWorld(StartingY, r, CellSize, true);
        CityGrid[c, r] = instance_create(xx, yy, o_RoadTile);
        CityGrid[c, r].image_xscale = CellSize / sprite_get_width(CityGrid[c, r].sprite_index); 
        CityGrid[c, r].image_yscale = CityGrid[c, r].image_xscale; 
        CityGrid[c, r].row = r;
        CityGrid[c, r].column = c;
        
        CityGrid[c, r].IsSelected = false;
        
        CityGrid[c, r].image_speed = 0;
        var IsOnTopBottomBorder = r == 0 or r == NumberOfRows - 1;
        var IsOnLeftRightBorder = c == 0 or c == NumberOfColumns - 1
        var IsOnCorner = IsOnTopBottomBorder and IsOnLeftRightBorder;
        var IsOnBorder = IsOnTopBottomBorder or IsOnLeftRightBorder;
               
        if IsOnBorder
        {   
            if IsOnCorner 
            {            
                CityGrid[c, r].image_index = 2;
                
                if r == 0 and c == 0
                {
                    CityGrid[c, r].image_angle = 0;
                }
                else if r == NumberOfRows - 1 and c == 0
                {
                    CityGrid[c, r].image_angle = 90;
                }
                else if r == 0 and c == NumberOfColumns -1 //c - 1
                {
                    CityGrid[c, r].image_angle = 270;
                }
                else
                {
                    CityGrid[c, r].image_angle = 180;            
                }
            }
            else if r == 0
            {                
                CityGrid[c, r].image_index = 4;
                CityGrid[c, r].image_angle = 270;
            }
            else if r == NumberOfRows - 1
            {                
                CityGrid[c, r].image_index = 4;
                CityGrid[c, r].image_angle = 90;
            }
            else if c == 0
            {                
                CityGrid[c, r].image_index = 4;
                CityGrid[c, r].image_angle = 0;
            }
            else if c == NumberOfColumns - 1
            {                
                CityGrid[c, r].image_index = 4;
                CityGrid[c, r].image_angle = 180;
            }
        }
        else
        {            
            CityGrid[c, r].image_index = 0;
        }
    }
}

/*Buildings*/
for (var iii = 0; iii < ds_list_size(ListOfBuildings); iii++)
{
    var tempBuilding = ds_list_find_value(ListOfBuildings, iii);
    with tempBuilding
    {
        instance_destroy();
    }
}
ds_list_clear(ListOfBuildings);

for (var r = 1; r < NumberOfRows; r++)
{
    for (var c = 1; c < NumberOfColumns; c++)
    {
        var BuildingX = f_PositionInWorld(StartingX, c, CellSize, false);
        var BuildingY = f_PositionInWorld(StartingY, r + 0.25, CellSize, false);
        var NewBuilding = instance_create(BuildingX, BuildingY, o_Building); 
        ds_list_add(ListOfBuildings, NewBuilding);
    }
}

global.RandomTreeTypeOffset = irandom_range(0, 2);

//Car, destination and traffic jams
f_SoftLevelReset(PercentageOfTrafficJams, NumberOfGoals);
