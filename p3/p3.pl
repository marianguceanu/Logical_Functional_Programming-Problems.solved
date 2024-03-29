% 13. The list a1, ..., an is given and it consists of distinct integers. 
% Write a predicate to determine all subsets with aspect of "mountain" 
% (a set has a "mountain" aspect if the elements increase to a certain point and then decrease).


% mountain(l1...ln, f) =
% 	true, n <= 1 and f = 1
% 	mountain(l2...ln, 0), l1 < l2 and f = 0
% 	mountain(l2...ln, 1), l1 >= l2 and f = 0
% 	mountain(l2...ln, 1, l1 > l2 and f = 1
% 	false, otherwise

mountain([], 1).
mountain([_], 1).
mountain([H1, H2|T], 0) :- H1 < H2,
    mountain([H2|T], 0).
mountain([H1, H2|T], 0) :- H1 >= H2,
    mountain([H2|T], 1).
mountain([H1, H2|T], 1) :- H1 > H2,
    mountain([H2|T], 1).

% isMountain(l1...ln) =
% 	mountain(l1...ln, 0), l1 < l2

% isMountain(L:list)
% isMountain(i)

isMountain([H1, H2, H3|T]) :- H1 < H2, mountain([H1, H2, H3|T] ,0).

% subsets(l1...ln) =
% 	[], n = 0
% 	l1 + subsets(l2...ln), n > 0
% 	subsets(l2...ln), n > 0

% subsets(L:list, R:list)
% subsets(i, o)

subsets([], []).
subsets([H|T], [H|R]) :-
    subsets(T, R).
subsets([_|T], R) :-
    subsets(T, R).

% onesolution(L:list, R:list)
% onesolution(i, o)

onesolution(L, R) :- 
    subsets(L, R),
    isMountain(R).

% allsolutions(L:list, S:number, R:list)
% allsolutions(i, o)

allsolutions(L, R) :-
    findall(RPartial, onesolution(L, RPartial), R).