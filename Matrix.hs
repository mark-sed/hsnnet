{- 
 Module for working with matrixes in Nnet
-}

module Matrix where

-- | Operator to multiply 2 lists within each other
(<.>) :: Num a => [a] -> [a] -> [a]
(<.>) x y
    | length x /= length y = error "Mismatched sizes of lists"
    | otherwise = zipWith (*) x y

-- | Operator to multiply 2 lists of lists
(<<.>>) :: Num a => [[a]] -> [[a]] -> [[a]]
(<<.>>) (xx:xxs) (yy:yys) 
    | length (xx:xxs) /= length (yy:yys) = error "Mismatched sizes of lists"
    | null xxs = [xx <.> yy]
    | otherwise = xx <.> yy : xxs <<.>> yys

-- | Operator to subtract 2 lists from each other
(<->) :: Num a => [a] -> [a] -> [a]
(<->) x y
    | length x /= length y = error "Mismatched sizes of lists"
    | otherwise = zipWith (-) x y

-- | Operator to subtract 2 lists of lists
(<<->>) :: Num a => [[a]] -> [[a]] -> [[a]]
(<<->>) (xx:xxs) (yy:yys) 
    | length (xx:xxs) /= length (yy:yys) = error "Mismatched sizes of lists"
    | null xxs = [xx <-> yy]
    | otherwise = xx <-> yy : xxs <<->> yys

-- | Operator to add 2 lists to each other
(<+>) :: Num a => [a] -> [a] -> [a]
(<+>) x y
    | length x /= length y = error "Mismatched sizes of lists"
    | otherwise = zipWith (+) x y

-- | Operator to add 2 lists of lists
(<<+>>) :: Num a => [[a]] -> [[a]] -> [[a]]
(<<+>>) (xx:xxs) (yy:yys) 
    | length (xx:xxs) /= length (yy:yys) = error "Mismatched sizes of lists"
    | null xxs = [xx <+> yy]
    | otherwise = xx <+> yy : xxs <<+>> yys

-- | Creates dot product of 2 lists of same size
dot1D :: Num a => [a] -> [a] -> a
dot1D [] [] = 0
dot1D [] (_:_) = error "Mismatched vector sizes"
dot1D (_:_) [] = error "Mismatched vector sizes"
dot1D (x:xs) (y:ys) = (x * y) + (dot1D xs ys)

-- | Created dot product of 2 matrixes
-- | The second matrix should not be transposed,
--   it has to have the same dimensions.
dot :: Num a => [[a]] -> [[a]] -> [[a]]
dot [] _ = [[]]
dot (xx:xxs) yys 
    | null xxs = [[dot1D xx y | y <- tyys]]
    | otherwise = [dot1D xx y | y <- tyys] : dot xxs yys
    where tyys = [[a!!b | a <- yys] | b <- [0..((length (yys!!0))-1)]]


