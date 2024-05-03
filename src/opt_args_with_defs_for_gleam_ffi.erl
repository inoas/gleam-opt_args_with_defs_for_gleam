-module(opt_args_with_defs_for_gleam_ffi).

-export([get_args_with/2, get_arg/2]).

get_args_with(Defaults, Options) ->
    do_get_args_with([], Defaults, Options).

% TODO: check Options if the keys exist multiple times => runtime error
% TODO: check if Options wrapper tuple (like OI for integer or OB for bool) matches the contained type => else runtime error
do_get_args_with(Arguments, _RemainingDefaults = [], _Options) ->
    lists:reverse(Arguments);
do_get_args_with(Arguments, [Default | RemainingDefaults], Options) ->
    {DefaultKey, _DefaultValue} = Default,
    case lists:keyfind(DefaultKey, 1, Options) of
        {DefaultKey, OptionValue} ->
            Option = {DefaultKey, OptionValue},
            do_get_args_with([Option | Arguments], RemainingDefaults, Options);
        false ->
            do_get_args_with([Default | Arguments], RemainingDefaults, Options)
    end.

get_arg(Options, Key) ->
    case lists:keyfind(Key, 1, Options) of
        {Key, Value} ->
            Value;
        false ->
            undefined
    end.
