defmodule Xenium do
  @moduledoc """
  An XML-RPC client for Elixir.

  Xenium simply combines the functionality of the HTTPoison and XML-RPC
  libraries so you can get stuff done.
  """

  @doc """
  Post the XML-RPC server URL with a method name and optional parameters.

  Returns a tuple of `{ :ok, response }` or `{ :error, message }`, where the
  error tuple contains either the error response from HTTPoison or the
  XMLRPC library.

  ## Examples
  
      Xenium.call "http://localhost:11311", "getSystemState", ["/"]
      #=> { :ok, [1, "current state", ... ] }
      Xenium.call "http://lclhst:11311", "getSystemState", ["/"]
      #=> { :error, %HTTPoison.Error{id: nil, reason: :nxdomain} }
      Xenium.call "http://localhost:11311", "unsupportedMethod", ["/"]
      #=> { :error, %XMLRPC.Fault{fault_code: 1,
      #     fault_string: "<type 'exceptions.Exce..."} }
  """
  @spec call(binary, binary, list) :: { :ok, any } | { :error, any }
  def call(url, method_name, params \\ []) do
    # safely pipe the results of each
    encode(method_name, params)
    |> (&post(url, &1)).()
    |> decode
    |> get_resp
  end

  defp encode(method_name, params) do
    %XMLRPC.MethodCall{method_name: method_name, params: params}
    |> XMLRPC.encode
  end

  defp post(url, { :ok, body }) do
    try do
      HTTPoison.post(url, body)
    rescue
      CaseClauseError -> {:error, "HTTPoison error. " <> "Probably a nil URL."}
    end
  end
  defp post(_url, error), do: error

  defp decode({ :ok, %{ body: body } }), do: XMLRPC.decode(body)
  defp decode(error), do: error

  defp get_resp({ :ok, error = %XMLRPC.Fault{} }), do: { :error, error }
  defp get_resp({ :ok, %{ param: resp } }), do: resp
  defp get_resp(error), do: error

  @doc """
  Post the XML-RPC server URL with a method name and optional parameters,
  raising an exception on failure.

  The functions used in the pipeline are `encode!` `post!` and `decode!`,
  which all raise exceptions on failure.

  ## Examples

      Xenium.call! "http://localhost:11311", "getSystemState", ["/"]
      #=> [1, "current state", ... ]
  """
  @spec call!(binary, binary, list) :: any
  def call!(url, method_name, params \\ []) do
    %XMLRPC.MethodCall{method_name: method_name, params: params}
    |> XMLRPC.encode!
    |> (&HTTPoison.post!(url, &1)).()
    |> Map.get(:body)
    |> XMLRPC.decode!
    |> Map.get(:param)
  end

end
