///f_ReconstructPath(Path, PointA, PointB)

var path = argument0;
var A = argument1;
var B = argument2;

if next[A, B] < 0
{
    return path;
}

CurrentIndex = array_length_1d(path);
path[@ CurrentIndex] = A;
CurrentIndex++;

while A != B
{
    A = next[A, B];
    
    path[@ CurrentIndex] = A;
    CurrentIndex++;
}

return path;