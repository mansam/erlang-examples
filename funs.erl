-module(funs).
-export([select/2, reduce/3]).
% Author: Sam Lucidi

% select/2 --
% Apply function F to elements of List
% and return the list of elements where F(X) is true.
select(F, List) ->
	[X || X <- List, F(X) == true].

% reduce/3 --
% Apply a function to all the elements of
% a list and reduce the results to a single value.
reduce(_F, Acc, []) -> Acc;
reduce(F, Acc, [H|T]) ->
	reduce(F, F(Acc, H), T).
