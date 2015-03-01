///Window setup

window_set_fullscreen(false);

//How big is the screen?
//screen_width = display_get_width();
global.screen_height = display_get_height();

if global.screen_height <= 768
{
    global.screen_width = 800;
    global.screen_height = 600;
}
else
{
    global.screen_width = 1024;
    global.screen_height = 768;
}



//Set size of window - not useful when on fullscreen
window_set_size(global.screen_width, global.screen_height);

//How much of the room do we want on-screen
view_wview = global.screen_width; //room_width;
view_hview = global.screen_height; //room_height;

//How much of the screen do we want to take on?
view_wport = global.screen_width;  
view_hport = global.screen_height;

surface_resize(application_surface, global.screen_width, global.screen_height);
