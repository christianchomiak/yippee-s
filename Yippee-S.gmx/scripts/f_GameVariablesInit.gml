randomize();

global.StreetDepth = 0;
global.TrafficDepth = -1;
global.BuildingDepth = -2;
global.GPSCarDepth = -5;
global.MarkerDepth = -100;
global.ResultsDepth = -150;
global.CountdownDepth = -150;
global.RandomTreeTypeOffset = irandom_range(0, 2);

draw_set_font(fnt_Results);
draw_set_colour(c_white);
