defmodule Dienekes.Numbers.FetchPipeline do
  @moduledoc """
  A interface that represents the [fetch] -> [save] pipeline
  to get all numbers in Dienekes API and sort them
  """
  @callback fetch_sorted() :: :ok
  @callback fetch_from(integer()) :: list()
  @callback sort(list(integer())) :: list(integer())
  @callback save(integer()) :: :ok | {:error, String.t}
end
