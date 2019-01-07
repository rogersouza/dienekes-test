defmodule DienekesWeb.Router do
  use DienekesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DienekesWeb do
    pipe_through :api
  end
end
