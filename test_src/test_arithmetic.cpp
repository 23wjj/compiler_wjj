int num;
int tmp;
int num_cnt=0;
int sym_cnt=0;
int num_stack[15];
int symbol_stack[15];
int num_tmp[10];
int cnt=0;
int p=2;
int q;
char cc[100];


int calc(){
    int i;
    int res;
    int tmp2;
    i=symbol_stack[sym_cnt-1];
    tmp=num_stack[num_cnt-2];
    tmp2=num_stack[num_cnt-1];
    if(i==43){
        res=tmp+tmp2;
    }
    else{
        if(i==45){
            res=tmp-tmp2;
        }
        else{
            if(i==42){
                res=tmp*tmp2;
            }
            else{
                if(i==47){
                    res=tmp/tmp2;
                }
                else{
                    res=0;
                }
            }
        }
    }
    sym_cnt=sym_cnt-1;
    num_cnt=num_cnt-1;
    num_stack[num_cnt-1]=res;

    return 0;
}

int calc_pri(){
    int i;
    if(sym_cnt==0){
        p=2;
        if(q==1){
            p=0;
        }
        else{
            tmp=0;
        }
    }
    else{
        i=symbol_stack[sym_cnt-1];
        if(i==42){
            p=4;
        }
        else{
            if(i==45){
                p=4;
            }
            else{
                p=3;
            }
        }
    }
    return 0;
}

int deal_sym(){
    if(num==42) {
        q=4;
    }
    else {
        if(num==47) {
            q = 4;
        }
        else {
            if (num == 10) {
                q = 1;
            } else {
                q = 3;
            }
        }
    }

    while(p+1>q){
        calc();
        calc_pri();
    }
    symbol_stack[sym_cnt]=num;
    sym_cnt=sym_cnt+1;
    p=q;

    return 0;
}

int calc_num(){
    int res=0;
    int i=0;
    while(i<cnt){
        res=10*res;
        res=res+num_tmp[i];
        i=i+1;
    }
    cnt=0;
    return res;
}
int main(){
    char a=cc[0];
    int yy[100];
    int l;
    int j=0;
    scanf("%s",cc);
    tmp=0;
    while(cc[tmp]>a){
        yy[tmp]=cc[tmp]-0;
        tmp=tmp+1;
    }
    tmp=tmp-1;
    if(yy[tmp]==10){
        num=0;
    }
    else{
        tmp=tmp+1;
        yy[tmp]=10;
    }
    l=tmp+1;
    while(j<l) {
        num=yy[j];
        if(num>47){
            num_tmp[cnt]=num-48;
            cnt=cnt+1;
        }
        else{
            tmp = calc_num();
            num_stack[num_cnt] = tmp;
            num_cnt = num_cnt + 1;
            deal_sym();
        }

        if(num==10){
            printf("%d\n", num_stack[0]);
            return 0;
        }
        else{
            tmp=0;
        }
        j=j+1;
    }
    return 0;
}