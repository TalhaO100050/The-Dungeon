function scrNewTextMarkupTagScale(letter_struct){
	
	if(struct_exists(letter_struct, "s")){
		var scale_x = 1;
		var scale_y = 1;
		
		if(struct_exists(struct_get(letter_struct, "s"), "scale")){
			scale_x *= int64(struct_get(struct_get(letter_struct, "s"), "scale"))
			scale_y *= int64(struct_get(struct_get(letter_struct, "s"), "scale"))
		}
		
		if(struct_exists(struct_get(letter_struct, "s"), "scale_x")){
			scale_x *= int64(struct_get(struct_get(letter_struct, "s"), "scale_x"))
		}
		
		if(struct_exists(struct_get(letter_struct, "s"), "scale_y")){
			scale_y *= int64(struct_get(struct_get(letter_struct, "s"), "scale_y"))
		}
		
		return [real(scale_x), real(scale_y)];
	}
	
	return [1,1];
}