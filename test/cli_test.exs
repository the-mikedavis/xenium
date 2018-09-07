defmodule CliTest do
  use ExUnit.Case
  doctest Xenium

  import Xenium.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  test ":help returned by passing only one argument" do
    assert parse_args(["gibberish"]) == :help
  end

  test "proper tuple returned from example arguments" do
    assert parse_args(["http://url", "getSystemState", "/"]) ==
             {"http://url", "getSystemState", ["/"]}

    assert parse_args(["http://url", "addTwoInts", "2", "3"]) ==
             {"http://url", "addTwoInts", ["2", "3"]}
  end
end
