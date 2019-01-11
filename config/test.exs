use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dienekes, DienekesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :dienekes, Dienekes.Repo,
  username: "postgres",
  password: "postgres",
  database: "dienekes_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :dienekes, fetcher: Dienekes.Numbers.FetchTestPipeline

#Reduced numbers per page in pagination
config :dienekes, numbers_per_page: 50
