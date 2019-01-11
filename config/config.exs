# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dienekes,
  ecto_repos: [Dienekes.Repo],
  api_endpoint: "http://challenge.dienekes.com.br:8888/api/numbers"

# Configures the endpoint
config :dienekes, DienekesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UxOYJ+jBZ5lap/nBRPJYp4gntuCwz+jGKJQKQ9P3KquPaSD2u7pf3SEtncYizc9T",
  render_errors: [view: DienekesWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Dienekes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

