# Архитектура вычислительных систем - ИДЗ 2
# Завьялов Егор БПИ-217 Вариант 1

## Структура:
[Ассемблерный код без модификаций](asm)

[Ассемблерный код с модификациями](asm-mod)

[Код на Си](c-source)

[Тесты](tests)



## Компиляция кода на Си:
```
gcc main.c -c -o main.o
gcc logic.c -c -o logic.o
gcc main.o logic.o -o out
```
## Компиляция кода на Ассемблере:
```
gcc main.s -c -o main.o
gcc logic.s -c -o logic.o
gcc main.o logic.o -o out
```
## Запуск:
```
./out
str(строка)
N1 N2 (индексы от 0 до length(str))
```
или
```
./out path_to_input.txt path_to_output.txt
```
для ввода через input.txt

## Запуск тестов:
```
<executable> < test1.in // Далее результат руками сравнивается с содержанием файла test1.out
// test2.in также доступен
```
# Отчёт

[Код на Си](c-source) - 2 единицы компиляции

Макросы в [ассемблерном коде](asm) убраны с помощью аргументов командной строки:
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
```
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./logic.c \
    -S -o ./logic.s
```
Код на ассемблере отдельно скомпилирован и проходит тесты:
>![asm1](img/asm1.png)
>![res1](img/res1.png)
>![asm2](img/asm2.png)
>![res2](img/res2.png)

* Ввод через аргументы командной строки реализован
* Локальные переменные использованы
* Комментарии в [ассемблерный код](asm) добавлены 
* Возможность ввода данных через текстовые файлы добавлена

## Рефакторин
*     Удален endbr64
*     Удален код сгенерированный gcc после ret
*     Оптимизировано использование регистров процессора (r12d := N1, r13d := N2)

Тесты модифицированного кода:
>![asm_mod1](img/asm_mod1.png)
>![res1](img/res1.png)

>![asm_mod2](img/asm_mod2.png)
>![res2](img/res2.png)
