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
