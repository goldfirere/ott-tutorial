An `ott` Tutorial
=================

This repo contains several versions of a presentation of the simply-typed
lambda calculus (STLC) using the tool [ott](https://github.com/ott-lang/ott).
These versions use progressively more ott features and can serve as
a way to progress toward mastery of the tool.

* stlc1: Very basic ott files and Makefile without any fancy formatting

* stlc2: Basic tex homs to produce moderately-prettified output

* stlc3: More tex homs, and operational semantics.

* stlc4: Use of the `ottalt` package, and working extraction into Coq.
       This version demonstrates the use of
       the 'substitutions' ott directive to generate a substitution function
       over grammar elements.

* stlc5: Tuples are added to the language, demonstrating both forms of
       list syntax. The Coq extraction still works, and there is a partial
       proof of the canonical form for tuples. The cruft that Coq extraction
       generates can be removed using code in cruft.v.

