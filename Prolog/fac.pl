fac(0, 1).
fac(X, Result) :- X > 0, X1 is X - 1, fac(X1, Result1), Result is Result1 * X.