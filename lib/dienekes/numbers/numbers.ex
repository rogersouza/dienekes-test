defmodule Dienekes.Numbers do
  alias Dienekes.Numbers.InMemoryDatabase

  @fetch_pipeline Application.get_env(:dienekes, :fetcher)

  def get_numbers do
    stored_numbers = InMemoryDatabase.get()

    if stored_numbers == [] do
      {:error, "the numbers are being extracted"}
    else
      {:ok, stored_numbers}
    end
  end

  def update_numbers() do
    :ok = InMemoryDatabase.delete_all()
    Task.start(fn -> @fetch_pipeline.fetch_sorted() end)

    {:ok, "updating"}
  end
end
