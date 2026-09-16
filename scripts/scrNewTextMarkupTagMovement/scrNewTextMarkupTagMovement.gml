function scrNewTextMarkupTagMovement(temp_draw_struct,letter_struct,frame_number,letter_array_frame,j){

	if(struct_exists(letter_struct,"m")){
		var movement_struct = struct_get(letter_struct,"m");
		
		//sin_wave_up_down
		if(struct_exists(movement_struct,"sin_wave_up_down")){
			
			
			//Find options
			var sin_wave_up_down_options = struct_get(movement_struct,"sin_wave_up_down");
			var sin_wave_up_down_options_struct = {};
			var option_name = "";
			var option_value = "";
			var current = "name";
			for (var i = 1; string_length(sin_wave_up_down_options) >= i; i++){
				var letter = string_char_at(sin_wave_up_down_options,i);
				
				if (letter == "="){current = "value"; continue;}
				if (letter == ";"){
					current = "name";
					struct_set(sin_wave_up_down_options_struct,option_name,option_value);
					option_name = "";
					option_value = "";
					continue;
				}
				
				if (current == "name"){option_name += letter;}
				if (current == "value"){option_value += letter;}
			}
			
			//----Set options----
			//move_speed
			if (struct_exists(sin_wave_up_down_options_struct,"move_speed")){
				var move_speed = real(struct_get(sin_wave_up_down_options_struct,"move_speed"));
			}else{
				var move_speed = 1;
			}
			
			//length
			if (struct_exists(sin_wave_up_down_options_struct,"length")){
				var length = real(struct_get(sin_wave_up_down_options_struct,"length"));
			}else{
				var length = 1;
			}
			
			//delay 
			if (struct_exists(sin_wave_up_down_options_struct,"delay")){
				
				if (j != 0){
					var last_delay = struct_get(struct_get(struct_get(letter_array_frame[j - 1],"letter_draw"),"draw_1"),"sin_wave_up_down_delay");
					var delay = last_delay + real(struct_get(sin_wave_up_down_options_struct,"delay"));
				}else{
					var delay = 0;
				}
				
			}else{
				var delay = 0;
			}
			struct_set(temp_draw_struct,"sin_wave_up_down_delay",delay);
			
			//Find move value
			var sin_wave_up_down_move = length * sin((frame_number - delay)/move_speed);
			
			//Set move value
			struct_set(temp_draw_struct, "y", (sin_wave_up_down_move + struct_get(temp_draw_struct,"y")));
		}
		
		//sin_wave_left_right
		if(struct_exists(movement_struct,"sin_wave_up_down")){
			
			
			//Find options
			var sin_wave_left_right_options = struct_get(movement_struct,"sin_wave_left_right");
			var sin_wave_left_right_options_struct = {};
			var option_name = "";
			var option_value = "";
			var current = "name";
			for (var i = 1; string_length(sin_wave_left_right_options) >= i; i++){
				var letter = string_char_at(sin_wave_left_right_options,i);
				
				if (letter == "="){current = "value"; continue;}
				if (letter == ";"){
					current = "name";
					struct_set(sin_wave_left_right_options_struct,option_name,option_value);
					option_name = "";
					option_value = "";
					continue;
				}
				
				if (current == "name"){option_name += letter;}
				if (current == "value"){option_value += letter;}
			}
			
			//----Set options----
			//move_speed
			if (struct_exists(sin_wave_left_right_options_struct,"move_speed")){
				var move_speed = real(struct_get(sin_wave_left_right_options_struct,"move_speed"));
			}else{
				var move_speed = 1;
			}
			
			//length
			if (struct_exists(sin_wave_left_right_options_struct,"length")){
				var length = real(struct_get(sin_wave_left_right_options_struct,"length"));
			}else{
				var length = 1;
			}
			
			//delay 
			if (struct_exists(sin_wave_left_right_options_struct,"delay")){
				
				if (j != 0){
					var last_delay = struct_get(struct_get(struct_get(letter_array_frame[j - 1],"letter_draw"),"draw_1"),"sin_wave_left_right_delay");
					var delay = last_delay + real(struct_get(sin_wave_left_right_options_struct,"delay"));
				}else{
					var delay = 0;
				}
				
			}else{
				var delay = 0;
			}
			struct_set(temp_draw_struct,"sin_wave_left_right_delay",delay);
			
			//Find move value
			var sin_wave_left_right_move = length * sin((frame_number - delay)/move_speed);
			
			//Set move value
			struct_set(temp_draw_struct, "x", (sin_wave_left_right_move + struct_get(temp_draw_struct,"x")));
		}
	}
}