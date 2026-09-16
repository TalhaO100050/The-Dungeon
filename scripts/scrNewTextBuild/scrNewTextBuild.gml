function scrNewTextBuild(text_struct){
	/*
	Some markup tag functions first needs others the run.
	scrNewTextMarkupTagFont -> letter
	scrNewTextMarkupTagStartX -> scrNewTextMarkupTagFont, scrNewTextMarkupTagScale
	scrNewTextMarkupTagStartY -> scrNewTextMarkupTagFont, scrNewTextMarkupTagStartX			update
	scrNewTextMarkupTagKerning -> scrNewTextMarkupTagStartX
	scrNewTextMarkupTagLineSpacing -> scrNewTextMarkupTagStartY
	*/
	
	var letter_array = struct_get(text_struct,"letterList");
	struct_set(text_struct,"letterListFrame",[])
	var letter_array_frame = struct_get(text_struct,"letterListFrame");
	
	//Loop for all the letters
	for (var i = 0; i < array_length(letter_array); i++){
		var letter_struct = letter_array[i]
		var letter_frame_struct = {"delay":0};
		var temp_struct = {};
		var temp_draw_struct = {};
		var value;
		
		////Start adding letter_struct -> letter_frame_struct
		
		
		//-----------------
		//----Add delay----
		//-----------------
		
		
		//-----------------
		//----Add sound----
		//-----------------
		
		
		//------------------
		//----Add script----
		//------------------
		
		
		//----------------------------
		//----Add layer first draw----
		//----------------------------
		
		
		//----Save temp struct to the letter frame struct----
		struct_set(letter_frame_struct,"layer_first_draw",{});
		
		
		//------------------------
		//----Add effects draw----
		//------------------------
		
		
		//----Save temp struct to the letter frame struct----
		struct_set(letter_frame_struct,"effects_draw",{});
		
		
		//-----------------------
		//----Add letter draw----
		//-----------------------
		
		
		//Reset temporary structs
		temp_struct = {};
		temp_draw_struct = {};
		
		//Set letter
	 	struct_set(temp_draw_struct,"letter",struct_get(letter_struct,"letter"));
		
		//Set font
		struct_set(temp_draw_struct,"sprite",json_parse(json_stringify(scrNewTextMarkupTagFont(letter_struct))));
		
		//Set scale
		value = json_parse(json_stringify(scrNewTextMarkupTagScale(letter_struct)));
		struct_set(temp_draw_struct,"scale_x",value[0]);
		struct_set(temp_draw_struct,"scale_y", value[1]);
		
		//Set start x/start y
		value = json_parse(json_stringify(scrNewTextMarkupTagStartX(letter_array_frame,letter_struct)));
		struct_set(temp_draw_struct,"start_x",value);
		struct_set(temp_draw_struct,"x", value);
		value = json_parse(json_stringify(scrNewTextMarkupTagStartY(letter_array_frame,letter_struct,temp_draw_struct,letter_array,i)));
		struct_set(temp_draw_struct,"start_y", value[0]);
		struct_set(temp_draw_struct,"y", value[0]);
		struct_set(temp_draw_struct,"line_index", value[1]);
		struct_set(temp_draw_struct,"letter_index", value[2]);
		
		//Set kerning
		scrNewTextMarkupTagKerning(letter_struct,temp_draw_struct);
		
		//Set line spacing
		scrNewTextMarkupTagLineSpacing(letter_struct,temp_draw_struct,letter_array_frame);
		
		
		//----Save draw_x to temp_stuct from temp_draw_struct----
		struct_set(temp_struct,"draw_1",json_parse(json_stringify(temp_draw_struct)));
		
		
		//----Save temp struct to the letter frame struct----
		struct_set(letter_frame_struct,"letter_draw",json_parse(json_stringify(temp_struct)));
		
		
		//---------------------------
		//----Add layer last draw----
		//---------------------------
		
		
		//----Save temp struct to the letter frame struct----
		struct_set(letter_frame_struct,"layer_last_draw",{});
		
		
		//-------------------
		//----Save struct----
		//-------------------
		array_push(letter_array_frame,letter_frame_struct);
	}
}