///f_Visit(k, N, Value, Level)

var k = argument0;
var N = argument1;
var Value = argument2;
var level = argument3;

level = level + 1; 
Value[@ k] = level;
if (level == N)
{
  //AddItem();
    /*var s = "";
    for (var j = 0; j < array_length_1d(Value); j++)
    {
        s += string(Value[@ j]);
    }
    show_debug_message(":: " + s);*/
    global.total++;
}
else
{
  for (var i = 0; i < N; i++)
    if (Value[@ i] == 0)
      level = f_Visit(i, N, Value, level);
}

//level = level - 1;
Value[@ k] = 0;
return level - 1;
