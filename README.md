# Indy - Thread safe compare and swap

Pretty much based on clojure's `Atom` without the daft name.

Indy likes idols, and likes to swap them without boulders smashing his head in.

`function: (idolize val)` Make an idol from a val

`function: (behold idol)` Get the value from an idol

`function: (swap idol)` atomically swap the value of the idol

Massive thanks to the folks behind the chanl library for common lisp. Their trivial-cas package is the basis for this
