#include <stdio.h>
#include <lib_c_c.h>

void lib_c_d_testcase(void)
{
    printf("hello world from %s %d!\n", __FILE__, __LINE__);
    lib_c_c_testcase();

    return;
}

