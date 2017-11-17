defmodule PaironautsWeb.BrowserCase do
    @moduledoc """
    This module defines the test case to be used by
    browser integration/acceptance tests.

    Such tests rely on Wallaby for session management and also
    import other functionality to make it easier
    to build common datastructures and query the data layer.

    Finally, if the test case interacts with the database,
    it cannot be async. For this reason, every test runs
    inside a transaction which is reset at the beginning
    of the test unless the test case is marked as async.
    """

    use ExUnit.CaseTemplate
    
    using do
      quote do
        use Wallaby.DSL
  
        alias Paironauts.Repo
        import Ecto
        import Ecto.Changeset
        import Ecto.Query
  
        import Paironauts.Router.Helpers
      end
    end
  
    setup tags do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(Paironauts.Repo)
  
      unless tags[:async] do
        Ecto.Adapters.SQL.Sandbox.mode(Paironauts.Repo, {:shared, self()})
      end
  
      metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Paironauts.Repo, self())
      {:ok, session} = Wallaby.start_session(metadata: metadata)
      {:ok, session: session}
    end
  end