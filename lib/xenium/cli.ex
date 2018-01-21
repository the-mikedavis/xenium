defmodule Xenium.CLI do

  @moduledoc """
  Handle command line parsing for use as a local executable
  """

  def main(argv) do
    IO.inspect argv
    parse_args(argv)
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

end
