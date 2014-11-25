-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.Char
import System.Environment (getArgs)

-- Rotate the character `c` by the offset character `oc` and
-- return the resulting character. Will only rotate uppercase
-- alphabetics.
rot :: Char -> Char -> Char
rot oc c
    | c >= 'A' && c <= 'Z' =
        let base = ord c - ord 'A'
            offset = ord oc - ord 'A' in
        chr $ ((base + offset) `mod` 26) + ord 'A'
    | otherwise = c

-- Apply a Vigenere cipher. Each successive character
-- will be substituted using the alphabet selected
-- from the keytext character. The keytext cycles.
vig :: String -> String -> String
vig keytext plaintext =
    zipWith rot (concat $ repeat keytext) plaintext

-- The main program joins all the lines, applies the
-- decipher, and then tacks a newline onto the result.
main :: IO ()
main = do
  [key] <- getArgs
  interact ((++ ['\n']) . vig key . concat . lines)
