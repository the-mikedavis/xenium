defmodule Xenium do
  @moduledoc """
  An XML-RPC client for Elixir.
  """

  @doc """
  Ask!
  
  Post the XML-RPC server url with a method name and optional parameters.

  ## Examples

      iex> Xenium.ask! xml-rpc-url, "method.name", [:param1, :param2]
      "response"

  """
  def ask!(url, method_name, params \\ []) do
    %XMLRPC.MethodCall{method_name: method_name, params: params}
    |> XMLRPC.encode!
    |> (&HTTPoison.post!(url, &1)).()
    |> Map.get(:body)
    |> XMLRPC.decode!
    |> Map.get(:param)
  end

end
