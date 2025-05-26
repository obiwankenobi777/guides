.......................................................
    PROCESSAMENTO DE ARQUIVO

    O c++ visualiza cada arquivo como uma sequência de bytes. Onde cada arquivo
    termina com um marcador de fim de arquivo ou em um número específico de byte
    registrado em uma estrutura de dados administrativa mantida pelo sistema.
    Quando um arquivo é aberto um objeto é criado e um fluxo é associado com o
    objeto. Os fluxos associados com esses objetos fornecem canais de comunicação entre
    um programa e um arquivo ou dispositivo particular.
    Para realizar processamento de arquivo c++, os arquivos de cabeçalho
    <iostream> e <fstream> devem ser íncluídos. Onde: basic_ifstream(para entrada de
    arquivo), basic_ofstream(para sáida de arquivo) e basic_fstream(para a entrada e saída de
    arquivo).

.......................................................

    std::ofstream out("nameFile", std::ios::out);
    if (!out) {
        std::cerr << "File could not be opened!\n";
        return 1; 
    }
    std::string name; 
    int age;
    std::cout << ">> ";
    while (cin >> name >> age) {
        std::cout << ">> ";
        out << name << " | " << age << '\n';
    }
    out.close();

.......................................................

    std::ofstream out;
    if (!out) {
        std::cerr << "File could not be opened!\n";
        return 1;
    }
    out.open("file");
    out << "C++ is very good!\n";
    out.close();

.......................................................

    Para se posicionar o cursor em um dado local to arquivo tem-se:
    in.seekg('seek get') em ifstream e out.seekp('seek put') para ostream. Assim
    in.seekg(0) posiciona o ponteiro de posição de arquivo no começo do arquivo.
   Um segundo argumento pode ser especificado para indicar a direção de busca
    (seek direction). A direção de busca pode ser ios::beg (o padrão) para o
    posicionmento em relação ao fim de um fluxo. 

    ios::beg    -> para o posicionamento em relação ao inicio do fluxo
    ios::cur    -> para o posicionamento em relação à posição atual de um fluxo
    ios::end    -> para o posicionamento em relação ao fim de um fluxo

.......................................................

    std::ifstream in;
    in.open("file");

    posiciona para o enésimo byte de in (supõe std::ios::beg)
    in.seekg(n)

    posiciona n bytes para a frente em in
    in.seekg(n, std::ios::cur);

    posiciona n bytes para trás a partir do fim de in
    in.seekg(n, std::ios::end);

    posiciona no fim de in
    in.seekg(0, std::ios::end)

.......................................................
    
    As funçõ̀es-membro tellg e tellp de ifstream e ofstream, respectivamente são
    fornecidas para retornar as localizações atuais dos ponteiros "get" e "up",
    respectivamente. A seguinte instrução atribui o valor do ponteiro de posição de
    aruivo "get" à variável location de tipo long:

    std::ifstream in;
    in.open("file");
    location = in.tellg():
    in.close();

    std::ofstream out;
    out.open("file");
    location = out.tellp;
    out.close();

.......................................................

    //ESCREVENDO E LENDO DE ARQUIVO TEXTO
    #include <iostream>
    #include <fstream>
    #include <string>

    int main() {
        std::ofstream out;
        out.open("file");
        if (!out) {
            std::cerr << "Arquivo nao aberto para escrita!\n";
            return 1;
        }
        out << "I love C++";
        out << "I will be the bester C++ developer!\n";
        out.close();

        std::ifstream in;
        in.open("file");
        if (!in) {
            std::cerr << "Arquivo nao aberto para leitura\n";
            return 1;
        }
        std::string line;
        while (std::getline(in, line)) {
            std::cout << line << '\n';
        }
        in.close();
        
        return 0;
    }

.......................................................

    STRING E PROCESAMENTO DE STRING

    std::getline é uma função da biblioteca que lê uma linha inteira da entrada
    (std::cin ou outro std::ifstream) e coloca essa linha numa std::string.

    std::getiline(std::cin, str) lê tudo que o usuário digitar até encontrar um
    '\n'. Diferentemente std::cin >> str, que para no primeiro espaço, std::getline pega a
    linha inteira (com espaços).

    Usar std::cin >> antes de std::getline, pode dar problemas porque o cin
    deixa um '\n' na entrada, e std::getline pega esse '\n' vazio.
    Nesse caso, é comum limpar o buffer com std::cin.ignore() antes de usar
    getline.

.......................................................

    #include <iostream>
    #include <string>
    int main() {
        int idade;
        std::string nome;

        std::cout << "Digite sua idade: ";
        std::cin >> idade;

        std::cin.ignore(); // <-- limpa o '\n' que ficou depois do número

        std::cout << "Digite seu nome completo: ";
        std::getline(std::cin, nome);

        std::cout << "Idade: " << idade << ", Nome: " << nome << '\n';
    }

.......................................................

    MÉTODOS AT, ASSIGN COMPARE, SUBSTR, FIND, RFIND, FIND_FIRST_OF,
    FIND_LAST_OF, FIND_FIRST_NOT_OF, APPEND

    MÉTODO AT:

    char& at(size_t pos);
    const char& at(size_t pos) const;

    std::string str = "arch";
    char ch = str.at(0) // ch = 'a';
    char ch = str.at(1) // ch = 'r';
    char ch = str.at(2) // ch = 'c';
    char ch = str.at(3) // ch = 'h';

    MÉTODO ASSIGN:

    string& assign(const string& str);
    string& assign(const string& str, size_t pos, size_t len);
    string& assign(const char* s);
    string& assign(const char* s, size_t n);
    string& assign(size_t n, char c);

    assign(str): copia str inteira para a string atual.
    assign(str, pos, len): copia len caracteres a partir da posição pos de str.
    assign(s): copia a string C (char*) até o caractere nulo \0.
    assign(s, n): copia exatamente n caracteres do ponteiro s.
    assign(n, c): cria uma string com n cópias do caractere c.

    MÉTODO COMPARE

    int compare(const std::string& str) const;

    Retorna 0 se as strings forem iguais.
    Retorna um valor negativo se o objeto da esquerda (this) for menor que str.
    Retorna um valor positivo se o objeto da esquerda (this) for maior que str.

    std::string a = "apple", b = "banana";
    int result = a.compare(b);

    MÉTODO SUBSTR

    std::string s = "the airplane landed on time";
    std::cout << s.substr(7, 5) << '\n';

    MÉTODO FIND, RFIND, FIND_FIRST_OF, FIND_LAST_OF, FIND_FIRST_NOT_OF

    find -> busca do começo da string ao final

    size_t pos = s.find('o', 5); // Procura 'o' a partir da posição 5

    rfind -> do fim da string para o inicio

    std::string s = "hello world";
    size_t pos = s.rfind('o');
    if (pos != std::string::npos) {
    std::cout << "Último 'o' em: " << pos << '\n';
    } else {
        std::cout << "Não encontrado\n";
    }

    find_first_of -> procura o caractere que esteja em um conjunto de caracteres

    std::string s = "abcdefg";
    size_t pos = s.find_first_of("de");
    if (pos != std::string::npos) {
        std::cout << "Encontrado '" << s[pos] << "' em: " << pos << '\n';
    }
    
    find_last_of -> procura o último caractere que esteja em um conjunto de
    caracteres

    std::string s = "abcdefg";
    size_t pos = s.find_last_of("de");

    if (pos != std::string::npos) {
        std::cout << "Encontrado '" << s[pos] << "' em: " << pos << '\n';
    }

    find_first_not_of
    Procura o primeiro caractere que não esteja em um conjunto de caracteres

    std::string s = "aaaabbbbcdef";
    size_t pos = s.find_first_not_of("ab");

    if (pos != std::string::npos) {
        std::cout << "Primeiro não 'a' ou 'b': '" << s[pos] << "' em: " << pos << '\n';
    }

       # Essas funções são muito usadas em situações como:
       # Pular espaços em branco (find_first_not_of(" \t\n"))
       # Encontrar qualquer caractere separador (ex: find_first_of(",;|"))
       #  Ler palavras ou tokens manualmente

    MÉTODO APPEND

    std::string a = "Hello";
    a.append(" ");
    a.append("World");

    std::cout << a << '\n'; // Saída: Hello World

    ITERADORES EM STRINGS
    A classe string fornece iteradores para percorrer strings para frente e
    para trás. Os iteradores fornecem acesso aos caracteres individuais com uma
    sintaxe semelhante às operações de ponteiro.

    std::string str = "hello, elliot";

    std::string::const_iterator it = str.begin();
    //O iterador é inicializado para o inicio de str.

    std::string::const_iterator it = str.end()
    //O iterador é inicializado para o fim de str.

    EXAMPLES

    std::string s = "Hello, Elliot";

    std::string::const_iterator it = s.begin();
    while (it != s.end()) { 
        std::cout << *it;
        ++it;
    }
    std::cout << '\n';

    //or

    for (std::string::cont_iterator it = s.begin(); it != s.begin(); ++it) 
        std::cout << *it;
    std::cout << '\n';

    //PERCORRE A STRING DE TRÁS PARA FRENTE
    std::string::const_iterator it1 = s.end();
    while (it1 != s.begin()) {
        --it1;
        std::cout << *it1;
    }
    std::cout << '\n';

    //or

    for (std::string::const_iterator rit = s.rbegin(); rit != s.rend(); ++rit) 
        std::cout << *rit;
    std::cout << '\n';


.......................................................

    COLORS

    Código  | Cor do Texto  | Código    | Cor do Fundo
    30      | Preto         | 40        | Fundo Preto
    31      | Vermelho      | 41        | Fundo Vermelho
    32      | Verde         | 42        | Fundo Verde
    33      | Amarelo       | 43        | Fundo Amarelo
    34      | Azul          | 44        | Fundo Azul
    35      | Magenta       | 45        | Fundo Magenta
    36      | Ciano         | 46        | Fundo Ciano
    37      | Branco        | 47        | Fundo Branco

    Código  | Cor Viva (Texto)
    90      | Preto Claro
    91      | Vermelho Claro
    92      | Verde Claro
    93      | Amarelo Claro
    94      | Azul Claro
    95      | Magenta Claro
    96      | Ciano Claro
    97      | Branco Claro

    Código  | Efeito
    0       | Reset (padrão)
    1       | Negrito
    4       | Sublinhado
    7       | Inverter cores


    EXAMPLES

    #include <iostream>

    int main() {
        std::cout << "\033[31mTexto Vermelho\033[0m" << std::endl;
        std::cout << "\033[32;40mVerde com fundo preto\033[0m" << std::endl;
        std::cout << "\033[1;34mTexto Azul em Negrito\033[0m" << std::endl;
        return 0;
    }

.......................................................
    //book progcpp.pdf
    std::vector<Person *> p(100);
    for (int i = 0; i < 100; ++i) {
        std::cin >> name >> age
        p[i] = new Person(name, age);
    }

    for (int i = 0; i < 100; ++i) {
        delete p[i];
        p[i] = NULL;
    }

    //chatgpt
    //Em c++ moderno c++11 em diante, é melhor evitar ponteiros brutos e preferir
    //std::unique_ptr para gerenciamento automático de memória
    //sem alocação de memória

    std::vector<std::unique_ptr<Person>> p(100);

    for (int i = 0; i < 100; ++i) {
        std::string name;
    int age;
    std::cin >> name >> age;
    p[i] = std::make_unique<Person>(name, age);
    }

    //book progcpp.pdf
    //

    std::vector<Person> p;
    for (int i = 0; i < 100; ++i) {
        std::string name;
        int age;
        std::cin >> name >> age;
        p.push_back({name, age});
    }

.......................................................

    SOBRECARGA DE OPERADORES
    
    Muitas vezes, é conveniente sobrecarregar o operador<< do fluxo
    de saída para classes personalizadas. O objeto std::cout (e, portanto
    a classe std::ostream) possui métodos sobrecarregados chamados operator<<
    que nos permitem imprimir tipos primitivos, como inteiros e números de 
    ponto flutuante. Se criarmos um novo tipo como, a classe std::ostream não
    possui o método operator<< incorporado para manipular objetos do novo tipo.
    Para usar o operator<< de std::cout com objetos definidos pelo programador,
    precisamos definir uma função de operador glogal do tipo:

    std::ostream& operator<<(std::ostream& os, signalColor color);

    onde signalColor é:
     
    enum class signalColor { Red, Green, Yellow };
    std::string toString(signalColor color) {
    switch(color) {
        case signalColor::Red: return "Red";
        case signalColor::Green: return "Green";
        case signalColor::Yellow: return "Yellow";
        default: return "Unknow";
    }
    }

    std::ostream& operator<<(std::ostream& os, signalColor color) {
        return os << toString(color);
    }

    int main() {
        signalColor color = signalColor::Green;

        std::cout << color << '\n'; //Green
        
        return 0;
    }

    class Person {
        std::string name, distro; int age;
        public:
        ...

        //sobrecarga do operador << para a class person
        friend std::ostream& operator<<(std::ostream& os, const Person& p) {
            os << p.name << ", " << p.age << ", " << p.distro << "\n";
            return os;
        }
    };
    int main() {
        Person me("Adão Modesto", 76, "ArchLinux");
        std::cout << me;
    }

.......................................................

    //UTILS

    std::ostream& operator<<(std::ostream& os, const std::vector<int>& v) {
        os << '{';
        int n = v.size();
        if (n > 0) {
            os << v[0];
                for (int i = 1; i < n; ++i) 
                    os << ',' << v[i];
        }
        os << '}';
        return os;
    }

---------------------------------

    #include <iostream>
    #include <vector>

    int main() {
        std::vector<int> list(10,5);
        std::putchar('[');
        for (int i = 0; i < list.size(); ++i) {
            std::cout << list[i] << (i < list.size() - 1 ? ", " : "]");
        }
        std::cout << '\n';

        return 0;
    }

.......................................................
    
    VIRTUAL FUNCTION 

    #include <iostream>
    class A {
        public:
            virtual void func() {
                std::cout << "I am func in A\n";
            }
    };
    class B : public A {
        public:
            void func() {
                std::cout << "I am func in B\n";
            }
    };
    class C : public A {
        public:
            void func() override {
                std::cout << "I am func in C\n";
            }
    };
    void foo(A& a) {
        a.func();
    }
    int main() {
        A a;
        B b;
        C c;
        foo(a);
        foo(b);
        foo(c);

        return 0;
    }
    output:
    ~/code/cpp/ $ ./foo
    I am func in A
    I am func in B
    I am func in C

    Como func() é virtual, o C++ chama a implementação correta
    em tempo de execução.
    Se a função não fosse virtual, o C++ chamaria sempre a versão
    da classe base (A), mesmo que você passasse um B ou C.

.......................................................
    FUNÇÕES LAMBDA

    [capturas](parâmetros) especificadores -> tipo_retorno { corpo_funcao };

    Captura([]) -> define quais variáveis de escopo a lambda pode acessar e
    como(valor ou referência).
    Parâmetros(()) -> lista de parâmetros, como em uma função normal. Pode ser
    vazia. 
    Especifadores -> opicional, como mutable (permite modficar variáveis
    capturadas por valor).
    Tipo de retorno(->) -> opcional, especifica o tipo retornado. Se omitido, é
    inferido automaticamente.
    Corpo da função({}) -> O código a ser executado.

    auto sum = [](int a, int b) -> int { return a + b; };
    std::cout << sum(1, 1001);

    auto mul = [](int a, int b){ return a * b; };
    std::cout << mul(23, 93) << '\n';

    Capturas

    As capturas determinam como variáveis externas são acessadas:

    . []: sem captura, não acessa variáveis externas;
    . [x]: captura o valor da variável x(cópia, imutável por padrão);
    . [&x]: captura x por referência (modificações afetama variávelo original);
    . [=]: captura todas as variáveis do escopo por valor;
    . [&]: captura todas as variáveis do escopo por referência;
    . [this]: captura o ponteiro this(usado em classes);

    . Combinações: [x, &y] x por valor e y por referência

    int x = 7;
    auto lambda = [x]() { std::cout << x << '\n'; };
    lambda();

    Especificador mutavel
    
    int x = 10;
    auto lambda = [x]() mutable { x++; return x; };
    std::cout << lambda();
    std::cout << x;

    Uso com STL
    
    std::vector<int> v{11, 13, 17, 19};
    std::sort(v.begin(), v.end(), [](int a, int b) { return a > b; });

    Armazenametos e tipos
    . Uma lambda é um objeto de um tipo anônimo gerado pelo compilador (um
    closure).
    . Pode ser armazenada em uma variável com auto ou em std::function para
    maior flexibilidade

    #include <functional>
    std::function<int(int, int)> func = [](int a, int b) { return a + b; };

    Quando usar lambdas
    . Para funções curtas e locais, evitando a necessidade de declarar funções
    nomeadas
    . Em algoritmos STL ou APIs que aceitem funções como argumentos
    . Para capturar contexto local de forma conveniente

    std::vector<int> n {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    std::vector<int> evens;
    std::copy_it(n.begin(), n.end(), std::back_inserter(evens), 
        [](int n){ return n % 2 == 0; });


.......................................................
