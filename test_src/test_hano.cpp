int move(char x, char y)
{
    int c=0;
    printf("%c->%c\n",x,y);
    return c;
}

int hanoi(int n, char one, char two, char three)
{
    int tmp=1;
    if(n==tmp) {
        move(one, three);
    }
    else
    {
        hanoi(n-tmp, one, three, two);
        move(one, three);
        hanoi(n-tmp, two, one, three);
    }
    return 0;
}

int main()
{
    int m;
    int d=0;
    scanf("%d",&m);
    char a='A';
    char b='B';
    char c='C';
    hanoi(m,a,b,c);
    return 0;
}
