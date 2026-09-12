function scrNewTextGroupStart(current_text, current_struct, restorable_markup_tag_names){
	
	///@function			sNewTextCreateGroup(current_text, current_struct, restorable_markup_tag_names)
	/*
	
		To use
		->set current_text to current_text after use
		->set current_struct to current_struct after use
	
	*/
	
	var j = 0;
	//Save the text
	if (current_text != ""){
		while (struct_exists(current_struct,"_" + string(j) + "_text") or struct_exists(current_struct,"_" + string(j) + "_group") == 1){
			j++;
		}
		struct_set(current_struct, "_" + string(j) + "_text", current_text);
		current_text = ""
		j = 0
	}
	//Create a new group
	while (struct_exists(current_struct,"_" + string(j) + "_text") or struct_exists(current_struct,"_" + string(j) + "_group") == 1){
		j++;
	}
	//Get parets markup tags
	var parent_markup_tags = [];
	for(var k = 0; k < array_length(restorable_markup_tag_names); k++){
		if (struct_exists(current_struct, restorable_markup_tag_names[k])){array_push(parent_markup_tags, restorable_markup_tag_names[k]);}
	}
	struct_set(current_struct, "_" + string(j) + "_group", {});
	for (k = 0; k < array_length(parent_markup_tags); k++){
		struct_set(struct_get(current_struct, "_" + string(j) + "_group"),parent_markup_tags[k],current_struct[$parent_markup_tags[k]]);
	}
	struct_set(struct_get(current_struct, "_" + string(j) + "_group"),"level",current_struct.level + 1);
	struct_set(struct_get(current_struct, "_" + string(j) + "_group"),"parent",current_struct);
	current_struct = struct_get(current_struct, "_" + string(j) + "_group");
	
	return {"current_text" : current_text, "current_struct" : current_struct}
}