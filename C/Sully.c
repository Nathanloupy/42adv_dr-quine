#include <stdio.h>
#define STR "#include <stdio.h>%c#define STR %c%s%c%cint main(){%cint i = %d;%cchar fname[] = %cSully_X.c%c;%cwhile (i >= 0){%cif (i > 9) {return 1;}%cfname[6] = '0' + i;%cFILE *file = fopen(fname, %cw%c);%cif (!file) {return 1;}%cfprintf(file, STR, 10, 34, STR, 34, 10, 10, i, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10);%cfclose(file);%ci--;%c}}%c%c"
int main(){
int i = 5;
char fname[] = "Sully_X.c";
while (i >= 0){
if (i > 9) {return 1;}
fname[6] = '0' + i;
FILE *file = fopen(fname, "w");
if (!file) {return 1;}
fprintf(file, STR, 10, 34, STR, 34, 10, 10, i, 10, 34, 34, 10, 10, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10);
fclose(file);
i--;
}}
