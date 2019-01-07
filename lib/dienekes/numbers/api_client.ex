defmodule Dienekes.Numbers.APIClient do
  @callback get_numbers_from(String.t()) :: {:ok, list()} | {:error, String.t()}
end
