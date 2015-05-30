rev([], []).
rev([Head|Tail], ReversedList) :- rev(Tail, ReversedTail), append(ReversedTail, [Head], ReversedList).