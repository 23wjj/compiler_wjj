int main(){
    int i;
    int a=2;
    int tmp;
    scanf("%d", &i);

    if(i==1){
        printf("0");
        return 0;
    }
    else{
        tmp=0;
    }

    if(i==2){
        printf("1");
        return 0;
    }
    else{
        tmp=0;
    }

    while(a<i/2+1){
        if (i%a==0){
            printf("0");
            return 0;
        }
        else{
            tmp=0;
        }
        a=a+1;
    }
    printf("1");
    return 0;
}