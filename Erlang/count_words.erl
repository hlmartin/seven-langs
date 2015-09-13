-module(count_words).
-export([count/1]).

count(String) -> string:words(String).