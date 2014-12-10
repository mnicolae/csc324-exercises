{- Code from Week 8 (plus a few extra examples and exercises) -}

type Stack = [Integer]
type StackOp a = Stack -> (a, Stack)

x :: Stack
x = [1,2,3,4,10]

-- Equivalent type:
-- pop :: Stack -> (Integer, Stack)
pop :: StackOp Integer
pop (x:xs) = (x, xs)

-- Equivalent type:
-- push :: Integer -> (Stack -> ((), Stack))
push :: Integer -> StackOp ()
push n s = ((), n:s)

-- Switch the top two elements on a stack.
-- Note that this is the "naive" approach using
-- let to explicitly keep track of intermediate state.
switchTopTwo :: StackOp ()
switchTopTwo s =
    let (x, s1) = pop s      -- (1, [2,3,4,10])
        (y, s2) = pop s1     -- (2, [3,4,10])
        (_, s3) = push x s2  -- ((), [1,3,4,10])
        (_, s4) = push y s3  -- ((), [2,1,3,4,10])
    in  ((), s4)


-- "Sideways man": Do f, throw away result, and then do g
(>.>) :: StackOp a -> StackOp b -> StackOp b
(f >.> g) s =            -- or, f >.> g = \s -> ...
    let (_, s1) = f s
    in  g s1

-- What are the types of the following?
popPop = pop >.> pop
push5Pop = push 5 >.> pop

-- "Awkward man": Do f, USE the result to create a new StackOp, and do it
(>~>) :: StackOp a -> (a -> StackOp b) -> StackOp b
(f >~> g) s =
    let (x, s1) = f s
        newStackOp = g x
    in  newStackOp s1

addTenToTop = pop >~> \x -> push (x + 10)
double = pop >~> \x -> push x >.> push x
-- eqivalently:
double2 =
    pop >~> \x ->
    push x >.>
    push x


-- "Lift": Do f, and then "lift" g up to apply it to the result
-- Can be defined in terms of >~> (try it!!)
(~>) :: StackOp a -> (a -> b) -> StackOp b
(f ~> g) s =
    let (x, s1) = f s
        newData = g x
    in  (newData, s1)

topBiggerThan20 = pop ~> (>20)


-- Now we can use these operators to simplify switchTopTwo
switchTopTwo2 :: StackOp ()
switchTopTwo2 s =
    let (x, s1) = pop s             -- (1, [2,3,4,10])
        (y, s2) = pop s1            -- (2, [3,4,10])
    in  ((push x) >.> (push y)) s2

switchTopTwo3 :: StackOp ()
switchTopTwo3 s =
    (pop >~> \x ->
        (pop >~> \y ->
            ((push x) >.> (push y))
        )
    ) s

-- Note: same as switchTopTwo3, except without indentation and parentheses
switchTopTwoAWESOME :: StackOp ()
switchTopTwoAWESOME =
    pop >~> \x ->
    pop >~> \y ->
    push x >.>
    push y


-- Final example: summing a stack
sumOfStack :: StackOp Integer
sumOfStack [] = (0, [])
sumOfStack s = (
    pop >~> \x ->
    sumOfStack ~>
    (+x)
    ) s

-- Defining sumOfStack without pattern matching
-- (This is a little uglier in my opinion, but added
-- for completeness.)
-- Note that "uglier" also corresponds to a more
-- imperative-style program
sumOfStack2 :: StackOp Integer
sumOfStack2 =
    isEmpty >~> \x ->
    if x
    then
        \_ -> (0, [])
    else
        pop >~> \x ->
        sumOfStack ~>
        (+x)

isEmpty :: StackOp Bool
isEmpty s = (s == [], s)


-------- EXERCISES! --------
-- 1. removeSecond: remove (but don't return) the second-highest item
-- (i.e., the item below the top item on the stack)
removeSecond :: StackOp ()
removeSecond = undefined

-- 2. removeThird: remove the third-highest item
removeThird :: StackOp ()
removeThird = undefined

-- 3. removeNth: remove the n-th highest item
removeNth :: Integer -> StackOp ()
removeNth = undefined

-- 4. safePop: same as pop, except uses Maybe to handle
-- the possibility of an empty stack
safePop :: StackOp (Maybe Integer)
safePop = undefined

-- 5. returnVal: take an input, make a StackOp that does not affect the stack,
-- but puts the input as its "data"
returnVal :: a -> StackOp a
returnVal = undefined

-- 6. Using returnVal, fix sumOfStack so that it does not "mutate" the stack

-- 7. Using returnVal, implement removeSecond, removeThird, and removeNth
-- so that they also *return* the removed item.

-- 8. len: return the number of elements on the stack. Do not affect the stack.
len :: StackOp Integer
len = undefined

-- 9. stackMap: mutate stack by applying a function to every element in the stack.
stackMap :: (Integer -> Integer) -> StackOp ()
stackMap = undefined

-- 10. stackFilter: mutate stack by removing all elements that don't satisfy
-- the input predicate
stackFilter :: (Integer -> Bool) -> StackOp ()
stackFilter = undefined

-- 11. stackFold: fold a function an initial value across a stack. Leave the stack
-- unchanged.
stackFold :: (a -> Integer -> a) -> a -> StackOp a
stackFold = undefined

