defmodule Dienekes.Numbers.FetchPipeline do
  @moduledoc """
  A interface that represents the [fetch] -> [save] pipeline
  for fetch and sort all Dienekes API's numbers
  """
  @callback fetch_sorted() :: :ok
  @callback fetch_from(integer()) :: list()
  @callback sort(list(integer())) :: list(integer())
  @callback save(list()) :: :ok | {:error, String.t}
end
