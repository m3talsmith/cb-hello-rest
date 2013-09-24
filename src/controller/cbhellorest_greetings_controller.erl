-module(cbhellorest_greetings_controller, [Req]).
-compile(export_all).
-default_action(index).

index('GET', []) ->
  Greetings = boss_db:find(greeting, []),
  {ok, [{greetings, Greetings}]}.

hello('GET', []) ->
  {json, [{message, "hey"}]};
hello('POST', []) ->
  NewGreeting = greeting:new(id, Req:post_params("message")),
  {ok, SavedGreeting} = NewGreeting:save(),
  {json, [{message, SavedGreeting:attributes()}]}.
