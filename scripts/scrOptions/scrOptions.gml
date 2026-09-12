function scrOptions(options, name, def){
	if (struct_exists(options,name)){
		return options[$name];
		}
	else{
		return def;
	}
}