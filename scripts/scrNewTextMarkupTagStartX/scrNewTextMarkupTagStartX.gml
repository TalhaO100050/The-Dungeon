function scrNewTextMarkupTagStartX(letter_array_frame,letter_struct){
	
	//First letter
	if(array_length(letter_array_frame) == 0){
		return struct_get(letter_struct,"x_pos");
	}
	
	//Not the first letter
	return struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "start_x") + sprite_get_width(struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "sprite"));
}