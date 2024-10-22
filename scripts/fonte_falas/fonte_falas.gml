function falas_fonte(_npc, _conversa = 0){
	switch _npc{
		case "garoto":
		switch _conversa{
		case 0:
		fala[0] = "Ah! Você não vai me machucar? Ainda bem...";
		fala[1] = "Eu me chamo Mello... como eu fiquei assim?";
		fala[2] = "O rei da Peste jogou uma praga forte na região e acabei ficando assim, mas não é tão ruim...";
		fala[3] = "Fica mais facil de eu me camuflar!!";
		fala[4] = "Você precisa de ajuda?";
		fala[5] = "O QUÊ?! Ir para o território da fome é morte certa!!"
		fala[6] = "Você é muito corajoso! Eu te levo até lá, mas depois que você entrar no reino da fome você deverá seguir sozinho..."
		fala[7] = "Não posso me arriscar nesse nível... Vamos!"
		break;
		
		case 1:
		fala[0] = "Ah! olha só, é uma foto do casamento da princesa Nerida e do principe Darian...";
		fala[1] = "Minha mãe me contou da história deles...";
		fala[2] = "Ela disse que o mundo só ficou assim por causa deles...";
		fala[3] = "A vinte anos atrás o mundo era normal...";
		fala[4] = "Mas chega de história triste, vamos nos apressar!";
		break;
		
		case 2:
		fala[0] = "Foi muito legal essa pequena jornada que tivemos até aqui, vou sentir sua falta...";
		fala[1] = "Vamos sair para outra aventura depois, quando voce conseguir realizar o seu objetivo é claro...";
		fala[2] = "Só não morre, beleza?";
		break;
		
		case 3:
		fala[0] = "Por que o cogumelo foi ao médico? Porque ele estava se sentindo um 'funguinho' mal! haha";
		break;
		
		case 4:
		fala[0] = "Carambaa, voce acabou com eles!!!";
		fala[1] = "Boa dog";
		fala[2] = "Ce é fera hein";
		break;
		}
		break;
		
		case "tutorial":
		fala[0] = "Um verdadeiro herói é aquele não se importa em ter seu nome reconhecido";
		fala[1] = "Além disso, cada grande herói, desde os tempos em que dragões andavam como reis pela terra, tinham um ponto de destaque.";
		fala[2] = "O mais antigo que conheço é Hanumam, que parecia se teleportar ao correr [SHIFT].";
		fala[3] = "Há também Miyamoto Musashi, que ao balançar sua espada, podia cortar seus inimigos até mesmo através da parede [Q].";
		fala[4] = "Outro a ser citado é Milo de Crotona, que suportava os mais poderosos golpes sem levar qualquer dano [E].";
		fala[5] = "Entretanto para ser um herói basta creer que é possível. Mas as vezes, uma habilidade poderosa pode ser útil em uma jornada contra um inimigo poderoso [R?].";
		fala[6] = "Caso voce esteja indo para uma jornada como herói, leve as palavras deste poderoso mago errante."
		fala[7] = "Nunca deixe sua espada jogada, e tenha em mente que nem todas as batalhas foram feitas para serem vencidas (as guerras sim)."
		break;
	}
}