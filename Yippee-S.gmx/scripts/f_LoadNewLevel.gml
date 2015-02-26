///f_LoadNewLevel()


switch (global.CurrentLevel)
{
    case 0:
        f_HardLevelReset(0.75, 0.75, 2, 2, 0, 1, 0);
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
        f_HardLevelReset(0.75, 0.75, 3, 3, 0.25, 1, 0);
        break;
    case 5:
        f_HardLevelReset(0.75, 0.75, 3, 3, 0.5, 1, 0);
        break;
    case 6:
        f_HardLevelReset(0.75, 0.75, 3, 3, 0.75, 1, 0);
        break;
    case 7:
        f_HardLevelReset(0.75, 0.75, 3, 4, 0.75, 3, 0);
        break;
    case 10:
        f_HardLevelReset(0.75, 0.75, 3, 3, 0, 3, 0);
        break;
    /*case 4:
        break;
    case 5:
        break;
    case 6:
        break;
    case 7:
        break;*/
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
