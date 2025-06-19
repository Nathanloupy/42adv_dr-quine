#include <stdio.h>
/*
	cmt1
*/
void hello(){}
int main(){
/*
	cmt2
*/
char *str = "#include <stdio.h>%c/*%c%ccmt1%c*/%cvoid hello(){}%cint main(){%c/*%c%ccmt2%c*/%cchar *str = %c%s%c;%chello();%cprintf(str, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);%creturn 0;}%c";
hello();
printf(str, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 10, 34, str, 34, 10, 10, 10, 10, 10);
return 0;}
