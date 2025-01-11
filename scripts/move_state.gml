///move_state

//Set animation speed for movement

image_speed = 0.2;

//Set default speed if there is no input

hspd = 0;
vspd = 0;

//Set speed to the direction you are pressing as long as there isn't a wall there
//Left and up take precedence

if(right && !place_meeting(x+1,y,obj_soildsmall)) hspd = spd;

if(left && !place_meeting(x-1,y,obj_soildsmall)) hspd = -spd;

if(down && !place_meeting(x,y+1,obj_soildsmall)) vspd = spd;

if(up && !place_meeting(x,y-1,obj_soildsmall)) vspd = -spd;

//Prevent stuttering if against a wall pressing opposite directional buttons

if(left && right && place_meeting(x-1,y,obj_soildsmall))
{
hspd = 0;
vspd = 0;
}

//if(left && right && place_meeting(x-1,y,obj_soildsmall)) hspd = 0;

//if(up && down && place_meeting(x,y-1,obj_soildsmall)) vspd = 0;

//Set the sprite to the appropriate direction

if(hspd < 0) sprite_index = spr_testleft;

if(hspd > 0) sprite_index = spr_testright;

if(vspd < 0) sprite_index = spr_testup;

if(vspd > 0) sprite_index = spr_testdown;

//Sprite direction correction in special cases of multiple button press combinations

if((right && down && left && !up) || (right && down && !left && !up && dir == 1) || (left && down && !right && !up && dir == 3)) dir = 0;

if((down && left && up && !right) || (down && left && !up && !right && dir == 2) || (up && left && !right && !down && dir == 0)) dir = 1;

if((left && up && right && !down) || (left && up && !right && !down && dir == 3) || (right && up && !down && !left && dir == 1)) dir = 2;

if((up && right && down && !left) || (up && right && !down && !left && dir == 0) || (down && right && !up && !left && dir == 2)) dir = 3;

//Maintain sprite momentum by checking the previous sprite direction

if(hspd < 0 && dir == 1 && left) sprite_index = spr_testleft;

if(hspd > 0 && dir == 3 && right) sprite_index = spr_testright;

if(vspd < 0 && dir = 2 && up) sprite_index = spr_testup;

if(vspd > 0 && dir = 0 && down) sprite_index = spr_testdown;

//Special checks when you're up against a wall trying to move against or along it

if(sprite_index == spr_testleft)
{
   if(place_meeting(x-1,y,obj_soildsmall))
   {
       if(vspd > 0 && !place_meeting(x,y+1,obj_soildsmall))
       {
           sprite_index = spr_testdown;
           dir = 3;
       }
       else if(vspd < 0 && !place_meeting(x,y-1,obj_soildsmall))
       {
           sprite_index = spr_testup;
           dir = 1;
       }
       else
       {
           hspd = 0;
           vspd = 0;
       }
   }
   else dir = 1;
}

if(sprite_index == spr_testright)
{
   if(place_meeting(x+1,y,obj_soildsmall))
   {
       if(vspd > 0 && !place_meeting(x,y+1,obj_soildsmall))
       {
           sprite_index = spr_testdown;
           dir = 3;
       }
       else if(vspd < 0 && !place_meeting(x,y-1,obj_soildsmall))
       {
           sprite_index = spr_testup;
           dir = 1;
       }
       else
       {
           hspd = 0;
           vspd = 0;
       }
   }
   else dir = 3;
}

if(sprite_index == spr_testup)
{
   if(place_meeting(x,y-1,obj_soildsmall))
   {
       if(hspd > 0 && !place_meeting(x+1,y,obj_soildsmall))
       {
           sprite_index = spr_testright;
           dir = 3;
       }
       else if(hspd < 0 && !place_meeting(x-1,y,obj_soildsmall))
       {
           sprite_index = spr_testleft;
           dir = 1;
       }
       else
       {
           hspd = 0;
           vspd = 0;
       }
   }
   else dir = 2;
}

if(sprite_index == spr_testdown)
{
   if(place_meeting(x,y+1,obj_soildsmall))
   {
       if(hspd > 0 && !place_meeting(x+1,y,obj_soildsmall))
       {
           sprite_index = spr_testright;
           dir = 3;
       }
       else if(hspd < 0 && !place_meeting(x-1,y,obj_soildsmall))
       {
           sprite_index = spr_testleft;
           dir = 1;
       }
       else
       {
           hspd = 0;
           vspd = 0;
       }
   }
   else dir = 0;
}

//If there is no input, default to the idle state

if(hspd == 0 && vspd == 0)
{
   image_index = 0;
   image_speed = 0;
}

//Actually move the player

move(obj_soildsmall);
