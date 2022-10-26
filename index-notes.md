# 0 目录 Contents
# 0 非官方说明 Unofficial Texinfo Format
# 0 献词 Dedication
# 0 序 Foreword
# 0 第2版前言 Preface to the Second Edition
# 0 第1版前言 Preface to the First Edition
# 0 致谢 Acknowledgments
# 1 通过过程(procedure)建立抽象 Building Abstractions with Procedures 构造过程抽象
## 1.1 程序设计的基本元素 The Elements of Programming
### 1.1.1 表达式 Expressions
### 1.1.2 命名和环境 Naming and the Environment
### 1.1.3 组合式的求值(计算组合式) Evaluating Combinations
### 1.1.4 符合过程 Compound Procedures
### 1.1.5 过程应用的代换模型 The Substitution Model for Procedure Application
### 1.1.6 条件表达式和谓词 Conditional Expressions and Predicates
### 1.1.7 实例: 采用牛顿法求平方根 Example: Square Roots by Newton's Method
### 1.1.8 过程作为黑箱抽象 Procedures as Black-Box Abstractions
## 1.2 过程与它们所产生的计算 Procedures and the Processes They Generate
### 1.2.1 线性的递归和迭代 Linear Recursion and Iteration
### 1.2.2 树形递归 Tree Recursion
### 1.2.3 增长的阶 Orders of Growth (增长)的阶, 不是 (增长的)阶
### 1.2.4 求幂 Exponentiation 指数运算
### 1.2.5 最大公约数 Greatest Common Divisors 最大工共因子(把乘数看作因子之积)
### 1.2.6 实例: 素数检测 Example: Testing for Primality
## 1.3 用高阶函数做抽象 Formulating Abstractions with Higher-Order Procedures 用高阶函数构造抽象
### 1.3.1 过程作为参数 Procedures as Arguments
### 1.3.2 用lambda构造过程 Constructing Procedures Using lambda
### 1.3.3 过程作为一般性的方法 Procedures as General Methods
### 1.3.4 过程作为返回值 Procedures as Returned Values
# 2 通过数据建立抽象 Building Abstractions with Data 构造数据抽象

## 2.1 数据抽象导论 Introduction to Data Abstraction 不知道怎么翻译成数据抽象引导的
### 2.1.1 实例: 有理数的算数运算 Example: Arithmetic Operations for Rational Numbers
### 2.1.2 抽象屏障 Abstraction Barriers
### 2.1.3 数据意味着什么 What Is Meant by Data?
### 2.1.4 扩展练习: 区间算术 Extended Exercise: Interval Arithmetic
## 2.2 层次性数据和闭包性质 Hierarchical Data and the Closure Property 分层数据
此处的闭包并不是js中的闭包概念

而是一种抽象代数的概念：如果一个运算(操作)作用于某个集合中的元素，产出的结果仍然是该集合中的元素，那么这个集合称为在这个运算(操作)下封闭，这种性质也被称为闭包

意味着通过对满足闭包性质的集合进行运算之后得到的结果，还可以对结果进行相同的运算

### 2.2.1 序列的表示 Representing Sequences

list 的本质是使用 cons 生成，使用 list 简化了操作

(list 1 2 3 4) 等价于 (cons 1 (cons 2 (cons 3 (cons 4 nil))))

```scheme
(define l (list 2 3 4)) ; (2 3 4) => (2 (3 (4 nil)))
(cdr l) ; (3 4) => (3 (4 nil))
(cdr (cdr l)) ; (4) => (4 nil)
(car (cdr (cdr l))) ; 4 => 4
(cdr (cdr (cdr l))) ; () => nil
```
感觉像是链表，一个节点指向下一个节点

> (cadr list) : (car (cdr list))
> (caddr list) : (car (cdr (cdr list)))
> 操作顺序从后往前

ChezScheme 中 nil 不是关键字，空表使用 '() 表示，即 (list 1 2 3) 等价于 (cons 1 (cons 2 (cons 3 '() )))

#### 表操作

(list-ref a index) 找到列表 a 下标为 index 的值，下标从 0 开始

list-ref 和 append 都是基于递归实现的，本质都是通过 cdr 找到列表的后项

变长参数列表，通过`.`来实现，(define (f x y . z)) 中的 x 和 y 就是传入参数的第一第二个，第三个及后面的参数就会成为一个列表 z

#### 对表的映射

map 帮我们建起了一层抽象屏障，将对表中的元素变换的过程和提取表中元素并组合的细节隔离开

for-each 与 map 类似，不过 map 每个元素都会返回值，结果依然可以接着进行运算

for-each 是没有返回值的

### 2.2.2 层次性结构 Hierarchical Structures

length 获取列表长度，但是如果列表的元素也有列表，结果回合预想的不符

如 (list '(1 2) '(3 4)) 其实是 '((1 2) (3 4))，length 结果就是 2

因为 length 是通过不断 cdr 然后 +1 实现的，而上面这个列表的 car 是(1 2)，cdr 是(3 4)，会将这两个列表看做两个元素，只按 1 计算

但是其实实现也没错，毕竟算出来的是列表内的元素数量，列表也算是元素

如果要计算全部列表长度，也就是书中的计算叶子节点，需要对列表中的每一个元素都进行 pair? 判断是否是列表，计算每个列表元素的长度

### 2.2.3 序列作为传统常见接口 Sequences as Conventional Interfaces 序列作为一种约定的界面

#### 序列操作

(filter predicate list) 过滤

不过好像并不是 stream，而是每次操作都要进行遍历

### 2.2.4 实例: 一个图形语言 Example: A Picture Language
## 2.3 符号数据 Symbolic Data
### 2.3.1 引号 Quotation

'(a b ...)，将括号内的值构造成表，相当于(quote (a b ...))

(quote s) 是引用字符串
     
     ```scheme
     (quote s) ; s
     (quote (a b)) ; (a b)
     (quote "123") ; 123
     ```

如 a = 2，(list a 3)是(2 3)，而'(a 3)其实是(a 3)，不会将变量的值进行构造

```scheme
(define a 1)
(define b 2)
(list a b) ; (1 2)
'(a b) ; (a b)
(quote (a b)) ; (a b)
(list 'a b) ; (a 2)
(quote (list 'a b)) ; (list 'a b)
'('a b cc) ; ('a b cc)
```

`eq?`比较两个符号是否相同

```scheme
(define a 1)
(eq? a '1) ; #t
(eq? 'c 'c) ; #t
(define abc "abc")
(eq? abc abc) ; #t
(eq? abc "abc") ; ChezScheme 9.5.8:#f, DrRacket 8.6:#t
```

很奇怪，使用chezscheme，`(eq? abc "abc")`是false的，看书上的注释中应该是相等的，然后下了一个DrRacket，再去比较居然是相等的了……麻了

### 2.3.2 实例: 符号求导 Example: Symbolic Differentiation 符号微分

(apply f list): 将list传入f进行操作

### 2.3.3 实例: 集合的表示 Example: Representing Sets

这里的集合就是set，不重复的列表

#### 集合作为二叉树

二叉排序树，左子树的值小于根节点的值，根节点的值小于右子树的值

(make-tree entry left right)
使用树来表示集合，而树又是用list表来表示的，这个就是在一种数据抽象上面构造另一种数据抽象

二叉搜索树极端情况下可能会出现线性复杂度的情况，因为没有对树进行平衡操作

### 2.3.4 实例: Huffman编码树 Example: Huffman Encoding Trees

ASCII 是定长编码，为每个字符都使用相同长度的编码方式

变长编码的问题是如何确定何时到达了一个字符的结束位
- 在每个字符的末位后添加一个特殊的分隔符，如摩斯电码
- 使用前缀码，让每个字符的完整编码都不是其他字符的前缀，如霍夫曼Huffman编码

Huffman编码其实就是一颗二叉树，叶子是被编码的字符，每个节点都有一个权重，左树枝是0，右树枝是1，每个字符的编码就是从根节点到该字符的一串01

初始每个字符的权重是出现的频率，之后从最小的权重开始两两组合，两个子节点的根节点的权重是两个叶子节点相加，将组合后的树的根节点放入列表重新组合，直到全部组合成一颗二叉树
> 从权重最小的节点开始组合，是为了让频率低的离根节点越远

## 2.4 抽象数据的多重表示 Multiple Representations for Abstract Data
### 2.4.1 复数的表示 Representations for Complex Numbers

复数可以由直角坐标系的实部虚部实现，也可以由极坐标系的幅角模长实现，
实现复数运算时，使用对应的通用过程实现，而两种复数的实现方式也都实现了这些过程，那么就不需要关心复数具体是由哪种方式实现的，
只要实现了通用过程，也就是进行了抽象屏障，两种方式都可以进行运算

极坐标系：(r, A), (模长， 幅角)
直角坐标系：(x, y), (实部， 虚部)
x=rcosA, y=rsinA
r=√(x2+y2), A=arctan(y, x)

### 2.4.2 带标志的数据 Tagged Data
### 2.4.3 数据导向程序设计和可加性 Data-Directed Programming and Additivity 数据导向的程序设计和可加性 

这里的操作表类似于一种映射(map)，操作和类型一起组成了 key，对应的过程就是 value 
调用过程时根据传入的操作和类型去寻找对应的过程来执行

通过 package 包机制来进行类型和操作的封装，
需要添加新的类型时，只需要新编写一个 package 放入操作表，不需要改变之前的代码 
需要添加新的操作时，也不需要改变之前的代码，可以在一个新的 package 中为每个类型添加新的过程

#### 消息传递

消息分发机制+面向对象？(幻视)
看起来像是面向对象，将操作(方法)封装到每个类型(对象)

## 2.5 带有通用型操作的系统 Systems with Generic Operations
### 2.5.1 通用型算数运算 Generic Arithmetic Operations

定义通用型算数过程，像是定义了一个接口，再对每个类型实现接口，调用时根据tag判断是哪个实现

### 2.5.2 不同类型数据的组合 Combining Data of Different Types
#### 类型的层次结构

继承

#### 层次结构的不足

多继承问题

### 2.5.3 实例: 符号代数 Example: Symbolic Algebra
# 3 模块化, 对象和状态 Modularity, Objects, and State
## 3.1 赋值和局部状态 Assignment and Local State
### 3.1.1 局部状态变量 Local State Variables
### 3.1.2 引进赋值带来的利益 The Benefits of Introducing Assignment

(random x) 如果给的是整数，结果随机数也是整数，如果是浮点数，结果随机数也是浮点数

### 3.1.3 引进赋值的代价 The Costs of Introducing Assignment
## 3.2 求值的环境模型 The Environment Model of Evaluation
### 3.2.1 求值规则 The Rules for Evaluation

环境模型：在将一个过程应用于一组实参时，会建立一个新的环境(上下文)，其中新定义的约束也就是局部变量

### 3.2.2 简单过程的应用 Applying Simple Procedures
### 3.2.3 框架作为局部状态的仓库 Frames as the Repository of Local State 将框架看作局部状态的展台
### 3.2.4 内部定义 Internal Definitions
## 3.3 通过变动数据建模 Modeling with Mutable Data 用变动数据做模拟
### 3.3.1 变动的表结构 Mutable List Structure

`set-car!`,`set-cdr!`是对序列本身进行修改，会修改`car``cdr`指针的指向

`append!`和`append`类似，会拼接两个序列，但是`append`是生成一个新的序列，不会修改原序列，`append!`会将后一个序列拼接到前一个序列的最后一个序对，会修改前一个序列本身的结构

### 3.3.2 队列的表示 Representing Queues
### 3.3.3 表格的表示 Representing Tables

一维表格，像是映射表

assoc 根据 key 查询 value，遍历一维表格的 key 逐个对比，返回键值对，insert! 先遍历查出是否存在对应 key，再进行替换 value 或插入新键值对

#### 二维表格

二维表格是类似于 `Map<Map>` 的形式，查询时先判断一级 key 是否存在，存在就接着查询二级 key，插入也是，如果二级表格不存在，就创建新的二级表格并将构造键值对插入到表格中

### 3.3.4 数字电路的模拟器 A Simulator for Digital Circuits
### 3.3.5 约束的传播 Propagation of Constraints
## 3.4 并发: 时间至关重要 Concurrency: Time Is of the Essence 并发: 时间是一个本质问题
### 3.4.1 并发系统中时间的性质 The Nature of Time in Concurrent Systems

经典的 ABA 问题

### 3.4.2 控制并发的机制 Mechanisms for Controlling Concurrency
## 3.5 流 Streams
### 3.5.1 流是延时的List Streams Are Delayed Lists 流作为延时的表
### 3.5.2 无穷流 Infinite Streams
### 3.5.3 流范式的使用 Exploiting the Stream Paradigm 流计算模式的使用
### 3.5.4 流和延时求值 Streams and Delayed Evaluation
### 3.5.5 函数式程序的模块化和对象的模块化 Modularity of Functional Programs and Modularity of Objects
# 4 元语言抽象 Metalinguistic Abstraction
## 4.1 元循环求值器 The Metacircular Evaluator (元循环)求值器
### 4.1.1 求值器的内核 The Core of the Evaluator
### 4.1.2 表达式的表示 Representing Expressions
### 4.1.3 求值器数据结构 Evaluator Data Structures
### 4.1.4 求值器作为程序运行 Running the Evaluator as a Program 作为程序运行这个求值器
### 4.1.5 数据作为程序 Data as Programs
### 4.1.6 内部定义 Internal Definitions
### 4.1.7 将语法分析与执行分离 Separating Syntactic Analysis from Execution
## 4.2 Scheme的变体 - 惰性求值 Variations on a Scheme — Lazy Evaluation Scheme的变形
### 4.2.1 常规(正则)序和应用序 Normal Order and Applicative Order 正则序和应用序
### 4.2.2 一个采用惰性求值的解释器 An Interpreter with Lazy Evaluation
### 4.2.3 流作为惰性的List Streams as Lazy Lists
## 4.3 Scheme的变体 - 非确定性计算 Variations on a Scheme — Nondeterministic Computing Scheme的变形
### 4.3.1 amb和搜索 Amb and Search
### 4.3.2 非确定性程序的实例 Examples of Nondeterministic Programs
### 4.3.3 实现amb求值器 Implementing the amb Evaluator
## 4.4 逻辑程序设计 Logic Programming
### 4.4.1 演绎信息检索 Deductive Information Retrieval
### 4.4.2 查询系统如何工作 How the Query System Works
### 4.4.3 逻辑程序设计是数理逻辑吗 Is Logic Programming Mathematical Logic?
### 4.4.4 查询系统的实现 Implementing the Query System
#### 4.4.4.1 驱动循环及实例化 The Driver Loop and Instantiation
#### 4.4.4.2 求值器 The Evaluator
#### 4.4.4.3 通过模式匹配寻找断言 Finding Assertions by Pattern Matching
#### 4.4.4.4 规则和一致性(单一化?) Rules and Unification
#### 4.4.4.5 数据库的维护 Maintaining the Data Base
#### 4.4.4.6 流操作 Stream Operations
#### 4.4.4.7 查询语法过程 Query Syntax Procedures
#### 4.4.4.8 框架和绑定 Frames and Bindings
# 5 通过寄存器机器计算 Computing with Register Machines 寄存器机器里的计算
## 5.1 寄存器机器里的计算 Designing Register Machines
### 5.1.1 一种描述寄存器机器的语言 A Language for Describing Register Machines
### 5.1.2 机器设计的抽象 Abstraction in Machine Design
### 5.1.3 子程序 Subroutines
### 5.1.4 通过栈实现递归 Using a Stack to Implement Recursion 采用堆栈实现递归
### 5.1.5 指令总结 Instruction Summary
## 5.2 一个寄存器机器模拟器 A Register-Machine Simulator
### 5.2.1 机器模型 The Machine Model
### 5.2.2 汇编器 The Assembler 汇编程序
### 5.2.3 构造指令的执行过程 Generating Execution Procedures for Instructions 为指令生成执行过程
### 5.2.4 监视机器执行 Monitoring Machine Performance
## 5.3 存储分配和垃圾回收 Storage Allocation and Garbage Collection 存储分配和废料收集
### 5.3.1 内存作为向量 Memory as Vectors 将存储看作向量
### 5.3.2 维持无线内存的假象 Maintaining the Illusion of Infinite Memory 维持一种无穷存储的假象
## 5.4 显示控制的求值器 The Explicit-Control Evaluator
### 5.4.1 显示控制的求值器的内核 The Core of the Explicit-Control Evaluator
### 5.4.2 顺序求值和尾递归 Sequence Evaluation and Tail Recursion 序列的求值和尾递归
### 5.4.3 条件, 赋值和定义 Conditionals, Assignments, and Definitions
### 5.4.4 求值器的运行 Running the Evaluator
## 5.5 编译 Compilation
### 5.5.1 编译器的结构 Structure of the Compiler
### 5.5.2 表达式的编译 Compiling Expressions
### 5.5.3 组合式的编译 Compiling Combinations
### 5.5.4 指令序列的组合 Combining Instruction Sequences
### 5.5.5 编译代码的实例 An Example of Compiled Code
### 5.5.6 词法寻址 Lexical Addressing 词法地址
### 5.5.7 连接编译后的代码至求值器 Interfacing Compiled Code to the Evaluator 编译代码与求值器的互连
# 6 参考文献 References
# 7 练习列表 List of Exercises
# 8 配图列表 List of Figures
# 9 索引 Index
# 10 尾页 说明 Colophon
