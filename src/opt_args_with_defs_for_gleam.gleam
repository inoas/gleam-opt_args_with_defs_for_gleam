pub type OptionalArgument(a) {
  O(a)
  OB(Bool)
  OF(Float)
  OI(Int)
  ON(Nil)
  OS(String)
}

@external(erlang, "opt_args_with_defs_for_gleam_ffi", "get_args_with")
pub fn get_args_with(
  defaults: defaults_keyword_list,
  options: options_keyword_list,
) -> defaults_keyword_list

@external(erlang, "opt_args_with_defs_for_gleam_ffi", "get_arg")
pub fn get_arg(arguments: defaults_keyword_list, key: key) -> return
