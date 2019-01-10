defmodule Dienekes.Numbers.InMemoryDatabase do
  @moduledoc """
  A simple in-memory database to store our numbers
  """
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

  def delete_all do
    Agent.update(@name, fn(_) -> [] end)
  end
end
