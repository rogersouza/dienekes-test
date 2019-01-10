defmodule Dienekes.NumbersTests do
  use ExUnit.Case

  alias Dienekes.Numbers

  setup :clear_number_agent

  def clear_number_agent(_) do
    Numbers.InMemoryDatabase.delete_all()
  end


  test "get_sorted_numbers returns all stored numbers in crescrent order" do
    Enum.to_list(1..1_000_000) |> Numbers.InMemoryDatabase.put()

    {:ok, sorted_numbers} = Numbers.get_stored_numbers()
    assert sorted_numbers == Enum.sort(sorted_numbers)
  end

  test "get_sorted_numbers returns error when our NumbersAgent is not full yet" do
    Enum.to_list(1..10) |> Numbers.InMemoryDatabase.put()
    assert {:error, "the numbers are being extracted"} = Numbers.get_stored_numbers()
  end
end
