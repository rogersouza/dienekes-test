defmodule Dienekes.Numbers.NumbersAgent do
  use Agent

  @name __MODULE__
  def start_link(_) do
    Agent.start_link(fn -> [] end, name: @name)
  end

  def get do
    Agent.get(@name, fn(numbers) -> numbers end)
  end

  def put(number_list) do
    Agent.update(@name, fn(numbers) -> numbers ++ number_list end)
  end
end
