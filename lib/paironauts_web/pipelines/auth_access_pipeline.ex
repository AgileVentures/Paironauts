defmodule PaironautsWeb.Plug.AuthAccessPipeline do
    use Guardian.Plug.Pipeline, otp_app: :paironauts

    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource, ensure: true
  end
