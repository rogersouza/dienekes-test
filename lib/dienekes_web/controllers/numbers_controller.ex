defmodule DienekesWeb.NumbersController do
  use DienekesWeb, :controller
  alias Dienekes.Numbers

  @numbers_per_page Application.get_env(:dienekes, :numbers_per_page)

  def get_numbers(conn, %{"page" => page}) do
    case Numbers.get_numbers() do
      {:ok, numbers} ->
        paginated_numbers = paginate(numbers, page)
        render(conn, "numbers.json", numbers: paginated_numbers)

      {:error, reason} ->
        render(conn, "numbers.json", error: reason)
    end
  end

  defp get_window(1), do: {0, @numbers_per_page - 1}

  defp get_window(page) do
    page = String.to_integer(page)
    to = @numbers_per_page * page
    from = to - @numbers_per_page

    {from, to}
  end

  defp paginate(numbers, page) do
    {from, to} = get_window(page)
    Enum.slice(numbers, from..to)
  end

  def update_numbers(conn, _params) do
    {:ok, message} = Numbers.update_numbers()
    render(conn, "updating.json", message: message)
  end
end
