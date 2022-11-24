#include <stdio.h>

//will return if a number is prime
int isPrime(int a){
    if(a==0)return 0;
    for (int i=2; i<a;i++){
        if ((a%i) == 0) return 0;
    }
    return 1;
};


//factorial function
int factorial(int a){
    int factorial=1;
    // 0!==1
    if (a==0) return 1;
       for (int i = 1; i <= a; i++){
        factorial=i*factorial;
       };
       return factorial;

}


//Strong number is a special number whose sum of the factorial of digits is equal to the original number.
int isStrong(int a){
    int newNum=a;  
    int sum=0;
    if (a==0) return 0;
    while (newNum>0){
       sum+=factorial(newNum%10);
       newNum=newNum/10;  
    };
    if(sum==a) return 1;
    return 0;

    
};

