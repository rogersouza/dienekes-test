defmodule Dienekes.Numbers.APIClient do
  @callback get_numbers_from(integer()) :: {:ok, list()} | {:error, String.t()}
end
