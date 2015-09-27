-module(tictactoe).
-export([game_status/1]).

game_status(List) ->
  case game_is_won(List) of
    true  -> winner(find_matches(List));
    false ->
      case move_available(List) of
        true  -> no_winner;
        false -> cat
      end
  end.

% Get board elements with indexes, c/o http://eigenjoy.com/2009/02/10/rubys-each_with_index-for-erlang/
indices(List) -> lists:seq(1, length(List)).
each_with_index(List) -> [{Element, Index} || {Element, Index} <- lists:zip(List, indices(List))].

% Get rows of tic tac toe board
start_of_row(Index) -> Index + 2 * (Index - 1).
row(List, RowIndex) -> lists:sublist(List, start_of_row(RowIndex), 3).

% Get columns of tic tac toe board
is_in_column(Index, ColIndex) -> Index rem 3 == ColIndex rem 3.
col(List, ColIndex) -> [Value || {Value, Index} <- each_with_index(List), is_in_column(Index, ColIndex)].

% Get diagonals of tic tac toe board
diag(List, 1) -> [lists:nth(1, List), lists:nth(5, List), lists:nth(9, List)];
diag(List, 2) -> [lists:nth(3, List), lists:nth(5, List), lists:nth(7, List)].

% Check whether a given row, col, or diag (list of size 3) has a match
has_match([One, Two, Three]) -> (One == Two) and (Two == Three) and (One /= e).

% Get all rows, columns, and diagonals
all_rcd(List) -> [row(List, 1), row(List, 2), row(List, 3), col(List, 1), col(List, 2), col(List, 3), diag(List, 1), diag(List, 2)].

% Find any matches.
find_matches(List) -> lists:filter((fun(X) -> has_match(X) end), all_rcd(List)).

% Determine if there is a winner.
game_is_won(List) -> length(find_matches(List)) > 0.

% Determine if there are any valid moves available.
move_available(List) -> lists:any((fun(X) -> X == e end), List).

% Determine the winner!
winner([Match|_]) -> lists:nth(1, Match).