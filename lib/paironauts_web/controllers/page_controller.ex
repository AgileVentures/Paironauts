defmodule PaironautsWeb.PageController do
  use PaironautsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def pairing(conn, _params) do
    render conn, "pairing.html"
  end
end
