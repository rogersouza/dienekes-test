defmodule Dienekes.Numbers.FetchTestPipeline do
  @behaviour Dienekes.Numbers.FetchPipeline

  alias Dienekes.Numbers.InMemoryDatabase

  @impl true
  def fetch_sorted do
    1..10
    |> Enum.to_list
    |> Enum.map(&fetch_from(&1))
    |> Enum.reduce(fn sequence, list -> sequence ++ list end)
    |> sort()
    |> save()
  end

  @impl true
  def fetch_from(_) do
    for _ <- 1..5, do: :rand.uniform()
  end

  @impl true
  def sort(list), do: Enum.sort(list)

  @impl true
  def save(list) do
    InMemoryDatabase.put(list)
  end
end
