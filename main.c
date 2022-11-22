#include <stdio.h>
#include "NumClass.h"

int main()
{
  int num1, num2;
  printf("Enter int 1: ");
  scanf("%d", &num1);

  printf("Enter int 2: ");
  scanf("%d", &num2);

  if (num1 > num2)
  {
    int temp = num2;
    num2 = num1;
    num1 = temp;
  }

  for (int i = num1; i <= num2; i++)
  {
    if (isPrime(i))
    {
      printf("%d ", i);
    }
  }
  
  printf("\n");
  for (int i = num1; i <= num2; i++)
  {
    if (isArmstrong(i))
    {
      printf("%d ", i);
    }
  }

  printf("\n");
  for (int i = num1; i <= num2; i++)
  {
    if (isStrong(i))
    {
      printf("%d ", i);
    }
  }

  printf("\n");
  for (int i = num1; i <= num2; i++)
  {
    if (isPalindrome(i))
    {
      printf("%d ", i);
    }
  }
  printf("\n");
  

  return 0;
}
