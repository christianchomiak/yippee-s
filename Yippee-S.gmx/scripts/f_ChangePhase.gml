///f_ChangePhase(newPhase)

var p = argument0;

global.CityManager.currentPhase = p;

if p == phase.selection
{             
   draw_set_font(fnt_Results);
   draw_set_colour(c_white);
   global.CityManager.UsingGPSView = false;
}
else if p == phase.movement
{
}
else if p == phase.results
{
    draw_set_font(fnt_Results);
    global.CityManager.resultsobject = instance_create(room_width * 0.5, room_height * 0.5, o_Results);          
}
else
{
   f_LoadNewLevel();

   if instance_exists(global.CityManager.resultsobject)
   {
        with global.CityManager.resultsobject
        {
            instance_destroy();
        }
   }

   global.CityManager.UsingGPSView = true;
   
   draw_set_font(fnt_Countdown);
   draw_set_colour(c_white);
   instance_create(0, 0, o_Countdown);
}
