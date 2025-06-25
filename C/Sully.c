#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define STR "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c#define STR %2$c%3$s%2$c%1$cint main(){%1$cint i = %4$d;%1$cchar fname[] = %2$cSully_X.c%2$c;%1$cchar exename[] = %2$cSully_X%2$c;%1$cchar compile_cmd[100];%1$cchar run_cmd[100];%1$cchar current_file[100];%1$cif (i < 0) return 1;%1$csprintf(current_file, %2$cSully_%%d.c%2$c, i);%1$cif (!strcmp(current_file, __FILE__)) i--;%1$cfname[6] = '0' + i;%1$cexename[6] = '0' + i;%1$cFILE *file = fopen(fname, %2$cw%2$c);%1$cif (!file) return 1;%1$cfprintf(file, STR, 10, 34, STR, i);%1$cfclose(file);%1$csnprintf(compile_cmd, sizeof(compile_cmd), %2$cgcc -Wall -Wextra -Werror %%s -o %%s%2$c, fname, exename);%1$csystem(compile_cmd);%1$cif (i >= 0) {%1$csnprintf(run_cmd, sizeof(run_cmd), %2$c./%%s%2$c, exename);%1$csystem(run_cmd);%1$c}%1$creturn 0;%1$c}%1$c"
int main(){
int i = 5;
char fname[] = "Sully_X.c";
char exename[] = "Sully_X";
char compile_cmd[100];
char run_cmd[100];
char current_file[100];
if (i < 0) return 1;
sprintf(current_file, "Sully_%d.c", i);
if (!strcmp(current_file, __FILE__)) i--;
fname[6] = '0' + i;
exename[6] = '0' + i;
FILE *file = fopen(fname, "w");
if (!file) return 1;
fprintf(file, STR, 10, 34, STR, i);
fclose(file);
snprintf(compile_cmd, sizeof(compile_cmd), "gcc -Wall -Wextra -Werror %s -o %s", fname, exename);
system(compile_cmd);
if (i >= 0) {
snprintf(run_cmd, sizeof(run_cmd), "./%s", exename);
system(run_cmd);
}
return 0;
}
