# Wordle helper
This repo provides a helper to find the correct answer for the famous [wordle game](https://www.powerlanguage.co.uk/wordle/)

_I created it as an exercise to discover haskell_

## Usage
```sh
./app.sh run --with=... --without=... --exact=...
```
```
The tool will return a list of possible words

Arguments: 
  --with      list of letters that are present in the word (yellow)
              eg. `--with=absr` will return all words with letters(absr) present in any position and order
  --without   list of letters that are not in the word (no color)
              eg. `--without=fe` will return all words that not contains f or e
  --exact     a word of five letters with letters in the correct position (green)
              use underscore as a placeholder for unknown letters
              eg. `--exact=__r__` will return all words with r as third letter
```
