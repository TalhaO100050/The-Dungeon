function scrNewTextMarkupTagStartY(letter_array_frame,letter_struct,temp_draw_struct){
	
	//Find the L lenght for new line
	static font_table_lenght = {
		"default_font":sL
	
	};
	
	//First letter
	if(array_length(letter_array_frame) == 0){
		return [struct_get(letter_struct,"y_pos"), 0, 0];
	}
	
	var line_index = struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "line_index");
	
	//Eğer n varsa
	if(struct_exists(letter_struct,"n")){
		struct_set(temp_draw_struct,"start_x",struct_get(letter_struct,"x_pos"));
		struct_set(temp_draw_struct,"x",struct_get(letter_struct,"x_pos"));
		line_index ++;
	}
	
	if(struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "line_index") == line_index){
		return [struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "start_y"), line_index, struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "letter_index") + 1];
	}else{
		return [struct_get(struct_get(struct_get(letter_array_frame[0], "letter_draw"), "draw_1"), "start_y") + sprite_get_height(struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "sprite")), line_index, 0];
	}
}