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