function scrNewTextMarkupTagXOffset(temp_draw_struct,letter_struct){
	
	if(struct_exists(letter_struct,"xo")){
		struct_set(temp_draw_struct, "x", (real(struct_get(letter_struct,"xo")) + struct_get(temp_draw_struct,"x")))
	}

}