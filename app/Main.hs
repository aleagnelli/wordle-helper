module Main where

import Lib (solve, parse)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs 
    solve $ map parse args