Password Generator
==================

 - [Introduction](#introduction)
 - [OCaml implementation](#ocaml-implementation)
   - [Building](#building)
   - [Running](#running)

## Introduction

A password generator following the rules indicated in [Rosetta Code](http://rosettacode.org/wiki/Password_generator).

I copy-paste said rules here for information:

> Create a password generation program which will generate passwords containing random ASCII characters from the following groups:
> ```
>          lower-case letters:  a -> z
>          upper-case letters:  A -> Z
>                      digits:  0 -> 9
>  other printable characters:  !"#$%&'()*+,-./:;<=>?@[]^_{|}~ 
>  (the above character list excludes white-space, backslash and grave) 
> ```
> 
> The generated password(s) must include   at least one   (of each of the four groups):
> ```
>    lower-case letter, 
>    upper-case letter,
>    digit  (numeral),   and 
>    one  "other"  character. 
> ```
> 
> The user must be able to specify the password length and the number of passwords to generate.
> 
> The passwords should be displayed or written to a file, one per line.
> 
> The randomness should be from a system source or library.
> 
> The program should implement a help option or button which should describe the program and options when invoked.
> 
> You may also allow the user to specify a seed value, and give the option of excluding visually similar characters.
> 
> For example: `Il1 O0 5S 2Z` where the characters are:
> 
>  - capital eye, lowercase ell, the digit one
>  - capital oh, the digit zero
>  - the digit five, capital ess
>  - the digit two, capital zee

I consider my code is not worth being added to the Rosetta Code site... Maybe later, in a few months or in a few years...


## OCaml
I chose to implement the program in OCaml, just because... well... because... why not?

Just one word here: I don't use external libraries such as Core or Batteries, because I want to learn the language, and sticking to the default library provided by the standard package makes things a bit harder, but also forces to think a bit more...

_If it's too easy, it ain't that funny_. -- Author: Me. 

### Building
An Oasis file is provided:
```
$ cd ocaml
$ oasis setup
$ ocaml setup.ml -configure
$ ocaml setup.ml -build
```
A file (a symbolic link, actually) named `pwdgen.native` (or `pwdgen.byte` depending on your system) should be present now.

The program can also be built by hand using `ocamlbuild`:
```
$ cd ocaml/src
$ ocamlbuild pwdgen.native
```

### Running
Information is shown using the `--help` option:
```
$ ./pwdgen.native --help
./pwdgen.native: Generate random passwords.
usage: ./pwdgen.native [--len <number>] [--num <number>] [--seed <number>] [--safe]
  --len : length of the password (default and minimum = 4)
  --num : number of passwords to be generated (default and minimum = 1)
  --seed : arbitrary number used as a seed for the random number generator
  --safe : exclude visually similar characters
  -help  Display this list of options
  --help  Display this list of options
```

Quick example:
```
$ ./pwdgen.native --len 20 --num 5 --safe --seed 987654321
4rtu/M;h_L@@?m{N/#i?
9!;e7T^qFmrL.QvQb^|a
tjn+aWB{v!A<x:%;7jw@
-[:vA3sf4Pk{_f$%jGJW
kuRo_i}$$N#.Hbz9y~3W
```
Using the same seed generates the same passwords (useful for testing, for example).

---
