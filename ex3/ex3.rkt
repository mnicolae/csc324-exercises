#| Exercise 3 - More Higher-Order Functions (due Oct 4, noon)

**Updated Sept 16, 4pm**

General exercise instructions:
- Exercises must be done *individually*.
- You may not import any Racket libraries, unless explicitly told to.
- You may write helper functions freely; in fact, you are encouraged
  to do so to keep your code easy to understand.
- Your grade will be determined by our automated testing. However,
  no tests are provided; it is your responsibility to ensure your
  code is correct before your final submission.
- That said, submit early and often! MarkUs is rather slow close to
  the due date. It is your responsibility to make sure your work is
  submitted on time.
- No late submissions will be accepted!

Implement the two functions below. Note that these functions both
return new functions.
|#
#lang racket
(provide f-max fix)

#|
(f-max f g)
  f, g: unary functions *whose input and output are numbers*

  Return a new unary function that always returns the max of f and g
  applied to its argument.

> (define h (f-max (lambda (x) (+ x x)) (lambda (x) (- x 10)))
> (h 23)
46
|#
(define (f-max f g)
  (lambda (x)
    (max (f x) (g x))))


#|
(fix f n x)
  f: a function taking m arguments
  n: a natural number, 1 <= n <= m
  x: an argument

  Return a new function g that takes m-1 arguments, which acts as follows:
  (g a_1 ... a_{n-1} a_{n+1} ... a_m)
  = (f a_1 ... a_{n-1} x a_{n+1} ... a_m)

  That is, x is inserted as the nth argument in a call to f.

> (define f (lambda (x y z) (+ x (* y (+ z 1)))))
> (define g (fix f 2 100))
> (g 2 4) ; equivalent to (f 2 100 4)
502

HINT:
1. It might seem unusual to create a function whose arity (number of arguments)
   isn't a fixed constant. Use a slightly easier approach and use a "rest argument"
   to create a function that takes an arbitrary number of arguments.
   (See note on course webpage about Rest Arguments under week 4.)
   You can assume we'll only call your created function with the correct number
   of arguments.
2. Use the function (apply f lst), which calls f with the arguments
   contained in the list lst.
|#
(define (fix f n x)
  (lambda args
    (apply f (append (take args (- n 1)) (list x) (list-tail args (- n 1))))))
