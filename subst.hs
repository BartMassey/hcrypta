-- Copyright © 2014 Bart Massey
-- [This program is licensed under the "3-clause ('new') BSD License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

import Data.Char
import Data.List

mkHist text =
    sort $ map mkCounts $ group $ sort text
    where
      mkCounts [] = error "empty group"
      mkCounts cs@(c : _) = (- (length cs), c)

mkSubst (_, c) s = (c, s)

applySubst substs c =
    case lookup c substs of
      Just s -> s
      Nothing -> error "missing subst"

subst text =
    let hist = mkHist text
        substs = zipWith mkSubst hist (['E', 'T', 'A', 'O', 'N',
                                        'R', 'I', 'S', 'H', 'D'] ++
                                       ['_', '_' ..]) in
    map (applySubst substs) text

main = interact ((++ ['\n']) . subst . concat . lines)
