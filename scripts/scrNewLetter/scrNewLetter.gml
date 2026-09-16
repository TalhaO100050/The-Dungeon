function scrNewLetter(letter, x_pos, y_pos, options = {}){
	
	//Set options
	var scale_x = scrOptions(options,"scale_x",1);
	var scale_y = scrOptions(options,"scale_y",1);
	var alpha = scrOptions(options,"alpha",1);
	var rotation = scrOptions(options,"rotation",0);
	var letter_index = scrOptions(options,"letter_index",0)
	var color = scrOptions(options,"color",c_white);
	
	//Draw the letter
	draw_sprite_ext(letter, letter_index, x_pos, y_pos, scale_x, scale_y, rotation, color, alpha);
}