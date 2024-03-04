#region mudar fala
if( keyboard_check_pressed(ord("F")) ){
	if( letra < string_length(fala[texto]) ){
		txt_completo = true;	
	}else{
		texto++;
		letra = 1;
		texto_atual = "";
		txt_completo = false;
	}
}

if( texto > array_length(fala) - 1 ){
	instance_destroy();
	global.interagindo = false;
}
#endregion