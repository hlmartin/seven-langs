# Roughly a mergesort algorithm. It doesn't appear to like lists with repeated values.

sortl([], []).
sortl([X], [X]).
sortl([One,Two|Tail], Sorted) :-
  divide([One,Two|Tail], Left, Right),
  sortl(Left, SortedLeft),
  sortl(Right, SortedRight),
  merge(SortedLeft, SortedRight, Sorted).

divide([], [], []).
divide([X], [X], []).
divide([X,Y|Z], [X,Left], [Y,Right]) :- divide(Z, Left, Right).

merge(Left, [], Left).
merge([], Right, Right).
merge([LHead|LTail], [RHead|RTail], [LHead|Merged]) :-
  LHead =< RHead,
  merge(LTail, [RHead|RTail], Merged).
merge([LHead|LTail], [RHead|RTail], [LHead|Merged]) :-
  LHead > RHead,
  merge([LHead|LTail], RTail, Merged).
