min([X], X).
min([Head|Tail], Head) :- min(Tail, TailMin), Head =< TailMin.
min([Head|Tail], TailMin) :- min(Tail, TailMin), TailMin < Head.