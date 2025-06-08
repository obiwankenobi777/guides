.............................................................................
    VARIÁVEIS

    TIPOS ESCALARES
    Um tipo escalar representa um único valor. Rust possui quatro tipos
    escalares principais: inteiros(i(com sinal) ou u(sem sinal)), números
    de ponto flutuante (float), booleanos(bool) e caracteres(char).

        Length  Signed Unsigned
        8-bit   i8      u8
        16-bit  i16     u16
        32-bit  i32     u32
        64-bit  i64     u64
        128-bit i128    u128
        arch    isize   usize

    Os tipos isize e usize dependem da arquitetura do computador em que seu
    programa está sendo executado, o que é denotado na tabela como "arch": 64
    bits se você estiver em uma arquitetura de 64 bits e 32 bits se você estiver
    em uma arquitetura de 32 bits.

        Literais numéricos	Exemplo
        Decimal	            98_222
        Hex	                0xff
        Octal	            0o77
        Binário	            0b1111_0000
        Byte(u8somente)	    b'A'

    TIPOS DE PONTO FLUTUANTE
    Os tipos de pontos flutuantes em RUST são f32 e f64, que têm 32 e 64 bits,
    respectivamente. O tipo padrão usado é: f64 porque, em CPU's modernas, ele
    tem aproximadamente a mesma velociade que, f32 mas é capaz de maior
    precisão. Todos os tipos de pontos flutuante são assinados.

    fn main() {
        let x = 2.0; //f64
        let y: f32 = 3.0; //f32
    }

    TIPO BOOLEANO
    true e false

    fn main() {
        let t = true;
        let f: bool = false; //with explicit type annotation
    }

    TIPO CARACTERE

    fn main() {
        let c = 'z';
        let z: char = 'ℤ'; // with explicit type annotation
        let heart_eyed_cat = '😻';
    }

    TIPO TUPLA
    Um tupla é uma maneira de agrupar uma série de valores com diversos tipos em
    um tipo composto. As tuplas têm cumprimento fixo: uma vez declaradas, não
    podem aumentar ou diminuir tamanho.

    fn main() {
        let tup: (i32, f64, u8) = (500, 6.4, 1);
        let (x, y, z) = tup;
        println!("{} {} {}", tup.0, tup.1, tup.2);
    }

    TIPO DE ARRAY
    Ao contrário de uma tupla todos os elementos de um array devem ser do mesmo
    tipo. Arrays em RUST têm um comprimento fixo.

    fn main() {
        let a = [1, 2, 3, 4, 5];
        println!("{} {}", a[0], a[1]);
    }

    Arrays são úteis quando você deseja que seus dados sejam alocados na pilha,
    assim como os outros tipos que vimos até agora, em vez do heap ou quando
    você deseja garantir que sempre tenha um número fixo de elementos. Um array
    não é flexível quanto o tipo vetor. Um vetor é um tipo de coleção semelhante
    fornecido pela bibioteca padrão que pode aumentar ou diminuir de tamanho.

    Você pode inicializar uma matriz para conter o mesmo valor para cada
    elemento especificando o valor inicial, seguido por um ponto e vírgula e, em
    seguida, o comprimento do array entre colchetes:

    let a = [3; 5];


.............................................................................
    FUNÇÕES

    Declarações e expressões

    Corpos de funções são compostos por uma série de intruções que terminam
    opcionalmente em uma expressão.

        .Intruções são instruções que executam alguma ação e não retornam um
        valor.
        .Expressões são avaliadas como um valor resultante. //expressões não
        incluem ponto e vírgula: ';'.

    Instruções não retornam valores. Portanto, você não pode atribuir um let
    instrução a outra variável, como o código a seguir tenta fazer; você
    receberá um erro:

        fn main() {
            let x = (let y = 6);
        }
        
    Ao executar o programa acima, o compilador enviará um erro. Pois let y = 6 é
    uma instrução.

    fn main() {
        let y = {
            let x = 3;
            x + 1
        };
        println!("The value of y is: {y}"); //4
    }

    Esta expressão: 
    {
        let x = 3;
        x + 1
    }
    é um bloco, neste caso, é avaliado como 4. Esse valor é vinculado a y como
    parte da instrução let. Oberseve que a linha x + 1 não tem ponto e vírgula
    no final, o que é diferente da maioria das linhas que você viu até agora.
    Expressões não incluem ponto vírgula final. Se você adicionar um ponto e
    vírgula ao final de uma expressão, você a transforma em uma instrução, e ela
    não retornará um valor. Tenha isso em mente ao explorar os valores de
    retorno de funções e expressões a seguir.

    FUNÇÕES COM VALORES DE RETORNO
    Funções podem retornar valores para o código que as chama. Não nomeamos os
    valores de retorno, mas devemos declarar seu tipo após uma seta: '->'. Em
    RUST, o valor de retorno da função é sinônimo do valor da expressão final no
    bloco do corpo de uma função. Você pode retornar no início de uma função
    usando a keyboard: return e especificando um valor, mas a maioria das
    funções retorna a última expressão implicitamente. 

    fn five() -> i32 {
        //return 5; 
        //tanto return 5 como 5 dá no mesmo resultado
        5
    }
    fn main() {
        let x = five():
        println!("The value of x is: {x}");
    }

.............................................................................
