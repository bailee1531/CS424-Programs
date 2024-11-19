%% Bailee Segars
%% 11/15/2024
%% CS 424-01
%% I did not use AI, copy from another person, or copy this solution from the internet.
%% Used the online sandbox version of SWI-Prolog

%% Part 1. Count the number of times an element appears in a list.
countValues(_, [], 0).  %% Base case
countValues(H, [H|T], C) :-!, countValues(H, T, C2), C is C2 + 1.   %% Recursively call countValues if the element is found in the head and the tail.
%% ! above prevents from checking the countValues below.
countValues(H, [_|T], C) :- countValues(H, T, C).   %% Recursively call countValues if the element is found in the tail.


%% Part 2. Create a family tree.
% Atomic facts
male(chris).
male(gabe).
male(dan).
male(paul).
male(cody).

female(bailee).
female(katie).
female(patty).
female(libbie).
female(alison).

parent(patty, bailee).
parent(patty, katie).
parent(libbie, patty).
parent(dan, patty).
parent(gabe, cody).
parent(dan, gabe).
parent(libbie, gabe).
parent(paul, bailee).
parent(paul, katie).
parent(chris, paul).
parent(alison, paul).

% Predicates
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).
sister(X, Y) :- mother(A, X), mother(A, Y), father(B, X), father(B, Y), female(X), not(X=Y). %% not(X=Y) so the person in the query isn't also returned
brother(X, Y) :- mother(A, X), mother(A, Y), father(B, X), father(B, Y), male(X), not(X=Y). 
cousin(X, Y) :- grandmother(A, X), grandmother(A, Y), grandfather(B, X), grandfather(B, Y), not(X=Y), not(sister(X, Y)), not(brother(X, Y)). %% not(sister) and not(brother) so it doesn't return siblings of person in query
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).