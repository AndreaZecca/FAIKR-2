% specialPrint prints all numbers between 1 and N 
specialPrint(1):-
    write('1'), nl, !.
specialPrint(N):-
    N > 1,
    N1 is N - 1,
    specialPrint(N1),
    write(N), nl.

% fib computes the Nth Fibonacci number
fib(0, 1):-!.
fib(1, 1):-!.
fib(N, F):-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

% fibAcc computes the Nth FIbonacci number using tail recursion
fibAcc(N, F):-
    fibAcc(N, 1, 1, F).
fibAcc(0, F, _, F):-!.
fibAcc(N, F1, F2, F):-
    N > 0,
    N1 is N - 1,
    F3 is F1 + F2,
    fibAcc(N1, F2, F3, F).

% isPrime(N) is true if N is prime
isPrime(2):-!.
isPrime(N):-
    N > 2,
    Div is N-1,
    notDivisible(N, Div).

notDivisible(N,2):-
    1 is N mod 2, !.
notDivisible(N,Div):-
    Div > 2,
    0 < N mod Div, !,
    NewDiv is Div - 1,
    notDivisible(N, NewDiv).

% printAllPrime(N) prints all prime numbers between 2 and N
printAllPrime(N):-
    printPrimesBetween(2, N).

printPrimesBetween(L, U):-
    L =< U,
    isPrime(L),
    write(L), nl,
    NewL is L + 1,
    printPrimesBetween(NewL, U).

printPrimesBetween(L, U):-
    L =< U,
    \+isPrime(L),
    NewL is L + 1,
    printPrimesBetween(NewL, U).

% brother(X, Y) is true if X and Y are brothers
fatherOf(federico, francesco).
fatherOf(federico, chiara).
motherOf(elena, francesco).
motherOf(elena, chiara).

brother(X,Y):-
    fatherOf(F, X),
    fatherOf(F, Y),
    motherOf(M, X),
    motherOf(M, Y),
    X \= Y.

% last(L, E) is true if E is the last element of L
last([E], E):-!.
last([_|T], E):-
    last(T, E).

% sublist(S, L) is true if S is a sublist of L
sublist(S, L):-
    append([_,S,_],L).

% palindrome(L) is true if L is a palindrome
palindrome(L):-
    reverse(L, L).

% isSorted(L) is true if L is sorted
isSorted([]):-!.
isSorted([_]):-!.
isSorted([E1,E2|T]):-
    E1 =< E2,
    isSorted([E2|T]).

% removeDuplicates(L, R) is true if R is L without duplicates
removeDuplicates([], []):-!.
removeDuplicates([H|T], R):-
    member(H, T),
    !,
    removeDuplicates(T, R).
removeDuplicates([H|T], [H|R]):-
    removeDuplicates(T, R).

% countOccurences(L, E, N) is true if N is the number of occurences of E in L
countOccurences(_, [], 0).
countOccurences(E, [E | T], N):- 
    countOccurences(E, T, NT),
    N is NT+1.
countOccurences(E, [A | T], N) :-
    A =\= E,
    countOccurences(E, T, N).

% flatten(L, R) is true if R is the list obtained by flattening L
flatten([], []):-!.
flatten([H|T], L):-
    !,
    flatten(H, R1),
    flatten(T, R2),
    append(R1, R2, L).
flatten(E, [E]):-!.

% sortedmake(L, R) is true if R is the list obtained by sorting L
sorted([], []):-!.
sorted([H|T], R):-
    sorted(T, R1),
    insertOrder(H, R1, R).

insertOrder(E, [], [E]):-!.
insertOrder(E, [H|T], [E,H|T]):-
    E =< H,
    !.
insertOrder(E, [H|T], [H|R]):-
    insertOrder(E, T, R).

% allDistinct(L) is true if all elements of L are distinct
allDistinct([]):-!.
allDistinct([H|T]):-
    \+member(H, T),
    allDistinct(T).

% intersect(L, R, I) is true if I is the intersection of L and R
intersect([], _, []):-!.
intersect([H|T], R, [H|I]):-
    member(H, R),
    !,
    intersect(T, R, I).
intersect([_|T], R, I):-
    intersect(T, R, I).