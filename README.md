

## chapter 2 welcome to lisp

### Form
```
> 1
1
>
> (+ 2 3)
5
```
### Evaluation

首先从左至右对实参求值。在这个例子当中，实参对自身求值，所以实参的值分别是 2 跟 3 。
实参的值传入以操作符命名的函数。在这个例子当中，将 2 跟 3 传给 + 函数，返回 5 。

### Data

- integer
- string
- symbol: 'quote
- list: 列表是由被括号包住的零个或多个元素来表示。元素可以是任何类型，包含列表本身。使用列表必须要引用，不然 Lisp 会以为这是个函数调用：
```
> '(my 3 "Sons")
(MY 3 "Sons")
> '(the list (a b c) has 3 elements)
(THE LIST (A B C) HAS 3 ELEMENTS)
```

### List Operations

用函数 cons 来构造列表。如果传入的第二个实参是列表，则返回由两个实参所构成的新列表，新列表为第一个实参加上第二个实参：
取出列表元素的基本函数是 car 和 cdr 。对列表取 car 返回第一个元素，而对列表取 cdr 返回第一个元素之后的所有元素：
不过，你可以用更简单的 third 来做到同样的事情：

### Truth

函数的返回值将会被解释成逻辑 真 或逻辑 假 时，则称此函数为谓词（predicate）。在 Common Lisp 里，谓词的名字通常以 p 结尾。
逻辑 假 在 Common Lisp 里，用 nil ，即空表来表示。
在 Common Lisp 里，最简单的条件式是 if 。通常接受三个实参：一个 test 表达式，一个 then 表达式和一个 else 表达式。若 test 表达式求值为逻辑 真 ，则对 then 表达式求值，并返回这个值。若 test 表达式求值为逻辑 假 ，则对 else 表达式求值，并返回这个值：

```
> (if (listp '(a b c))
      (+ 1 2)
      (+ 5 6))
3
> (if (listp 27)
      (+ 1 2)
      (+ 5 6))
11
```

### Functions

你可以用 defun 来定义新函数。通常接受三个以上的实参：一个名字，一组用列表表示的实参，以及一个或多个组成函数体的表达式。

### Recursion

```
> (defun our-member (obj lst)
   (if (null lst)
       nil
   (if (eql (car lst) obj)
       lst
       (our-member obj (cdr lst)))))
OUR-MEMBER
```
起初，许多人觉得递归函数很难理解。较好的比喻是，把函数想成一个处理的过程。在过程里，递归是在自然不过的事情了。日常生活中我们经常看到递归的过程。

### Input and Output

最普遍的 Common Lisp 输出函数是 format 。接受两个或两个以上的实参，第一个实参决定输出要打印到哪里，第二个实参是字符串模版，而剩余的实参，通常是要插入到字符串模版，用打印表示法（printed representation）所表示的对象。

```
> (format t "~A plus ~A equals ~A. ~%" 2 3 (+ 2 3))
2 plus 3 equals 5.
NIL
```
标准的输入函数是 read 。当没有实参时，会读取缺省的位置，通常是顶层。下面这个函数，提示使用者输入，并返回任何输入的东西：

### Variables

let 是一个最常用的 Common Lisp 的操作符之一，它让你引入新的局部变量（local variable）：
```
> (let ((x 1) (y 2))
     (+ x y))
3
```
你可以给 defparameter 传入符号和值，来创建一个全局变量：
```
> (defparameter *glob* 99)
*GLOB*
```
你也可以用 defconstant 来定义一个全局的常量：
```
(defconstant limit (+ *glob* 1))
```

### Assignment
在 Common Lisp 里，最普遍的赋值操作符（assignment operator）是 setf 。可以用来给全局或局部变量赋值：
```
> (setf *glob* 98)
98
> (let ((n 10))
   (setf n 2)
   n)
2
```
如果 setf 的第一个实参是符号（symbol），且符号不是某个局部变量的名字，则 setf 把这个符号设为全局变量：

### Functional Programming

函数式编程意味着撰写利用返回值而工作的程序，而不是修改东西。它是 Lisp 的主流范式。大部分 Lisp 的内置函数被调用是为了取得返回值，而不是副作用。

### Iteration

(variable initial update)

### Functions as Objects

apply 可以接受任意数量的实参，只要最后一个实参是列表即可
```
> (apply #'+ '(1 2 3))
6
> (+ 1 2 3)
6
> (apply #'+ 1 2 '(3 4 5))
15
```

### Types

函数 typep 接受一个对象和一个类型，然后判定对象是否为该类型，是的话就返回真：

### summary:

- Lisp 是一种交互式语言。如果你在顶层输入一个表达式， Lisp 会显示它的值。
- Lisp 程序由表达式组成。表达式可以是原子，或一个由操作符跟着零个或多个实参的列表。前序表示法代表操作符可以有任意数量的实参。
- Common Lisp 函数调用的求值规则： 依序对实参从左至右求值，接着把它们的值传入由操作符表示的函数。 quote 操作符有自己的求值规则，它完封不动地返回实参。
- 除了一般的数据类型， Lisp 还有符号跟列表。由于 Lisp 程序是用列表来表示的，很轻松就能写出能编程的程序。
- 三个基本的列表函数是 cons ，它创建一个列表； car ，它返回列表的第一个元素；以及 cdr ，它返回第一个元素之后的所有东西。
- 在 Common Lisp 里， t 表示逻辑 真 ，而 nil 表示逻辑 假 。在逻辑的上下文里，任何非 nil 的东西都视为 真 。基本的条件式是 if 。 and 与 or 是相似的条件式。
- Lisp 主要由函数所组成。可以用 defun 来定义新的函数。
- 自己调用自己的函数是递归的。一个递归函数应该要被想成是过程，而不是机器。
- 括号不是问题，因为程序员通过缩排来阅读与编写 Lisp 程序。
- 基本的 I/O 函数是 read ，它包含了一个完整的 Lisp 语法分析器，以及 format ，它通过字符串模板来产生输出。
- 你可以用 let 来创造新的局部变量，用 defparameter 来创造全局变量。
- 赋值操作符是 setf 。它的第一个实参可以是一个表达式。
- 函数式编程代表避免产生副作用，也是 Lisp 的主导思维。
- 基本的迭代操作符是 do 。
- 函数是 Lisp 的对象。可以被当成实参传入，并且可以用 lambda 表达式来表示。
- 在 Lisp 里，是数值才有类型，而不是变量。

### Exercises
1. 描述下列表达式求值之后的结果：
(a) (+ (- 5 1) (+ 3 7))
14
(b) (list 1 (+ 2 3))
(1 5)
(c) (if (listp 1) (+ 1 2) (+ 3 4))
7
(d) (list (and (listp 3) t) (+ 1 2))
(NIL 3)

2. 给出 3 种不同表示 (a b c) 的 cons 表达式 。
(1). (cons '(a b c))
(2). (cons 'a '(b c))
(3). (cons 'a (cons 'b (cons 'c nil)))

3. 使用 car 与 cdr 来定义一个函数，返回一个列表的第四个元素。
(defun return-fourth(list)
  (car (cdr (cdr (cdr list)))))

(return-fourth '(a b c d))

4. 定义一个函数，接受两个实参，返回两者当中较大的那个。
