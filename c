.......................................................
    CONDITIONAL OPERATOR / TERNARY OPERATOR
    a = b ? c : b

    is equivalent to:

    if (b) a = c;
    else a = d;

    The conditional operator associates from right to left. Consider the following:
    exp1 ? exp2 : exp3 ? exp4 : exp5

    As the association is from right to left, the above expression is evaluated as
    exp1 ? exp2 : (exp3 ? exp4 : exp5)

.......................................................
    FUNCTION CALL OPERATOR

    int func(int x, int y) { return x + y; }
    int (*ptr)(int, int) = &func;

    deferrence implicity
    printf("(*ptr)(%d, %d) = %d\n", (*ptr)(1, 3));

    derreference explicity
    printf("ptr(%d, %d) = %d\n", ptr(1, 1));

.......................................................
    EXIT_SUCCESS, EXIT_FAILURE

    EXIT_SUCCESS -> indica que o programa terminou com 
    sucesso
    EXIT_FAILURE -> indica que o programa terminou com
    falha (ou erro)

    #include <stdio.h>
    #include <stdlib.h>
    int main(void) {
        FILE* f = fopen("nameFile", "r");
        if (!f) {
            perror("Error opening failued");
            return EXIT_FAILURE;
        }
        fclose(f);

        return EXIT_SUCCESS;
    }

.......................................................
    TECNICAS PARA IMPRESSAO LENTA NO TERMINAL

    FILE* f = fopen("nameFile", "r");
    struct timespec delay;
    delay.tv_sec = 0;
    delay.tv_nsec = 100000000L;

    int ch;
    for (int i = 0; i < ftell(f); ++i) {
        fseek(f, i, SEEK_SET);
        ch = fgetc(f);
        printf("%c", ch);
        fflush(stdout);
        nanosleep(&delay, NULL); // in <time.h>
    }

.......................................................
