-module(cbhellorest_test).
-export([start/0]).

start() ->
  application:start(boss),
  boss_web_request:get_request('/greetings/', [],
    [% Making sure the index comes up and that we have a link to add a greeting
      fun boss_assert:http_ok/1,
      fun(Res) -> boss_assert:link_with_text('Greet us!', Res) end
    ], []).
