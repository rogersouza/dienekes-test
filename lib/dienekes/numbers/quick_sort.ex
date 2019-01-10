defmodule Dienekes.Numbers.QuickSort do
  def sort(list) do
    qsort(list)
  end


  defp qsort([]), do: []
  defp qsort([pivot]), do: [pivot]
  defp qsort(list) do
    {pivot, list} = extract_pivot(list)
    {left, right} =
      list
      |> Enum.split_with(fn x -> x <= pivot end)

    qsort(left) ++ [pivot] ++ qsort(right)
  end

  def extract_pivot([pivot | rest]), do: {pivot, rest}



end
