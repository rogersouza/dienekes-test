defmodule DienekesWeb.Router do
  use DienekesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DienekesWeb do
    pipe_through :api

    get "/numbers/", NumbersController, :get_numbers
    get "/numbers/update", NumbersController, :update_numbers
  end
end
