#include <stdio.h>

int isPalindromeRecur(int a, int reverso){
    if (a==0) return reverso;
    reverso=(reverso*10)+(a%10);
    return isPalindromeRecur(a/10,reverso);

};

int isPalindrome(int a){
   int reverso=0;
   reverso=isPalindromeRecur(a,reverso);
   if(reverso==a) return 1;
   return 0;
};

int powToNum(int n,int powNum){
    if (powNum == 1) return n;
    return powToNum(n,powNum-1)*n;
};

int length(int a, int count){
    if (a==0) return count;
    count+=1;
    return (count+(length(a/10,count)));
};

int isArmstrongRecur(int a, int pow){
    if (a==0) return 0;
    return isArmstrongRecur(a/10,pow) + powToNum(a%10,pow);
};

int isArmstrong(int a){
    int len=length(a,0);
    int sum=isArmstrongRecur(a,len);
    if (a==sum) return 1;
    return 0;
};

