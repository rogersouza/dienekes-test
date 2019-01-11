defmodule DienekesWeb.NumbersView do
  use DienekesWeb, :view
  import DienekesWeb.NumbersHelpers

  def render("numbers.json", %{numbers: numbers, page: page}) do
    %{numbers: paginate(numbers, page)}
  end

  def render("numbers.json", %{error: reason}) do
    %{error: reason}
  end

  def render("updating.json", %{message: message}) do
    %{message: message}
  end
end
