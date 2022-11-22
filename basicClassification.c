#include <stdio.h>


int isPrime(int a){
    if(a==0)return 0;
    for (int i=2; i<a;i++){
        if ((a%i) == 0) return 0;
    }
    return 1;
};

int factorial(int a){
    int factorial=1;
    if (a==0) return 1;
       for (int i = 1; i <= a; i++){
        factorial=i*factorial;
       };
       return factorial;

}

int isStrong(int a){
    int newNum=a;  
    int sum=0;
    while (newNum>0){
       sum+=factorial(newNum%10);
       newNum=newNum/10;  
    };
    if(sum==a) return 1;
    return 0;

    
};

