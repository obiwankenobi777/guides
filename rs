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


.............................................................................
