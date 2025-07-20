	ARRAYS 

	Iteração com o laço for .. of e for .. in

	let numbers = [2,3,5,7,11]
	for (const i in numbers) { console.log(numbers[i])}
	//2,3,5,7,11
	
	for (const n of numbers) {
		console.log(n);
	}
	//2,3,5,7,11

	
	concat - junta vários arrays e devolve um cópia dos arrays concatenados

	let arr1 = [1,2,3,4];
	let arr2 = [5,6,7,8];
	let arr3 = arr1.concat(arr2);
	//arr3: [1,2,3,4,5,6,7,8]
	let arr3 = arr2.concat(arr1);
	//arr3: [4,5,6,1,2,3] 

	ou
	const zero = 0
	const positive = [1,2,3]
	const negative = [-1,-2,-3]
	const numbers = negative.concat(zero, positive)
	//numbers: -1,-2,-3,0,1,2,3

	every - itera por todos os elementos do array, verificando um condição desejada
	(função) até que "false" sefa devolvido

	let arr = [2, 4, 6, 8, 9, 10, 12];
	const isEven = (x) => { console.log(x); return x % 2 === 0 ? true ?}
	arr.every(isEven);
	//2,4,6,8,9 false
	
	filter - cria um array com todos os elementos avaliados com true pela função
	especificada

	let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
	const isEven = x => x % 2 === 0;
	numbers.map(i);
	//[
	   2,  4,  6, 8,
	  10, 12, 14
	]

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

	reverse - inverte o array
	arr.reverse()

	slice - devolve um novo array a partir do índece especificado

	some - itera por todos os elementos do array, verificando a condição
	desejada ou (função) até que true seja devolvido

	sort - organiza o array em ordem alfabética ou de acordo com a função
	especificada.

	toString - devolve o array na forma de uma string

	valueOf - é semelhante ao método toString e devolve o array na forma de
	uma string.

	pop - remove ultimo
	shift - remove primeiro
	push - adiciona no fim do array
	unshift - adiciona no inicio do array

	copyWithin - copia uma sequencia de valores do array para a
	posição de um índice de ínicio.

	let arr = [1,2,3,4,5,6];
	arr.copyWithin(0, 3);
	//arr: [4,5,6,4,5,6]

	
