#include <stdio.h>
#include <lib_c_a.h>
#include <lib_c_b.h>

void lib_c_c_testcase(void)
{
    printf("hello world from %s %d, %d %d!\n", __FILE__, __LINE__, lib_c_a_add(1, 2), lib_c_b_mul(3, 4));
    printf("hello world from %s %d, %d %d!\n", __FILE__, __LINE__, lib_c_a_add(5, 6), lib_c_b_mul(7, 8));
    printf("hello world from %s %d, %d %d!\n", __FILE__, __LINE__, lib_c_a_sub(9, 10), lib_c_b_div(11, 12));

    return;
}
