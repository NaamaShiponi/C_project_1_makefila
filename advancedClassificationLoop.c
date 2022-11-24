#include <stdio.h>

//will return if a numder is a palindrome.
int isPalindrome(int a){
    int reverse=0;
    int temp=a;
    //Create the word from the end to the beginning.
    while (temp!=0)
    {
    reverse= (reverse*10)+(temp%10);
    temp=temp/10;
    };
   
    if(reverse==a) return 1;
    return 0;
};

//pow function
int powToNum(int n,int powNum){
    int newNum=n;
    for(int i=1;i<powNum;i++){
        newNum=newNum*n;
    };
    return newNum;
} 

//An armstrong number is an n-digit number that is equal to the sum of the nth powers of its digits.
int isArmstrong(int a){
    int contNum=0;
    int sum=0;
    int temp=a;
    //Checks the word length
    while (temp!=0)
    {
        contNum++;
        temp/=10;
    }
    //Raise to the power for each number
    temp=a;
    while (temp!=0)
    {
        sum=sum+(powToNum(temp%10,contNum));
        temp/=10;
    }
    if(sum==a)return 1;
    return 0;
};


