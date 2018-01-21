defmodule Xenium do
  @moduledoc """
  An XML-RPC client for Elixir.
  """

  @doc """
  Ask.
  
  Post the XML-RPC server url with a method name and optional parameters

  ## Examples

      iex> Xenium.ask url, "method.name", [:param1, :param2]
      "response"

  """
  def ask(url, method_name, params \\ []) do
    #uri = System.get_env("ROS_MASTER_URI")
#    req = %XMLRPC.MethodCall{method_name: method_name, params: params}
#          |> XMLRPC.encode
#    resp = HTTPoison.post(url, req)
#           |> get_in([:body])
#           |> XMLRPC.decode
#           |> get_in([:param])

    %XMLRPC.MethodCall{method_name: method_name, params: params}
    |> XMLRPC.encode
    |> (&HTTPoison.post(url, &1)).()
    |> Map.get(:body)
    |> XMLRPC.decode
    |> Map.get(:param)
  end

end
