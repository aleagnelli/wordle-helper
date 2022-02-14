import Lib (withChar, withExact, withoutChar)
import System.Exit
import Test.HUnit

main :: IO ()
main = do
  counts2 <-
    runTestTT
      ( test
          [ testWithCharDiscardWord,
            testWithCharKeepsWord,
            testWithoutCharDiscardWord,
            testWithoutCharKeepsWord,
            testWithExactDiscardWord,
            testWithExactKeepsWord
          ]
      )
  if errors counts2 + failures counts2 == 0
    then exitSuccess
    else exitFailure

testWithCharDiscardWord = TestCase (assertEqual "word without char gets discarded" [] (withChar "g" ["abcde"]))

testWithCharKeepsWord = TestCase (assertEqual "word with char is kept" ["abefg"] (withChar "g" ["abefg"]))

testWithoutCharDiscardWord = TestCase (assertEqual "word with char gets discarded" [] (withoutChar "a" ["abcde"]))

testWithoutCharKeepsWord = TestCase (assertEqual "word without char is kept" ["abcde"] (withoutChar "f" ["abcde"]))

testWithExactDiscardWord = TestCase (assertEqual "word without char in pos gets discarded" [] (withExact [(0, 'f')] ["abcde"]))

testWithExactKeepsWord = TestCase (assertEqual "word with char in pos is kept" ["abcde"] (withExact [(0, 'a')] ["abcde"]))
