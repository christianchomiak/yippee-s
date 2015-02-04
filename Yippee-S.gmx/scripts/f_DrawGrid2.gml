///f_DrawGrid2(snap_size, starting_x, starting_y, snap_amount)

//http://www.gamemakergames.com/forum/index.php?topic=21809.0

//Argument0: Snap size.
//Argument1: Starting x position.
//Argument2: Starting y position.
//Argument3: Snap amount.

xi = argument1;
xy = argument2;
repeat(argument3)
{
    draw_line(xi,argument2,xi,argument3*argument0+argument2);
    draw_line(argument1,xy,argument3*argument0+argument1,xy);
    xi+=argument0;
    xy+=argument0;
}
    draw_line(xi,argument2,xi,argument3*argument0+argument2);
    draw_line(argument1,xy,argument3*argument0+argument1,xy);
