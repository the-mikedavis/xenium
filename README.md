# Xenium

A simple client toolkit for making XML-RCP calls and reading responses.
The current [XML-RPC](https://github.com/ewildgoose/elixir-xml_rpc)
has a bit of a learning curve. Chances are if you're using XML-RPC, you just
want to get stuff done now. Xenium allows you to skip all the technicals of
XML-RPC and HTTP and get to getting stuff done.

XML-R..P... _what_?

XML-RPC is just regular XML that fits a certain standardized spec. It's for
issuing **r**emote **p**rocedure **c**alls using HTTP. RPC allows the client to send
a request to a server which will execute a command based on the request and
any other parameters in the call. Along the same line is JSON-RPC. The main
idea is that the server and client can be written in any language, independent
of eachother.

Xeeny... _what_?

A _xenium_, from Greek, is a gift for strangers and travellers like a banquet
or smaller meal.

## Installation

Add `xenium` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    { :xenium, "~> 0.1.0" }
  ]
end
```

If you prefer to do it all in-house, you can do this:

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

There are two functions at the moment. `call!` just calls the server. Here's
an example that interacts with ROS (see 
[ROS documentation](http://wiki.ros.org/ROS/Technical%20Overview)):

```elixir
iex> url = System.get_env("ROS_MASTER_URI")
http://localhost:11311
iex> Xenium.call! url, "getSystemState", ["/"]
[1, 'current system state', [[['/rosout_agg', ['/rosout']]], [['/time', ['/rosout']], ['/rosout', ['/rosout']], ['/clock', ['/rosout']]], [['/rosout/set_logger_level', ['/rosout']], ['/rosout/get_loggers', ['/rosout']]]]]
```

`call` makes the same call, but allows you to inspect failures. It returns a
tuple `{ :ok, response }` if it's successful and `{ :error, error }` on error.
The errors are carried over from the HTTPoison and XML-RPC libraries, so playing
around in iex is the best environment for the `call` method.

## Documentation

Documentation is done by ExDocs. It's now live. Check out the official docs at
[hexdocs](http://hexdocs.pm/xenium).
