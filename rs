.............................................................................
    THE RUST PROGRAMMING LANGUAGE
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
    FLUXO DE CONTROLE
    fn main() {
        let x = 3;
        if x < 5 {
            println!("condition was true");
        }
        esle {
            println!("condition was false");
        }
    }
    Vale ressaltar que condição neste código dever um bool. Se a condição não
    for um bool, ocorrerá um erro.
    fn main() {
        let number = 3;
        if number {
            println!("This is a mistake");
        }
    }
    O código acima está errado. Ao contrário de rust linguagens como ruby e
    javascript, o RUST não tenta converter automaticamente tipos não booleanos
    em um booleano. Você deve ser explícito e sempre fornecer if um booleano
    como condição.

    Lidando com múltiplas condições com if else

    fn main() {
        let number = 6;

        if number % 4 == 0 {
            println!("number is divisible by 4");
        } else if number % 3 == 0 {
            println!("number is divisible by 3");
        } else if number % 2 == 0 {
            println!("number is divisible by 2");
        } else {
            println!("number is not divisible by 4, 3, or 2");
        }
    }
    
    Usando if em uma let declaração.

    fn main() {
        let condition = true;
        let number = if condition { 5 } else { 6 };

        println!("The value of number is: {number}");
    }

    LOOPS
    RUST possui três tipos de loops: loop, while e for. 

    fn main() {
        let mut i = 0;
        loop {
            println!("Again");
            if i < 10 break;
        }
    }

.............................................................................
    TUPLES EM RUST

    Uma tupla é uma maneira de agrupar uma série de valores com diversos tipos
    um tipo composto. As tuplas têm um comprimento fixo: uma vez declaradas,
    não podem aumentar ou diminuir de tamanho.

    fn main() {
        let tup: (i32, f64, u8) = (500, 6.4, 1);
        let (x, y, z) = tup;
        println!("The value of y is {y}");

        //acessando os valores das tuplas
        let five_hundred = x.0;
        let six_pointer_four = x.1;
        let one = x.2;
    }

.............................................................................
    ARRAYS EM RUST

    Outra maneira de criar uma coleção de múltiplos valores é com um array. Ao
    contrário de uma tupla todos os elementos de um array devem ter o mesmo
    tipo. Ao contrário de arrays em algumas outras linguagens, arrays em RUST
    têm um comprimento fixo.
    
    fn main() {
        let a = [1, 2, 3, 4, 5];
        let b = [3; 5]; // [3, 3, 3, 3, 3, 3]

        let arr: [i32; 5] = [1, 2, 3, 4, 5];

        let first = arr[0];
        let second = arr[1];
    }

.............................................................................
    STRUCTS EM RUST

    struct User {
        active: bool,
        username: String,
        email: String,
        sign_in_cout: u64,
    }
    fn main() {
        ler mut user1 = User {
            active: true,
            username: String::from("useradm"),
            email: String::from("user@email.com"),
            sign_in_count: 1,
        };
        user1.eamail = String::from("user1@email.com");

        //criando instancias de outras instancias com sintaxe de atualizacao de
        //estrutura
        let user2 = User {
            active: user1.active,
            username: user1.name,
            email: String::from("user2@emai.com"),
            sign_in_count: user1.sign_in_count
        };

        //usando a sintax de atualizacao de struct, podemos obter o mesmo efeito
        //com menos codigo, com a sintaxe '..'.
        let user2 = User {
            email: String::from("user2@emai.com"),
            ..user1
        };
    }
    fn build_user(email: String, username: String) -> User {
        User {
            active: true,
            username = username,
            email = email,
            sign_in_count: 1,
        }
    }

    A função build_user pode ser construída usando a abreviação de campo:

    fn build_user(email: String, username: String) -> User {
        User {
            active: true,
            username,
            email,
            sign_in_count: 1, 
        }
    }

    USANDO ESTRUTURAS DE TUPLA SEM CAMPOS NOMEADO PARA CRIAR TIPOS DIFERENTES

    Estruturas de tuplas são úteis quando você deseja dar um nome à tupla
    inteira e torná-la um tipo diferente das outras tuplas, e quando nomear cada
    campo como em uma estrutura normal seria prolixo ou reduntante.

    struct Color(i32, i32, i32);
    struct Point(i32, i32, i32);

    fn main() {
        let black = Color(0, 0, 0);
        let origin = Point(0, 0, 0);
    }

    //EXAMPLE 1

    struct Rectangle {
        width: u32,
        height: u32,
    }
    fn area(rectangle: &Rectangle) -> u32 {
        rectangle.widht * rectangle.height
    }
    fn main() {
        let rect1 = Rectangle { width: 30, height: 50 };
        println!(
            "The area of the rectangle is {} square pixels.", 
            area(&rect1)
        );
    }

    //EXAMPLE 2

    #[derive(Debug)]
    struct Rectangle {
        widht: u32,
        height: u32,
    }
    impl Rectangle {
        fn area(&self) -> u32 {
            self.widht * self.height
        }
        //verifica se um retangulo cabe no outro
        fn can_hold(&self, other: &Rectangle) -> bool {
            self.widht > other.width && self.height > other.height
        }
    }
    fn main() {
        let rect1 = Rectangle {
            widht: 30,
            height: 50,
        };
        println!("rect1 is {rect1:?}");
        println!(
            "The area of rectangle is {} square pixels",
            rect1.area()
        );
    }

.............................................................................
    MACROS

    macro_rules! <nome> {
        (padrao1) => (acao);
        (padrao2) => (acao);
        (padrao3) => (acao);
        ...
        (padraon) => (acao);
    }

    ou

    macro_rules! <nome> {
        (padrao1) => {
            acao1;
            acao2;
            ...
            acaon;
        };
        ...
        (padraon) => {
            acao1;
            ...
            acaon;
        };
    }

    EXEMPLO 1:

    macro_rules! escreva {
        ($esc:expr) => (print!(concat!($esc, "\n")));
        ($esc:expr, $($param:tt)*) => (print!(concat!($esc, "\n"), 
        $($param)*));
    }
    fn main() {
        escreva!("i am a rustacean... BTW!");
    }


.............................................................................
    PROPRIEDADE

    REGRAS DA PROPRIEDADE
    .cada valor em RUST em um proprietário;
    .só pode haver um proprietário por vez;
    .quando o proprietário sai do escopo, o valor será descartado.

