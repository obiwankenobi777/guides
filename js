	ARRAYS 

	concat - junta vários arrays e devolve um cópia dos arrays concatenados

	let arr1 = [1,2,3,4];
	let arr2 = [5,6,7,8];
	let arr3 = arr1.concat(arr2);
	//arr3: [1,2,3,4,5,6,7,8]
	let arr3 = arr2.concat(arr1);
	//arr3: [4,5,6,1,2,3] 

	every - itera por todos os elementos do array, verificando um condição desejada
	(função) até que "false" sefa devolvido
	
	filter - cria um array com todos os elementos avaliados com true pela função
	especificada

	let arr = [-3,-,2,-2, -1, 0, 1 2, 3];
	let positive = arr.filter((x) => x > 0);
	ou
	let positive = arr.filter((x) => { return x > 0; });
	//positive: [1,2,3];
	let negative = arr.filter((x) => x < 0);
	ou
	let negative = arr.filter((x) => { return x < 0; });
	//negative: [-3,-2,-1]
	const nulo = arr.filter((x) => x == 0);
	//nulo: [0]

	forEach - executa uma função em cada elemento do array
	arr.forEach((x) => console.log(Math.pow(x, 3)));

	join - reune todos os elementos do array em uma string

	let arr = [1,2,3]
	arr.join("");
	//"123"
	arr.join("-")
	//"1-2-3"

	indexOf - pesquisa array em busca de elementos especificos e devolve
	sua posicao

	let alpha = ['a','b','c','d','e'];
	alpha.indexOf('e');
	//4

	lastIndexOf - delvove a posição do último item do array que corresponda
	ao criterio da pesquisa

	let a = [1,2,3,4,4,5];
	a.lastIndexOf(4)
	//4
	a.indexOf(4)
	//3

	map - cria outro array a partir de uma função que contém o critério/condição
	e devolve os elementos do array que correspondem ao critério

	const numbers = [2,3,5,7];
	const arr = numbers.map((elem) => { return Math.pow(elem, 2); });
	//arr: 4, 9, 25, 49

	
