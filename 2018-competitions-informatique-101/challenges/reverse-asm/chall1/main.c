#include <stdio.h>

void print_flag() {
  printf("Congratz! Here is your flag : CFI{d1d_y0u_run_str1ngs?}\n");
}

int get_user_input_number() {
  unsigned int number = 0;
  printf("Enter a number : ");
  scanf("%d", &number);
  return number;
}

int main(int argc, char *argv[]) {


  if (get_user_input_number() == 0x13371337) {
    print_flag();
  }

  printf("Wrong!\n");
}
