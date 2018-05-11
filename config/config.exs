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
  providers: [
    github:   {Ueberauth.Strategy.Github, [uid_field: "login"]},
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id:     System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :guardian, Guardian,
  issuer: "Paironauts.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: PaironautsWeb.GuardianSerializer,
  secret_key: to_string(Mix.env),
  hooks: GuardianDb,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
