-module (sorting).
-compile (export_all).
 
merge_sort([]) -> [];
merge_sort(L) ->
    {L1 , L2} = split(L),
    merge(merge_sort(L1),merge_sort(L2)).
 
merge(X , Y) ->
     merge(X,Y,[]).
 
merge([], [] , X) -> X;
merge([] , S2, X) -> X ++ S2;
merge(S1 , [], X) -> X ++ S1;
merge([H1 | T1] , [H2 | T2], X) when H1 >= H2 ->
    merge( [H1 | T1] , T2 , append(X,[H2])); %tail recursion
merge([H1 | T1] , [H2 | T2], X) ->
     merge( T1 , [H2 | T2], append(X,[H1])). %tail recursion 
 
append(X , Y) ->
      X ++ Y. % appending two lists
 
split(L) ->
    split(L , {[] , []}).
 
split([] , {X , Y}) -> { X , Y };
split([H|T] , {X , Y}) ->
    split( T , { Y , append(X , [H]) }). %tail recursion
