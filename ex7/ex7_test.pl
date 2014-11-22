% This is a set of sample tests for Exercise 7.
% You can run it on the command line with
% > swipl -f ex7_test.pl -g run_tests -t halt
% Note: you can safely ignore warnings about "choicepoints".

% This line seems to be necessary to import the plunit library.
:- use_module(library(plunit)).

% This declares a test suite called "nats".
:- begin_tests(nats).
% This imports the exercise module. Don't change the file name!
:- use_module(ex7).

% These are tests for sublist/2; the "fail" indicates that 
% the goal on the right should fail.
test(sublist1) :- sublist([], []).
test(sublist2) :- sublist([], [1]).
test(sublist3) :- sublist([], [1,2]).
test(sublist4) :- sublist([1], [1,2]).
test(sublist5) :- sublist([2], [1,2]).
test(sublist6) :- sublist([1,2], [1,2]).
test(sublist7) :- sublist([1,2,3], [1,2,3,4,5,6,7,8]).
test(sublist8) :- sublist([3,4,5,6,7], [1,2,3,4,5,6,7,8]).
test(sublist9,fail) :- sublist([1,3,5], [1,2,3,4,5,6,7,8]).

% These are tests for with/3;
test(with1) :- with([], 1, [1]).
test(with2) :- with([1], 2, [1,2]).
test(with3) :- with([1], 2, [2,1]).
test(with4,fail) :- with([1,2,3], 99, [1,2,3,4]).

% These are tests for shuffled/2;
test(shuffled1) :- shuffled([], []).
test(shuffled2) :- shuffled([1], [1]).
test(shuffled3) :- shuffled([1,2], [2,1]).
test(shuffled4) :- shuffled([1,2,3], [3,2,1]).
test(shuffled5) :- shuffled([1,2,3], [2,3,1]).
test(shuffled6,fail) :- shuffled([1,2,3], [2,2,1]).

:- end_tests(nats).

% This is the "main" goal that's executed when the file is run.
main(Argv) :- run_tests.
