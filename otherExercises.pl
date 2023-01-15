% this file contains some exercises in Prolog found on internet

% revert a list
revert([],[]):-!.
revert([E|T],R):-
    revert(T,H),
    append(H,[E],R).

% compress a list removing consecutive duplicates
compress([],[]):-!.
compress([E],[E]):-!.
compress([E,E|T],R):-
    compress([E|T],R),!.
compress([E1,E2|T],[E1|R]):-
    compress([E2|T],R).

% pack consecutive duplicates of list elements into sublists
pack([],[]):-!.
pack([E],[[E]]):-!.
pack([E,E|T],[[E|H]|R]):-
    pack([E|T],[H|R]),!.
pack([E1,E2|T],[[E1]|R]):-
    pack([E2|T],R).


% run-length encoding of a list.Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.
encode([],[]):-!.
encode([E],[[1,E]]):-!.
encode([E,E|T],[[N,E]|R]):-
    encode([E|T],[[N1,E]|R]),
    N is N1+1,!.
encode([E1,E2|T],[[1,E1]|R]):-
    encode([E2|T],R).

% duplicate the elements of a list
dupli([],[]):-!.
dupli([E|T],[E,E|R]):-
    dupli(T,R).

% duplicate the elements of a list a given number of times
dupli(L1,N,L2):-
    dupliN(L1,N,L2,N).
dupliN([],_,[],_).
dupliN([_|Xs],N,Ys,0) :- dupliN(Xs,N,Ys,N).
dupliN([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupliN([X|Xs],N,Ys,K1).

% drop every N'th element from a list
drop(L1,N,L2) :- drop(L1,N,L2,N).
drop([],_,[],_).
drop([_|Xs],N,Ys,1) :- drop(Xs,N,Ys,N).
drop([X|Xs],N,[X|Ys],K) :- K > 1, K1 is K - 1, drop(Xs,N,Ys,K1).

% split a list into two parts; the length of the first part is given
split([], _, [], []).
split(L, 0, [], L).
split([E|T], N, [E|L1], L2):-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% extract a slice from a list
slice([X|_],1,1,[X]).
slice([X|Xs],1,K,[X|Ys]) :- K > 1, 
   K1 is K - 1, slice(Xs,1,K1,Ys).
slice([_|Xs],I,K,Ys) :- I > 1, 
   I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).
