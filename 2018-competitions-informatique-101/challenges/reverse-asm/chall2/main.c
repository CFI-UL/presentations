#include <stdio.h>

void print_flag() {
  printf("Congratz! Here is your flag : CFI{y3ah_w3_lik3_l33t_sp34k}\n");
}

int get_user_input_number() {
  unsigned int number = 0;
  printf("Enter a number : ");
  scanf("%d", &number);
  return number;
}

void main() {

  if ((get_user_input_number() + get_user_input_number()) * get_user_input_number() == 1338) {
    print_flag();
  }

  printf("Wrong!\n");
}
