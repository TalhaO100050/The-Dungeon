function scrNewTextMarkupTagStartY(letter_array_frame,letter_struct,temp_draw_struct,letter_array,i){
	
	//First letter
	if(array_length(letter_array_frame) == 0){
		if(struct_get(letter_struct,"fix_to_cam") == true and camera_get_active() != -1){
			return [struct_get(letter_struct,"y_pos") + camera_get_view_y(camera_get_active()), 0, 0];
		}
		return [struct_get(letter_struct,"y_pos"), 0, 0];
	}
	
	var line_index = struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "line_index");
	
	//Eğer n varsa
	if(struct_exists(letter_struct,"n")){
		struct_set(temp_draw_struct,"start_x",struct_get(letter_struct,"x_pos"));
		struct_set(temp_draw_struct,"x",struct_get(letter_struct,"x_pos"));
		line_index ++;
	}
	
	if(struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "line_index") == line_index){
		//Same line
		return [struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "start_y"), line_index, struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "letter_index") + 1];
	}else{
		//New line
		
		//Find max scale
		var max_height = struct_get(temp_draw_struct,"scale_y") * sprite_get_yoffset(struct_get(temp_draw_struct,"sprite"));
		i++;
		while(true){
			var current_scale = 1;
			var current_font = "default_font";
			var current_letter = struct_get(letter_array[i],"letter");
			if(struct_exists(letter_array[i],"s")){
				if(struct_exists(struct_get(letter_array[i],"s"),"scale")){current_scale *= real(struct_get(struct_get(letter_array[i],"s"),"scale"));}
				if(struct_exists(struct_get(letter_array[i],"s"),"scale_y")){current_scale *= real(struct_get(struct_get(letter_array[i],"s"),"scale_y"));}
			}
			if(struct_exists(letter_array[i],"f")){current_font = struct_get(letter_array[i],"f");}
			
			var current_height = current_scale * sprite_get_yoffset(scrNewTextMarkupTagFonts(current_font, current_letter));
			
			if(max_height < current_height){max_height = current_height;}
			i++;
			if(struct_exists(letter_array[i],"n") or array_length(letter_array) - 1 == i){break;}
		}
		
		return [struct_get(struct_get(struct_get(letter_array_frame[array_length(letter_array_frame) - 1], "letter_draw"), "draw_1"), "start_y") + max_height, line_index, 0];
	}
}