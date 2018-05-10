defmodule PaironautsWeb.Plug.AuthErrorHandler do
  import Plug.Conn
  import Phoenix.Controller, only: [json: 2]

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_status(401)
    |> json(%{message: to_string(type)})
    |> halt()
  end
end
