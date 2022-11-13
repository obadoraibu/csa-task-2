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
>[Снимок экрана от 2022-11-13 20-41-22.png](img/Снимок экрана от 2022-11-13 20-41-22.png)

<br>
![Снимок экрана от 2022-10-23 20-40-27](https://user-images.githubusercontent.com/76088544/197407297-ec6192e4-f3fc-4746-b064-0f0a877e04ce.png)
![Снимок экрана от 2022-10-23 20-40-37](https://user-images.githubusercontent.com/76088544/197407300-abf78410-5a68-4159-92c8-31c0267661b9.png)

* Ввод через аргументы командной строки реализован
* Локальные переменные использованы
* Комментарии в [ассемблерный код](asm) добавлены 
* Возможность ввода данных через текстовые файлы добавлена

## Рефакторинг
*     Удален endbr64
*     Удален код сгенерированный gcc после ret
*     Оптимизировано использование регистров процессора (r12d := N1, r13d := N2)

Тесты модифицированного кода:
![Снимок экрана от 2022-10-23 21-47-27](https://user-images.githubusercontent.com/76088544/197410151-4ffa62e2-5d5e-410a-8b7e-32d218c3e010.png)
![Снимок экрана от 2022-10-23 20-39-55](https://user-images.githubusercontent.com/76088544/197407293-1b8aabf4-b768-47b7-8c4b-bd44188e12ef.png)

![Снимок экрана от 2022-10-23 21-47-46](https://user-images.githubusercontent.com/76088544/197410163-59f60266-8369-483b-abcb-8f8d5e63396c.png)
![Снимок экрана от 2022-10-23 20-40-37](https://user-images.githubusercontent.com/76088544/197407300-abf78410-5a68-4159-92c8-31c0267661b9.png)
