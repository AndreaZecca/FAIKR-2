solve(true):-!.
solve((A,B)):-!,
    solve(A),
    solve(B).
solve(A):-
    clause(A,B),
    solve(B).

% verbose(Goal) is true if Goal can be proved. Moreover it prints the subgoals that it's trying to prove.
verbose(true):-!.
verbose((A,B)):-!,
    write('Solving: '), write(A), nl,
    solve(A),
    write('Solving: '), write(B), nl,
    solve(B).
verbose(A):-
    clause(A,B),
    write('Solving: '), write(A), nl,
    verbose(B).


p(X):- q(X), r(X).
p(X):- s(X).
q(X):- t(X).
r(1).
r(2).
r(3).
t(1).
t(2).