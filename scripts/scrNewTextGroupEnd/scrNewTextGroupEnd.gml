function scrNewTextGroupEnd(current_struct, text, current_text){
	
	/// @function		sNewTextGroupEnd(current_struct, text, current_text)
	/*
	
		To use
		->set current_text to current_text after use
		->set current_struct to current_struct after use
	
	*/
	if(current_struct.level == 0){show_error("sNewText -> Unexpected %' : " + text,true);}
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
	current_struct = current_struct.parent;
	
	return {"current_struct" : current_struct, "current_text" : current_text};
}