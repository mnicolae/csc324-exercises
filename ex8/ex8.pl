:- module(ex8,
       [ tree/1,
         tree/3,
         contains/2,
         preorder/2]).

% empty tree.
tree(empty).
% General tree. Assume Left and Right are valid trees themselves.
% An "atom" is just a literal constant like "bob", but is NOT a number.
tree(X, Left, Right) :- atom(X).

% For example,
% tree(bob, tree(alice, tree(empty), tree(empty)), tree(empty)).

% contains(X, Elem)


% preorder(X, List)
