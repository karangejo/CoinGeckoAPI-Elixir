# CoinGeckoApi

An interface to the [coin gecko api](https://www.coingecko.com/en/api)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `coin_gecko_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coin_gecko_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/coin_gecko_api](https://hexdocs.pm/coin_gecko_api).
 
 ## Usage
 
iex> CoinGeckoApi.ping
%{"gecko_says" => "(V3) To the Moon!"}
