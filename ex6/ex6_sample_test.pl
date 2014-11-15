% This is a set of sample tests for Exercise 6.
% You can run it on the command line with
% > swipl -f ex6_test.pl -g run_tests -t halt
% Note: you can safely ignore warnings about "choicepoints".

% This declares a test suite called "nats".
:- begin_tests(nats).
% This imports the exercise module. Don't change the file name!
:- use_module(ex6).

% These are tests for even/1 and odd/1; the "fail" indicates that 
% the goal on the right should fail.
test(odd3) :- odd(succ(succ(succ(0)))).
test(even1, fail) :- even(succ(1)).

% This is a test for subtract.
test(subtract2) :- subtract(succ(succ(succ(0))), succ(succ(0)), succ(0)).

:- end_tests(nats).

% This is the "main" goal that's executed when the file is run.
main(Argv) :- run_tests().
