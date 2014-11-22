:- module(ex7,
       [ sublist/2,
         with/3,
         shuffled/2]).

% sublist(S, L) : S is a sublist of list L.
% Assumes L is instantiated/ground (will be a concrete list).
sublist(S, L) :- append([_,S,_], L).

% with(L, E, LE) : LE is the the list L with E inserted somewhere.
% Assumes L and E are instantiated.
with(L, E, [E|L]).
with([H|L], E, [H|LE]) :- with(L, E, LE).

% shuffled(L, S) : S is list L in some order
shuffled(L,S) :- permutation(L,S).

