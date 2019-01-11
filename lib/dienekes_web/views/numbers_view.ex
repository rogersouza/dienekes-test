defmodule DienekesWeb.NumbersView do
  use DienekesWeb, :view

  def render("numbers.json", %{numbers: numbers}) do
    %{numbers: numbers}
  end

  def render("numbers.json", %{error: reason}) do
    %{error: reason}
  end

  def render("updating.json", %{message: message}) do
    %{message: message}
  end
end
