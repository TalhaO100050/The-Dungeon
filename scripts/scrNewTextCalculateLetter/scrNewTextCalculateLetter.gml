function scrNewTextCalculateLetter(text_struct){
	
	var letter_array = struct_get(text_struct,"letterList");
	struct_set(text_struct,"letterListFrame",[])
	var letter_array_frame = struct_get(text_struct,"letterListFrame");
	
	//Loop for all the letters
	for (i = 0; i < array_length(letter_array); i++){
		var letter_struct = letter_array[i]
		var letter_frame_struct = {};
		
		////Start adding letter_struct -> letter_frame_struct
		
		//letter
	 	struct_set(letter_frame_struct,"letter",struct_get(letter_struct,"letter"));
		
		
		
		//Save struct
		array_push(letter_array_frame,letter_frame_struct);
	}
}