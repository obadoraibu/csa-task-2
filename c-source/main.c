#include <stdio.h>
#include <stdlib.h>

extern char* logic(char* str, int N1, int N2);

int main(int argc, char *argv[]) {
    int N1, N2;
    
    char str[256];

    if (argc == 3) {   
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("Error");
            return 0;
        }
        fgets(str, sizeof(str), input);
        fscanf(input, "%d", &N1);
        fscanf(input, "%d", &N2);
        fclose(input);

        FILE *output = fopen(argv[2], "w");
        fprintf(output, "%s ", logic(str, N1, N2));
        fclose(output);
        return 0;
    }
    printf("Enter string (256 length max): ");
    fflush(stdin);
    fgets(str, 256, stdin);
    scanf("%d", &N1);
    scanf("%d", &N2);
    printf("%s ", logic(str, N1, N2));
    
    return 0;
}