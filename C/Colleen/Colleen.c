#include <stdio.h> //cmt1
void hello(){}
int main(){ //cmt2
char *str = "#include <stdio.h> %c%ccmt1%cvoid hello(){}%cint main(){ %c%ccmt2%cchar *str = %c%s%c;%chello();%cprintf(str, 47, 47, 10, 10, 47, 47, 10, 34, str, 34, 10, 10, 10, 10, 10);%creturn 0;}%c";
hello();
printf(str, 47, 47, 10, 10, 47, 47, 10, 34, str, 34, 10, 10, 10, 10, 10);
return 0;}
