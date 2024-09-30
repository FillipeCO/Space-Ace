/// @description Insert description here
// You can write your code in this editor
//draw_set_halign(1);
draw_set_font(fnt_points);
var _middle_screen = room_width / 2;

draw_text(x, y, "Points: " + string(global.points));

draw_text_color(_middle_screen + 50, y, "Highscore: " + string(global.highscore), c_purple, c_purple, c_purple, c_purple, 1);

draw_set_font(-1);
//draw_set_halign(-1);