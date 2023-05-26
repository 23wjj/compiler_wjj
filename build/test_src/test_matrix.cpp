int main()
{
    int M;
    int N;
    int P;
    int a[100];
    int b[100];
    int i=0;
    int j=0;
    int k=0;
    int sum=0;
    int tmp1;
    int tmp2;
    int tmp;
    scanf("%d %d %d", &M, &N, &P);
    while(i<M*N){
        scanf("%d", &tmp);
        a[i]=tmp;
        i = i+1;
    }

    i=0;
    while(i<N*P){
        scanf("%d", &tmp);
        b[i]=tmp;
        i = i+1;
    }
    i=0;
    while(i<M){
        j=0;
        while(j<P){
            sum=0;
            k=0;
            while(k<N){
                tmp1 = a[N*i+k];
                tmp2 = b[P*k+j];
                sum = sum + tmp1*tmp2;
                k = k+1;
            }
            if(j==0) {
                printf("%d", sum);
            }
            else {
                printf(" %d", sum);
            }
            j = j+1;
        }
        printf("\n");
        i = i+1;
    }

    return 0;
}
