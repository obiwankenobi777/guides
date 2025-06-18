.............................................................................
    MAP 
    map(function, iterable)

    function: função aplicada a cada elemento do iterável
    o resultado é um iterador, que você pode converter para lista, tupla, etc

    exemplo:
    def square(x: int) -> int:
        return x ** 2

    def main():
        numbers = [x for x in range(1, 8, 1)]
        result = map(square, numbers)
        print(list(result))
    main()

    USING LAMBDA FUNCTION

    def main():
        numbers = list(range(1, 8, 1))
        result = map(lambda x: x ** 2, numbers)
        print(list(result))
    main()

    a = list(1, 2, 3)
    b = [4, 5, 6]
    sums = map(lambda x, y: x + y, a, b)
    print(list(sums))

    Quando usar map:
        .quando voce quer transformar elementos de uma sequência com uma função
        simples.
        . em tarefas que exigem aplicação uniforme de uma função

.............................................................................
    FILTER
    filter(function, iterable)

    def eh_par(x): return x % 2 == 0

    numbers = [i for i in range(1, 7, 1)]
    result = filter(eh_par, number)
    print(list(result))
    # [2, 4, 6]

    Using lambda function

    numbers = [i for i in range(1, 7, 1)]
    result = filter(lambda x: x % 2 == 0, number)
    print(list(result))
    # [2, 4, 6]

.............................................................................
    PEP 8

    Métodos de classe devem usar cls como nome do promeiro parâmetro
    (referindo-se à classe)

    class Person:
        people = 0

        def __init__(self, name):
            self.name = name
            Person.people += 1

        @classmethod
        def count_people(cls):
            return cls.people

    Dica:
    Use self quando estiver falando de um objeto específico: self.name
    Use cls quando estiver falando de classe como um todo: cls.people
    Use método estático quando a função não depende nem da instância nem da
    classe, mas faz sentido estar ali. Ex: validações simples.


.............................................................................
