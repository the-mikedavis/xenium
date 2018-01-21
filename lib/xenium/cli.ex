defmodule Xenium.CLI do

  @moduledoc """
  Handle command line parsing for use as a local executable
  """

  def main(argv) do
    argv |> parse_args |> process
  end


  @doc """
  `argv` can be -h or --help, which returns :help.

  Otherwise, it tries to parse out the url, method name, and parameters.

  Return a tuple of `{ url, method, params }`, or `:help`.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ],
                                     aliases:  [ h:    :help    ])

    case parse do
      { [ help: true ], _, _ } -> :help
        # params will always be a list, [] default
      { _, [ url, method | params ], _ } -> { url, method, params }

      _ -> :help
    end
  end

  @doc """
  Process.

  React to the command line arguments.

  Print the help dialog if help is needed.

  Call the client function otherwise.
  """
  def process(:help) do
    IO.puts """
    usage:  xenium <url> <method-name> [ <param1> <param2> <param3> ]
    """
    System.halt(0)
  end

  def process({ url, method, params }) do
    Xenium.ask!(url, method, params) |> IO.inspect
  end

end
