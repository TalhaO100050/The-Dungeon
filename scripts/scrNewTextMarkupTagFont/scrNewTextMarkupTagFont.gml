function scrNewTextMarkupTagFont(letter_struct){
	
	if(struct_exists(letter_struct,"f")){
		//Font varsa
		return scrNewTextMarkupTagFonts(struct_get(letter_struct,"f"), struct_get(letter_struct,"letter"));
	}else{
		//Font yoksa deffault font kullan
		return scrNewTextMarkupTagFonts("default_font",struct_get(letter_struct,"letter"));
	}
}