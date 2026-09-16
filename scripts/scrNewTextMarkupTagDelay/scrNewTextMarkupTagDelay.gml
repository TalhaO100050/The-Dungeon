function scrNewTextMarkupTagDelay(letter_struct,letter_array_frame,letter_array,i){
	
	//If first letter
	if(array_length(letter_array_frame) == 0){
		return 1;
	}
	
	
	//If not the first letter
	if(struct_exists(letter_array[i - 1],"d")){
		var delay_struct = struct_get(letter_array[i - 1],"d");
		
		if(struct_exists(delay_struct, "frames")){
			var frames = real(struct_get(delay_struct, "frames"));
			
			var last_letter_delay = real(struct_get(letter_array_frame[array_length(letter_array_frame) - 1],"delay"));
			
			return frames + last_letter_delay;
		}
		
		if(struct_exists(delay_struct, "seconds")){
			var seconds = real(struct_get(delay_struct, "seconds"));
			
			var last_letter_delay = real(struct_get(letter_array_frame[array_length(letter_array_frame) - 1],"delay"));
			
			var frames = seconds * game_get_speed(gamespeed_fps);
			
			return frames + last_letter_delay;
		}
	}
	
}