{- |
Module for creating neural network
-}

module Nnet where

import Data.List (transpose)
import Matrix

-- | Sigmoid function and its derivation for 1 value
sigmoid :: Floating a => a -> Bool -> a
sigmoid x deriv
    | deriv = x * (1 - x)
    | otherwise = 1/(1 + (exp (-x)))

-- | Activation function for whole matrix
activation :: Floating a => (a -> Bool -> a) -> Bool -> [[a]] -> [[a]]
activation _ _ [] = []
activation f deriv (xx:xxs) = activelem xx : activation f deriv xxs
                              where activelem [] = []
                                    activelem (x:xs) = f x deriv : activelem xs 

-- | Calculates forward step
forward :: Floating a => (a -> Bool -> a) -> [[a]] -> [[a]] -> [[a]]
forward f d w = activation f False $ dot d w

-- | Calculates backward step
backward :: Floating a => (a -> Bool -> a) -> [[a]] -> [[a]] -> [[a]] -> [[a]] -> [[a]]
backward f frwd out inp w = w <<+>> (dot (transpose inp) delta)
                            where delta = (out <<->> frwd) <<.>> (activation f True frwd)

-- | Predicts values based on input and trained weights
-- | Pass in matrix of input data, trained weights and 
--   activation function
predict :: Floating a => [[a]] -> [[a]] -> (a -> Bool -> a) -> [[a]]
predict d w f = activation f False $ dot d w

-- | Trains neural network
train :: Floating a => (a -> Bool -> a) -> [[a]] -> [[a]] -> [[a]] -> [[a]]
train f inp out w = backward f (forward f inp w) out inp w

