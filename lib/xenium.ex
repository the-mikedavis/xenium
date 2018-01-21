defmodule Xenium do
  @moduledoc """
  An XML-RPC client for Elixir.

  Xenium simply combines the functionality of the HTTPoison and XML-RPC
  libraries so you can get stuff done.
  """

  @doc """
  Post the XML-RPC server url with a method name and optional parameters,
  raising an exception on failure.

  The functions used in the pipeline are `encode!` `post!` and `decode!`,
  which all raise exceptions on failure.
  """
  def call!(url, method_name, params \\ []) do
    %XMLRPC.MethodCall{method_name: method_name, params: params}
    |> XMLRPC.encode!
    |> (&HTTPoison.post!(url, &1)).()
    |> Map.get(:body)
    |> XMLRPC.decode!
    |> Map.get(:param)
  end

end
