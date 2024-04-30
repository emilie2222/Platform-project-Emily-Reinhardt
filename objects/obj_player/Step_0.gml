/// @desc Core Player Logic

//Get player imputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate Movement
var _move = key_right - key_left;

hsp= _move * walksp;

vsp = vsp + grv;

//Horizontal collision.
if(place_meeting(x+hsp,y,obj_InvisibleWall))
{
	while (!place_meeting(x+sign(hsp),y,obj_InvisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Verticle  collision.
if(place_meeting(x,y + vsp,obj_InvisibleWall))
{
	while (!place_meeting(x,y +sign(vsp),obj_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;