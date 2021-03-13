{- |
Neural network module
-} 

import Nnet
import System.Environment (getArgs)

-- | Input traning data
inputs :: [[Float]]
inputs = [[0.0, 1.0, 0.0],
          [0.0, 1.0, 1.0],
          [0.0, 0.0, 1.0],
          [1.0, 0.0, 0.0],
          [1.0, 0.0, 1.0],
          [1.0, 1.0, 1.0]]
-- | Expected output
outputs :: [[Float]]
outputs = [[0.0], [0.0], [0.0], [1.0], [1.0], [1.0]]
-- | Weights of inputs
weights :: [[Float]]
weights = [[0.5], [0.5], [0.5]]
-- | Default number of epochs
epochs :: Int
epochs = 25000

-- | Does one training epoch and should be called
--   with iterate
training :: [[Float]] -> [[Float]]
training w = train sigmoid inputs outputs w

-- | Main function
-- | Takes 3 arguments and 1 optional
--   First 3 arguments are data from which to predict
--   4th argument can be the amount of epochs in training
main :: IO()
main = do
    argv <- getArgs
    let w = last $ take (e argv) $ iterate training weights in
        print $ predict (pdat argv) w sigmoid
    where e a
            | length a > 3 = read (a!!3)::Int
            | otherwise = epochs
          pdat a = [[read (a!!0)::Float, read (a!!1)::Float, read (a!!2)::Float]]
