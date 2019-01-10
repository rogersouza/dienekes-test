defmodule Dienekes.NumbersTests do
  use ExUnit.Case

  alias Dienekes.Numbers
  alias Dienekes.Numbers.InMemoryDatabase

  @processing_time 100

  describe "when the sorted numbers is requested" do
    setup do
      InMemoryDatabase.delete_all()
    end

    test "returns {:error, reason} when numbers still being fetched" do
      assert {:error, "the numbers are being extracted"} =
        Numbers.get_numbers()
    end

    test "returns sorted numbers when the numbers has been already fetched" do
      {:ok, "updating"} = Numbers.update_numbers()
      :timer.sleep(@processing_time)

      assert {:ok, numbers} = Numbers.get_numbers()
      assert numbers == Enum.sort(numbers)
    end
  end

  describe "when an update is requested" do
    test "the in-memory database is wiped out" do
      {:ok, "updating"} = Numbers.update_numbers()
      assert InMemoryDatabase.get == []
    end

    test "after some time, the in-memory database if filled with sorted numbers" do
      {:ok, "updating"} = Numbers.update_numbers()
      :timer.sleep(@processing_time)
      numbers = InMemoryDatabase.get()

      assert numbers != []
      assert numbers == Enum.sort(numbers)
    end
  end
end
