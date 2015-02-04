///f_DrawGrid(x1,y1,x2,y2,size,xoffset,yoffset,color,alpha)

//http://gmc.yoyogames.com/index.php?showtopic=421757

var x1, y1, x2, y2, size, xoff, yoff, col, alp, ix, iy;

x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
size = argument4
xoff = argument5
yoff = argument6
col = argument7
alp = argument8


draw_primitive_begin(pr_linelist); //not sure what the arg is called... its the one where it connects the last 2 vertices.
for(ix=x1; ix<x2; ix+=size) //draws vertical lines
{
draw_vertex_color(ix,y1,col,alp);
draw_vertex_color(ix,y2,col,alp);
}
for(iy=y1; iy<y2; iy+=size) //draws horizontal lines
{
draw_vertex_color(x1,iy,col,alp);
draw_vertex_color(x2,iy,col,alp);
}
draw_primitive_end();
