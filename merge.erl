-module(merge).
-export([sort/1]).
% Author: Sam Lucidi

% partition --
% splits a list into a tuple containing the two halfs
partition(List) -> 
	partition(List, {[], []}).
% the original list is empty, we're done.
partition([], {L1, L2}) -> {L1, L2};
% alternate peeling elements off the original
% list and sticking them onto the two sublists.
partition([H | T], {L1, L2}) ->
	partition(T, {L2, L1 ++ [H]}).

% merge --
% Merge two sorted lists
merge(Sorted, []) -> Sorted;
merge([], Sorted) -> Sorted;
% interleave sublists
merge([H1 | T1], [H2 | T2]) ->
	case H1 < H2 of
		true -> [H1 | merge(T1, [H2|T2])];
		false -> [H2 | merge([H1|T1], T2)]
	end.

% sort/1 --
% Erlang implementation of Mergesort
sort([]) -> [];
sort([Unsorted| []]) -> [Unsorted];
sort(Unsorted) ->
	{Unsorted1, Unsorted2} = partition(Unsorted),
	merge(sort(Unsorted1), sort(Unsorted2)).