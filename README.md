# Implementation-of-Computational-Methods

## Description:
The language I chose was the set of words from the Chalkobsa language: 
* chaumas 
* chaumurky
* cherem
* chouhada
* cielago

"Chalkobsa" is a fictional language created by Frank Herbert, with a focus on emotional expression over the transmission of specific meanings. In the context of the Dune universe, "Chakobsa" is a secret language used by the Fremen, the inhabitants of the planet Arrakis. This language allows them to covertly communicate and coordinate during battles and other dangerous situations.

## Models:
I chose to do a DFA since a DFA only needs one go to determine whether a string is accepted or not. Furthermore, in a DFA, for each state and each input, there is exactly one transition to another state. This means that there is no ambiguity in how an input string is processed, making it easier to identify specific words. And DFAs are simpler to implement and understand than Non-Deterministic Finite Automata (NFA). Each state in a DFA has a clear and unique transition for each possible input

![](https://github.com/Dieg0Lir4/Implementation-of-Computational-Methods/blob/main/automata.png)

The previous automaton can be represented with the next regular expression

RE: c(h(aum(as|urky)|erem|ouhada)|ielago)



## Implementation:

For the implementation of my analysis of certain words of Chakobsa, I decided to use the structure shown in the representation of my automata that can be seen in the image called "automata.png"

The finished automaton is in the file "evidencia1_2.pl" to be able to use my automaton you will have to use a prolog interpreter.

To use the automata use this format:

["rute-to-the-file"].

To check if a word belongs to the list of previously established words, use the following format:

word(the-word-you-want-to-check).

Prolog will return true or false, depending on whether the given word is in the list

EXAMPLES:

* word(cielago) -> true
* word(cielagos) ->false
* word(chaumas) -> true
* word(cHAUMAS) -> false
* word(hola) -> false
* word(pikachu) -> false
* word(cherem) -> true


Note: writing word() without a word will run the test cases.


## Test

You can find the test cases in the file "evidencia1_test_cases.pl"

To use it, just enter the following format:

test() or word().

Make sure "evidencia1_test_cases.pl" is in the same directory as "evidencia1_2.pl"


## Analysis

### Time complexity

```
word(Input) :- 
    string_chars(Input, Characters),
    process(Characters, 0).
```
The function string_chars is built in prolog, it needs to go through the entire length of the string to convert it to a list of characters, making it of O(n) complexity. Where n is equal to the length of the string

The function process do two main actions:

```
% Recursive case:
process([Character|Rest], ActualState) :-
    move(ActualState, NextState, Character),
    write(ActualState), write(' -> '), write(NextState), write(' '), write(Character), nl,
    !,
    process(Rest, NextState).
```

ONE: Call the fact move() to determine the next state of the automata. The time complexity of this operation depends on how many facts it has to check, then this operation has a time complexity of O(m), where m is the number of facts for move(). 

TWO: Calls itself recursively to process the rest of the character list. Since process() is called once for each character in the list, this operation has a time complexity of O(n).

Therefore the time complexity of the code is O(n*m) and since it has 27 facts for move() the final time complexity is O(27n)


### Efficient for the problem

This solution is efficient for the problem, since whenever the list of characters is greater than or equal to one, then the complexity will always be the one established above O(27n). 

As demonstrated in the following image:



Therefore, this solution is efficient if the number of move() facts defined and the length of the input string is small.




## Bibliography

* Wiki, C. T. D. (n.d.). Chakobsa. Dune Wiki. https://dune.fandom.com/es/wiki/Chakobsa
* Wiki, C. T. D. (n.d.). Chakobsa. Dune Wiki. https://dune-fandom-com.translate.goog/wiki/Chakobsa?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es-419&_x_tr_pto=sc
* colaboradores de Wikipedia. (2023, August 16). Chakobsa (idioma ficticio). Wikipedia, La Enciclopedia Libre. https://es.wikipedia.org/wiki/Chakobsa_(idioma_ficticio)
* SWI-Prólogo --string_chars/2. (n.d.). https://www.swi-prolog.org/pldoc/man?predicate=string_chars/2
* Adam J. Stewart and Zaid Qureshi Prolog (2023, April 30) Documentation Release 1.0.0 https://www.nationalgeographic.es/animales/abeja


