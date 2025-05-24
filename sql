INTRODUCAO LINGUAGEM SQL
---------------------------------
cp. 4 -> SELECT

select * from nameTable;

select c1, c2, ..., cn from nameTable;

select ci * 777 as account from nameTable;

/*
select c1, c2, c3, round(c3 * 1.07, 2) as taxed_c3 from nameTable;

/* CONCATENAÇÃO DE TEXTO */
select c1, c2 || ', ' || c3 as columnsGeral from nameTable;

/* estilo csv */
select c1 || ',' || c2 || ',' || c3 as csvTable from nameTable where cj between
10 and 999;

---------------------------------

cp. 5 -> WHERE

select * from nameTable where cj = value;

select * from nameTable where cj between value1 and value2;

select * from nameTable where cj != value;
or
select * from nameTable where cj <> value;

select * from nameTable where cj in (v1, v2, v3);

select * from nameTable where cj not in (v1, v2, v3);

select * from nameTable where cj >= v1 and cj <= v3;

select * from nameTable where cj > v1 and vj < v3;

select * from nameTable where cj = v1 or cj = v2 or ci = v4 or cn = v11;

select * from nameTable where ci % 2 == 0;
or 
select * from nameTable where ci % 2 = 0;

/* where com texto */
select * from nameTable where ci = 'str1';

select * from nameTable where ci in ('str1', 'str2', 'str3');

select * from nameTable where ci not in ('str1', 'str2', 'str3');

select * from nameTable where length(c1) != 11;

select * from nameTabel where length(cn) between 20 and 30;

/*
Outra operação comum é o uso de curingas em uma expressão LIKE, onde %
significa qualquer número de caracteres e _ um único caractere.

Para encontrar todas as strings que começam com a letra A, do it:
*/
select * from nameTable where cn LIKE 'A%';

/* se quisessemos encontrar todas as linhas que possuem um B como primeiro
 * caractere e um C como segundo, do it:
*/ 
select * from nameTable where cn LIKE 'B_C%';

select * from ads where cod like '%9_7%';

+----+-------+-----------------------------------------+--------+
| id |  cod  |                  prod                   |  buy   |
+----+-------+-----------------------------------------+--------+
| 5  | 9077  | chicote de fiacao do painel             | 10.4   |
| 27 | 21987 | chave ignicao titan cargo               | 37.56  |
| 48 | 26967 | carburador completo mhx fan titan cargo | 107.99 |
+----+-------+-----------------------------------------+--------+

/*
USANDO WHERE COM BOOLEANOS

*/
---------------------------------
Armazenar o dia da semana em uma tabela

insert into tabela (data, diaSemana) 
values (date(datetime('now')),
    case strftime('%w', date(datetime('now')))
    when '0' then 'sunday'
    when '1' then 'monday'
    when '2' then 'tuesday'
    when '3' then 'wednesday'
    when '4' then 'thursday'
    when '5' then 'friday'
    when '6' then 'saturday'
    end
);

Funções de data/hora úteis
SQLite tem várias funções nativas de data e hora:

date('now') → apenas data

time('now') -> hora atual
time('now', 'localtime') -> horal atual local
time('now', 'localtime', '+3 hours') -> hora atual local +3 horas
time('now', 'localtime', '-3 hours') -> hora atual local -3 horas

datetime('now') → data e hora

strftime('%Y-%m-%d', 'now') → data formatada

strftime('%s', 'now') → timestamp Unix

julianday('now') → dia juliano
