#include <stdio.h>

//Create the word from the end to the beginning.
int isPalindromeRecur(int a, int reverso){
    if (a==0) return reverso;
    reverso=(reverso*10)+(a%10);
    return isPalindromeRecur(a/10,reverso);

};

//will return if a numder is a palindrome.
int isPalindrome(int a){
   int reverso=0;
   reverso=isPalindromeRecur(a,reverso);
   if(reverso==a) return 1;
   return 0;
};

//pow function
int powToNum(int n,int powNum){
    if (powNum == 1) return n;
    return powToNum(n,powNum-1)*n;
};





//Checks the word length
int length(int a, int count){
    if (a==0) return count;
    return length(a/10,++count);
};

//Raise to the power for each number
int isArmstrongRecur(int a, int pow){
    if (a==0) return 0;
    return isArmstrongRecur(a/10,pow) + powToNum(a%10,pow);
};


//An armstrong number is an n-digit number that is equal to the sum of the nth powers of its digits.
int isArmstrong(int a){
    int len=length(a,0);
    int sum=isArmstrongRecur(a,len);
    if (a==sum) return 1;
    return 0;
}

