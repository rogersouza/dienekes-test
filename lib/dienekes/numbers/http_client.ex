defmodule Dienekes.Numbers.HTTPClient do
  alias Dienekes.Numbers.APIClient

  @behaviour APIClient

  @api_endpoint Application.get_env(:dienekes, :api_endpoint)

  @impl true
  @spec get_numbers_from(integer()) :: {:ok, list()} | {:error, String.t()}
  def get_numbers_from(page_index) when page_index > 0 and is_integer(page_index) do
    endpoint = @api_endpoint <> "?page=#{page_index}"

    with {:ok, %{status_code: 200, body: body}} <- HTTPoison.get(endpoint),
         {:ok, %{"numbers" => numbers}} when numbers != [] <- Jason.decode(body) do
      {:ok, numbers}
    else
      {:ok, %{"numbers" => []}} -> {:error, "empty list"}
      {:ok, %{body: "{\"error\":\"Simulated internal error\"}"}} -> {:error, "internal error"}
      {:error, reason} -> {:error, reason}
    end
  end
end
