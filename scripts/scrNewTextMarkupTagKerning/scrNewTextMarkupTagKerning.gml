function scrNewTextMarkupTagKerning(letter_struct,temp_draw_struct){

	var kerning;
	
	//Get kerning pixel
	if(!struct_exists(letter_struct, "k")){
		kerning = 5;
	}else{
		kerning = int64(struct_get(letter_struct, "k"));
	}
	
	//Update start_x and x
	if(struct_get(temp_draw_struct, "letter_index") != 0){
		struct_set(temp_draw_struct, "start_x", struct_get(temp_draw_struct, "start_x") + kerning);
		struct_set(temp_draw_struct, "x", struct_get(temp_draw_struct, "x") + kerning);
	}
}