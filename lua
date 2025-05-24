.......................................................

    function nameFunction()
        ...
    end
    nameFunction()

    or

    var = nameFunction
    var()

.......................................................

    if (condition) then
        ...
    end

    if (condition) then
        ...
    else
        ...
    end

    if (cond1) then
        ...
    elseif (cond2) then
    elseif (cond3) then
    else
    end

.......................................................

    OPERADORES LOGICOS
    and; or; not; false; true; nil(zero)

    (cond1 and not (cond2)) or (not (cond1) and cond2)

.......................................................

    LOOPS

    while [not] (condition) do
        ...
    end 

    repeat
    ...
    until [not] (condition)

    for <var> = start, end, pass do
        ...
    end

    for i = 1, 10, 1 do
        print("jesus cristo")
    end

.......................................................

    PRECEDÊNCIA

    A precedência de operadores em Lua segue a tabela abaixo, da maior
    prioridade para a menor:
        ^
        not     #       - 
        *       /       %
        +       -
        ..
        < >     <= >=   ~= ==
        and
        or

.......................................................
    
    TABLES

    Construtores de tabelas
    Mais simples: {}; isto é: tabela = {}
    Construtores também inicializam listas

    days = {
        "sunday", "monday", "tuesday", "wednesday", 
        "thursday", "friday", "saturday"
        }

    print(days[4]) -> wednesday

    Uma sintaxe especial para inicalizar uma tabela como um 
    regsitro:

    a = {x=10, y=20}
    a.x == a['x']
    a.y == a['y']
    a[x] == a[y] --> nil

    ou

    a = {}; a.x = 10; a.y = 20;

    Podemos misturar inicializações no estilo registro e no 
    estilo lista no mesmo contrutor:

    polyline = {
        color = 'blue',
        thickness = 2,
        npoints = 4,
        { x = 0, y = 0 },       --polyline[1]
        { x = -10, y = 0 },     --polyline[2]
        { x = -10, y = 1 },     --polyline[3]
        { x = 0, y = 1 }        --polyline[4]
    }
    for i = 1, 4 do
        print(polyline[i].x .. ", " .. polyline[i].y)
    end

.......................................................

    STRINGS EM LUA
    
    Strings em lua sao cadeias de caracteres imutaveis.
    O operarador concatenacao sempre cria uma nova cadeia, 
    sem nenhuma modificacao em seus operandos.

    Operador de concatenaçao: .. (ponto ponto)

    Operador de comprimento: #
    print(a[#a])    --imprime o ultimo valor
    a[#a] = nil     --remove esse ultimo valor
    a[#a + 1] = v   --acrecenta 'v' ao final da sequencia

    name = "archlinux"

    string.len(name)
    print(#name) == string.len(name)
    string.lower(name)
    string.upper(name)
    string.reverse(name)
    string.sub(name, 1)
    string.sub(name, 1, 3)
    string.sub(name, 4, 5)
    string.sub(name, -5)
    string.byte("ian", 1)
    string.byte("ian", 2)
    string.char(97) -> a
    string.byte('a') -> 97

.......................................................

    MATH EM LUA

    pi = math.acos(-1)
    math.cos(number)
    math.sin(number)
    math.tan(number)
    math.floor(number)
    math.sqrt(number)

.......................................................

    FUNCTION        | WHAT IT DOES 
    string.match    | Encontra a primeira ocorrência
    string.find     | Retorna a posição da ocorrência
    string.gsub     | Substitui partes da string
    string.gmatch   | Itera sobre todas as ocorrências

    PATTERN         | SIGNIFICADO
    .               | Qualquer caractere
    %a              | Letra (A-Z, a-z)
    %d              | Dígito (0-9)
    %s              | Espaço
    %w              | Alfanumérico
    +               | Um ou mais
    *               | Zero ou mais
    -               | Zero ou mais (modo "lazy")
    ^ / $           | Início / Fim da string
    []              | Lista de caracteres
    [^]             | Negação da lista

.......................................................

    MODULOS

    A linguagem Lua possui alguns módulos em sua biblioteca padrão.
    coroutine - funções de uso do recurso de co-rotinas
    debug - funções para o processo de depuração
    io - funções para as operações de entrada e saída
    math - funções para o uso de operações matemáticas
    os - funções que facilitam operações com o sistema operacional
    package - funções para tratamento de módulo
    string - funções para manipulações de strings
    table - funções para a manipulação de tabelas

    O uso da função require() é obrigatório quando da definição e do
    uso de uma biblioteca externa e particular criada pelo programador
    para atender às próprias necessidades.

    //module.lua
    function hello(name) 
        print("Hello, " .. name)
    end
    
    //main.lua
    require('./module')
    hello("Elliot")
    
    or

    //module.lua
    local M = {}
    function M.hell() 
        print("Hello, Elliot")
    end

    //foo
    #!/usr/bin/env lua

    local bar = require("./module")
    bar.hello()

.......................................................

    METATABELAS

    Metatabela em Lua é um recurso avançado que permite 
    alterar o comportamento padrão de tabelas, como a forma
    como elas respondem a operações aritméticas, comparações, 
    indexações, entre outros. É um dos pilares da flexibilidade
    da linguagem Lua.

    Uma **metatabela** é uma tabela especial que pode ser associada
    a outra tabela (ou userdata) para **personalizar seu comportamento.
    Através de **métodos especiais** chamados **metamétodos** (como
    `__add`, `__index`, etc.), você define o que acontece quando
    certas operações são feitas com a tabela original.

    Como definir e usar uma metatabela

    Exemplo básico:

    t1 = {1, 2}
    t2 = {3, 4}

    metatabela = {
        __add = function(a, b)
            return {a[1] + b[1], a[2] + b[2]}
        end
    }
    
    setmetable(t1, metatabela)
    resultado = t1 + t2 
    print(resultado[1], resultado[2])

    | METAMÉTODO    | SIGNIFICADO                                   |
    | ------------  | -------------------------------------------   |
    | __index       | Personaliza a leitura de um campo             |
    | __newindex    | Personaliza a escrita de um campo             |
    | __concat      | concatenação                                  | 
    | __add         | Soma (+) entre tabelas                        |
    | __sub         | Subtração (-) entre tabelas                   |
    | __mul         | Multiplicação (*)                             |
    | __div         | Divisão (/)                                   |
    | __pow         | Exponenciação                                 |
    | __eq          | Igualdade (==)                                |
    | __lt          | Menor que (<)                                 |
    | __le          | Menor ou igual (<=)                           |
    | __tostring    | Representação como string (tostring(obj))     |
    | __call        | Quando a tabela é chamada como função         |
    | __len         | tamanho                                       |

    EXEMPLO:

    pessoa = {nome = "João"}
    metatabela = {
        __index = function(tabela, chave)
            return "Campo '" .. chave .. "' não encontrado."
        end
    }

    setmetatable(pessoa, metatabela)

    print(pessoa.nome)     --> João
    print(pessoa.idade)    --> Campo 'idade' não encontrado.

.......................................................

    UTILS

    A expressão:

    x = x or <--> if not x then x = v end

    Isto é, a expressão acima atribui a x um valor um valor
    padrao v, quando x não tem valor (desde que não tenha o 
    valor false)

    (a and b) or c <--> a and or c <--> (a ? b : c)

    And tem maior precedencia que or. Ele e equivalente a 
    ultima expressao acima desde que b nao seja false

    max = (x > y) and x or y

    Quando x > y for verdadeira, a primeira expressao do and
    sera verdadeira, e, assim, o and resultara em sua segunda
    expressao (x), que sera sempre verdadeira; a expressao x > y
    for falso, a expressao and sera falsa, e, portanto, o or 
    resultara em sua segunda expressao, y.

.......................................................
