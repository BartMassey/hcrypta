-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.Char

-- Rotate the text by the given offset.
tryrot :: String -> Int -> String
tryrot text offset =
    map rot text
    where
      rot c
          | c >= 'A' && c <= 'Z' =
              let base = ord c - ord 'A' in
              chr $ ((base + offset) `mod` 26) + ord 'A'
          | otherwise = c

-- Output each offset in turn.
tryrots :: String -> [String]
tryrots text =
    map (tryrot text) [1..26]

-- Remove line boundaries, apply rots, show each of them.
main :: IO ()
main = interact (unlines . tryrots . concat . lines)
