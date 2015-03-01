///f_LoadNewLevel()

with global.CityManager
{
    global.CityManager.BestTime = 0;
    global.CityManager.SelectedPathCost = 0;
    global.CityManager.collectedPois = 0;
    global.CityManager.totalPois = 0;
    
    
    switch (global.CurrentLevel)
    {
        case 0:
            f_HardLevelReset(0.75, 0.7, 2, 2, 0, 1, 0);
            break;
        case 1:
            f_HardLevelReset(0.75, 0.75, 2, 3, 0, 1, 0);
            break;
        case 2:
            f_HardLevelReset(0.75, 0.75, 2, 3, 0, 2, 0);
            break;
        case 3:
            f_HardLevelReset(0.75, 0.75, 3, 3, 0, 2, 1);
            break;
        case 4:
            //f_HardLevelReset(0.75, 0.75, 3, 3, 0.25, 1, 0);            
            f_SoftLevelReset(0.25, 1, 0);
            break;
        case 5:
            //f_HardLevelReset(0.75, 0.75, 3, 3, 0.5, 1, 0);
            f_SoftLevelReset(0.5, 1, 0);
            break;
        case 6:
            //f_HardLevelReset(0.75, 0.75, 3, 3, 0.5, 1, 0);
            f_SoftLevelReset(0.5, 1, 0);
            break;
        case 7:
            f_HardLevelReset(0.75, 0.75, 3, 4, 0.5, 3, 0);
            break;
        case 8:
            //f_HardLevelReset(0.75, 0.75, 3, 4, 0.5, 3, 0);
            f_SoftLevelReset(0.5, 3, 0);
            break;
        case 9:
            //f_HardLevelReset(0.75, 0.75, 3, 4, 0.5, 3, 0);
            f_SoftLevelReset(0.5, 3, 0);
            break;
        case 10:
            f_HardLevelReset(0.75, 0.75, 3, 5, 0.75, 3, 0);
            break;
        case 11:
            //f_HardLevelReset(0.75, 0.75, 3, 3, 0.5, 1, 0);
            f_SoftLevelReset(0.75, 3, 1);
            break;
        case 12:
            //f_HardLevelReset(0.75, 0.75, 3, 4, 0.5, 3, 0);
            f_SoftLevelReset(0.75, 3, 2);
            break;
        case 13:
            f_HardLevelReset(0.75, 0.75, 4, 4, 0.25, 2, 2);
            break;
        case 14:
            //f_HardLevelReset(0.75, 0.75, 3, 4, 0.5, 3, 0);
            f_SoftLevelReset(0.25, 3, 2);
            break;
        case 15:
            f_SoftLevelReset(0.5, 3, 0);
            break;
        case 16:
            f_SoftLevelReset(0.75, 4, 1);
            break;
        case 17:
            f_HardLevelReset(0.75, 0.75, 5, 5, 0.25, 2, 2);
            break;
        case 18:
            f_SoftLevelReset(0.5, 4, 1);
            break;
        case 19:
            f_SoftLevelReset(0.75, 3, 3);
            break;
        default:
            f_HardLevelReset(0.75, 0.75, irandom_range(minNumRow, maxNumRow), 
                                     irandom_range(minNumCol, maxNumCol), 
                                     random_range(MinTraf, MaxTraf), 
                                     irandom_range(minNumGoals, maxNumGoals), 
                                     irandom_range(minNumSecGoals, maxNumSecGoals)
                         );
            break;
    }
    
    global.CurrentLevel++;
}
