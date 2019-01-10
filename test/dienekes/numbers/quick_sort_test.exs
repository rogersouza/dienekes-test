defmodule Dienekes.Sorting.QuickSortTest do
  use ExUnit.Case
  alias Dienekes.Numbers.QuickSort

  test "sort/1 should sort a list" do
    unordered_list = for _ <- 1..100, do: :rand.uniform()
    assert QuickSort.sort(unordered_list) == Enum.sort(unordered_list)
  end
end
