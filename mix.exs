defmodule Xenium.MixProject do
  use Mix.Project

  def project do
    [
      app: :xenium,
      version: "0.1.0",
      elixir: "~> 1.0",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      escript: escript_config(),
      name: "Xenium",
      source_url: "https://github.com/the-mikedavis/xenium"
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      { :httpoison, "~> 1.0" },
      { :xmlrpc, "~> 1.1" },
      { :ex_doc, "~> 0.16", only: :dev, runtime: false }
    ]
  end

  defp description do
    """
    A client interface for XML-RPC. Makes XML-RPC methods accessible with a
    single function invocation.
    """
  end

  defp package do
    files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
    maintainers: ["Michael Davis"],
    links: %{"GitHub" => "https://github.com/the-mikedavis/xenium"}
  end

  defp escript_config do
    [ main_module: Xenium.CLI ]
  end

end
