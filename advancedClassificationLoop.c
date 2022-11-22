#include <stdio.h>

int isPalindrome(int a){
    int reverso=0;
    int temp=a;
    while (temp!=0)
    {
    reverso= (reverso*10)+(temp%10);
    temp=temp/10;
    };
   
    if(reverso==a) return 1;
    return 0;
};

int powToNum(int n,int powNum){
    int newNum=n;
    for(int i=1;i<powNum;i++){
        newNum=newNum*n;
    };
    return newNum;
} 

int isArmstrong(int a){
    int contNum=0;
    int sum=0;
    int temp=a;
    while (temp!=0)
    {
        contNum++;
        temp/=10;
    }
    temp=a;
    while (temp!=0)
    {
        sum=sum+(powToNum(temp%10,contNum));
        temp/=10;
    }
    if(sum==a)return 1;
    return 0;
};


