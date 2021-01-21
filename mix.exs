defmodule CoinGeckoApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :coin_gecko_api,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/karangejo/CoinGeckoAPI-Elixir",
      name: "coin_gecko_api",
      docs: [main: "CoinGeckoApi",
            extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "An interface to the CoinGecko API"
  end

  defp package do
    [
      name: "coin_gecko_api",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/karangejo/CoinGeckoAPI-Elixir"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:poison, "~> 3.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
