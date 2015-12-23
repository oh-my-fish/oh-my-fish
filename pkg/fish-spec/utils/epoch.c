#include <stdio.h>
#include <sys/time.h>

int main(int argc, char** argv) {
  struct timeval time_struct;
  gettimeofday(&time_struct, 0);
  printf("%lld", (time_struct.tv_sec * 1000ll) + (time_struct.tv_usec / 1000ll));

  return 0;
}
