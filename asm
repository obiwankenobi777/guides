Um programa geralmente não pode ignorar o sistema operacional nem interagir
diretamente com os recursos que ele controla. Estará limitado às chamadas de
sistema (system calls), que são rotinas oferecidas por um sistema operacional às
aplicações de usuário.

O unix identica um arquivo pelo seu descritor assim que ele é aberto por um
programa. Um descritor nada mais é do que um valor inteiro (como 42 ou 999).

arquivos    valor do descritor      associado
stdin               0               teclado
stdout              1               monitor
stderr              2               monitor

Um arquivo é aberto por meio da chamada de sistem - syscall - open.
Para escrever em um arquivo a syscall utilizado é write. Onde o arquivo: stdin
deve ser usado para isso. Cujo o seu descritor é 0.
Para ler um arquivo a syscall usada é read. 

;hello.asm

global _start
section data
message: db 'hello world', 10

.section text
_start:
    mov     rax, 1      ; o numero da chamada de sistema deve ser armazendo em rax
    mov     rdi, 1      ; argumento #1 em rdi: onde escrever (descritor)?
    mov     rsi, message ; argumento #2 em rsi; onde começa a string?
    mov     rdx, 14     ; argumento #3 em rdx: quantos bytes devem ser escritos?
    syscall             ; essa instrução faz uma chamada de sistema

Um programa assembly pode ser dividido em vários arquivos. Um deles conter o
rótulo _start. É o ponto de entrada e marca a primeira instrução a ser
executada.

A linguagem Assembly é constituída de comandos, que são diretamente mapeados
para código de máquina. Contudo, nem todas as instruções da linguagem são
comandos. Outras controlam o processo de tradução e, com frequência, são
chamadas de diretivas. Exemplo de diretivas: global, section e db.

A diretiva db é usada para criar bytes de dados. Em geral, os dados são
definidos usando uma das diretivas a seguir:
db - bytes
dw - palavras (words) - correspondem a 2 bytes cada;
dd - double words - 4 bytes
dq - quad words - 8 bytes

; data_decl.asm
section .data
example1: db 5, 16, 8, 4, 2, 1
example2: times 999 db 42
example3: dw 99

times n cmd é uma diretiva para repetir cmd n vezes no código do programa. É
como se você copiasse e colasse esse comando n vezes.

É possível criar dados em qualquer seção, inclusive em .text. Como dissemos
antes, para um CPU, dados e instruções são todos semelhantes.

Letras, digitos e outros caracteres são codificados em ASCII.

Palavra de máquina (machine word) - uma machine word em um computador de 64 bits
possuit 64 bits, i.e, 8 bytes. Os registradores de propósito geral têm 64 bits.

INSTRUÇÕES BÁSICAS

mov -> usada para escrever um valor no registrador ou na memória. O valor obtido
pode ser de outro registrador ou da memória, ou pode ser um valor imediato.
Entretanto:
    . mov -> não pode copiar dados da memória para a memória;
    . os operandos de origem e destino devem ter o mesmo tamanho

A instrução syscall é usada para fazer chamadas de sistema (system calls) em
sistema *nix.
Cada chamada de sistema tem um único número. Para executá-la:

1. o registrado rax deve armazenar o número da chamada de sistema.
2. os registradores usados para armazernar seus argumentos são: 
--> rdi, rsi, rdx, r10, r8, r9.
Um chamada de sistema não pode aceitar mais do que seis argumentos.
3. Execute a instrução syscall.





--------------------------------------------------------------------------------
LER ASSEMBLY GERADO PELO GCC:
--------------------------------------------------------------------------------

gcc -S -O0 -fno-omit-frame-pointer foo.c

monte com -> as
link com -> ld
analise com -> objdump -d -Mintel(para sintaxe intel), readelf -h -l -S
debugue com -> gdb

Isso cria uma linha reta entre:
c -> asm -> objeto -> elf -> syscall -> kernel

Como mudar a sintaxe AT&T para INTEL no 'as'?
Basta colocar no topo do arquivo .s: .intel_syntax noprefix
E se quiser voltar para AT&T depois: .att_syntax

.intel_syntax noprefix
.global _start

_start:
    mov rax, 60      # syscall: exit
    xor rdi, rdi     # status = 0
    syscall

Montando de linkando sem o gcc:
as foo.s -o foo.o
ld hell.o -o foo

Executando
./foo


gcc -O3 -S -masm=intel -mtune=native -fverbose-asm foo.c

sub eax, -1
sub $-1, %eax

--------------------------------------------------------------------------------
REGISTRADORES
--------------------------------------------------------------------------------

"Variáveis internas que um programa assembly usará. Na literatura técnica essas
'variáveis' internas são chamadas de 'registradores'".

O modo i386 define 10 registradores de uso geral ou GPRs (General Purpose
Registers). São eles: 

. EAX, EBX, ECX, EDX, ESI, EBP, ESP, EIP, EFLAGS.

Todos possuem 32 bits de tamanho.
Os registradores EIP e EFLAGS são especiais e, normalmente, não são diretamente
acessíveis.

eax -> 'a' significa acumulador
ebx -> 'b' significa base
ecx -> 'c' significa contador
edx -> 'd' significa dados
esi -> 'si' significa source index (índice fonte)
edi -> 'di' significa destination index(índice de destino)
ebp -> 'bp' vem de base pointer (ponteiro base - da pilha)
esp -> 'sp' vem de stack pointer (pointeiro da pilha - do 'topo' da pilha)
eip -> 'ip' é o instruction pointer (ponteiro de instrução)
eflags -> este é resgistrador que contém os flags de status do processador

Apenas esp, eip e eflags têm destino certo e não podem ser usados para outra
coisa.

Registradores que selecionam "segmento" de memória

6 registradores 16 bits usados para selecionar segmentos:
. cs, ds, es, fs, gs, ss. 

E já que eles selecionam segmentos, nada mais justo que sejam conhecidos como
seletores de segmentos. Mas aqui seram chamados de seletores.

Em x86, um seletor de segmento é um valor especial  que a CPU usa para localizar
um segmento de memória. Ele não é o endereço em si - ele aponta para uma
entrada em uma tabela de descritores.
Eles ficam em registradores de segmentos:
. cs - code segment
. ds - data segment
. ss - stack segment
. es - extra segment
. fs - segment extra (muito usado em OSs)
. gs - segment extra

; INTEL
cmp dword [myvar], 0    ; compara o conteúdo da memória apelidada de 'myvar' com
                        ; zero. Esse símbolo referencia uma região de memória
                        ; cujo tamanho deve ser tratado como dword (4 bytes = 32
                        ; bits).

; AT&T
cmpl $0, myvar            

O TAMANHO VEM DO SUFIXO:
b -> byte (8)
w -> word (16)
l -> long (32)
q -> quad (64)

push %eax               ; empilha o conteúdo de eax
push $10                ; empilha o qword imediato 10
pop %eac                ; rcx = [rsp]; rsp = rsp + 8

É possível empilhar valores com tamanhos diferentes?
não, push e pop sempre manterão um alinhamento por dword(no caso do modo i386)
ou qword (no modo x86-64)


