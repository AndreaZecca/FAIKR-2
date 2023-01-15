% count(p(X), N) is true if there are N clauses for p(X) in the program.

count(C, N):-
    findall(A, clause(C,A), L),
    length(L, N).

% another possible solution for count 
count2(C,N):-
    bagof(B, C^clause(C,B),L),
    length(L, N).

p(a).
p(b).
p(c).

