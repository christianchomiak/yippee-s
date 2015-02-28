///f_ButtonPressed(Text, PositionX, PositionY, Margin)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(fnt_Menu);

var ButtonText = argument0;
var PositionX = argument1;
var PositionY = argument2;
var Margin = argument3;

var Result = false

//Find the corners of our box
var BoxTop = PositionY
var TextTop = BoxTop + (Margin * 2.5)
var BoxBottom = BoxTop + Margin + string_height(ButtonText) + Margin
var HalfTextWidth = string_width(ButtonText) / 2
var BoxLeft = PositionX - HalfTextWidth - (Margin * 2)
var BoxRight = PositionX + HalfTextWidth + (Margin * 2)

draw_set_colour(make_colour_hsv(102,120,107))

//See if the cursor is hovering over it
if device_mouse_x_to_gui(0) > BoxLeft and device_mouse_x_to_gui(0) < BoxRight and device_mouse_y_to_gui(0) > BoxTop and device_mouse_y_to_gui(0) < BoxBottom {
    draw_set_alpha(1)
    if mouse_check_button_pressed(mb_left) 
    {
        var Result = true;
        audio_play_sound(x_Coin2, 1, false);
        audio_sound_gain(x_Coin2, 0.25, 0);
    }
} else {
    draw_set_alpha(0.75)
}


draw_rectangle(BoxLeft,BoxTop,BoxRight,BoxBottom,false)
draw_set_alpha(1)

draw_set_colour(c_white)

CurrentY = TextTop
f_DrawTextAndUpdateCurrentY(ButtonText, PositionX, CurrentY);

//CurrentY = CurrentY + (Margin * 2)


return Result
