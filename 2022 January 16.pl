% filter(L1, L2, L3) is true if L3 is the set of common element between L1 and L2

filter(L1,L2,L3):-
    setof(X, (member(X,L1), member(X,L2)), L3).