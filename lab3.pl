%PROLOG has no built-in arithmetics - we have to build our own using logical concepts
%1) zero is a constant representing number 0
%2) s represents a successor function (i.e. function s(x) = x+ 1)
%3) terms zero, s(zero), s(s(zero)) etc., will represent positive integers

% First we will define a predicate that can be used to recognize or generate terms that are numbers
isnumber(zero).
isnumber(s(X)):-isnumber(X).

% With this definition we define some standard predicates on our set of numbers
isequal(X,X):-isnumber(X).
isequal(s(X),s(Y)):-isequal(X,Y).

lessthanequal(zero,X):-isnumber(X).
lessthanequal(s(X),s(Y)):-lessthanequal(X,Y).

add(zero,X,X):-isnumber(X).
add(s(X),Y,s(Z)):-add(X,Y,Z).

even(zero).
even(s(s(X))):-even(X).

odd(s(zero)).
odd(s(s(X))):-odd(X).

times(zero,X,zero) :- isnumber(X).
times(s(X),Y,Z) :- times(X, Y, Q), add(Y, Q, Z).

quotient(_,zero,nan):-!.
quotient(X,X,s(zero)):-isnumber(X), !.
quotient(zero,X,zero):-isnumber(X), !.
quotient(X,Y,s(Z)) :- quotient(Q,Y,Z), add(Q,Y,X), !.

remainder(zero,_,zero).
remainder(X,X,zero).
remainder(X,Y,R) :- lessthanequal(X,Y),R=X.
remainder(X,Y,R) :- add(Y,Q, X), remainder(Q,Y,R).

fact(zero,s(zero)).
fact(s(N),X) :- fact(N,Q), times(s(N),Q,X).

fibonacci(zero,zero).
fibonacci(s(zero),s(zero)).
fibonacci(s(s(N)),X) :- fibonacci(s(N),Q), fibonacci(N,P), add(Q,P,X).

shownum(zero,0).
shownum(s(X),N) :- shownum(X,Y), N is Y + 1.