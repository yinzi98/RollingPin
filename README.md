# RollingPin
学习编译原理过程中用来练习的仓库。

## 准备工作
- Flex 
- Bison
- ~~LLVM~~
- 一些简单的正则知识

Flex 和 Bison 用于将一个特殊格式的定义文件输出为 C 语言代码。 

```bash
sudo apt install flex bison
```


## 笔记

### token 
token其实是一个总称、包含三部分，分别是
1. **token的种类**
以计算器中的123.456为例，token 的种类是一个实数（DOUBLE_LITERAL）。

2. **token的原始字符**
以计算器中的123.456为例，token 的原始字符是123.456。

3. **token的值**
以计算器中的123.456为例，token 的值为实数123.456。



### 语法处理过程
一般编程语言的语法处理过程如下。

1. **词法分析**  
将源代码分割为若干个 token 的处理。

2. **语法分析**  
从 token 构建 AST （abstract syntax tree，抽象语法树）。

3. **语义分析**  
经过语法分析生成的AST并不包含数据类型等语义信息。因此在语义分析阶段，会检查程序中是否含有语法正确但是存在逻辑问题的错误。（有些情况并不存在一个明确的语义分析阶段）

4. **生成代码**  
如果是 C 语言等生成机器码的编译器或 Java 这样生成字节码的编译器，在 AST 构建完毕后会进入代码生成阶段。


## Part Ⅰ
一个简单的计算器 mycalc，用来入门Flex和Bison。

### Flex 
执行词法分析的程序称为词法分析器(lexical analyzer)，flex的工作就是根据词法规则自动生成词法分析器，通过输入扩展名为.l的文件，输出词法分析器的 C 语言代码。

语法分析器是将输入的字符串分割为 token 的程序，因此必须首先定义所用到的 token。

在这里用到的 token 定义如下

- 运算符，包括 +、-、*、/。
- 整数，如 123。
- 实数，如 123.456。
- 换行符，算式输入完成后，输入换行符执行计算。

#### mycal.l
```Lex
%{
#include <stdio.h>
#include "y.tab.h"

/* 不必手动链接lex库文件的奇技淫巧 */
int yywrap(void) {
    return 1;
}
%}

/* 上面这部分称为定义区块。在定义区域内，可以定义初始状态或者为正则表达式命名。*/

%%
"+"             return ADD;
"-"             return SUB;
"*"             return MUL;
"/"             return DIV;
"\n"            return CR;
"("             return LP;
")"             return RP;
([1-9][0-9]*)|0|([0-9]+\.[0-9]*) {
    double temp;
    sscanf(yytext, "%lf", &temp);
    yylval.double_value = temp;
    return DOUBLE_LITERAL;
}
[ \t] ;
. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}
%%

```
%{ }%包裹部分属于定义区块，其目的是让生成的词法分析器将这部分代码原样输出。后续程序所需的头文件等都包含在这里。比如用#include包含进来的y.tab.h，就是之后bison自动生成的头文件。下面的ADD、SUB、MUL等都是在y.tab.h中用#define定义的宏，其原始出处则定义于mycalc.y中。这些宏将 token 的种类区分开来。 

%% %%包裹部分属于规则区块，使用正则表达式去描述 token。

其他部分属于用户代码区块。在这里可以编写任意的 C 代码，与定义、规则区域不同，用户区块无需使用其他字符包裹。


### Bison
执行语法分析的程序称为解析器(parser)，bison就是能根据语法规则自动生成解析器的程序，输入扩展名为.y的文件，就会输出解析器的 C 语言代码。

**On the way**
写文档比写代码难多了qwq


### 生成执行文件
```bash
bison --yacc -dv mycalc.y
flex mycalc.l
gcc -o mycalc y.tab.c lex.yy.c
```
or
```bash
sh giao.sh
```

## Part Ⅱ
一个简单的玩具语言 
