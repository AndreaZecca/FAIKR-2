% inOddPosition(L1, L2) is true if L2 contain the elements that are in odd position in L1
inOddPosition(L1, L2):- inOddPosition(L1, L2, 1).

inOddPosition([], [], _).
inOddPosition([E|T],[E|T2], N):-
    N mod 2 =:= 1,
    N1 is N + 1,
    inOddPosition(T, T2, N1).
inOddPosition([_|T], L2, N):-
    N mod 2 =:= 0,
    N1 is N + 1,
    inOddPosition(T, L2, N1).
