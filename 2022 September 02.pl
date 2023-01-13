% solve(Goal) is a right-most vanilla interpreter
solve(true):-!.
solve(write(X)):-
    !,
    call(write(X)), nl.
solve((A,B)):-
    !,
    solve(B),
    solve(A).
solve(A):-
    clause(A,B),
    !,
    solve(B).

p(1):- write('I am solving P.').
r(1):- write('I am solving R.').
q(X):- p(X), r(X).