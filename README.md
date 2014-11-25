# Stupid Cryptanalysis Tools
Copyright &copy; 2014 Bart Massey

These are some very simple, relatively untested Haskell
tools to aid cryptanalysis of really unsophisticated
ciphers. All tools leave characters outside the range 'A-Z'
untransformed.

* `transpose.hs`: Given a count as an argument, transpose
  standard input to standard output with that spacing.
  Ignore newlines on input and produce 78-character lines on
  output.

* `rot.hs`: Show all 26 possible Caesar decryptions of the
  input, one per line.

* `subst.hs`: Try a very primitive frequency-table-based
  decryption of a general monalphabetic substitution cipher.
  Basically substitutes ETAONRISHD for the highest-frequency
  letters in the ciphertext in order, and translates all
  other alphabetics to '_'.

* `vigenere.hs`: Given the key as an argument, decrypt the
  given ciphertext as a
  [Vigenère_cipher](http://en.wikipedia.org/wiki/Vigenère_cipher)
 
This work is available under a "BSD License". Please see the
file COPYING in this distribution for license terms.
