///Window setup

window_set_fullscreen(false);


//How big is the screen?
//screen_width = display_get_width();
screen_height = display_get_height();

if screen_height <= 768
{
    screen_width = 800;
    screen_height = 600;
}
else
{
    screen_width = 1024;
    screen_height = 768;
}



//Set size of window - not useful when on fullscreen
window_set_size(screen_width, screen_height);

//How much of the room do we want on-screen
view_wview = room_width;
view_hview = room_height;

//How much of the screen do we want to take on?
view_wport = screen_width;  
view_hport = screen_height;

surface_resize(application_surface, screen_width, screen_height);
