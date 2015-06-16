%% -*- coding: utf-8 -*-
-module(hep_v2_tests).

%% hep_v2_tests: tests for module hep_v2.

-include_lib("eunit/include/eunit.hrl").
-include("hep.hrl").

%% API tests.

ipv4_encode_decode_test () ->
    Hep = hep(),
    {ok, Bin} = hep_v2:encode(Hep),
    ?assertEqual({ok, Hep}, hep_v2:decode(Bin)).

ipv6_encode_decode_test () ->
    Hep = (hep())#hep{ protocol_family = 'ipv6'
                     , src_ip = {1, 2, 3, 4, 5, 6, 7, 8}
                     , dst_ip = {8, 7, 6, 5, 4, 3, 2, 1}
                     },
    {ok, Bin} = hep_v2:encode(Hep),
    ?assertEqual({ok, Hep}, hep_v2:decode(Bin)).

%% Internals

hep () ->
    #hep{ version = 'hep_v2'
        , protocol_family = 'ipv4'
        , protocol = 17
        , src_ip = {127, 0, 0, 1}
        , src_port = 1234
        , dst_ip = {0, 0, 0, 0}
        , dst_port = 5060
        , timestamp = {1313, 440459, 120000}
        , payload_type = 'sip'
        , node_id = 228
        , payload = <<"INVITE sip:bob">>
        }.

%% End of Module.
