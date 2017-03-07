jivebunny
=========

`jivebunny` is a probilistic demultiplexer for double-indexed Illumina
sequencing runs.  It is intended to both detect and remove contamination
with unexpected libraries, and to demultiplex while providing an easy to
understand quality measure.

This is work-in-progress.  For the time being, we have `jivebunny`,
which operates on BAM files (and is a bit slow), and `bcl2bam`, which
converts BCL to BAM.  Eventually, both functions will be merged into one
tool.


Installation
------------

`jivebunny` uses Cabal, the standard installation mechanism for
Haskell.  It depends on the `biohazard` library and additional stuff
from Hackage.  To install, follow these steps:

* install a useable Haskell environment, either
 * install the Haskell Platform or have someone install it (see
   http://haskell.org/platform/ for details), or
 * install GHC (see http://haskell.org/ghc) and bootstrap Cabal (see
   http://haskell.org/cabal), and
 * run `cabal update` (takes a while to download the current package list),
* run `cabal install
  https://bitbucket.org/ustenzel/biohazard/get/0.6.13.tar.gz
  https://bitbucket.org/ustenzel/jivebunny/get/0.1.tar.gz`
  (takes even longer).

When done, on an unmodified Cabal setup, you will find the binaries in 
`${HOME}/cabal/bin`.  Cabal can install them in a different place, please 
refer to the Cabal documentation at http://www.haskell.org/cabal/ if 
you need that.  Sometimes, repeated installations and re-installations can result 
in a thoroughly unusable state of the Cabal package collection.  If you get error 
messages that just don't make sense anymore, please refer to 
http://www.vex.net/~trebla/haskell/sicp.xhtml; among other useful things, it 
tells you how to wipe a package database without causing more destruction.