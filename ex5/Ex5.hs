{- Exercise 5 - A Set Data Type (CORRECTED: due NOV 1, noon)

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

A mathematical set is a collection of items with no duplicates.
In this exercise, you'll implement a new datatype to represent a
set of values (of the same type).
-}
module Ex5 (Set(..), setIntersect) where

-- Create a new data type Set with one type variable a, and
-- a value constructor Set, whose single parameter is a list of a's.


-- Make Set a member of the Show typeclass by implementing a show
-- function with the following behaviour:
-- > let emptyset = Set []
-- > emptyset
-- {}
-- > let singleton = Set ["hi"]
-- > singleton
-- {"hi"}
-- With multiple elements, order matters!
-- > let multiple = Set [3,2,10]
-- > multiple
-- {3,2,10}
--
-- Note: this assumes that the type variable a is an instance of Show,
-- so you'll need to specify this in your instance declaration by using
-- the following syntax:
-- instance (Show a) => Show (Set a) where ...


-- Finally, write a function intersect, which takes
-- two sets and returns a new set containing all elements
-- that appear in both. Note: efficiency is not too
-- much of a concern, just don't go exponential. ;)
-- The order in which the items appear in the new set doesn't matter.
setIntersect :: Eq a => Set a -> Set a -> Set a
setIntersect = undefined

