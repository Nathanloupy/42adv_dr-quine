#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define STR "#include <stdio.h>%1$c#define FILENAME %2$c%3$s%2$c%1$c#define STR %2$c%4$s%2$c%1$c#define FT() int main(){FILE *file = fopen(FILENAME, %2$cw%2$c); if (!file) {return 1;} fprintf(file, STR, 10, 34, FILENAME, STR, 9); fclose(file); return 0;}%1$cFT()%1$c/*%1$c%5$ccmt%1$c*/%1$c"
#define FT() int main(){FILE *file = fopen(FILENAME, "w"); if (!file) {return 1;} fprintf(file, STR, 10, 34, FILENAME, STR, 9); fclose(file); return 0;}
FT()
/*
	cmt
*/
