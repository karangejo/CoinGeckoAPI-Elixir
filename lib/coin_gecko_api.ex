defmodule CoinGeckoApi do
  @moduledoc """
  Documentation for `CoinGeckoApi`.
  """

  @cg_base_url "https://api.coingecko.com/api/v3/"

  def get_api(api_path) do
    res = HTTPoison.get!(@cg_base_url <> api_path)
    Poison.decode!(res.body)
  end

  def get_api_params(api_path,params \\%{}) do
    query_params = URI.encode_query(params)
    url = @cg_base_url <> api_path <> query_params
    IO.puts url
    res = HTTPoison.get!(url)
    Poison.decode!(res.body)
  end

  @doc """
  Ping API

  ## Examples

      iex(1)> CoinGeckoApi.ping
      %{"gecko_says" => "(V3) To the Moon!"}
  """
  def ping do
    get_api("ping")
  end

  @doc """
  simple price

  ## Examples

      iex(1)> CoinGeckoApi.simple_price
      %{"bitcoin" => %{"usd" => 35861}}
  """

  def simple_price(params \\ %{"ids" => "bitcoin", "vs_currencies" => "usd", "include_market_cap" => "true", "include_24hr_vol" => "true", "include_24hr_change" => "true", "include_last_updated_at" => "true"}) do
    get_api_params("simple/price?", params)
  end

  @doc """
  simple token price

  ## Examples

      iex(1)> CoinGeckoApi.simple_token_price
      %{
        "0xc00e94cb662c3520282e6f5717214004a7f26888" => %{
          "last_updated_at" => 1611109511,
          "usd" => 213.46,
          "usd_24h_change" => -6.384358204432436,
          "usd_24h_vol" => 87929838.57157373,
          "usd_market_cap" => 888756153.0997704
        }
      }
  """

  def simple_token_price(params \\ %{"contract_addresses" => "0xc00e94cb662c3520282e6f5717214004a7f26888", "vs_currencies" => "usd", "include_market_cap" => "true", "include_24hr_vol" => "true", "include_24hr_change" => "true", "include_last_updated_at" => "true"}) do
    get_api_params("simple/token_price/ethereum?", params)
  end

  def coins_markets(params \\ %{"vs_currency" => "usd", "ids" => "bitcoin", "order" => "market_cap_desc", "per_page" => "100", "sparkline" => "false"}) do
    get_api_params("coins/markets?", params)
  end

  def coins(id \\ "bitcoin", params \\ %{"tickers" => "true", "market_data" => "true", "community_data" => "true", "developer_data" => "true", "sparkline" => "false"}) do
    get_api_params("coins/" <> id <> "?", params)
  end

  def coins_id_tickers(id \\ "bitcoin", params \\ %{}) do
    get_api_params("coins/" <> id <> "/tickers?", params)
  end

  def coins_id_history(id \\ "bitcoin", params \\ %{"date" => "01-01-2015"}) do
    get_api_params("coins/" <> id <> "/history?", params)
  end

  def coins_id_market_chart(id \\ "bitcoin", params \\ %{"vs_currency" => "usd", "days" => "100"}) do
    get_api_params("coins/" <> id <> "/market_chart?", params)
  end

  def coins_id_market_chart_range(id \\ "bitcoin", params \\ %{"vs_currency" => "usd", "from" => "1392577232", "to" => "1422577232"}) do
    get_api_params("coins/" <> id <> "/market_chart/range?", params)
  end

  def coins_id_status_updates(id \\ "bitcoin", params \\ %{}) do
    get_api_params("coins/" <> id <> "/status_updates?", params)
  end

  def coins_id_ohlc(id \\ "bitcoin", params \\ %{"vs_currency" => "usd", "days" => "90"}) do
    get_api_params("coins/" <> id <> "/ohlc?", params)
  end

  def coins_id_contract_contract_address(id \\ "ethereum", contract_address \\ "0xc00e94cb662c3520282e6f5717214004a7f26888") do
    get_api("coins/" <> id <> "/contract/" <> contract_address)
  end
  @doc """
  List all coins
  %{"id" => "1", "name" => "coin_name", "symbol" => "coin_symbol"}
  """
  def coins_list do
    get_api("coins/list")
  end

  def simple_supported_vs_currencies do
    get_api("simple/supported_vs_currencies")
  end
end
