defmodule Paironauts.Mixfile do
  use Mix.Project

  def project do
    [
      app: :paironauts,
      version: "0.0.1",
      elixir: "~> 1.6.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Paironauts.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "1.3.2"},
      {:phoenix_pubsub, "1.0.2"},
      {:phoenix_ecto, "3.3.0"},
      {:postgrex, "0.13.5"},
      {:phoenix_html, "2.11.2"},
      {:phoenix_live_reload, "1.1.5", only: :dev},
      {:gettext, "0.15.0"},
      {:cowboy, "1.1.2"},
      {:ueberauth, "0.5.0"},
      {:ueberauth_identity, "0.2.3"},
      {:ueberauth_github, "0.7.0"},
      {:guardian, "1.0.1"},
      {:comeonin, "4.1.1"},
      {:bcrypt_elixir, "1.0.6"},
      {:wallaby, "0.19.2", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
