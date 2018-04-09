ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Paironauts.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
{:ok, _} = Application.ensure_all_started(:paironauts)
Application.put_env(:wallaby, :base_url, PaironautsWeb.Endpoint.url)

ExUnit.configure(exclude: [pending: true])
