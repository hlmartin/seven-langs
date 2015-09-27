-module(dictionary).
-export([get_value/2]).

get_value(List, Keyword) -> [Value || {Key, Value} <- List, Key == Keyword].