-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.List

-- Return a histogram of characters of `text` in count/char
-- form.
mkHist :: String -> [(Int, Char)]
mkHist text =
    sort $ map mkCounts $ group $ sort text
    where
      mkCounts [] = error "empty group"
      mkCounts cs@(c : _) = (- (length cs), c)

-- Given a histogram bin and a substitution character,
-- make a new substitution tuple.
mkSubst :: (Int, Char) -> Char -> (Char, Char)
mkSubst (_, c) s = (c, s)

-- Apply a substitution from `substs` to `c` to get
-- a new character.
applySubst :: [(Char, Char)] -> Char -> Char
applySubst substs c =
    case lookup c substs of
      Just s -> s
      Nothing -> error "missing subst"

-- Apply a substitution that matches 'E' to a highest-frequency
-- letter, 'T' to a next, and so forth.
subst :: String -> String
subst text =
    let hist = mkHist text
        substs = zipWith mkSubst hist (['E', 'T', 'A', 'O', 'N',
                                        'R', 'I', 'S', 'H', 'D'] ++
                                       ['_', '_' ..]) in
    map (applySubst substs) text


-- Glue the lines together, do the substitutions, and return the result.
main :: IO ()
main = interact ((++ ['\n']) . subst . concat . lines)
