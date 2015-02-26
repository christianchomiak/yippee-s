///f_ReachMarker(MarkerID)

var marker = argument0;

marker.image_blend = c_dkgray;//c_blue;
marker.Reached = true;
marker.y = marker.BaseJumpDistance;

audio_play_sound(x_Coin3, 1, false);
