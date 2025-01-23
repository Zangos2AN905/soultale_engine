#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PLAYER OBJECT CREATE EVENT

//Maximum speed
spd = 4;
runspd = 6;

//Current movement speed
hspd = 0;
vspd = 0;

//Initialize basic properties
image_index = 0;
image_speed = 0;

/*

Directions for top-down spritework.

0 = down
1 = left
2 = up
3 = right

*/

dir = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///PLAYER OBJECT STEP EVENT

//Get input (keyboard/controller)
get_input();

//Execute the state (in the basic case, this calls the move_state script)
script_execute(move_state);
#define Mouse_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = mouse_x
y = mouse_y
