# Xenium

A simple client toolkit for making XML-RCP calls and reading responses.

XML-R..P... _what_?

XML-RPC is just regular XML that fits a certain standardized spec. It's for
issuing _r_emote _p_rocedure _c_alls using HTTP. RPC allows the client to send
a request to a server which will execute a command based on the request and
any other parameters in the call. Along the same line is JSON-RPC. The main
idea is that the server and client can be written in any language.

Xiny... _what_?

A _xenium_, from Greek, is a gift for strangers and travellers like a banquet
or smaller meal.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `xenium` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    { :xenium, "~> 0.1.0" }
  ]
end
```

Currently, this isn't on hex. (I'm too hip and cool for that.) You can clone
this repo and then:

```elixir
def deps do
  [
    { :xenium, path: "path/to/top-level/dir/of/repo" }
    # example
    # { :xenium, path: "~/xenium" }
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/xenium](https://hexdocs.pm/xenium).

Don't expect that any time soon. The source files should be short and neat
enough to grok it.
