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


