//Keyboard checks
var key_pressed_up = keyboard_check_pressed(vk_up);
var key_pressed_down = keyboard_check_pressed(vk_down);
var key_pressed_right = keyboard_check_pressed(vk_right);
var key_pressed_left = keyboard_check_pressed(vk_left);

var key_horizontal = key_pressed_right - key_pressed_left;
var key_vertical = key_pressed_down - key_pressed_up;

//Turning the player sprite
if (key_horizontal != 0 or key_vertical != 0){image_angle = (-key_horizontal * 90 + abs(key_horizontal) * 90) - key_vertical * 90} 

//Moving & Collisions
if(!place_meeting(x + key_horizontal * 128, y + key_vertical * 128, oTest_level)){x += key_horizontal * 128; y += key_vertical * 128;}

//Activating the looked object
var selected_objects_list = ds_list_create();
var selected_objects_count = instance_place_list(x + lengthdir_x(128, image_angle), y + lengthdir_y(128, image_angle),all, selected_objects_list, false);
for(i = 0; i < selected_objects_count; i++){	
	with(selected_objects_list[|i]){variable_instance_exists(self,"selected"){selected = 1;}}
}