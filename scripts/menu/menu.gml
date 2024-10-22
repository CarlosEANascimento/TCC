function save_save_name(_save_name){
	ini_open("SaveNames");
	var _num = round( real( ini_read_string("qtde_saves","num","0") ) );
	
	ini_write_string("save_names", string(_num++),_save_name);
	ini_write_string("qtde_saves","num",string(_num++));
	ini_close();
}

function exist_save_name(_save_name){
		
}

function load_save_name(_id_save){
	ini_open("SaveNames");
	var _read = ini_read_string("save_names", string(_id_save), "Não há jogos salvos");
	ini_close();
	
	return _read;
}

function load_qtd_saves(){
	ini_open("SaveNames");
	var _read = ini_read_string("qtde_saves", "num", "0");
	ini_close();
	
	return _read;
}