defmodule DienekesWeb.NumbersHelpers do
  @numbers_per_page Application.get_env(:dienekes, :numbers_per_page)

  def paginate(numbers, page) do
    {from, to} = get_window(page)
    Enum.slice(numbers, from..to)
  end

  defp get_window("1"), do: {0, @numbers_per_page - 1}

  defp get_window(page) do
    page = String.to_integer(page)
    to = @numbers_per_page * page
    from = to - @numbers_per_page

    {from, to}
  end
end
