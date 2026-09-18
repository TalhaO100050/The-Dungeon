function scrNewTextMarkupTagYOffset(temp_draw_struct,letter_struct){
	
	if(struct_exists(letter_struct,"yo")){
		struct_set(temp_draw_struct, "y", (real(struct_get(letter_struct,"yo")) + struct_get(temp_draw_struct,"y")))
	}
}