ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Paironauts.Repo, :manual)
Application.put_env(:wallaby, :base_url, Paironauts.Endpoint.url)
