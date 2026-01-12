------------------------------------------------------------------
STRINGS
------------------------------------------------------------------

CONCATENATION

echo "Hello " . ", Friend"

echo "3 mices" + "2 cats"
" -> 5

echo 10 + "10.10"
" -> 20
Vim will not coerce string to floats.
echo 10 + "foo" 
" -> 10

echo 10.1 . "foo"
" -> 10.1foo

echo 10 . "foo"
10foo

SPECIAL CHARACTERS

echo "foo \'bar\'"
foo 'bar'

echo "foo \"bar\""
foo "bar"

echo "foo\\bar"
foo\bar

echo "foo\nbar"
foo
bar

echo 'that''s enough'
that's enough

------------------------------------------------------------------
STRINGS FUNCTIONS
------------------------------------------------------------------

LENGTH

echo strlen("foo")
3
echo strlen("arch")
4
echo len("linux")
5

SPLITTING

echo split("math, physics, eng", ",")
['math', 'physics', 'eng']

echo split("arch gentoo freebsd")
['arch', 'gentoo', 'freebsd']

echo split("alfa > beta > omega", ">")
["alfa", "beta", "omega"]

echo split("alfa > beta > omega")
['alfa', '>', 'beta', '>', 'omega']

JOINING

echo join(["foo", "bar"], "...")
foo...bar

echo join(split("foo bar"), ";")
foo;bar


LOWER AND UPPER CASE

echo tolower('IAN')
ian
echo toupper('Ian')
IAN

echo tolower(toupper('Arch Linux'))
arch linux

echo toupper(tolower('Arch Linux'))
ARCH LINUX

------------------------------------------------------------------
LISTS
------------------------------------------------------------------

echo ['foo', 3, 'bar']
echo ['foo', [3, 'bar']]
let l = ['ian', '1985', acos(1), exp(1), ['tom','cat']]
echo l
echo len(l)

INDEXING

echo ['arch', [1, 2]][0]
'arch'

echo ['arch', [1, 2]][1]
[1,2]

echo [0, [1, 2]][-1]
[1,2]

echo [0, [1, 2]][-2]
0

SLICING

echo ['a', 'b', 'c', 'd', 'e'][0:2]
['a', 'b', 'c']

echo ['a', 'b', 'c', 'd', 'e'][0:1000]
['a', 'b', 'c', 'd', 'e']

echo ['a', 'b', 'c', 'd', 'e'][-2:-1]
['d', 'e']

echo ['a', 'b', 'c', 'd', 'e'][:1]
['a','b']

echo ['a', 'b', 'c', 'd', 'e'][3:]
['d', 'e']

echo "abcd"[0:2]
abc

echo "abcd"[-1] . "abcd"[-2:]
cd

CONCATENATION

echo ['a', 'b'] + ['c']
['a', 'b', 'c']

LIST FUNCTIONS

let foo = ['a']
call add(foo, 'b')
echo foo
['a', 'b']
echo len(foo)
2

echo get(foo, 0, 'default')
echo get(foo, 100, 'default')

echo join(foo)
a b
echo join(foo, '---')
a---b
echo join([1,2,3], '')
123

call reverse(foo)
echo foo
['b', 'a']

------------------------------------------------------------------
LOOPS
------------------------------------------------------------------

let lst = []
let sum = 0

for i in range(10)
    call add(lst, i + 1)
endfor

for i in lst
    let sum += i
endfor
echo lst
echo sum
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// 55

let lst = []
let count = 0

while count < 10
    call add(lst, c + 1)
    let count += 1
endwhile

let sum = 0
let count = 0

while count < len(l)
    let sum += l[count]
    let count += 1
endwhile

echo sum
echo lst
echo len(lst)
// 45 
/ [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
// 10

------------------------------------------------------------------
DICTIONARIES
------------------------------------------------------------------

echo { a: 1, 100: 'foo' }
let dict = { 0: 'arch', 'name': 'elliot', 'age': 31 }
echo dict[0]
echo dict['name']
echo dict['age']
echo dict
// arch
// elliot
// 31
// { '0': 'arch', 'name': 'elliot': 'age': '31'}

------------------------------------------------------------------
EVENTS
------------------------------------------------------------------

BufRead - quando um arquivo é lido
BufWrite - quando um buffer é salvo
FileType - quando o tipo do arquivo é declarado
VimEnter - quando o vim inicia


exemplo: 
autocmd BufWrite *.c echo "Arquivo C salvo"

------------------------------------------------------------------
------------------------------------------------------------------
==? é operador de comparacao que ignora maiusculas e minusculas, 
independente da configuracao do usuario

==# diferencia maiusculas e minuscula independentes da configuracao 
do usuario

------------------------------------------------------------------
------------------------------------------------------------------
COPIAR, COLAR, DELETAR

dd -> deleta toda a linha atual
D  -> deleta o restante da linha
d$ -> deleta do ponto atual do cursor até o final da linha
d^ -> deleta do cursor ao primeiro caractere não nulo da linha
d0 -> deleta do cursor ao inicio da linha
"dfe" -> apaga do cursor até o caractere 'e'

x -> apaga o caractere sob o cursor
xp -> troca letras de lugar
ddp -> troca linhas de lugar
d5x -> apaga os próximos 5 caracteres
dd -> apaga a linha atual
5dd -> apaga 5 linhas
d5G -> apaga até a 5 linha
dw -> apaga uma palavra
5dw -> apagar 5 palavras
dl -> apaga um letra, semelhante a x
5dl -> apaga 5 letras 
d0 -> apaga até o início da linha
d^ -> apaga até o primeiro da linha    
d$ -> apaga até a final da linha
dgg -> apaga até o início do arquivo
dG -> apaga até o final do arquivo
D -> apaga até o final do arquivo
d% -> apaga até o próximo (, [, {
da" -> deleta aspas com conteudo
diw -> apaga palavra mesmo que não estja posicionada no inicio
dip -> apaga o paragrafo atual
d4p -> apaga as quatro palavras anteriores
dfx -> apagar até o x

yy -> copia linha atual
Y  -> copia a linha atual
ye -> copia do cursor ao fim da palavra
yb -> copia do começo da palavra ao cursor 
5yy -> copia 6 linhas 
y/pat -> copia até pat
yw -> copia uma palavra
5yw -> copia 5 palavras
yl -> copia 5 letras
5yl -> copia 5 letras
y5l -> copia 5 letras
y^  -> copia da posição atual até o início da linha, mesmo que: y0 
y$ -> copia da posição atual até o fim da linha
ygg -> copia da posição atual até o início do arquivo
yG -> copia da posição atual até o final do arquivo

p -> cola o que foi copiado ou deletado abaixo
P -> cola o que foi copiado ou deletado acima
[p -> cola o que foi copiado ou deletado antes do cursor
]p -> cola o que foi copiado ou deletado antes do cursor

Trocando a letra 'd' nos comandos acima por 'c' de change, invés
de deletar será feita uma mudança de conteúdo.

ciw -> modifica uma palavra
cip -> modifica um paragrafo
cis -> modifica uma palavra
C   -> modifica até o final da linha

ORDENANDO

sort u -> ordena e retira linnhas duplicadas
sort n -> ordena numericamente

i, j sort n -> ordena entre as linha i e j

CONVERTENDO PARA MAIUSCULAS

gUU -> converte a linha toda para maiuscula
guu -> converte a linha toda para minuscula
gUiw -> converte a palavra atual para maiuscula
~   -> altera o case do caractere atual 

USANDO EXPRESSÕES REGULARES EM BUSCAS

/ -> inicia uma busca
/\%x69 -> localiza a letra 'i'
/\d -> localiza números
/[3-8] -> localiza números entre 3 e 8

OBTENDO INFORMAÇÕES DO ARQUIVO

ga -> mostra código do caractere em decimal hexa e octal
ctrl-g -> mostra o caminho e o nome do arquivo
g-ctrl-g -> mostra estatísticas detalhadas do arquivo

FILE EXPLORER

:Ve -> abre o file explore verticalmente
:Sex -> abre o file explore em uma nova janela
:Tex -> abre o file explore em um nova aba


