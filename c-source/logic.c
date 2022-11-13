#include <stdio.h>
#include <string.h>

char* logic(char* str, int N1, int N2) {
    char remember;
    while (N1 <= (N1 + N2) / 2) {
        remember = str[N1];
        str[N1] = str[N2];
        str[N2] = remember;
        N1++;
        N2--;
    }
    return str;
}