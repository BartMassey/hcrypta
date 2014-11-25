-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.Char

tryrot text offset =
    map rot $ concat text
    where
      rot c
          | c >= 'A' && c <= 'Z' =
              let base = ord c - ord 'A' in
              chr $ ((base + offset) `mod` 26) + ord 'A'
          | otherwise = c

tryrots text =
    map (tryrot text) [1..26]

main = interact (unlines . tryrots . lines)
