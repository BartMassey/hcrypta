-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.List
import System.Environment

-- Group the text `cs` into groups of `k` characters,
-- with the last group potentially short.
gather :: Int -> String -> [String]
gather k cs
  | null rest = [cs]
  | otherwise = first : gather k rest
  where
    (first, rest) = splitAt k cs

-- Glue everything together, gather it into the right units,
-- transpose it, glue it back together, and gather it into
-- 78-char lines for printing.
main :: IO ()
main = do
  [countStr] <- getArgs
  interact (unlines . gather 78 . concat . transpose .
            gather (read countStr) . concat . lines)
