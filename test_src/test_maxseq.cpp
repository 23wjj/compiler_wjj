
char a[20];
char b[20];
int c[400];
int n=0;
int m=0;
int i=0;
int j=0;
int k=0;
int tmp1;
int tmp2;

int main()
{

    char tmp=a[19];
    scanf("%s %s",a,b);

    while(a[i]>tmp){
        i=i+1;
        n=n+1;
    }
    i=0;
    while(b[i]>tmp){
        i=i+1;
        m=m+1;
    }
    i=0;
    while(i<n+1){
        tmp1=m+1;
        tmp1=i*tmp1;
        c[tmp1]=0;
        i=i+1;
    }
    i=0;
    while(i<m+1){
        c[i]=0;
        i=i+1;
    }
    i=1;
    while(i<n+1){
        j=1;
        while(j<m+1){
            if(a[i-1]==b[j-1])
            {
                tmp1=m+1;
                tmp1=i*tmp1;
                tmp1=tmp1+j;
                tmp2=m+1;
                k=i-1;
                tmp2=tmp2*k;
                tmp2=tmp2+j-1;
                c[tmp1]=c[tmp2]+1;
            }
            else
            {
                tmp1=i-1;
                k=m+1;
                tmp1=k*tmp1;
                tmp1=tmp1+j;
                tmp1=c[tmp1];
                tmp2=m+1;
                tmp2=tmp2*i;
                tmp2=tmp2+j;
                tmp2=tmp2-1;
                tmp2=c[tmp2];
                k=m+1;
                k=k*i;
                k=k+j;
                if(tmp1>tmp2){
                    c[k]=tmp1;
                }
                else{
                    c[k]=tmp2;
                }
            }
            j=j+1;
        }
        i=i+1;
    }
    tmp1=m+1;
    tmp1=tmp1*n;
    tmp1=tmp1+m;
    printf("%d\n",c[tmp1]);

    return 0;
}
