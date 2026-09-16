function scrNewTextMarkupTagRotate(letter_struct){
	
	if(struct_exists(letter_struct, "r")){
		return struct_get(letter_struct, "r");
	}else{
		return 0;
	}
}