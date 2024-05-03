import gleam/io
import opt_args_with_defs_for_gleam.{OI, OS, get_arg, get_args_with}

pub fn main() {
  example_fun_1([#("limit", OI(1)), #("offset", OI(2))])
  example_fun_2([#("dir", OS("asc"))])
}

fn example_fun_1(options: options_keyword_list) {
  let arguments =
    [#("limit", OI(-1)), #("offset", OI(-1))]
    |> get_args_with(options)

  let assert OI(limit) = get_arg(arguments, "limit")

  io.debug(limit)
}

fn example_fun_2(options: options_keyword_list) {
  let arguments =
    [#("order_by", OS("id")), #("dir", OS("desc"))]
    |> get_args_with(options)

  let assert OS(order_by) = get_arg(arguments, "order_by")

  io.debug(order_by)

  Nil
}
