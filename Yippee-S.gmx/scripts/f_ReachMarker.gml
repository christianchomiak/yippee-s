///f_ReachMarker(MarkerID)

var marker = argument0;

marker.image_blend = c_dkgray;//c_blue;
marker.Reached = true;
marker.y = marker.BaseJumpDistance;

if marker.isOptional
   global.CityManager.collectedPois += 1;

audio_play_sound(x_Coin3, 1, false);
audio_sound_gain(x_Coin3, 0.25, 0);
