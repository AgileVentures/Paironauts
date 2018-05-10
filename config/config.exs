# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :paironauts,
  ecto_repos: [Paironauts.Repo]

# Configures the endpoint
config :paironauts, PaironautsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CvsTNu60FH3Icmk5SzCazHPfdeVgmV8D90f0ATcYAgNVN04tdAbHMPENldAEizG1",
  render_errors: [view: PaironautsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Paironauts.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  base_path: "/api/auth",
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      callback_path: "/api/auth/identity/callback",
      nickname_field: :username,
      param_nesting: "user",
      uid_field: :username
    ]}
  ]

config :paironauts, Paironauts.Guardian,
  issuer: "Paironauts",
  secret_key: "not a real secret key"

config :paironauts, PaironautsWeb.Plug.AuthAccessPipeline,
    module: Paironauts.Guardian,
    error_handler: PaironautsWeb.Plug.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
