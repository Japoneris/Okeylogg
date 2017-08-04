# What

Ocaml keylogger.

Get the elapsed time between two hits on the keyboard.

# Why

Want to study typing speed on my keyboard.

# Who

Me

# How

No need of specific lib. Any recent version of Ocaml might be okay.

Compile the Ocaml file `keylogg.ml` :

`ocamlc -custom unix.cma  keylogg.ml -cclib -lunix -o Keyloggs`

Reccord your next terminal hit. Stop it using *escape*.

To test it directly:

`./Keyloggs`

The printing must be a little bit uggly as the script will print what you have typed twice. You can do some change on the script in order to remove the character print part, and keep only the delta t.

To save it in a file:

`./Keyloggs >> My_reccord.txt`

# Issues I had

- When using Scanf or Printf modules, it doesn't flush the buffer, so you can wait forever before geting any output. Plus, it will evaluate the program when you say "stop", and so you get ridiculous time difference between key hit.

# Next

- Study myself, record and exploit data
- Try to go to a deeper level to get key **up/down**
- Change it in order to use it as `read_char ()` everywhere to study key hit in any context
