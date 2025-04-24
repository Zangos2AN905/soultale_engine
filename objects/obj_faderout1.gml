#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha >= 0
{
alpha+=0.25
}

if alpha = 1
{
room_goto(global.whatnextroom);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(alpha); // Set transparency
draw_set_color(c_black)
draw_rectangle(0,0,room_width,room_height,false)
