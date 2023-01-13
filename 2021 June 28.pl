% count(p(X), N) is true if there are N clauses for p(X) in the program.

count(C, N):-
    findall(A, clause(C,A), L),
    length(L, N).


p(a).
p(b).
p(c).

