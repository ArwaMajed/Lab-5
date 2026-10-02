% --- Facts ---

% Males
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Females
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parents
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% --- Rules ---

father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

son(X, Y) :- parent(Y, X), male(X).

daughter(X, Y) :- parent(Y, X), female(X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X, Y) :- sibling(X, Y), male(X).

sister(X, Y) :- sibling(X, Y), female(X).

grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

aunt(X, Y) :- sister(X, Z), parent(Z, Y).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).

cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W).


ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
%----------------------------------------------------
% 3. Testing Queries and Answers

% 60 ?- consult(['/Users/arwa/Lab5Task1.pl']).
% true.

% 61 ?- father(homer, bart).
% true.

% 62 ?- father(X, lisa).
% X = homer .

% 63 ?- mother(marge, maggie).
% true.

% 64 ?- mother(X, ling).
% X = selma.

% 65 ?- son(bart, homer).
% true.

% 66 ?- son(X, abraham).
% X = herb ;
% X = homer.

% 67 ?- daughter(lisa, marge).
% true.

% 68 ?- daughter(X, clancy).
% X = marge ;
% X = patty ;
% X = selma.

% 69 ?- brother(herb, homer).
% true .

% 70 ?- brother(X, lisa).
% X = bart .

% 71 ?- sister(patty, selma).
% true .

% 72 ?- sister(X, bart).
% X = lisa ;
% X = maggie .

% 73 ?- grandfather(abraham, bart).
% true.

% 74 ?- grandfather(X, ling).
% X = clancy .

% 75 ?- aunt(patty, bart).
% true .

% 76 ?- aunt(X, ling).
% X = marge ;
% X = patty .

% 77 ?- uncle(herb, lisa).
% true .

% 78 ?- uncle(X, maggie).
% X = herb .

% 79 ?- cousin(ling, bart).
% true .

% 80 ?- cousin(X, lisa).
% X = ling .

% 81 ?- ancestor(abraham, maggie).
% true .

% 82 ?- ancestor(clancy, X).
% X = marge ;
% X = patty ;
% X = selma ;
% X = bart ;
% X = lisa ;
% X = maggie ;
% X = ling.
