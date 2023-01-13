% vanilla meta-interpreter
vanillasolve(true):-!.
vanillasolve((A,B)):-!,vanillasolve(A),vanillasolve(B).
vanillasolve(A):-clause(A,B),vanillasolve(B).


% we can now define a new meta-interpreter solve(p(X), ListOfSubGoals) where ListOfSubGoals
% is the list of subgoals used to prove the goal p(X)
solve(true,[]):-!.
solve((A,B), R):-
    !,
    solve(A, R1),
    solve(B, R2),
    append(R1, R2, R).
solve(A, [A|R]):-
    clause(A,B),
    solve(B, R).


p(X):-q(X),r(X).
p(X):-s(X).
q(X):-t(X).
r(1).
r(2).
r(3).
t(1).
t(2).
s(12).