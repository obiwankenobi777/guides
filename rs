.............................................................................
    VARIÁVEIS

    Em rust há dois tipos de variáveis: mutáveis e imutáveis. Uma variável
    imutável (definida pelos comando let mut) é aquela que possibilita alteração
    de seu valor após a definição de um valor a ela quer poderá ser feita a
    qualquer momento no programa a partir de um única entrada.

.............................................................................

    fn main() {
        println!("=== REPRESENTAÇÃO DE VALORES ===");
        println!("Decimal: {}", 1_234);
        println!("Hexadecimal (0xab): {}", 0xab);
        println!("Octal (0o12): {}", 0o12);
        println!("Binário (0b1111_1010): {}", 0b1111_1010);

        println!("\n=== VALORES MÁXIMOS E MÍNIMOS ===");

        // Inteiros com sinal
        println!("i8   -> MIN: {:>20}, MAX: {}", i8::MIN, i8::MAX);
        println!("i16  -> MIN: {:>20}, MAX: {}", i16::MIN, i16::MAX);
        println!("i32  -> MIN: {:>20}, MAX: {}", i32::MIN, i32::MAX);
        println!("i64  -> MIN: {:>20}, MAX: {}", i64::MIN, i64::MAX);
        println!("i128 -> MIN: {:>20}, MAX: {}", i128::MIN, i128::MAX);

        // Inteiros sem sinal
        println!("u8   -> MIN: {:>20}, MAX: {}", u8::MIN, u8::MAX);
        println!("u16  -> MIN: {:>20}, MAX: {}", u16::MIN, u16::MAX);
        println!("u32  -> MIN: {:>20}, MAX: {}", u32::MIN, u32::MAX);
        println!("u64  -> MIN: {:>20}, MAX: {}", u64::MIN, u64::MAX);
        println!("u128 -> MIN: {:>20}, MAX: {}", u128::MIN, u128::MAX);

        // Float
        println!("\n=== FLOATS ===");
        println!("f32  -> MIN: {:e}, MAX: {:e}", f32::MIN, f32::MAX);
        println!("f32  -> MIN_POSITIVE: {:e}", f32::MIN_POSITIVE);

        println!("f64  -> MIN: {:e}, MAX: {:e}", f64::MIN, f64::MAX);
        println!("f64  -> MIN_POSITIVE: {:e}", f64::MIN_POSITIVE);
    }

.............................................................................
