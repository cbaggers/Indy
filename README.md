I dont trust this yet

Indy - Thread safe compare and swap

Aims to be like clojure atom

Indy likes idols, and likes to swap them without boulders smashing his head in.

function: (idolize val) Make an idol from a val

function: (behold idol) Get the value from an idol

function: (swap idol swap-function) atomically swap the value of the idol with the result of swap-function. swap-function is called with the current value of the idol. swap-function may be called multiple times, and thus should be free of side effects. Returns the value that was swapped in.

Massive thanks to the folks behind the chanl library for common lisp. Their trivial-cas package is the basis for this
Current state of this package

WIP: This only works on sbcl so far. Will support for other implementations when I have time
