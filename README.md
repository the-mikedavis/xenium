# Xenium

A simple client toolkit for making XML-RCP calls and reading responses.

XML-R..P... _what_?

XML-RPC is just regular XML that fits a certain standardized spec. It's for
issuing **r**emote **p**rocedure **c**alls using HTTP. RPC allows the client to send
a request to a server which will execute a command based on the request and
any other parameters in the call. Along the same line is JSON-RPC. The main
idea is that the server and client can be written in any language.

Xeeny... _what_?

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
    # example if you cloned into ~
    # { :xenium, path: "~/xenium" }
  ]
end
```

## Usage

There's only one function at the moment. `call!` just calls the server. Here's
an example that interacts with ROS (see 
[ROS documentation](http://wiki.ros.org/ROS/Technical%20Overview)):

```elixir
iex> url = System.get_env("ROS_MASTER_URI")
http://localhost:11311
iex> Xenium.ask! url, "getSystemState", ["/"]
[1, 'current system state', [[['/rosout_agg', ['/rosout']]], [['/time', ['/rosout']], ['/rosout', ['/rosout']], ['/clock', ['/rosout']]], [['/rosout/set_logger_level', ['/rosout']], ['/rosout/get_loggers', ['/rosout']]]]]
```

## Documentation

Documentation is done by ExDocs. When it's live, it'll be
[here](http://hexdocs.pm/xenium).

In the meantime, ExDocs is a dev dep, so just go to the top-level dir and run
`mix docs` and then `open docs/index.html`.
