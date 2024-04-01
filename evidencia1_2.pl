:- consult('evidencia1_test_cases.pl').

% Acceptable State:
acceptable(23).

% Transitions:

% c-
move(0,1, 'c').

% -h-
move(1,2, 'h').

% -ielago
move(1,3, 'i').
move(3,4, 'e').
move(4,5, 'l').
move(5,6, 'a').
move(6,7, 'g').
move(7,23, 'o').

% -aum-
move(2,8, 'a').
move(8,11, 'u').
move(11,12, 'm').

% -as
move(12,13, 'a').
move(13,23, 's').

% -urky
move(12,14, 'u').
move(14,15, 'r').
move(15,16, 'k').
move(16,23, 'y').

% -erem
move(2,9, 'e').
move(9,17, 'r').
move(17,18, 'e').
move(18,23, 'm').

% -ouhada
move(2,10, 'o').
move(10,19, 'u').
move(19,20, 'h').
move(20,21, 'a').
move(21,22, 'd').
move(22,23, 'a').

% Main function:
word(Input) :- 
    string_chars(Input, Characters),
    process(Characters, 0).

word() :- 
    test().

% Base case:
process([], ActualState) :-
    acceptable(ActualState).

% Recursive case:
process([Character|Rest], ActualState) :-
    move(ActualState, NextState, Character),
    write(ActualState), write(' -> '), write(NextState), write(' '), write(Character), nl,
    !,
    process(Rest, NextState).
