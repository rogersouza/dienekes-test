defmodule Dienekes.Numbers.NumbersAgent do
  def start_link(_opts) do
    Agent.start_link(fn -> [] end)
  end

  def get(pid) do
    Agent.get(pid, fn(numbers) -> numbers end)
  end

  def put(pid, number_list) do
    Agent.update(pid, fn(numbers) -> numbers ++ number_list end)
  end
end
