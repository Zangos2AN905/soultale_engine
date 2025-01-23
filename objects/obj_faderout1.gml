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
if alpha < 1
{
alpha=+0.05
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
draw_set_color(c_black)
draw_sprite_ext(spr_fade,0,view_xview[0],view_yview[0],1,1,0,c_white,alpha)
