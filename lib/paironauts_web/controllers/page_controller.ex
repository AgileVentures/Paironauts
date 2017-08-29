defmodule PaironautsWeb.PageController do
  use PaironautsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
