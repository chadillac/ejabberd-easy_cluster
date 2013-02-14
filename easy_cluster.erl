-module(easy_cluster).

-export([test_node/1,join/1]).

test_node(MasterNode) ->
	case net_adm:ping(MasterNode) of 'pong' ->
		io:format("server is reachable.~n");
	_ ->
		io:format("server could NOT be reached.~n")
	end.

join(MasterNode) ->
	application:stop(ejabberd),
	mnesia:stop(),
	mnesia:delete_schema([node()]),
	mnesia:start(),
	mnesia:change_config(extra_db_nodes, [MasterNode]),
	mnesia:change_table_copy_type(schema, node(), disc_copies),
	application:start(ejabberd).
