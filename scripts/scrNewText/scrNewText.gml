function scrNewText(text, xth_use_in_this_object, start_x=0, start_y=0, fix_to_camera=true){

	//Markup tags
	static markup_tags = {
		"*" : "group start",
		"'" : "group end",
		"n" : "next line",
		"xs" : "x start",
		"ys" : "y start",
		"ftc" : "fix to camera",
		"c" : "color",
		"xo" : "x offset",
		"yo" : "y offset",
		"s" : "scale",
		"sx" : "scale x",
		"sy" : "scale y",
		"a" : "alpha",
		"r" : "rotate letter",
		"rl" : "rotate line",
		"f" : "font",
		"k" : "kerning",
		"j" : "line spacing",
		"m" : "movement",
		"e" : "effect",
		"l" : "layer",
		"d" : "delay",
		"snd" : "sound",
		"ani" : "animation",
		"scr" : "scripts"
	}
		
	//Restore markup tags
	static restorable_markup_tags = {
		"c" : "color",
		"xo" : "x offset",
		"yo" : "y offset",
		"s" : "scale",
		"sx" : "scale x",
		"sy" : "scale y",
		"a" : "alpha",
		"r" : "rotate letter",
		"rl" : "rotate line",
		"f" : "font",
		"k" : "kerning",
		"j" : "line spacing",
		"m" : "movement",
		"e" : "effect",
		"l" : "layer",
		"d" : "delay",
		"snd" : "sound",
		"ani" : "animation",
		"scr" : "scripts"
	};
	static restorable_markup_tag_names = struct_get_names(restorable_markup_tags);

	
	//Is TextBoxes struct exist for this object
	if (!variable_instance_exists(id,"TextBoxes")){
		TextBoxes = {};
	}

	//Name of the text	
	var textName = "Text_" + string(xth_use_in_this_object);
	
	//Decode the string if it isnt done before
	if (!struct_exists(TextBoxes,textName)){
		
		//Create the textbox struct
		var textNameStructTree = string(textName) + "_Tree";
		TextBoxes[$textNameStructTree] = {
			"level" : 0,
			"x_pos" : start_x,
			"y_pos" : start_y,
			"fix_to_cam" : true
		};
		
		//Start filling the textbox struct
		var current_text = "";
		var current_markup_tag = "";
		var current_markup_tag_value = "";
		var current_level = 0;
		var current_struct = TextBoxes[$textNameStructTree];
		var pending_group_closes = 0
		
		//Start checking the text
		for (var i = 1; i <= string_length(text); i++){
			//Look for markup tags
			if (string_char_at(text,i) == "%"){
				i++;
				//Is literal %
				if (string_char_at(text,i) != "%"){
					//Find the markup tag
					current_markup_tag = "";
					current_markup_tag_value = "";
					while (string_char_at(text,i) != "/" and string_char_at(text,i) != "["){
						current_markup_tag += string_char_at(text,i);
						i++;
					}
					
					//Is markup tag exist
					if (!struct_exists(markup_tags,current_markup_tag)){
						show_error("sNewText -> Invalid markup tag : " + current_markup_tag,true);
					}
					
					//Is it a restorable markup tag
					if (struct_exists(restorable_markup_tags,current_markup_tag)){
						
						//Is it restore/reset markup tag
						if (string_char_at(text,i) == "/"){
							if (current_struct.level == 0){show_error("sNewText -> Restore/Rest tag at root",true)};
							//Reset markup tag
							if (string_char_at(text,i + 1) == "/"){
								i++
								//Save the markup tag values
								var value = scrNewTextGroupStart(current_text, current_struct, restorable_markup_tag_names);
								current_text = value.current_text;
								current_struct = value.current_struct;
								
								i++;
								current_text += string_char_at(text,i);
								if(struct_exists(current_struct,current_markup_tag)){struct_remove(current_struct,current_markup_tag);}
								
								var value = scrNewTextGroupEnd(current_struct,text,current_text);
								current_struct = value.current_struct;
								current_text = value.current_text;
							}else{
								//Restore markup tag
								var value = scrNewTextGroupStart(current_text, current_struct, restorable_markup_tag_names);
								current_text = value.current_text;
								current_struct = value.current_struct;
								
								i++;
								current_text += string_char_at(text,i);
								struct_set(current_struct,current_markup_tag,struct_get(current_struct.parent.parent,current_markup_tag));
								
								var value = scrNewTextGroupEnd(current_struct,text,current_text);
								current_struct = value.current_struct;
								current_text = value.current_text;
							}
						//If normal restorable markup tag
						}else if (string_char_at(text,i) == "["){
							//Get the markup tag values
							var bracet_counter = 1;
							while(bracet_counter > 0){
								i++;
								if (string_char_at(text,i) == "["){bracet_counter++;}
								if (string_char_at(text,i) == "]"){bracet_counter--;}
								if (bracet_counter != 0){current_markup_tag_value += string_char_at(text,i);}
							}
							
							//Save the markup tag values
							var value = scrNewTextGroupStart(current_text, current_struct, restorable_markup_tag_names);
							current_text = value.current_text;
							current_struct = value.current_struct;
							
							//Formatını düzenleyip kaydet
							var parent_value = struct_exists(current_struct, current_markup_tag) ? current_struct[$ current_markup_tag] : {};
							current_struct[$ current_markup_tag] = scrNewTextSetIdentifiers(current_markup_tag_value, parent_value);
							
							pending_group_closes++;
							
						//Unexpected character
						}else{
							show_error("sNewText -> Unexpected character after restorable markup tag : " + current_markup_tag + string_char_at(text,i),true);
						}
					//Its not a restorable markup tag
					}else{
						//If its a group start markup tag
						if (current_markup_tag == "*"){
							//Create and go in the new group
							var value = scrNewTextGroupStart(current_text, current_struct, restorable_markup_tag_names);
							current_text = value.current_text;
							current_struct = value.current_struct;
							
							//Find the create group markup tags markup tags
							var bracet_counter = 1;
							while(bracet_counter > 0){
								i++;
								if (string_char_at(text,i) == "["){bracet_counter++;}
								if (string_char_at(text,i) == "]"){bracet_counter--;}
								if (bracet_counter != 0){current_markup_tag_value += string_char_at(text,i);}
							}
							
							for (var j = 1; j <= string_length(current_markup_tag_value); j++){
								if (string_char_at(current_markup_tag_value,j) == "%"){
									j++;
									var create_group_current_markup_tag = "";
									var create_group_current_markup_tag_value = "";
									//Find the markup tag
									while (string_char_at(current_markup_tag_value,j) != "[" and string_char_at(current_markup_tag_value,j) != "/"){
										create_group_current_markup_tag += string_char_at(current_markup_tag_value,j);
										j++;
									}
									
									//Is markup tag exist
									if (!struct_exists(restorable_markup_tags,create_group_current_markup_tag)){
										show_error("sNewText -> Invalid markup tag : " + create_group_current_markup_tag,true);
									}
									
									//Is it restore/reset markup tag
									if (string_char_at(current_markup_tag_value,j) == "/"){
										if (string_char_at(current_markup_tag_value,j + 1) == "/"){
										//Reset markup tag
										j++;
										if(struct_exists(current_struct,create_group_current_markup_tag)){struct_remove(current_struct,create_group_current_markup_tag);}
										}else{
										//Restore markup tag
										if (current_struct.level == 0){show_error("sNewText -> Tried using restore markup tag at the root : " + text,true);}
										struct_set(current_struct,create_group_current_markup_tag,struct_get(current_struct.parent.parent,create_group_current_markup_tag));
										}
									}else{
										var bracet_counter = 1;
										while(bracet_counter > 0){
											j++;
											if (string_char_at(current_markup_tag_value,j) == "["){bracet_counter++;}
											if (string_char_at(current_markup_tag_value,j) == "]"){bracet_counter--;}
											if (bracet_counter != 0){create_group_current_markup_tag_value += string_char_at(current_markup_tag_value,j);}
										}
		
										//Set markup tag
										var parent_value = struct_exists(current_struct, create_group_current_markup_tag) ? current_struct[$ create_group_current_markup_tag] : {};
										struct_set(current_struct, create_group_current_markup_tag, scrNewTextSetIdentifiers(create_group_current_markup_tag_value, parent_value));
									}
								}else{
									//Unexpected character	
									show_error("sNewText -> Unexpected letter in create group : " + current_markup_tag_value,true);
								}
							}
						}
						
						//If its a group end markup tag
						if (current_markup_tag == "'"){
							var value = scrNewTextGroupEnd(current_struct,text,current_text);
							current_struct = value.current_struct;
							current_text = value.current_text;
						}
						
						//If its a next line markup tag
						if (current_markup_tag == "n"){current_text += "%n"}
						
						//If its a x start markup tag
						if (current_markup_tag == "xs"){
							if (current_struct.level == 0){
								i++;
								while (string_char_at(text,i) != "]"){
									current_markup_tag_value += string_char_at(text,i);
									i++;
								}
								current_struct.x_pos = int64(current_markup_tag_value);
							}else{
								//Not at the root
								show_error("sNewText -> xs tag not used at the root : " + text,true);						
							}
						}
						
						//If its a y start markup tag
						if (current_markup_tag == "ys"){
							if (current_struct.level == 0){
								i++;
								while (string_char_at(text,i) != "]"){
									current_markup_tag_value += string_char_at(text,i);
									i++;
								}
								current_struct.y_pos = int64(current_markup_tag_value);
							}else{
								//Not at the root
								show_error("sNewText -> ys tag not used at the root : " + text,true);						
							}
						}
						
						//If its a fix to camera markup tag
						if (current_markup_tag == "ftc"){
							if (current_struct.level == 0){
								i++;
								while (string_char_at(text,i) != "]"){
									current_markup_tag_value += string_char_at(text,i);
									i++;
								}
								current_struct.fix_to_cam = string_lower(current_markup_tag_value) == "true";
							}else{
								//Not at the root
								show_error("sNewText -> ftc tag not used at the root : " + text,true);						
							}
						}
					}
				}else{
					//If litteral %
					current_text += "%"
				}	
			}else{
				//Character add
				current_text += string_char_at(text,i);
				
				while (pending_group_closes > 0){
					var value = scrNewTextGroupEnd(current_struct, text, current_text);
					current_struct = value.current_struct;
					current_text = value.current_text;
					pending_group_closes = 0;
				}
			}
		}
		//Save the last text
		var j = 0;
		if (current_text != ""){
			while (struct_exists(current_struct,"_" + string(j) + "_text") or struct_exists(current_struct,"_" + string(j) + "_group") == 1){
				j++;
			}
			struct_set(current_struct, "_" + string(j) + "_text", current_text);
			current_text = ""
			j = 0
		}
		
		
		//Make the text array
		TextBoxes[$textName] = {
			"currentFrames" : 0,
			"letterList" : []
		}
		
		var new_letter;
		var current_number = 0
		current_struct = TextBoxes[$textNameStructTree];
	
		while (true){
			if (struct_exists(current_struct, ("_" + string(current_number) + "_text"))){
				//Look every letter at text
				for (var k = 1; k <= string_length(current_struct[$("_" + string(current_number) + "_text")]); k++){
					new_letter = {};
					
					//Add letter to struct
					struct_set(new_letter,"letter",string_char_at(current_struct[$("_" + string(current_number) + "_text")], k));
					
					//Add markup tags to  struct
					for (var l = 0; l < struct_names_count(restorable_markup_tags); l++){
						//If markup tag exist add it
						if(struct_exists(current_struct, struct_get_names(restorable_markup_tags)[l])){
							struct_set(new_letter,struct_get_names(restorable_markup_tags)[l],struct_get(current_struct, struct_get_names(restorable_markup_tags)[l]));	
						}
					}
					
					//Add x_pos y_pos and fix_to_cam
					struct_set(new_letter,"x_pos",struct_get(TextBoxes[$textNameStructTree], "x_pos"));
					struct_set(new_letter,"y_pos",struct_get(TextBoxes[$textNameStructTree], "y_pos"));
					struct_set(new_letter,"fix_to_cam",struct_get(TextBoxes[$textNameStructTree], "fix_to_cam"));
					
					//Add struct to array
					array_push(TextBoxes[$textName].letterList, new_letter);
				}
				
				current_number ++;
			
			}else if (struct_exists(current_struct, ("_" + string(current_number) + "_group"))){
				//Go deeper
				current_struct = current_struct[$("_" + string(current_number) + "_group")];
				current_number = 0;
			}else{
				//If read all then stop
				if (current_struct.level == 0){break;}
				
				//Go higher
				var child_struct = current_struct;
				current_struct = current_struct.parent;
				
				//Find the correct number
				var names = struct_get_names(current_struct);
				for (var i = 0; i < array_length(names); i++){
					if (current_struct[$names[i]] == child_struct){	
						j = 2;
						current_number = ""
						while (string_char_at(names[i],j) != "_"){
							current_number += string_char_at(names[i],j);
							j++;
						}
						current_number = int64(current_number);
						current_number ++;
					}
				}
			}
		}
	}
	
	//Calculate letter placement and everything
	scrNewTextCalculateLetter(TextBoxes[$textName]);
	
	show_debug_message(json_stringify(TextBoxes))
}