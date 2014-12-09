{- Exercise 4 - Getting started with Haskell (due Oct 18, noon)

General exercise instructions:
- Exercises must be done *individually*.
- You may not import any Haskell modules, unless explicitly told to.
- You may write helper functions freely; in fact, you are encouraged
  to do so to keep your code easy to understand.
- Your grade will be determined by our automated testing. However,
  no tests are provided; it is your responsibility to ensure your
  code is correct before your final submission.
- That said, submit early and often! MarkUs is rather slow close to
  the due date. It is your responsibility to make sure your work is
  submitted on time.
- No late submissions will be accepted!

Implement the two functions below to get some experience programming in Haskell. You might want to review the work you did in Lab 2.
Try to make your code as simple as possible.
-}
module Ex4 where


isDivisible :: Int -> Int -> Bool
isDivisible x y = if (mod x y == 0) then True else False

-- |The 'isPrime' function returns True if its argument is prime.
-- Returns False for any argument < 2.
isPrime :: Int -> Bool
isPrime n = if n < 2 then False else 
		if length (filter (\x -> isDivisible n x) [2..(n-1)]) == 0 then True else False

-- |'primes' is an infinite list containing the prime numbers,
-- in ascending order.
primes :: [Int]
primes = filter (\x -> isPrime x) [1..]

