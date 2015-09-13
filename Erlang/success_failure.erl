-module(success_failure).
-export([print/1]).

print({error, Message}) -> io:format("error: ~p ~n", [Message]);
print(success)          -> io:format("success~n").