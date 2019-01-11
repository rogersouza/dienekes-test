defmodule Dienekes.Numbers.QuickSort do
  def sort(list) do
    qsort(list)
  end

  defp qsort([]), do: []
  defp qsort([pivot]), do: [pivot]

  defp qsort(list) do
    {pivot, list} = extract_pivot(list)
    {left, right} = partition(list, pivot)
    merge(left, pivot, right)
  end

  defp extract_pivot([pivot | rest]), do: {pivot, rest}
  defp partition(list, pivot), do: Enum.split_with(list, fn x -> x <= pivot end)
  defp merge(left, pivot, right), do: qsort(left) ++ [pivot] ++ qsort(right)
end
