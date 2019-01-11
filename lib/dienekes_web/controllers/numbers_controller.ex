defmodule DienekesWeb.NumbersController do
  use DienekesWeb, :controller
  alias Dienekes.Numbers

  def get_numbers(conn, params) do
    case Numbers.get_numbers() do
      {:ok, numbers} ->
        page = Map.get(params, "page", "1")
        render(conn, "numbers.json", numbers: numbers, page: page)

      {:error, reason} ->
        render(conn, "numbers.json", error: reason)
    end
  end

  def update_numbers(conn, _params) do
    {:ok, message} = Numbers.update_numbers()
    render(conn, "updating.json", message: message)
  end
end
