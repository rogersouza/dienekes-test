defmodule Dienekes.Numbers.NumbersAgentTest do
  use ExUnit.Case, async: true

  alias Dienekes.Numbers.NumbersAgent

  test "stores a list of numbers" do
    {:ok, pid} = NumbersAgent.start_link([])
    assert NumbersAgent.get(pid) == []

    number_list = for n <- 1..100, do: n
    NumbersAgent.put(pid, number_list)
    assert NumbersAgent.get(pid) == number_list
  end
end
