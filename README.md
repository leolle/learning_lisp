

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
``
> (let ((x 1) (y 2))
     (+ x y))
3
``
