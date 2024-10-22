layers = layer_get_all();
bkg_list = ds_list_create();

for( var _i = 0; _i < array_length(layers); _i++ ){
	show_debug_message(string(layer_get_element_type(layers[_i])) +"     "+ string(layer_get_name(layers[_i])));
	if( layer_get_element_type(layers[_i]) == layerelementtype_background ) show_debug_message(string(layer_get_name(layers[_i])));
}
