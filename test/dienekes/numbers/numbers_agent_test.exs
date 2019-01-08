defmodule Dienekes.Numbers.NumbersAgentTest do
  use ExUnit.Case, async: true

  alias Dienekes.Numbers.NumbersAgent

  test "stores a list of numbers" do
    assert NumbersAgent.get() == []

    number_list = for n <- 1..100, do: n
    NumbersAgent.put(number_list)
    assert NumbersAgent.get() == number_list
  end
end
