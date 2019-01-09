defmodule Dienekes.Numbers.FetchHTTPPipeline do
  @moduledoc """
  This mudule is reponsible for fetch all pages in Dienekes API.
  [10_001 pages] -> [FETCH_NUMBERS] ->  [SORT_NUMBERS] ->[SAVE_NUMBERS]

  All the numbers are persisted in our agent, NumbersAgent
  """
  @behaviour Dienekes.Numbers.FetchPipeline

  alias Dienekes.Numbers.HTTPClient
  alias Dienekes.Numbers.NumbersAgent

  @impl true
  def fetch_sorted do
    Enum.to_list(1..10_001)
    |> Flow.from_enumerable(max_demand: 200)
    |> Flow.partition(max_demand: 200, stages: 100)
    |> Flow.map(&fetch_from/1)
    |> Flow.reduce(fn -> [] end, fn numbers, list -> numbers ++ list end)
    |> sort()
    |> save()

  end

  @impl true
  def fetch_from(page_index) do
    case HTTPClient.get_numbers_from(page_index) do
      {:ok, numbers} -> numbers
      {:error, "empty list"} -> []
      {:error, "internal error"} -> fetch_from(page_index)
      {:error, _} -> fetch_from(page_index)
    end
  end

  @impl true
  def save(numbers) do
    NumbersAgent.put(numbers)
  end

  @impl true
  def sort(numbers) do
    Enum.sort(numbers)
  end
end
