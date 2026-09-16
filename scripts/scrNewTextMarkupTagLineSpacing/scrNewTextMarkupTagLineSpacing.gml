function scrNewTextMarkupTagLineSpacing(letter_struct,temp_draw_struct,letter_array_frame){

	var line_spacing;
	
	//Get line spacing pixel
	if(!struct_exists(letter_struct, "j")){
		line_spacing = 25;
	}else{
		line_spacing = int64(struct_get(letter_struct, "j"));
	}
	
	//Update start_x and x
	if(array_length(letter_array_frame) != 0){
		if(struct_get(temp_draw_struct, "line_index") != struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "line_index")){
			struct_set(temp_draw_struct, "start_y", struct_get(temp_draw_struct, "start_y") + line_spacing);
			struct_set(temp_draw_struct, "y", struct_get(temp_draw_struct, "y") + line_spacing);
		}
	}
}