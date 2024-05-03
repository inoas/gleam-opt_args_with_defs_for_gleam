import gleeunit
import gleeunit/should
import opt_args_with_defs_for_gleam.{OB, OF, OI, OS, get_arg, get_args_with}

pub fn main() {
  gleeunit.main()
}

fn fun_returning_limit(options: options_keyword_list) -> Int {
  let args =
    [#("limit", OI(-1)), #("offset", OI(-1))]
    |> get_args_with(options)

  let assert OI(limit) = get_arg(args, "limit")

  limit
}

fn fun_returning_order_by(options: options_keyword_list) -> String {
  let args =
    [#("order_by", OS("id")), #("dir", OS("desc"))]
    |> get_args_with(options)

  let assert OS(order_by) = get_arg(args, "order_by")

  order_by
}

type OptionalArgumentKeys {
  SomeNumber
  SomeFlag
}

fn fun_with_typed_keys(options: options_keyword_list) -> #(Float, Bool) {
  let args =
    [#(SomeNumber, OF(1.0)), #(SomeFlag, OB(True))]
    |> get_args_with(options)

  let assert OF(some_number) = get_arg(args, SomeNumber)
  let assert OB(some_flag) = get_arg(args, SomeFlag)

  #(some_number, some_flag)
}

pub fn fun_returning_limit_test() {
  fun_returning_limit([#("limit", OI(1)), #("offset", OI(1))])
  |> should.equal(1)

  fun_returning_limit([#("limit", OI(2)), #("offset", OI(1))])
  |> should.equal(2)

  fun_returning_limit([#("limit", OI(3))])
  |> should.equal(3)

  fun_returning_limit([#("offset", OI(4))])
  |> should.equal(-1)
}

pub fn fun_returning_order_by_test() {
  fun_returning_order_by([#("dir", OS("asc"))])
  |> should.equal("id")

  fun_returning_order_by([#("order_by", OS("name"))])
  |> should.equal("name")
}

pub fn fun_with_typed_keys_test() {
  fun_with_typed_keys([#(SomeNumber, OF(2.0))])
  |> should.equal(#(2.0, True))
}
