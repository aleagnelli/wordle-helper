module Lib
  ( parse,
    solve,
    withChar,
    withoutChar,
    withExact,
  )
where

import Data.List (isPrefixOf)

data Arg = With [Char] | Without [Char] | Exact [(Int, Char)]

parse :: String -> Arg
parse arg
  | "--with=" `isPrefixOf` arg = With $ drop 7 arg
  | "--without=" `isPrefixOf` arg = Without $ drop 10 arg
  | "--exact=" `isPrefixOf` arg = Exact $ parseExact $ drop 8 arg
  | otherwise = error $ "Invalid arg " ++ arg

parseExact :: [Char] -> [(Int, Char)]
parseExact = filter (\(_, x) -> x /= '_') . zip [0 ..]

solve :: [Arg] -> IO ()
solve args = do
  content <- readFile "words.txt"
  let words = lines content
  let solved = findMatches args words
  print solved

findMatches :: [Arg] -> [String] -> [String]
findMatches [] words = words
findMatches (With with : args) words = findMatches args $ withChar with words
findMatches (Without without : args) words = findMatches args $ withoutChar without words
findMatches (Exact exact : args) words = findMatches args $ withExact exact words

withChar :: [Char] -> [String] -> [String]
withChar [] words = words
withChar _ [] = []
withChar (c : otherChars) words =
  withChar otherChars [w | w <- words, c `elem` w]

withoutChar :: [Char] -> [String] -> [String]
withoutChar [] words = words
withoutChar _ [] = []
withoutChar (c : otherChars) words =
  withoutChar otherChars [w | w <- words, c `notElem` w]

withExact :: [(Int, Char)] -> [String] -> [String]
withExact [] words = words
withExact ((pos, c) : otherExact) words =
  withExact otherExact [w | w <- words, w !! pos == c]
