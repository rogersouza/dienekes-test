defmodule Dienekes.Numbers.HTTPClientTests do
  use ExUnit.Case, async: true

  import Mox
  alias Dienekes.Numbers.HTTPClientMock

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  test "get_numbers_from/1 returns all numbers to the given page index" do
    list_of_numbers = for n <- 1..100, do: n

    HTTPClientMock
    |> expect(:get_numbers_from, 3, fn
      1 -> {:ok, list_of_numbers}
      2 -> {:ok, list_of_numbers}
      10_001 -> {:error, "empty list"}
    end)

    assert {:ok, _} = HTTPClientMock.get_numbers_from(1)
    assert {:ok, _} = HTTPClientMock.get_numbers_from(2)
    assert {:error, "empty list"} = HTTPClientMock.get_numbers_from(10_001)
  end
end
