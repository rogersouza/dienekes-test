defmodule Dienekes.FetchHTTPPipelineTests do
  use ExUnit.Case, async: true

  import Mox
  alias Dienekes.Numbers.FetchHTTPPipelineMock

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

  test "sort/1 returns a sorted list" do
    unordered_list = 1..10 |> Enum.to_list |> Enum.shuffle

    FetchHTTPPipelineMock
    |> expect(:sort, fn(unordered_list) -> Enum.sort(unordered_list) end)

    assert sorted_list = FetchHTTPPipelineMock.sort(unordered_list)
  end

end
