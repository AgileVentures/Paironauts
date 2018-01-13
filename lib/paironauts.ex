defmodule Paironauts do
  use Application
  @moduledoc """
  Paironauts keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Start the endpoint when the application starts
      supervisor(PaironautsWeb.Endpoint, []),
      # Start the Ecto repository
      worker(Paironauts.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(Paironauts.Worker, [arg1, arg2, arg3]),
      supervisor(Paironauts.Presence, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Paironauts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PaironautsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
