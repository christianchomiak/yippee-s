///f_PositionInWorld(basePosition, indexInGrid, sizeOfTile, inInnerGrid)
var _basePosition, _indexInGrid, _sizeOfTile, _inInnerGrid;

_basePosition = argument0;
_indexInGrid = argument1;
_sizeOfTile = argument2;
_inInnerGrid = argument3;

var newPosition = _basePosition + _indexInGrid * _sizeOfTile;

if _inInnerGrid
{
    newPosition += _sizeOfTile / 2;
}

return newPosition;