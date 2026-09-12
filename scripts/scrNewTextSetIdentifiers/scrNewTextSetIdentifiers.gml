function scrNewTextSetIdentifiers(current_markup_tag_value, parent_markup_tag_values){
	
	/*
	
	How to use? :
	
	var parent_value = struct_exists(current_struct, current_markup_tag) ? current_struct[$ current_markup_tag] : {};
	current_struct[$ current_markup_tag] = scrNewTextSetIdentifiers(current_markup_tag_value, parent_value);
	
	*/
	
	var tag_value_lenght = string_length(current_markup_tag_value);
	var tag_value_has_values = 0;
	
	//Is it needs to organise
	for (var i = 1; i <= tag_value_lenght; i++){
		if (string_char_at(current_markup_tag_value,i) == "("){
			tag_value_has_values = 1;
			break;
		}
	}
	//If not return without doing anything
	if (!tag_value_has_values){return current_markup_tag_value}
	
	
	//Copy parent
	var new_markup_tag_value = {};
	var parent_names = struct_get_names(parent_markup_tag_values);
	for (var p = 0; p < array_length(parent_names); p++){
		struct_set(new_markup_tag_value, parent_names[p], parent_markup_tag_values[$ parent_names[p]]);
	}
	
	//Else start
	var identifier = "";
	var variable = "";
	for (var i = 1; i <= tag_value_lenght; i++){
		
		//If variable starts start reading
		if (string_char_at(current_markup_tag_value,i) == "("){
			i++;
			while (string_char_at(current_markup_tag_value,i) != ")"){
				variable += string_char_at(current_markup_tag_value,i);
				i++;
			}
			i++;
			new_markup_tag_value[$identifier] = variable
		}
		
		//If "," start next one
		if (string_char_at(current_markup_tag_value,i) == ","){
			identifier = "";
			variable = "";
			continue;
		}
		
		//Read identifier 
		identifier += string_char_at(current_markup_tag_value,i);
	}
	
	return new_markup_tag_value
}