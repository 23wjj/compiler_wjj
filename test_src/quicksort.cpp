int array[10];
char cc[10];
int maxlen=0;
int tmp;

int display()
{
    int i=0;

    while(i<maxlen){
        printf("%d ", array[i]);
        i=i+1;
    }
    printf("\n");

    return 0;
}

int QuickSort( int low, int high)
{
    int i;
    i = low;
    int j;
    j = high;
    int k ;
    k= array[low];
    int flag=1;

    if (low < high){

        while (i < j){
            flag=1;
            while(flag>0){
                if(i<j) {
                    if(array[j]+1>k) {
                        j = j - 1;
                    }
                    else{
                        flag=0;
                    }
                }
                else{
                    flag=0;
                }
            }

            if(i < j){
                array[i] = array[j];
                i=i+1;
            }
            else{
                tmp=0;
            }

            flag=1;
            while(flag>0){
                if(i<j){
                    if(array[i]<k){
                        i=i+1;
                    }
                    else{
                        flag=0;
                    }
                }
                else{
                    flag=0;
                }
            }

            if(i < j)
            {
                array[j] = array[i];
                j=j-1;
            }
            else{
                tmp=0;
            }
        }

        array[i] = k;

        QuickSort(low, i - 1);
        QuickSort(i + 1, high);
    }
    else{
        tmp=0;
    }

    return 0;
}

int main()
{
    int i=0;
    scanf("%d",&maxlen);

    while(i<maxlen)
    {
        scanf("%d", &tmp);
        array[i]=tmp;
        i=i+1;
    }

    QuickSort( 0, maxlen-1);

    printf("排序后的数组\n");
    display();

    return 0;
}