defmodule Xenium.MixProject do
  use Mix.Project

  @description "A simple client interface for XML-RPC."

  def project do
    [
      app: :xenium,
      version: "0.1.0",
      elixir: "~> 1.0",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.details": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps(),
      description: @description,
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
      {:httpoison, "~> 1.0"},
      {:xmlrpc, "~> 1.1"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end

  defp package do
    [
      # files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Michael Davis"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/the-mikedavis/xenium"}
    ]
  end

  defp escript_config do
    [main_module: Xenium.CLI]
  end
end
