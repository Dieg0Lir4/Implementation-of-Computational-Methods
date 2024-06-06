# Implementation-of-Computational-Methods

## Description:
The language I chose was the set of words from the Chalkobsa language: 
* chaumas 
* chaumurky
* cherem
* chouhada
* cielago

"Chalkobsa" is a fictional language created by Frank Herbert, with a focus on emotional expression over the transmission of specific meanings. In the context of the Dune universe, "Chakobsa" is a secret language used by the Fremen, the inhabitants of the planet Arrakis. This language allows them to covertly communicate and coordinate during battles and other dangerous situations.

The modeling technique for this solution I choose was Deterministic Finite Automata, since as explained by GeeksforGeeks, a Deterministic Finite Automaton (DFA) is suitable for representing systems where, for each input symbol, there exists only one possible transition to a next state. This is exactly what I need for the analysis of the Chakobsa language, where each input symbol (character) leads to a unique state transition. (GfG, 2023)

## Models:
I chose to do a DFA since a DFA only needs one go to determine whether a string is accepted or not. Furthermore, in a DFA, for each state and each input, there is exactly one transition to another state. This means that there is no ambiguity in how an input string is processed, making it easier to identify specific words. And DFAs are simpler to implement and understand than Non-Deterministic Finite Automata (NFA). Each state in a DFA has a clear and unique transition for each possible input

![](https://github.com/Dieg0Lir4/Implementation-of-Computational-Methods/blob/main/automata.png)

alphabets ∑={c, h, a, u, m, s, r, k, y, e, o, d, i, l, g}  

The previous automaton can be represented with the next regular expression

RE: ^c(h(aum(as|urky)|erem|ouhada)|ielago)$



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

![](https://github.com/Dieg0Lir4/Implementation-of-Computational-Methods/blob/main/Induction.png)

Therefore, this solution is efficient because the number of move() facts defined is small and the the average length of the input string is small. 

### Comparation

The first way that occurred to me to detect if it is a Chalkobsa word was the following:

```
word(chaumas).
word(chaumurky).
word(cherem).
word(chouhada).
word(cielago).

find_word(Input) :-
    word(Input),
    write('Word found: '), write(Input), nl.
```
But this way an automaton that passes different states depending on the characters is not created, so it was discarded

Another way to do this using iteration instead of recursion, as shown in this C++ code example made by Copilot:

```
bool is_word(const std::string input) {
    int state = 0;  // Start at state 0
    for (char c : input) {
        auto it = transitions.find({state, c});
        if (it == transitions.end()) {
            // No transition found, this is not a word
            return false;
        }
        state = it->second;  // Move to the next state
    }
    // The input is a word if we ended in the acceptable state
    return state == acceptableState;
}
```
GitHub Copilot. (2024). Code generated by GitHub Copilot.

but since prolog does not have certain operators to make it easier to work with iteration, I chose to do it recursively. It should be noted that doing it in the prolog was by own decision and not really because prolog is better than other programming languages.


Finally there was a faster way to implement the solution. 

If we remember the complexity is O(27n), this 27 comes from having to consult the 27 rules established in my code. In order to reduce this number we can use another data structure to make the search faster, but again prolog does not have an easy way to input other data structures.

We can use the following image to choose another data structure:


![](https://github.com/Dieg0Lir4/Implementation-of-Computational-Methods/blob/main/big-o-cheat-sheet-poster.png)


If we use a binary tree we can reduce the complexity from O(27n) to O(nlog(n)).

But since using binary tree in prolog is way off of what I can do in prolog, and haven discard the other way in prolog to do this evidence, the best solution within my capacity was chosen



## Bibliography

* Wiki, C. T. D. (n.d.). Chakobsa. Dune Wiki. https://dune.fandom.com/es/wiki/Chakobsa
* Wiki, C. T. D. (n.d.). Chakobsa. Dune Wiki. https://dune-fandom-com.translate.goog/wiki/Chakobsa?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es-419&_x_tr_pto=sc
* colaboradores de Wikipedia. (2023, August 16). Chakobsa (idioma ficticio). Wikipedia, La Enciclopedia Libre. https://es.wikipedia.org/wiki/Chakobsa_(idioma_ficticio)
* SWI-Prólogo --string_chars/2. (n.d.). https://www.swi-prolog.org/pldoc/man?predicate=string_chars/2
* Adam J. Stewart and Zaid Qureshi Prolog (2023, April 30) Documentation Release 1.0.0 https://www.nationalgeographic.es/animales/abeja
* math2me. (2017). Demostrar una fórmula por INDUCCIÓN MATEMÁTICA │ ejercicio 1 [Video]. In YouTube. https://www.youtube.com/watch?v=orhBEEKe9Ws
* «Big O notation» o como obtener mayor eficiencia en tus algoritmos. (2018, June 24). Coding Backside. https://codingbackside.wordpress.com/2018/06/24/big-o-notation/
* GfG. (2023, July 21). Difference between DFA and NFA. GeeksforGeeks. https://www.geeksforgeeks.org/difference-between-dfa-and-nfa/


