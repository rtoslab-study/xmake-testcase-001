# xmake-testcase-001

## 一、测试目的

仿照真实项目的组织结构，在Ubuntu 16.04 x64环境下本地编译测试程序，确定xmake是否存在以下问题：

1、add_shflags总是被处理在链接命令的末尾，甚至晚于add_syslinks

2、add_ldflags会过滤掉wl这样的自定义链接命令传递

3、动态库B依赖由静态库链接出的动态库A，动态库B的链接命令中出现静态库

## 二、测试用例说明

| 模块    | 说明          | 备注                                       |
| ------- | ------------- | ------------------------------------------ |
| lib_c_a | 静态库(-fPIC) | 被动态库lib_c_c依赖                        |
| lib_c_b | 静态库(-fPIC) | 被动态库lib_c_c依赖                        |
| lib_c_c | 动态库        | 由静态库lib_c_a和静态库lib_c_b参与链接生成 |
| lib_c_d | 动态库        | 依赖动态库lib_c_c                          |
| hello_c | 执行程序      | 依赖动态库lib_c_c，与动态库lib_c_d无关     |

## 三、编译输出

```
skyhigh@ubuntu1604x6a4-vm:~/WORK/JW_3A4000/xmake-testcase-001$ xmake -r -v
checking for platform ... linux
checking for architecture ... x86_64
checking for gcc ... /usr/bin/gcc
checking for dmd ... no
checking for ldc2 ... no
checking for gdc ... no
checking for zig ... no
checking for zig ... no
checking for ar ... /usr/bin/ar
checking for the static library archiver (ar) ... ar
checking for g++ ... /usr/bin/g++
checking for the shared library linker (sh) ... g++
checking for g++ ... /usr/bin/g++
checking for the linker (ld) ... g++
checking for gcc ... /usr/bin/gcc
checking for the c compiler (cc) ... gcc
checking for the c compiler (cc) ... gcc
checking for the c compiler (cc) ... gcc
checking for /usr/bin/gcc ... ok
checking for flags (-O2) ... ok
checking for flags (-Wall) ... ok
checking for flags (-fno-strict-aliasing) ... ok
checking for ccache ... /usr/bin/ccache
[ 22%]: ccache compiling.release src/lib/lib_c_d/lib_c_d_testcase.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -fPIC -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -o build/.objs/lib_c_d-shared/linux/x86_64/release/src/lib/lib_c_d/lib_c_d_testcase.c.o src/lib/lib_c_d/lib_c_d_testcase.c
checking for flags (-fPIC) ... ok
[ 22%]: ccache compiling.release src/lib/lib_c_a/lib_c_a_add.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -fPIC -o build/.objs/lib_c_a-shared/linux/x86_64/release/src/lib/lib_c_a/lib_c_a_add.c.o src/lib/lib_c_a/lib_c_a_add.c
checking for flags (-fPIC) ... ok
[ 22%]: ccache compiling.release src/lib/lib_c_a/lib_c_a_sub.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -fPIC -o build/.objs/lib_c_a-shared/linux/x86_64/release/src/lib/lib_c_a/lib_c_a_sub.c.o src/lib/lib_c_a/lib_c_a_sub.c
checking for flags (-MMD -MF) ... ok
checking for flags (-MMD -MF) ... ok
checking for flags (-fdiagnostics-color=always) ... ok
checking for flags (-fdiagnostics-color=always) ... ok
[ 31%]: ccache compiling.release src/lib/lib_c_c/lib_c_c_testcase.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -fPIC -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -o build/.objs/lib_c_c-shared/linux/x86_64/release/src/lib/lib_c_c/lib_c_c_testcase.c.o src/lib/lib_c_c/lib_c_c_testcase.c
[ 31%]: ccache compiling.release src/lib/lib_c_b/lib_c_b_mul.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -fPIC -o build/.objs/lib_c_b-shared/linux/x86_64/release/src/lib/lib_c_b/lib_c_b_mul.c.o src/lib/lib_c_b/lib_c_b_mul.c
[ 36%]: ccache compiling.release src/lib/lib_c_b/lib_c_b_div.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -fPIC -o build/.objs/lib_c_b-shared/linux/x86_64/release/src/lib/lib_c_b/lib_c_b_div.c.o src/lib/lib_c_b/lib_c_b_div.c
[ 40%]: ccache compiling.release src/app/hello_c/hello_c.c
/usr/bin/ccache /usr/bin/gcc -c -m64 -O2 -I/home/skyhigh/WORK/JW_3A4000/xmake-testcase-001/src/inc -DLINUX -D_REENTRANT -Wall -fno-strict-aliasing -o build/.objs/hello_c/linux/x86_64/release/src/app/hello_c/hello_c.c.o src/app/hello_c/hello_c.c
[ 54%]: archiving.release lib_c_a.a
/usr/bin/ar -cr build/linux/x86_64/release/shared/lib_c_a.a build/.objs/lib_c_a-shared/linux/x86_64/release/src/lib/lib_c_a/lib_c_a_sub.c.o build/.objs/lib_c_a-shared/linux/x86_64/release/src/lib/lib_c_a/lib_c_a_add.c.o
[ 54%]: archiving.release lib_c_b.a
/usr/bin/ar -cr build/linux/x86_64/release/shared/lib_c_b.a build/.objs/lib_c_b-shared/linux/x86_64/release/src/lib/lib_c_b/lib_c_b_mul.c.o build/.objs/lib_c_b-shared/linux/x86_64/release/src/lib/lib_c_b/lib_c_b_div.c.o
[ 72%]: linking.release lib_c_c.so
/usr/bin/g++ -o build/linux/x86_64/release/shared/lib_c_c.so build/.objs/lib_c_c-shared/linux/x86_64/release/src/lib/lib_c_c/lib_c_c_testcase.c.o -shared -fPIC -m64 -Lbuild/linux/x86_64/release/shared -l_c_b -l_c_a -Wl,-z,defs
[ 81%]: linking.release lib_c_d.so
/usr/bin/g++ -o build/linux/x86_64/release/shared/lib_c_d.so build/.objs/lib_c_d-shared/linux/x86_64/release/src/lib/lib_c_d/lib_c_d_testcase.c.o -shared -fPIC -m64 -Lbuild/linux/x86_64/release/shared -l_c_c -l_c_b -l_c_a -lm -Wl,-z,defs
checking for /usr/bin/g++ ... ok
checking for flags (-Wl,-rpath=@loader_path) ... ok
[ 81%]: linking.release hello_c
/usr/bin/g++ -o build/linux/x86_64/release/shared/hello_c build/.objs/hello_c/linux/x86_64/release/src/app/hello_c/hello_c.c.o -m64 -Lbuild/linux/x86_64/release/shared -Wl,-rpath=$ORIGIN -l_c_c -l_c_b -l_c_a
[100%]: build ok!
warning: target(lib_c_d-shared).add_linkdirs("build/linux/x86_64/release/shared") path not found at @programdir/rules/utils/inherit_links/inherit_links.lua:43
warning: target(lib_c_c-shared).add_linkdirs("build/linux/x86_64/release/shared") path not found at @programdir/rules/utils/inherit_links/inherit_links.lua:43
warning: target(hello_c).add_linkdirs("build/linux/x86_64/release/shared") path not found at ./xmake/linux/app/xmake.lua:18
skyhigh@ubuntu1604x6a4-vm:~/WORK/JW_3A4000/xmake-testcase-001$ 
```

问题1：可以看到lib_c_d的链接命令中(81%)，add_shflags的内容被放置于最后，晚于add_syslinks

问题2：lib_c_d的链接命令中(81%)，add_ldflags中的内容没有看到，wl的部分被过滤了

问题3：可以看到lib_c_d的链接命令中(81%)，出现了静态库lib_c_b和lib_c_a的链接序列，该序列并未在lib_c_d的xmake.lua文件中显式描述

## 四、改进建议

问题3应该确定为需要修复的问题，问题1、2目前可通过其他方式绕过，但建议控制可接受wl自定义链接指令的add_shflags的拼接命令顺序早于add_syslinks，以方便在其中通过wl控制加入的部分用户库文件的链接。
