min([X|[]], X).
min([X,Y], X) :- X < Y.
min([X,Y], Y) :- Y =< X.