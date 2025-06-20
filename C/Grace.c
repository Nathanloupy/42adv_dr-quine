#include <stdio.h>
#define STR "#include <stdio.h>%c#define STR %c%s%c%c#define FT() int main(){FILE *file = fopen(%cGrace_kid.c%c, %cw%c); if (!file) {return 1;} fprintf(file, STR, 10, 34, STR, 34, 10, 34, 34, 34, 34, 10, 10, 10, 9, 10, 10); fclose(file); return 0;}%cFT()%c/*%c%ccmt%c*/%c"
#define FT() int main(){FILE *file = fopen("Grace_kid.c", "w"); if (!file) {return 1;} fprintf(file, STR, 10, 34, STR, 34, 10, 34, 34, 34, 34, 10, 10, 10, 9, 10, 10); fclose(file); return 0;}
FT()
/*
	cmt
*/
