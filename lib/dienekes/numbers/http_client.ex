defmodule Dienekes.Numbers.HTTPClient do
  alias Dienekes.Numbers.APIClient

  @behaviour APIClient

  @api_endpoint Application.get_env(:dienekes, :api_endpoint)

  @simulated_internal_error %{body: "{\"error\":\"Simulated internal error\"}"}
  @empty_list %{"numbers" => []}

  @impl true
  def get_numbers_from(page_index) when page_index > 0 do
    endpoint = build_url(page_index)

    get_request = fn ->
      HTTPoison.get(endpoint, [], timeout: 50_000, recv_timeout: 50_000)
    end

    with {:ok, %{status_code: 200, body: body}} <- get_request.(),
         {:ok, %{"numbers" => numbers}} when numbers != [] <- Jason.decode(body) do
      {:ok, numbers}
    else
      {:ok, @empty_list} -> {:error, "empty list"}
      {:ok, @simulated_internal_error} -> {:error, "internal error"}
      {:error, reason} -> {:error, reason}
    end
  end

  defp build_url(page_index), do: @api_endpoint <> "?page=#{page_index}"
end
