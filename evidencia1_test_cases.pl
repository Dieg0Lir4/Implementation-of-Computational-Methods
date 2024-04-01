test() :-
    test1,
    test2,
    test3,
    test4,
    test5,
    test6,
    test7,
    test8,
    test9,
    test10,
    test11,
    test12,
    test13,
    test14,
    test15.


test1:-
    write('Test: '), nl,
    write('Analizing: cielago'), nl,
    write('Expected: true'), nl,
    word(cielago), nl, nl.

test2:-
    write('Analizing: chielago'), nl,
    write('Expected: false'), nl,
    \+ word(chielago), nl, nl.

test3:-
    write('Analizing: chielagosese'), nl,
    write('Expected: false'), nl,
    \+ word(chielagosese), nl, nl.

test4:-
    write('Analizing: chaumas'), nl,
    write('Expected: true'), nl,
    word(chaumas), nl, nl.

test5:-
    write('Analizing: chaumase'), nl,
    write('Expected: false'), nl,
    \+ word(chaumase), nl, nl.

test6:-
    write('Analizing: chauoomasea'), nl,
    write('Expected: false'), nl,
    \+ word(chauoomasea), nl, nl.

test7:-
    write('Analizing: chaumurky'), nl,
    write('Expected: true'), nl,
    word(chaumurky), nl, nl.

test8:-
    write('Analizing: chaumurkya'), nl,
    write('Expected: false'), nl,
    \+ word(chaumurkya), nl, nl.

test9:-
    write('Analizing: chaumerem'), nl,
    write('Expected: false'), nl,
    \+ word(chaumerem), nl, nl.

test10:-
    write('Analizing: cherem'), nl,
    write('Expected: true'), nl,
    word(cherem), nl, nl.

test11:-
    write('Analizing: cheremas'), nl,
    write('Expected: false'), nl,
    \+ word(cheremas), nl, nl.

test12:-
    write('Analizing: cheorom'), nl,
    write('Expected: false'), nl,
    \+ word(cheorom), nl, nl.

test13:-
    write('Analizing: chouhada'), nl,
    write('Expected: true'), nl,
    word(chouhada), nl, nl.

test14:-
    write('Analizing: chouhadades'), nl,
    write('Expected: false'), nl,
    \+ word(chouhadades), nl, nl.

test15:-
    write('Analizing: chouchou'), nl,
    write('Expected: false'), nl,
    \+ word(chouchou), nl, nl.

