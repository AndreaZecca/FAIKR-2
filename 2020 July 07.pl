% how_many(C,N) is true if N is the number of clauses C in the program
how_many(C,N):-
    findall(P, clause(C,P), L),
    length(L,N).

% another possible solution for how_many
how_many2(C,N):-
    bagof(B, C^clause(C,B), L),
    length(L,N).
    

a(X):-b(X),c(X).
a(X):- Y is X+1, b(Y), c(Y).
a(X) :- Y is X-1, b(Y), c(Y).

b(X).
c(X).