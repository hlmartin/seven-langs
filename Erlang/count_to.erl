-module(count_to).
-export([count_to_ten/0]).

count_to_ten() -> count(0).

count(10) -> 10;
count(N)  -> count(N+1). 
