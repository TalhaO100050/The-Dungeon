function sNewLetter(letter, x_pos, y_pos, options = {}){
	
	//Set options
	var fix_to_cam = sOptions(options,"fix_to_cam",true);
	var scale = sOptions(options,"scale",1);
	var scalex = sOptions(options,"scalex",1);
	var scaley = sOptions(options,"scaley",1);
	var alpha = sOptions(options,"alpha",1);
	var rotation = sOptions(options,"rotation",0);
	var letter_index = sOptions(options,"letter_index",0)
	var color = sOptions(options,"color",c_white);
	
	
	//Calculate the placement
	if (fix_to_cam){
		var last_x_pos = camera_get_view_x(camera_get_active()) + x_pos;
		var last_y_pos = camera_get_view_y(camera_get_active()) + y_pos;
	}else{
		var last_x_pos = x_pos;
		var last_y_pos = y_pos;
	}
	
	//Draw the letter
	draw_sprite_ext(struct_get(letter_table,letter), letter_index, last_x_pos, last_y_pos, scale*scalex, scale * scaley, rotation, color, alpha);
}