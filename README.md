# Optional Arguments with Defaults for Gleam

[![Package Version](https://img.shields.io/hexpm/v/opt_args_with_defs_for_gleam)](https://hex.pm/packages/opt_args_with_defs_for_gleam)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/opt_args_with_defs_for_gleam/)

## Notice

One can be doing quite a bunch of things wrong and get runtime errors.

This library is more a cursed hack than a good solution and should be mostly
used to explore how a gleam library public API _would_ look like if gleam
ever supported optional arguments with defaults out of the box.

## Installation

```shell
gleam add opt_args_with_defs_for_gleam
```

## Example

```gleam
import gleam/io
import opt_args_with_defs_for_gleam.{O, OB, OF, OI, ON, OS, get_arg, get_args_with}

// Can use string keys as well, but that is more error prone.
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

pub fn main() {
  fun_with_typed_keys([#(SomeNumber, OF(2.0))])
  |> io.debug() // #(2.0, True)
}
```

Further documentation can be found at <https://hexdocs.pm/opt_args_with_defs_for_gleam>.

## Development

```sh
gleam test  # Run the tests
```
