defmodule Dienekes.Numbers.InMemoryDatabaseTests do
  use ExUnit.Case, async: true

  alias Dienekes.Numbers.InMemoryDatabase

  test "stores a list of numbers" do
    assert InMemoryDatabase.get() == []

    number_list = for n <- 1..100, do: n
    InMemoryDatabase.put(number_list)
    assert InMemoryDatabase.get() == number_list
  end

  test "delete_all wipe out the agent state" do
    number_list = for n <- 1..100, do: n
    InMemoryDatabase.put(number_list)

    assert :ok = InMemoryDatabase.delete_all()
  end
end
