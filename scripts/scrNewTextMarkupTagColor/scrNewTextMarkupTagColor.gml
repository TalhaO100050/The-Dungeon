function scrNewTextMarkupTagColor(letter_struct){
	static color_table = {
	"c_aqua" : c_aqua,
	"c_black" : c_black,
	"c_blue" : c_blue,
	"c_dkgray" : c_dkgray,
	"c_fuchsia" : c_fuchsia,
	"c_gray" : c_gray,
	"c_green" : c_green,
	"c_lime" : c_lime,
	"c_ltgray" : c_ltgray,
	"c_maroon" : c_maroon,
	"c_navy" : c_navy,
	"c_olive" : c_olive,
	"c_orange" : c_orange,
	"c_purple" : c_purple,
	"c_red" : c_red,
	"c_silver" : c_silver,
	"c_teal" : c_teal,
	"c_white" : c_white,
	"c_yellow" : c_yellow
};

	if (struct_exists(letter_struct, "c")){
		
		var c_value = struct_get(letter_struct, "c");
		if(struct_exists(color_table, c_value)){
			return struct_get(color_table, struct_get(letter_struct, "c"))
		}else{
			//Hex color
			var r = real("0x" + string_copy(c_value, 2, 2));
			var g = real("0x" + string_copy(c_value, 4, 2));
			var b = real("0x" + string_copy(c_value, 6, 2));
			return make_color_rgb(r, g, b);
		}
	}else{
		return c_white;
	}

}