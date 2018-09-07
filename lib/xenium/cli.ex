defmodule Xenium.CLI do
  @moduledoc """
  Handle command line operations for use as a local executable.
  """

  @doc """
  Entrypoint for the app if compiled into an executable.

  Pipe the argument vector through `parse_args/1` and `process/1`
  """
  def main(argv) do
    argv |> parse_args |> process
  end

  @doc """
  Parse command line arguments.

  `argv` can be `-h` or `--help`, which returns `:help`.
  Otherwise, it tries to parse out the URL, method name, and parameters.

  Returns a tuple of `{ url, method, params }`, or `:help`.
  """
  def parse_args(argv) do
    parse =
      OptionParser.parse(argv,
        switches: [help: :boolean],
        aliases: [h: :help]
      )

    case parse do
      {[help: true], _, _} -> :help
      # params will always be a list, [] default
      {_, [url, method | params], _} -> {url, method, params}
      _ -> :help
    end
  end

  @doc """
  React to the command line arguments.

  Print the help dialog if help is needed. Call the client function otherwise.
  Accepts either the `:help` atom or a tuple of `{ url, method, params}` where
  params is a list.
  """
  def process(:help) do
    IO.puts("""
    usage:  xenium <URL> <method-name> [ <param1> <param2> <param3> ]
    """)

    System.halt(0)
  end

  def process({url, method, params}) do
    Xenium.call!(url, method, params) |> IO.inspect()
  end
end
