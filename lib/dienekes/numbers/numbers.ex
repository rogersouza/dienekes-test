defmodule Dienekes.Numbers do
  @all_numbers_in_api 1_000_000

  alias Dienekes.Numbers.NumbersAgent
  alias Dienekes.Numbers.FetchHTTPPipeline, as: FetchPipeline

  def get_stored_numbers do
    stored_numbers = NumbersAgent.get()
    is_agent_full = length(stored_numbers) == @all_numbers_in_api

    if is_agent_full do
      {:ok, stored_numbers}
    else
      {:error, "the numbers are being extracted"}
    end
  end

  def update_numbers() do
    :ok = NumbersAgent.delete_all()
    Task.start(fn -> FetchPipeline.fetch_sorted end)

    {:ok, "updating"}
  end
end
