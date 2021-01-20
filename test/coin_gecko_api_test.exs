defmodule CoinGeckoApiTest do
  use ExUnit.Case
  doctest CoinGeckoApi

  test "greets the world" do
    assert CoinGeckoApi.ping() == %{"gecko_says" => "(V3) To the Moon!"}
  end
end
