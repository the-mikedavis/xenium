defmodule Xenium.MixProject do
  use Mix.Project

  def project do
    [
      app: :xenium,
      version: "0.1.0",
      name: "Xenium",
      source_url: "https://github.com/the-mikedavis/xenium",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
end
