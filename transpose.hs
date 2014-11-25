-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.List
import System.Environment

gather k cs
  | null rest = [cs]
  | otherwise = first : gather k rest
  where
    (first, rest) = splitAt k cs

main = do
  [countStr] <- getArgs
  interact (unlines . gather 78 . concat . transpose .
            gather (read countStr) . concat . lines)
