
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    writeln('Hi, This is the "Name Game"'),
    writeln('You will be given a set of English letters in which you will add, delete or move to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    writeln('Enter your choice....'),
    read(Choice),
    process(Choice).

process(1) :-
    writeln('Current letters:'),
    display_letters,
    menu.

process(2) :-
    writeln('Enter the letter to add (end with a dot .):'),
    read(L),
    assert(letter(L)),
    writeln('Letter added!'),
    menu.

process(3) :-
    writeln('Enter the letter to add at the top (end with a dot .):'),
    read(L),
    asserta(letter(L)),
    writeln('Letter added at the top!'),
    menu.

process(4) :-
    writeln('Enter the letter to add at the bottom (end with a dot .):'),
    read(L),
    assertz(letter(L)),
    writeln('Letter added at the bottom!'),
    menu.

process(5) :-
    writeln('Enter the letter to delete (end with a dot .):'),
    read(L),
    ( retract(letter(L)) ->
        writeln('Letter deleted!')
    ;
        writeln('Letter not found!')
    ),
    menu.

process(6) :-
    retractall(letter(_)),
    writeln('All letters deleted!'),
    menu.

process(7) :-
    writeln('Exiting the Name Game. Goodbye!'),
    !.


process(_) :-
    writeln('Invalid choice, please try again.'),
    menu.

display_letters :-
    letter(X),
    write(X), write(' '),
    fail.
display_letters :-
    nl.