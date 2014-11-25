-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.Char
import Data.List
import System.Environment (getArgs)

rot oc c
    | c >= 'A' && c <= 'Z' =
        let base = ord c - ord 'A'
            offset = ord oc - ord 'A' in
        chr $ ((base + offset) `mod` 26) + ord 'A'
    | otherwise = c


vig keytext plaintext =
    zipWith rot keytext plaintext

main = do
  [key] <- getArgs
  interact ((++ ['\n']) . vig (concat $ repeat key) . concat . lines)
