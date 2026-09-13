function scrNewTextCalculateLetter(text_struct){
	
	var letter_array = struct_get(text_struct,"letterList");
	struct_set(text_struct,"letterListFrame",[])
	var letter_array_frame = struct_get(text_struct,"letterListFrame");
	
	//Loop for all the letters
	for (i = 0; i < array_length(letter_array); i++){
		var letter_struct = letter_array[i]
		var letter_frame_struct = {"delay":0};
		var temp_struct = {};
		var temp_draw_struct = {};
		
		////Start adding letter_struct -> letter_frame_struct
		
		//----Add delay----
		
		//----Add sound----
		
		//----Add script----
		
		//----Add layer first draw----
		
		struct_set(letter_frame_struct,"layer_first_draw",{});
		
		//----Add effects draw----
		
		struct_set(letter_frame_struct,"effects_draw",{});
		
		//----Add letter draw----
		temp_struct = {};
		temp_draw_struct = {};
	 	struct_set(temp_draw_struct,"letter",struct_get(letter_struct,"letter"))
		struct_set(temp_draw_struct,"sprite",json_parse(json_stringify(scrNewTextMarkupTagFont(letter_struct))))
		struct_set(temp_draw_struct,"start_x",json_parse(json_stringify(scrNewTextMarkupTagStartX(letter_array_frame,letter_struct))))
		//struct_set(temp_draw_struct,"start_y",json_parse(json_stringify(scrNewTextMarkupTagStartY(letter_array_frame,letter_struct))))
		struct_set(temp_draw_struct,"x",json_parse(json_stringify(scrNewTextMarkupTagStartX(letter_array_frame,letter_struct))))
		//struct_set(temp_draw_struct,"y",json_parse(json_stringify(scrNewTextMarkupTagStartY(letter_array_frame,letter_struct))))
		
		//Save draw_x to temp_stuct from temp_draw_struct
		struct_set(temp_struct,"draw_1",json_parse(json_stringify(temp_draw_struct)));
		
		//Save temp struct to the letter frame struct
		struct_set(letter_frame_struct,"letter_draw",json_parse(json_stringify(temp_struct)));
		
		//----Add layer last draw----
		
		
		struct_set(letter_frame_struct,"layer_last_draw",{});
		
		//----Save struct----
		array_push(letter_array_frame,letter_frame_struct);
	}
}