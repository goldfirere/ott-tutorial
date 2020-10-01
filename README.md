An `ott` Tutorial
=================

This repo contains several versions of a presentation of the simply-typed
lambda calculus (STLC) using the tool [ott](https://github.com/ott-lang/ott).
These versions use progressively more ott features and can serve as
a way to progress toward mastery of the tool.

* stlc1: Very basic ott files and Makefile without any fancy formatting

* stlc2: Basic tex homs to produce moderately-prettified output

* stlc3: More tex homs, along with some basic setup for Coq extraction
       The Makefile supports 'make coq', but the make intentionally fails --
       you can try to fix the problems and see if you get all the way to
       stlc4. This version also is the first to define values as a subgrammar
       of expressions.

* stlc4: Working extraction into Coq, along with the one clause of the
       canonical forms lemma proved. This version demonstrates the use of
       the 'substitutions' ott directive to generate a substitution function
       over grammar elements.

* stlc5: Tuples are added to the language, demonstrating both forms of
       list syntax. The Coq extraction still works, and there is a partial
       proof of the canonical form for tuples. The cruft that Coq extraction
       generates can be removed using code in cruft.v.

* stlc6: Full proof of the second clause of canonical forms, using the Ltac
       notation provided in cruft.v.
